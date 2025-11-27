import re

import numpy as np
import pandas as pd

cam_path = r"C:\Users\Facu\Downloads\proveedores camarco.xlsx"
fod_path = r"C:\Users\Facu\Downloads\proveedores fodeco.xlsx"


def find_col(df, must_contain):
    """
    Return the first column whose name contains ALL strings in must_contain.
    This makes the script robust to non-breaking spaces and small diffs.
    """
    cols = list(df.columns)
    for col in cols:
        text = str(col).replace("\xa0", " ")
        if all(part.lower() in text.lower() for part in must_contain):
            return col
    raise KeyError(f"Could not find column with parts: {must_contain}")

def normalize_dataframe(df, source):
    df = df.copy()
    # Detect columns in a robust way
    col_name   = find_col(df, ["Razón", "Social"])
    col_email  = find_col(df, ["E-Mail"])
    col_phone  = find_col(df, ["Teléfono"])
    col_iva    = find_col(df, ["situación", "Iva"])
    col_doc    = find_col(df, ["Número", "documento"])

    out = pd.DataFrame()
    out["name"]          = df[col_name].astype(str).str.replace("\xa0", " ").str.strip()
    out["email"]         = df[col_email].astype(str).str.replace("\xa0", " ").str.strip()
    out["phone"]         = df[col_phone].astype(str).str.replace("\xa0", " ").str.strip()
    out["iva_condition"] = df[col_iva].astype(str).str.replace("\xa0", " ").str.strip()
    out["doc_number_raw"]= df[col_doc].astype(str).str.strip()
    out["source"]        = source

    def norm_cuit(value):
        digits = re.sub(r"\D", "", str(value))
        # Keep only valid CUIT/CUIL: 11 digits and not all zeros
        return digits if len(digits) == 11 and digits != "00000000000" else np.nan

    out["cuit_cuil"] = out["doc_number_raw"].apply(norm_cuit)
    return out

def sql_escape(val: str) -> str:
    """
    Escape Python strings for use in SQL string literals.
    Returns SQL NULL when the value is missing/empty.
    """
    if val is None:
        return "NULL"
    s = str(val)
    if s.strip() == "" or s.lower() == "nan":
        return "NULL"
    # Escape single quotes
    s = s.replace("'", "''")
    return f"'{s}'"

def main():
    cam_df = pd.read_excel(cam_path)
    fod_df = pd.read_excel(fod_path)

    cam = normalize_dataframe(cam_df, "CAMARCO")
    fod = normalize_dataframe(fod_df, "FODECO")

    # Merge both and keep only rows with valid CUIT/CUIL
    merged = pd.concat([cam, fod], ignore_index=True)
    clean = merged.dropna(subset=["cuit_cuil"]).copy()

    # Priority: CAMARCO over FODECO when same CUIT appears in both
    clean["priority"] = clean["source"].map({"CAMARCO": 0, "FODECO": 1})
    clean_sorted = clean.sort_values(["cuit_cuil", "priority"])

    # One row per CUIT
    unique_providers = clean_sorted.drop_duplicates("cuit_cuil", keep="first")

    print(f"Total rows CAMARCO: {len(cam)}")
    print(f"Total rows FODECO : {len(fod)}")
    print(f"Con CUIT válido   : {len(clean)}")
    print(f"Proveedores únicos: {len(unique_providers)}")

    # Build one INSERT per provider, using a WHERE NOT EXISTS by CUIT
    statements = []
    for _, row in unique_providers.iterrows():
        name  = sql_escape(row["name"])
        email = sql_escape(row["email"])
        phone = sql_escape(row["phone"])
        cuit  = sql_escape(row["cuit_cuil"])
        iva   = sql_escape(row["iva_condition"])

        cuit_raw = str(row["cuit_cuil"]).strip()
        cuit_where = f"'{cuit_raw}'" if cuit_raw else "NULL"

        stmt = f"""INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT {name}, {email}, {phone}, {cuit}, {iva}
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = {cuit_where}
);"""
        statements.append(stmt)

    output_path = "proveedores_insert.sql"
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("-- Script generado automáticamente para insertar proveedores CAMARCO + FODECO\n")
        f.write("-- Ejecutar contra la base de datos invoices_managment_db\n\n")
        for stmt in statements:
            f.write(stmt)
            f.write("\n\n")

    print(f"Archivo SQL generado: {output_path}")

if __name__ == "__main__":
    main()
