/**
 * Shared money input utilities.
 *
 * Centralizes normalizeMoneyInput, formatMoneyForDisplay and sanitizeMoneyInput
 * so all forms (invoices, budgets) share the same correct behaviour.
 */

/**
 * Normalizes money input so users can type:
 * - "13213,21" or "13213.21"
 * - "1.234,56" or "1,234.56"
 * And we always return a backend-friendly number string with "." as decimal separator.
 */
export function normalizeMoneyInput(raw: string): string {
  const value = raw.trim().replace(/\s+/g, '');
  if (!value) return '';

  const hasComma = value.includes(',');
  const hasDot = value.includes('.');

  // If both separators exist, assume the last one is the decimal separator.
  if (hasComma && hasDot) {
    const lastComma = value.lastIndexOf(',');
    const lastDot = value.lastIndexOf('.');

    const decimalSep = lastComma > lastDot ? ',' : '.';
    const thousandsSep = decimalSep === ',' ? '.' : ',';

    const noThousands = value.split(thousandsSep).join('');
    return decimalSep === ',' ? noThousands.replace(',', '.') : noThousands;
  }

  // Only comma: treat it as decimal separator.
  if (hasComma) return value.replace(',', '.');

  // Only dot or none: already OK.
  return value;
}

/**
 * Formats a number/string to a nice money display (2 decimals, comma decimal for ES UI).
 * This is only for display; submission uses normalizeMoneyInput().
 */
export function formatMoneyForDisplay(value: unknown): string {
  if (value === null || value === undefined) return '';
  const str = String(value).trim();
  if (!str) return '';

  const normalized = normalizeMoneyInput(str);
  const n = Number(normalized);
  if (!Number.isFinite(n)) return str;

  return n.toFixed(2).replace('.', ',');
}

/**
 * Sanitizes money input to only allow digits plus a single decimal separator
 * (either comma or dot), with a maximum of 2 decimal digits.
 *
 * This fixes the bug where typing after the decimal separator would cause
 * rounding via toFixed(2) on blur, making it look like the number "incremented".
 */
export function sanitizeMoneyInput(raw: string): string {
  // Only allow digits, comma, and dot
  let sanitized = raw.replace(/[^\d,.]/g, '');

  // Determine which separator is being used as decimal
  const lastComma = sanitized.lastIndexOf(',');
  const lastDot = sanitized.lastIndexOf('.');

  if (lastComma > -1 && lastDot > -1) {
    // Both separators present: the last one is the decimal
    const decimalPos = Math.max(lastComma, lastDot);
    const decimalChar = sanitized[decimalPos];
    const otherChar = decimalChar === ',' ? '.' : ',';
    // Remove thousands separators
    sanitized = sanitized.split(otherChar).join('');
    // Limit decimal part to 2 digits
    const parts = sanitized.split(decimalChar);
    if (parts.length === 2) {
      parts[1] = parts[1].slice(0, 2);
      sanitized = parts[0] + decimalChar + parts[1];
    }
  } else if (lastComma > -1) {
    // Only commas: allow max 1, limit decimal to 2 digits
    const parts = sanitized.split(',');
    if (parts.length > 2) {
      // Multiple commas: keep first part + last part as decimal
      const intPart = parts.slice(0, -1).join('');
      sanitized = intPart + ',' + parts[parts.length - 1].slice(0, 2);
    } else if (parts.length === 2) {
      parts[1] = parts[1].slice(0, 2);
      sanitized = parts[0] + ',' + parts[1];
    }
  } else if (lastDot > -1) {
    // Only dots: allow max 1, limit decimal to 2 digits
    const parts = sanitized.split('.');
    if (parts.length > 2) {
      const intPart = parts.slice(0, -1).join('');
      sanitized = intPart + '.' + parts[parts.length - 1].slice(0, 2);
    } else if (parts.length === 2) {
      parts[1] = parts[1].slice(0, 2);
      sanitized = parts[0] + '.' + parts[1];
    }
  }

  return sanitized;
}
