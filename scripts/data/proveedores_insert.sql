-- Script generado automáticamente para insertar proveedores CAMARCO + FODECO
-- Ejecutar contra la base de datos invoices_managment_db

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDIC.DE LA GUIA REL.PUBLICAS', NULL, '314-9054/2914', '20040467913', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20040467913'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ISIDORO GILBERT', NULL, '4334-0600', '20040712365', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20040712365'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS ALBERTO KREIMER', NULL, '4372-5905/6327', '20041074354', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20041074354'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IGNACIO DI BARTOLO', NULL, NULL, '20041208083', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20041208083'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'J. BATTISTA IMPRESIONES', NULL, '831-2433', '20041493543', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20041493543'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASESORES ECONOMICOS', NULL, '4328-7934', '20041894688', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20041894688'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RICARDO HECTOR VALLS', NULL, NULL, '20041963094', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20041963094'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUILLERMO GLAUBART', NULL, NULL, '20042083292', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20042083292'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS S. ODRIOZOLA', NULL, '4311-3612', '20042358283', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20042358283'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN JOSE CANEDO', NULL, '326-1149', '20042449009', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20042449009'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MANUEL MORA Y ARAUJO', NULL, NULL, '20042643883', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20042643883'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS ALBERTO ETALA', NULL, NULL, '20043044541', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20043044541'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EMILIO FARBER', NULL, '4371-0032 Cel 15-41407661', '20043053958', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20043053958'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BERNARDO KLIKSBERG', NULL, NULL, '20043070771', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20043070771'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GENARO JUAN TIRELLI', NULL, NULL, '20043076907', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20043076907'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REPARACIONES EDUARDO SEBASTIANO', NULL, '4374-6937', '20043564391', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20043564391'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROBERTO ALVAREZ', NULL, NULL, '20043576187', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20043576187'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AG.LOS DIARIOS', NULL, '382-2728/2805', '20043676858', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20043676858'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN PODCAMINSKY', NULL, '393-1432', '20043725344', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20043725344'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTUDIO FONTAN BALESTRA & ASOC.', NULL, NULL, '20043845986', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20043845986'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARNALDO N COLOMBO', NULL, NULL, '20043873149', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20043873149'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARBARO JULIO DONATO', NULL, NULL, '20043906705', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20043906705'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAVICCHIA CARLOS ALBERTO', NULL, NULL, '20044020042', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20044020042'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VICTOR OSVALDO ALVAREZ', NULL, NULL, '20044034078', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20044034078'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS A. BATTILANA', NULL, '4371-5953/0738', '20044084229', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20044084229'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE HECTOR ROMANO', NULL, NULL, '20044112745', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20044112745'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALBERTO M. GARCIA LEMA', NULL, NULL, '20044152062', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20044152062'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO J. KUNTSCHER', NULL, NULL, '20044221641', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20044221641'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSE ALBERTO ARIAS', NULL, NULL, '20044250293', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20044250293'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE PABLO JUAN CARLOS', NULL, '328-9413/9563', '20044251249', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20044251249'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RICARDO ALEJO FRABOSCHI', 'alejofra@speedy.com.ar', '15-5003-9943 o 4988-0321', '20044300487', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20044300487'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LLACH JUAN JOSE', NULL, NULL, '20044308631', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20044308631'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SIMON EDUARDO SLIVKA', NULL, '4784-1826', '20044469678', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20044469678'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMLETO JUAN MURATORIO', NULL, NULL, '20044913128', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20044913128'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO LEON GERCHUNOFF', NULL, NULL, '20045130046', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045130046'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN CARLOS LAVAGNA', NULL, NULL, '20045144152', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045144152'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSE CRIADO', NULL, NULL, '20045212794', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045212794'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MABROMATA Y ASOC.', NULL, '371-0992  373-0662', '20045278892', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045278892'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RUBIO ALBERTO ALFREDO', NULL, NULL, '20045292399', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045292399'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DEL CARRIL TOMAS ALBERTO', NULL, NULL, '20045292550', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045292550'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'THERMO INGENIERIA', NULL, '4854-8955', '20045302246', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045302246'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAZZARELA  JOSÉ', NULL, NULL, '20045462863', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045462863'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GENVAL de Alberto Gentilini', NULL, '4581 6589', '20045471552', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045471552'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAFAEL C. CASTELLANO', NULL, '4803-1546 / 15-5404-1488', '20045483712', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045483712'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS ALBERTO MAQUIEYRA', NULL, '4771-50857 15-5661-4961', '20045532489', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045532489'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE ALEJANDRO VALERGA ARAOZ', NULL, '4371-9263/0980', '20045550215', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045550215'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HERMINIO GARCIA', NULL, NULL, '20045812236', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045812236'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO ORLANDO QUILES', NULL, '322-7965  394-1510', '20045906540', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045906540'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Jorge Enrigue Gonzalez', NULL, NULL, '20045938302', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20045938302'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN FRANCISCO IBAÑEZ', NULL, NULL, '20046136390', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20046136390'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAUL MEDINA FERNANDEZ', NULL, NULL, '20046194978', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20046194978'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Dellavedova Alberto Alfredo', NULL, NULL, '20047533601', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20047533601'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANIBAL LUIS AGOSTINELLI', NULL, NULL, '20049813679', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20049813679'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TOMAS RIOS', NULL, NULL, '20049833734', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20049833734'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Carlos Alberto Pablo Thierbach', NULL, NULL, '20050899641', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20050899641'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDGARDO MARIO CAMINO', NULL, '1552493038', '20052139490', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20052139490'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JAVIER GONZALEZ FRAGA', NULL, NULL, '20052748020', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20052748020'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARMEDENHO HUGO ALBERTO', NULL, NULL, '20053338241', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20053338241'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ORIOLO NESTOR CARLOS', NULL, '0291 4544691', '20055167649', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20055167649'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIAD HECTOR DANIEL', NULL, '48034062', '20055373427', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20055373427'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODOLFO ANIBAL AGUERRODI', NULL, '4361-5858', '20055810703', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20055810703'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IBARRONDO ISIDRO', NULL, NULL, '20056015990', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20056015990'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FRACASSI ANTONIO ANGEL', NULL, NULL, '20056091158', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20056091158'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMERICO JULIO GARCIA', NULL, '155210-3457', '20056183222', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20056183222'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PALMEYRO JULIO JORGE', NULL, NULL, '20057106574', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20057106574'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NIETO EUGENIO PEDRO', NULL, NULL, '20060330884', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20060330884'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SCERBO HECTOR MARIO', NULL, NULL, '20060762628', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20060762628'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MONJES DAMIAN GUALBERTO', NULL, '4422455', '20060863548', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20060863548'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RESTAURANTE C.A.C', NULL, NULL, '20060992348', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20060992348'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEREZ LLANA CARLOS EDUARDO', NULL, NULL, '20063082091', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20063082091'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLORENCIO ESCRIBANO MARTINEZ', NULL, NULL, '20066001866', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20066001866'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AUGUSTO FRANCISCO LUIS', NULL, NULL, '20067690916', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20067690916'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARRIAZU RICARDO HECTOR', NULL, NULL, '20072625065', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20072625065'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESCRIBANIA VALLARINO RUIZ', NULL, '4755-1522', '20073261512', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20073261512'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEDESMA Y ASOC.', NULL, '313-6619      311-4644', '20073582386', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20073582386'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE RAFAEL RUBIO', NULL, '4812-2881, 4813-6521/5543', '20073770352', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20073770352'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TROTTA GUILLERMO HORACIO', NULL, '4941-0673', '20075910690', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20075910690'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DR.MARIO ACKERMAN', NULL, '374-6269', '20075947276', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20075947276'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALBERTO EDUARDO MORA', NULL, '4555-7891', '20075958561', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20075958561'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUIS H. GONZÁLEZ', NULL, NULL, '20075998067', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20075998067'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MORENO GUILLERMO JULIO', NULL, NULL, '20076005819', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20076005819'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROTHER INGENIERIA - ING. SERGIO ROTHER', NULL, NULL, '20076058459', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20076058459'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REYES HECTOR CARLOS', NULL, NULL, '20076059544', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20076059544'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RIVERA JULIO CESAR', NULL, NULL, '20076065307', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20076065307'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CICARDO JORGE ALBERTO', NULL, '4812-2881', '20076420840', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20076420840'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDO ANGEL LAGO', NULL, NULL, '20076513741', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20076513741'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HECTOR RAUL ZAMORA', NULL, NULL, '20076753149', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20076753149'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LARREA OSCAR ERNESTO', NULL, NULL, '20077047671', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20077047671'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN CARLOS PALLAROLS', NULL, NULL, '20077352253', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20077352253'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TEDESCO JUAN CARLOS', NULL, NULL, '20077446363', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20077446363'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUIS ALBERTO JOSÉ ROMERO', NULL, '47813042', '20077499661', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20077499661'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ABAD ALBERTO R.', NULL, NULL, '20077510088', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20077510088'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE MARIO RODRIGUEZ CORDOBA', NULL, '4811-1071 / 75', '20077828428', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20077828428'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RICARDO BLAU', NULL, '4 300 1770', '20077938665', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20077938665'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROBERTO A. MARTIRENE', NULL, '4658-8653', '20077943677', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20077943677'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JULIO CESAR CRIVELLI', NULL, '4314-2170', '20078512211', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20078512211'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PASCUAL FERMIN ROMERO', NULL, NULL, '20078600722', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20078600722'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS EGGEL', NULL, '03496-421336', '20078903172', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20078903172'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUIS ANGEL CUADRADO', NULL, NULL, '20079145514', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20079145514'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARMANDO PALACIO RODRIGUEZ', NULL, '0291 4527449', '20079416747', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20079416747'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FELIPE VICENTE GOMEZ', NULL, NULL, '20080136197', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20080136197'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VARGAS JORGE CESAR', NULL, NULL, '20080426349', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20080426349'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSE IGNACIO GARICA HAMILTON', NULL, '4816-5803', '20080819375', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20080819375'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUSTAVO RUBEN PABLO ENGULIAN', NULL, '4805-3140', '20081048887', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20081048887'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ENRIQUE ZULETA PUCEIRO', NULL, '4313-5040', '20081571393', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20081571393'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AVELLANEDA ALFREDO D.', NULL, '3-4508/5826', '20081757853', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20081757853'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALEJANDRO TENCONI', NULL, NULL, '20082094726', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20082094726'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SALVADOR GIL PH. D', NULL, NULL, '20082099345', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20082099345'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE HAMPTON', NULL, NULL, '20082432583', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20082432583'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO DANIEL SANCHEZ', NULL, NULL, '20082750623', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20082750623'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLORERIA BELTZA', NULL, '811-4516', '20082883674', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20082883674'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDO BOLLA AGRELO', NULL, '4826-8044', '20082985558', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20082985558'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUELAR DIEGO RAMIRO', NULL, NULL, '20083411296', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20083411296'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUILLERMO ICKOWICZ', NULL, '4922-7930', '20083413167', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20083413167'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO BELLAVIA', NULL, '49418374', '20083442612', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20083442612'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALBERTO SALVADOR CALAFIORE', NULL, NULL, '20083484447', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20083484447'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS HUGO TAVERNA', NULL, NULL, '20083520877', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20083520877'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIC. MARIO A. SALINARDI', NULL, NULL, '20083825252', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20083825252'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BERNARDO PEDRO KOSACOFF', NULL, NULL, '20083890542', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20083890542'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARBERO JOSE ANTONIO', NULL, NULL, '20084064336', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20084064336'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TREVESSE ROBERTO SAMUEL', NULL, NULL, '20084505863', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20084505863'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SPERAGGI JORGE', NULL, NULL, '20084611884', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20084611884'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRAFICA RENACIENTO', NULL, NULL, '20084624684', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20084624684'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PARTIDA HECTOR RICARDO', NULL, NULL, '20084800687', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20084800687'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUSTAVO J. STAFFORINI', NULL, '0320-91194/92154', '20084900541', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20084900541'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VILMET', NULL, '4382-7977/4903', '20085158539', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20085158539'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MIGUEL CORE', NULL, NULL, '20085655672', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20085655672'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUILLERMO EMILIO NIELSEN', NULL, NULL, '20085733908', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20085733908'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPEZ MURPHY RICARDO', NULL, '314-1990', '20085756223', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20085756223'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BOTBOL MARCOS', NULL, NULL, '20085864700', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20085864700'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'APRIKIAN DANIEL A.', NULL, '400-9456', '20085896203', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20085896203'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN JOSE BARSOLA', NULL, '4951-8179', '20085953819', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20085953819'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO DANIEL PESARESI', NULL, '4572-9829', '20086345626', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20086345626'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALVAREZ ADRIAN', NULL, NULL, '20086379687', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20086379687'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TRAMEZZANI JUAN JOSE', NULL, NULL, '20100922232', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20100922232'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CESAR H.BATTISTOTTI', NULL, '4683-3832', '20101248756', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20101248756'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FARJI ALBERTO', NULL, NULL, '20101290264', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20101290264'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CESAR GUTIERREZ EGUIA', NULL, '4783-74546', '20101319718', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20101319718'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLOM JORGE GUILLERMO', NULL, NULL, '20101332013', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20101332013'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DANIEL ALBERTO SABSAY', NULL, NULL, '20101340067', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20101340067'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KOVATEL AUDIO Y VIDEO', NULL, '4952-2959', '20101412092', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20101412092'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTRADA ENRIQUE DANIEL', NULL, NULL, '20101609791', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20101609791'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TAMANINI HECTOR FEDERICO', NULL, NULL, '20101776957', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20101776957'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZAMMARANO JOSE SALVADOR', NULL, NULL, '20101926622', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20101926622'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESCRIBANIA MUGABURU', NULL, '4374-3132/4373-1422/', '20102038577', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20102038577'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANDREUCCI CARLOS ALBERTO', NULL, NULL, '20102158297', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20102158297'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ERNESTO JORGE ARRIAGA', NULL, NULL, '20102456387', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20102456387'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BLANCO ALFREDO FELIX', NULL, NULL, '20102520107', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20102520107'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HOMERO BIBILONI', NULL, '421-7984', '20103536546', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20103536546'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PINTO DANIEL OSVALDO', NULL, NULL, '20103540152', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20103540152'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIO ALEJANDRO MAUER', NULL, NULL, '20103905908', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20103905908'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HORACIO EDUARDO COSTA', NULL, NULL, '20104233679', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20104233679'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ENRIQUE DANTE BOTTO TRIPODARO', NULL, NULL, '20104683461', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20104683461'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAFRAYA EDUARDO EMILIO', NULL, NULL, '20105327138', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20105327138'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROBINSON TOMAS ANTONIO', NULL, NULL, '20105960604', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20105960604'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSE FRANCISCO CANO', NULL, NULL, '20106004472', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20106004472'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FRANCISCO LAMANNA', NULL, NULL, '20106196169', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20106196169'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KIERZNER JORGE IGNACIO', NULL, NULL, '20106315141', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20106315141'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUILLERMO LUIS PERKINS', NULL, NULL, '20106504041', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20106504041'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OBRAS Y PINTURAS - RICARDO J. BONORIS', NULL, '4823-7887', '20106616451', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20106616451'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSE MARIA JAUREGUI', NULL, NULL, '20106901350', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20106901350'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HECTOR GONANO', NULL, NULL, '20106930253', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20106930253'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIENDO  HUGO OSCAR', NULL, '0351-156513643', '20107430009', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20107430009'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Carlos Alberto Pastor', NULL, NULL, '20107803638', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20107803638'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZARITZKY JOSE LUIS', NULL, NULL, '20108327872', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20108327872'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALEJANDRO LEONARDO TANCREDI', NULL, NULL, '20109177203', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20109177203'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FRANCISCO A. DI CARLO', NULL, NULL, '20109877205', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20109877205'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAUL ENRIQUE BELLUCCIA', NULL, NULL, '20110204176', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20110204176'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUILLERMO ERNESTO DRALETTI', NULL, NULL, '20110223715', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20110223715'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RIOS GOMEZ JULIO ARGENTINO', NULL, NULL, '20110520221', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20110520221'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANIBAL DAHER', NULL, NULL, '20111201243', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20111201243'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'STARICCO EDUARDO JAVIER', NULL, NULL, '20111203238', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20111203238'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDGARDO SALVADOR SPIRIDIONE', NULL, NULL, '20111882410', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20111882410'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERLA  CARLOS ALFREDO', 'estudio@ferla-muzi.com.ar', '0351-4210872', '20111886521', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20111886521'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ECHAVARRIA LUIS ALBERTO', NULL, NULL, '20111944718', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20111944718'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEINE  LUIS  ANTONIO', NULL, NULL, '20112555065', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20112555065'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN RODRIGUEZ AZUA', NULL, NULL, '20112666932', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20112666932'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COHEN  JABOBO DANIEL', NULL, NULL, '20112966456', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20112966456'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS ERNESTO DE FILLIPO', NULL, NULL, '20113864266', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20113864266'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DANIEL VICTOR SOSA', NULL, '4504-7349', '20114096408', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20114096408'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARAMELO HECTOR CARLOS', NULL, NULL, '20114142892', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20114142892'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAGNUM SERVICE - EDUARDO L. COMETTA', NULL, '4791-0255/154420-2446', '20114277364', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20114277364'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROBERTO NESTOR BRUNO', NULL, NULL, '20114519643', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20114519643'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GONZALEZ LUIS EDUARDO', NULL, NULL, '20114528227', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20114528227'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTIN DANIEL EDUARDO', NULL, NULL, '20114603024', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20114603024'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RICARDO CRESPO', NULL, NULL, '20114783650', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20114783650'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUCIO DANIEL TRAVERSO', NULL, NULL, '20114783804', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20114783804'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HORACIO TOMAS LIENDO(H)', NULL, '4393-3363  4345-4510/15', '20114987337', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20114987337'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SAFATLE JULIO CESAR', NULL, NULL, '20114992217', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20114992217'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SAVRANSKY CARLOS ALBERTO', NULL, NULL, '20115288149', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20115288149'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIMPIEZA', NULL, NULL, '20115307151', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20115307151'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROBERTO MARIO FEVRE', NULL, NULL, '20115742311', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20115742311'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERGIO LIBMAN', NULL, NULL, '20116244765', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20116244765'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MININNI HORACIO CONRADO', NULL, NULL, '20116341566', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20116341566'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Kobiela Jose', NULL, NULL, '20117352103', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20117352103'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROBERTO ANTONIO MANSILLA', NULL, NULL, '20117554466', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20117554466'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DURAN VICTOR CARLOS RAMON', NULL, NULL, '20117580955', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20117580955'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAVAGLIA   FERNANDO HUGO', NULL, NULL, '20117673082', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20117673082'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE LUIS DE URQUIETA', NULL, NULL, '20117730337', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20117730337'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN CARLOS MARAZZI', NULL, NULL, '20117869270', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20117869270'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HECTOR ALBERTO PERUCHENA', NULL, NULL, '20117904513', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20117904513'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMERICO MARCELO CARMONA', NULL, NULL, '20118382510', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20118382510'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DOVAL OSVALDO RICARDO', NULL, NULL, '20118773315', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20118773315'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO JOSE ARES', NULL, NULL, '20118935021', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20118935021'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS ALEJANDRO KERLAKIAN', NULL, NULL, '20119241112', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20119241112'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NESTOR D. PAUTASIO', NULL, '4811-1071 / 75', '20119266212', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20119266212'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE EMILIO ABRAMIAN', NULL, NULL, '20119575347', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20119575347'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS ERAUSQUIN', NULL, '15-4414-4418', '20119857091', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20119857091'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS ENRIQUE TABANERA', NULL, NULL, '20119877645', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20119877645'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Gutman sergio', NULL, NULL, '20120111923', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20120111923'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARGUELLO JORGE MARTIN ARTURO', NULL, NULL, '20120457404', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20120457404'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIO DANIEL MOLDOVAN', NULL, NULL, '20120828593', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20120828593'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN JOSE LANSKY', NULL, NULL, '20121726743', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20121726743'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SCHOLOSSER CARLOS MARTIN', NULL, NULL, '20122122019', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20122122019'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HIPUS - GONZALO FRANCISCO ALBARRACIN', NULL, '0221-480-0253', '20122383769', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20122383769'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ACOSTA  LUIS ALDO', NULL, NULL, '20122451543', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20122451543'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BRINGAS OSCAR GERARDO', NULL, NULL, '20122539017', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20122539017'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEVY EDUARDO ISAAC', NULL, NULL, '20122545955', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20122545955'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SCHWEINHEIM GUILLERMO FERNANDO F', NULL, NULL, '20122894178', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20122894178'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Cardenas Miguel Angel', NULL, NULL, '20122955606', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20122955606'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PASTEN RODOLFO ARTURO', NULL, '0264 155046338', '20123063768', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20123063768'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARTURO GUILLERMO ARIAS', NULL, NULL, '20124215952', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20124215952'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELECSERVICE', NULL, '15-4973-0387', '20124227233', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20124227233'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESPECHE MIGUEL ENRIQUE', NULL, NULL, '20124438773', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20124438773'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAMON ALBERTO RADA', 'arquitecto@ramonrada.com', '4672-3016', '20125036032', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20125036032'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MOZZI SILVIA ALEJANDRA', NULL, NULL, '20125451323', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20125451323'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODOLFO SANTANGELO', NULL, '4312-1908', '20125483926', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20125483926'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARBOLEYA G.', NULL, NULL, '20125495444', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20125495444'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BURELLI RICARDO HORACIO', NULL, NULL, '20125630635', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20125630635'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDEZ HECTOR EDUARDO', NULL, NULL, '20125658769', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20125658769'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS MELCONIAN', NULL, '4312-1908', '20125998624', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20125998624'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MENDEZ GUILLERMO MARCELO', NULL, NULL, '20126395451', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20126395451'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARON ALBERTO WALTER', NULL, '4811-0570/4133', '20127142360', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20127142360'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAREZ RICARDO', NULL, NULL, '20127171093', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20127171093'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIEGO OSCAR CHAGAY', NULL, NULL, '20127623423', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20127623423'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTINEZ  GUSTAVO ANDRES', NULL, NULL, '20127755273', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20127755273'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CRESPO FLORIAL AUGUSTO', NULL, NULL, '20128096656', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20128096656'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NIELSEN R. OSCAR ANTONIO', NULL, NULL, '20128736051', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20128736051'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROBERTO EDUARDO AVILIA', NULL, NULL, '20128843761', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20128843761'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KREIMER NESTOR ARIEL', NULL, '4700', '20129697882', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20129697882'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN J. INCLAN', NULL, NULL, '20130113673', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20130113673'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROZENTAL SERGIO ADRIAN', NULL, '15-4414-4418', '20130802258', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20130802258'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMIO ANTONIO HORACIO MARCELO', NULL, NULL, '20131319135', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20131319135'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN CARLOS ANGELOME', NULL, NULL, '20131327308', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20131327308'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HECTOR SALINAS', 'HECTORFOTOVIDEO@COPELNET.COM.AR', '0299 4965503', '20131482893', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20131482893'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN CARLOS COINTRY', NULL, NULL, '20131824433', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20131824433'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEDERIK GUILLERMO LUIS', NULL, NULL, '20131829427', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20131829427'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NERY PUMPIDO', NULL, NULL, '20131903074', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20131903074'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CHOQUE FIDEL ARMANDO', NULL, NULL, '20132202576', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20132202576'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRINTER PC', NULL, '4372-5732/5621', '20132226971', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20132226971'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS AMADO RODRIGUEZ', NULL, NULL, '20132752827', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20132752827'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COTARELO GARCIA DANIEL ALBERTO', NULL, NULL, '20133055968', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20133055968'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VENEGONI OSCAR HUGO', NULL, '0', '20133687239', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20133687239'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO JOSÉ RODRÍGUEZ', NULL, NULL, '20133745085', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20133745085'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JAIR MARIO ALBERTO', NULL, NULL, '20133857894', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20133857894'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELO SEVERIO', NULL, NULL, '20134171775', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20134171775'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'POMBO MIGUEL ANGEL', NULL, NULL, '20134310899', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20134310899'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN ANTONIO IACOVELLI', NULL, '4762-1033', '20134370751', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20134370751'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANTIAGO LUIS SOLERI', NULL, NULL, '20134574489', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20134574489'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SATEL  CLAUDIO FRANCO', NULL, NULL, '20134629771', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20134629771'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONTARTESE DANIEL HORACIO', NULL, NULL, '20135156788', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20135156788'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AIRALDI ABEL ERNESTO', NULL, NULL, '20135163369', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20135163369'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE ABEL SCUTICCHIO', NULL, '4777-9133/9348', '20135295702', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20135295702'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LSC SISTEMA DE SONIDO Y VIDEO', NULL, '4781-1746/15-4992-2424', '20135307972', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20135307972'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARENGO  GERARDO RAUL', 'ventas@lidertrofeos.com', '0351-157192716/4229165', '20135381641', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20135381641'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VALDA JUAN CARLOS', NULL, NULL, '20135658252', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20135658252'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BALLAY HUGO ALBERTO', NULL, NULL, '20135995895', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20135995895'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUIS ALBERTO PAILLALEF', NULL, NULL, '20136542207', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20136542207'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARQ. MARTIN BAINTRUB', NULL, NULL, '20137364280', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20137364280'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELO EDUARDO NASJLETI', NULL, NULL, '20137364515', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20137364515'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALBERTO FEHRMANN', NULL, NULL, '20137545315', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20137545315'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'F.B. FUMIGACIONES', NULL, NULL, '20138238734', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20138238734'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AUGUSTO CARLOS PORTAIS', NULL, NULL, '20138814972', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20138814972'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CANTU ALEJANDRO DOMINGO', NULL, NULL, '20139125631', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20139125631'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARUJ ROBERTO', NULL, '15-4414-4418', '20139245661', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20139245661'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IGLESIAS GUILLERMO RAMON', NULL, '15-4414-4418', '20139485816', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20139485816'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAUL EDUARDO ZORRILLA', NULL, NULL, '20139517521', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20139517521'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS HUMBERTO ROUMEC', NULL, NULL, '20139811357', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20139811357'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPO K', NULL, NULL, '20140111970', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20140111970'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPEZ NOCERA MARCELO UBALDO', NULL, NULL, '20140140172', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20140140172'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EVENTOS ESPECIALES', NULL, '394-7821', '20140514757', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20140514757'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CHERNICKI JORGE DANIEL', NULL, NULL, '20140701891', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20140701891'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DENTATI Ingeniería Eléctrica', NULL, '4634-1234 o 15-5308-5111', '20141012305', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20141012305'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FISSORE NESTOR JUAN', NULL, NULL, '20141038150', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20141038150'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JULIO BAREIRO', NULL, NULL, '20141144163', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20141144163'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROZITCHNER ALEJANDRO', NULL, NULL, '20142218683', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20142218683'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAUL BELLOMUSTO', NULL, NULL, '20142642507', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20142642507'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DANIEL GALILEA (P)', NULL, NULL, '20143096166', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20143096166'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RUBINSTEIN JAVIER EDGARDO', NULL, NULL, '20143165303', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20143165303'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BERGER GABRIEL DARIO', NULL, NULL, '20143694160', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20143694160'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COLOMBO HORACIO DANIEL', NULL, '4700', '20143961428', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20143961428'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE NORBERTO ZANA', NULL, NULL, '20143991440', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20143991440'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIO JOSE BRENKIER', NULL, NULL, '20144189370', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20144189370'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DELGADO NORBERTO RUBEN', NULL, NULL, '20144311079', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20144311079'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALFREDO ANTONIO VALLEJOS BENEVENTANO', NULL, NULL, '20145234337', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20145234337'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GANDINI JOSE MARIA', NULL, NULL, '20145653046', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20145653046'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LABAL HERNAN JAVIER', NULL, NULL, '20145671168', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20145671168'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FABIAN CALCAGNO', NULL, NULL, '20145685762', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20145685762'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASARTELLI MARCELO HORACIO', NULL, NULL, '20145757046', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20145757046'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEREZ  REDRADO HERNAN MARTIN', NULL, NULL, '20146109714', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20146109714'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTINO GABRIEL GUSTAVO', NULL, NULL, '20146192328', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20146192328'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGUEZ CARLOS DANIEL', NULL, '4361-2826/4362-2500', '20146797939', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20146797939'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CRISTIAN CLAUDIO CRIVELLI', NULL, NULL, '20146808663', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20146808663'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OMAR DARIO GARZONIO', NULL, NULL, '20147571276', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20147571276'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NORBERTO NICOLAS COTGIA', NULL, NULL, '20148475475', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20148475475'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TOPOR SERGIO GABRIEL', NULL, NULL, '20148672416', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20148672416'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CACHON NORBERTO DANIEL', NULL, '0', '20148853410', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20148853410'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GABRIEL VAZQUEZ-FOTO Y VIDEO SERV.DELTA', NULL, NULL, '20148970441', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20148970441'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALEJANDRO JAVIER MORDUCHOWICZ', NULL, NULL, '20149005480', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20149005480'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ING. MARCELO CAMMISA', NULL, '44414-5474', '20149107445', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20149107445'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SESTO CLAUDIO DANIEL', NULL, NULL, '20149227335', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20149227335'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AIRA VICTOR GERARDO', NULL, NULL, '20149323245', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20149323245'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUSTAVO GABRIEL GRINBLAT', NULL, NULL, '20149522531', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20149522531'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPEZ ANDRES FLAVIO', NULL, NULL, '20149573675', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20149573675'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DANIEL FIORITO', NULL, NULL, '20149578022', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20149578022'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JEREZ DANIEL GONZALO', NULL, NULL, '20149698060', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20149698060'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAPARELLI MARCELO CLAUDIO', NULL, NULL, '20149966448', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20149966448'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'benito abal diez', NULL, NULL, '20152716002', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20152716002'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CORREO ARG.U.POSTAL 3630 -JERZY REKTOR', NULL, '436179670', '20153115835', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20153115835'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLEMENTE  JOSE DARIO', 'darioclemente@acrilicor.com.ar', '0351-153050449', '20160150018', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20160150018'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PINEIRO EDUARDO HIGINO', NULL, NULL, '20160501937', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20160501937'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS HORACIO PUYOL', NULL, NULL, '20161274969', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20161274969'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELO FERREYRA', NULL, NULL, '20161391280', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20161391280'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LISCHINSKY MARCELO GABRIEL', NULL, NULL, '20161858502', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20161858502'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIGIER HERNAN PEDRO', NULL, NULL, '20162060970', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20162060970'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TABAKMAN DAMIAN ANIBAL', NULL, NULL, '20162256093', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20162256093'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EMILIO BACIGALUPPI', NULL, NULL, '20162476581', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20162476581'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WORTMAN JOFRE HUGO MARIO', NULL, NULL, '20162878779', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20162878779'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSE OSCAR LOPEZ', 'aluminecatamarca@arnet.com.ar', '0383-4443559', '20162961552', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20162961552'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE STEFANO HORACIO EDUARDO', NULL, NULL, '20163320224', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20163320224'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASAS SERGIO RUBEN JOSE', NULL, NULL, '20163448328', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20163448328'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MUTIGLIENGO SERGIO LINDOR', NULL, NULL, '20164044824', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20164044824'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VOLONTE RUBEN MARIO', NULL, NULL, '20165027060', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20165027060'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OSCAR LIBERMAN', NULL, NULL, '20165215290', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20165215290'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO MOLINA', NULL, NULL, '20165218249', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20165218249'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARGAZZI MARCELO', NULL, NULL, '20165553633', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20165553633'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN MARTIN CANEDO PEÑA', NULL, NULL, '20165572212', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20165572212'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NESTOR FERNANDO GIORGI', NULL, NULL, '20165815816', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20165815816'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDO A. VILLALBA', NULL, '4314-1689', '20165820852', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20165820852'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NUÑEZ ENRIQUE JAVIER', NULL, NULL, '20165995628', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20165995628'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ATELIER AVIAM', NULL, NULL, '20166397465', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20166397465'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MERLO HECTOR FERNANDO', NULL, NULL, '20166398917', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20166398917'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LANZILLOTTA JOSE ANTONIO', NULL, '4700', '20166571058', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20166571058'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE LIECHTENSTEIN RODOLFO EDUARDO', NULL, NULL, '20166727856', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20166727856'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DUGO RUBEN OSCAR', NULL, NULL, '20166892830', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20166892830'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'QUIROGA CARLOS ALBERTO', NULL, NULL, '20166946019', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20166946019'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MONTALVO MARTIN', NULL, NULL, '20167276246', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20167276246'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FABIAN RAMON CABRERA (P)', NULL, NULL, '20167916814', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20167916814'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HERNANDEZ SERGIO SANTOS', NULL, NULL, '20168137495', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20168137495'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRATZ JAVIER BERNARDO', NULL, NULL, '20168925213', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20168925213'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUSTAVO ADOLFO GALILEA', NULL, '4305-1155', '20168957735', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20168957735'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGUERO PIÑERO  JUAN PABLO', NULL, NULL, '20169036196', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20169036196'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PODESTA HORACIO NICOLAS', NULL, NULL, '20169381284', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20169381284'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO IGNACIO OTAMENDI', NULL, NULL, '20169393746', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20169393746'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TROIA WALTER GABRIEL (P)', NULL, NULL, '20169754900', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20169754900'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CROCE HORACIO ALBERTO', NULL, NULL, '20169771759', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20169771759'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GIVOGRI PABLO ALBERTO', NULL, NULL, '20170043651', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20170043651'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROGELIO DIEGO GONZALEZ', NULL, NULL, '20170255764', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20170255764'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIC.ABRAM ALDO MARIO', NULL, NULL, '20170298455', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20170298455'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HECTOR DANIEL BORTOLIN', NULL, NULL, '20170309570', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20170309570'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLAUDIO FABIAN SAGRE', NULL, NULL, '20171061556', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20171061556'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAMPIS JORGE', NULL, '207-6364', '20171087881', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20171087881'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TELLO CRISTIAN DIEGO', NULL, NULL, '20171416745', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20171416745'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HERNAN GUSTAVO REIKEN', NULL, NULL, '20171718474', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20171718474'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BACIGALUPPI CRISTIAN', NULL, NULL, '20171979480', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20171979480'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TODO CAÑO - ESPECHE MIGUEL ANGEL', NULL, NULL, '20172167625', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20172167625'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEDRO JOSE RUIZ', NULL, NULL, '20172167951', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20172167951'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANDLER ADOLFO VALENTIN', NULL, NULL, '20172183663', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20172183663'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANDRES FERNANDO OTEIZA - GRUTA MINERALES', NULL, NULL, '20172545514', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20172545514'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RICARDO FABIAN GALFRASCOLI', NULL, NULL, '20172863842', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20172863842'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEONARDO A. DI MAIO', NULL, '372-8032', '20173232293', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20173232293'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO MARTINEZ BURKETT', NULL, '4384-6321', '20173442824', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20173442824'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUIS FERNANDO FUENTES', NULL, NULL, '20173547782', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20173547782'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUILLERMO CARLOS TELLA', NULL, NULL, '20173633298', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20173633298'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BACIGALUPPI ANGEL GABRIEL', NULL, NULL, '20173650850', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20173650850'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KEISMAJER AGUSTIN', NULL, NULL, '20173836415', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20173836415'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGUIRRE JORGE ALBERTO', NULL, NULL, '20173844078', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20173844078'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RECUPIDO  LUIS DANIEL', NULL, NULL, '20173854324', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20173854324'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERGIO KOHN', NULL, NULL, '20174540404', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20174540404'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MEZZELANI GUSTAVO DANTE', NULL, NULL, '20174623822', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20174623822'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELO BUSOLINI', NULL, NULL, '20174667560', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20174667560'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUIS M. LAVIRGEN ENRIQUEZ', NULL, NULL, '20174842680', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20174842680'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALEJANDRO CARLOS ZAMPRILE', NULL, NULL, '20174996947', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20174996947'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HAMZE ROBERTO CARIM', NULL, NULL, '20175473174', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20175473174'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PELLEGRINO CARLOS ALFREDO', NULL, NULL, '20175498517', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20175498517'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SPAGNUOLO LEONARDO EMILIO', NULL, NULL, '20175504037', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20175504037'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MASTERSOFT', NULL, '4305-3562/4306-7459', '20175761714', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20175761714'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE ANGELIS RODOLFO', NULL, NULL, '20175819712', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20175819712'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGUIRRE EDUARDO NELSON', NULL, NULL, '20175908219', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20175908219'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MATIAS LIPSZYC', NULL, NULL, '20176065452', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20176065452'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE FERNANDEZ BELDA', NULL, NULL, '20176066629', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20176066629'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TARDELLI ANTONIO', NULL, NULL, '20176154331', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20176154331'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO KASTIKA', NULL, NULL, '20176346931', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20176346931'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MOGLIATI SERGIO FABIAN', NULL, NULL, '20176658399', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20176658399'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTIN REPETTO ALCORTA', NULL, NULL, '20176746026', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20176746026'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUILLERMO NORBERTO SICA', NULL, NULL, '20177489701', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20177489701'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANDRES FELIX GHIA', NULL, '15-5515-8590', '20177591158', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20177591158'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EYRAS ISMAEL HERNAN', NULL, NULL, '20177722031', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20177722031'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOS CEDROS - RICARDO IPPOLITO', NULL, NULL, '20177891658', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20177891658'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SCHUJMAN ALEJANDRO DANIEL', NULL, NULL, '20178066502', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20178066502'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPEZ MARCOS GABRIEL', NULL, NULL, '20178556585', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20178556585'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LARCAMON MAXIMO', NULL, NULL, '20179313759', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20179313759'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE ALEJANDRO NUÑEZ', NULL, NULL, '20179786649', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20179786649'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REUSA GABRIEL', NULL, NULL, '20179851661', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20179851661'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DANIEL PABLO CUTINI', NULL, NULL, '20179998581', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20179998581'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BERARDO ARIEL ALEJANDRO', NULL, NULL, '20180164929', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20180164929'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HECTOR OSVALDO ROCHA', NULL, NULL, '20181356619', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20181356619'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BATTAGLINO ROBERTO CARLOS', NULL, NULL, '20181445255', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20181445255'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TSD LIGHTING SYSTEM', NULL, '4642-5379', '20181510472', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20181510472'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROSALES RUBEN FABIAN', NULL, NULL, '20181734524', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20181734524'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOCOCO EUGENIO ANIBAL', NULL, NULL, '20181834812', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20181834812'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIANO JAVIER DRETS', NULL, NULL, '20181844842', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20181844842'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE A. GARROCHO TERÁN', NULL, NULL, '20181863782', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20181863782'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BACIGALUPPI MARCELO MARTIN', NULL, NULL, '20181952513', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20181952513'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIGITAL VISION - PABLO RICARDO', NULL, NULL, '20182421481', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20182421481'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JULIO CESAR BLANCO', NULL, NULL, '20182680428', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20182680428'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEWIN DANIEL CLAUDIO', NULL, NULL, '20182851206', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20182851206'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WALTER ORLANDO NICORA', NULL, '4562242', '20183330331', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20183330331'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VERON MARCELO LEONARDO', NULL, NULL, '20183508165', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20183508165'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PICCININI EDUARDO JAVIER', NULL, NULL, '20183561791', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20183561791'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN LUIS SANGUINETTI', NULL, NULL, '20183636155', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20183636155'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE ALBERTO PANELLA', NULL, NULL, '20183742540', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20183742540'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARGAÑARAZ NADIN FABIAN', NULL, NULL, '20183855558', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20183855558'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTIN GERMAN RICARDO', NULL, NULL, '20184084814', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20184084814'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAUL GUILLERMO SCHINDLER KRAUS', NULL, NULL, '20184203155', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20184203155'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOCKETT GUILLERMO EMILIO', NULL, NULL, '20184378745', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20184378745'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO G. FLASTERSZTEIN', NULL, NULL, '20184417562', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20184417562'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALBERTO DANIEL DEL ROSSO', NULL, '4314-4799', '20184582423', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20184582423'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZOHIL JUAN JOSÉ', NULL, '3434218094', '20185067743', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20185067743'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS KAUF', NULL, NULL, '20186215975', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20186215975'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAVON ERNESTO FABIAN', NULL, NULL, '20186397097', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20186397097'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSE LUIS LENS FERNANDEZ', NULL, NULL, '20187061319', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20187061319'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JAIME C. RAMIREZ', NULL, NULL, '20187240566', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20187240566'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALONSO BERNADAS NAHUEL', NULL, NULL, '20187863377', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20187863377'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GONZALEZ DEL PINO AGUSTIN', NULL, NULL, '20188334688', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20188334688'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KOCAK SERVEN', NULL, NULL, '20188968369', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20188968369'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PANTIN RUIZ JUAN VICENTE', NULL, NULL, '20190567177', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20190567177'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PANORAMA GRAFICA & DISEÑO', NULL, NULL, '20200051190', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20200051190'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDO PABLO STISMAN', NULL, NULL, '20200051808', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20200051808'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FAVIO LAZZARINI', NULL, '0223-4945179', '20200516878', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20200516878'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DARIO ELIAS ORLINSKI', NULL, NULL, '20200594437', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20200594437'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANCHEZ HUGO RICARDO', NULL, NULL, '20201304696', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20201304696'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIGNOLI LUIS RODOLFO', NULL, NULL, '20201675899', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20201675899'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CINO DOMINGO MIGUEL', NULL, NULL, '20202018727', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20202018727'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VENERE RAFAEL', NULL, NULL, '20202157603', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20202157603'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROSSO MARCELO EDUARDO', NULL, NULL, '20202302875', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20202302875'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NAVARRO MARIO ALFREDO', NULL, NULL, '20202531386', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20202531386'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOLINSKY SERGIO', NULL, NULL, '20202831959', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20202831959'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALESSI MIGUEL ANGEL', NULL, NULL, '20203447974', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20203447974'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGO VERGARA', NULL, NULL, '20203555947', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20203555947'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LACUNZA JORGE ROBERTO HERNAN', NULL, NULL, '20204065471', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20204065471'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUILLERMO A. CISTERNA', NULL, '5032-6477', '20204103292', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20204103292'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUDRIS KLAZ FABIO GABRIEL', NULL, NULL, '20204279900', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20204279900'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JULIO ALBERTO ROJAS', NULL, NULL, '20204309699', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20204309699'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPEZ JOSE NICOLAS', NULL, NULL, '20204502820', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20204502820'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ACE DATA COMPUTERS', NULL, '4504-5190', '20204773115', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20204773115'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GANCEDO MARCELO RAUL', NULL, '0', '20205128671', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20205128671'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HATUM ANDRES OSAMA', NULL, NULL, '20205146092', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20205146092'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEÑA MARTIN MIGUEL', NULL, NULL, '20205377620', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20205377620'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELO OSCAR OLGUÍN', NULL, NULL, '20205417762', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20205417762'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'POZA PABLO MARTIN', NULL, NULL, '20205673424', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20205673424'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARIEL ALBERTO COREMBERG', NULL, NULL, '20205729497', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20205729497'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTUDIO YALET - LEONARDO YALET', NULL, '2060-2833', '20205860240', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20205860240'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALLENDE FERNANDO JOSE', NULL, NULL, '20205918303', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20205918303'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERGIO ARIEL ESPINOSA', NULL, NULL, '20206075725', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20206075725'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LORENZO SEBASTIAN JOSE', NULL, NULL, '20206228181', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20206228181'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FACUNDO FRANCISCO MANES', NULL, NULL, '20206355825', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20206355825'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGUEZ MARIANO JORGE', NULL, NULL, '20206365405', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20206365405'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN JOSE CITINO', NULL, NULL, '20206386607', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20206386607'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BURNA FAVIO ALEJANDRO ERNE', NULL, NULL, '20206485540', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20206485540'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEREZ CANTOS ALFREDO JAVIER', NULL, NULL, '20206650959', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20206650959'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIOTTI JORGE DAMIAN', NULL, NULL, '20206769581', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20206769581'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEBASTIAN LOPES PERERA', NULL, NULL, '20206826844', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20206826844'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Sardina Joaquin Miguel', NULL, NULL, '20206917831', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20206917831'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSE DANIEL DAZA', NULL, NULL, '20207583465', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20207583465'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUSTAVO ENRIQUE SANCHEZ ROMERO', NULL, NULL, '20207792900', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20207792900'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MANZUR JOSE MARIA', NULL, NULL, '20208148843', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20208148843'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARANCIBIA WALTER DARIO', NULL, NULL, '20209223431', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20209223431'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIEL JORGE EDUARDO', NULL, NULL, '20209252482', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20209252482'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GARCIA REUS NESTOR RAUL', NULL, NULL, '20209425204', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20209425204'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DARIO GUSTAVO ROMERO (P)', NULL, '420-6022/472-2345', '20210729934', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20210729934'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEGAL GABRIEL ALEJANDRO', NULL, NULL, '20211408511', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20211408511'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSENS GASTON EMILIO', NULL, NULL, '20211422727', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20211422727'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANDRES IGNACIO CARLI', NULL, '45249-4085/154249-4085', '20211561247', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20211561247'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RUBEN CEFERINO ESCOBAR', NULL, NULL, '20213126580', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20213126580'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUSTAVO RUBEN TINTE', NULL, NULL, '20213222490', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20213222490'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE LEONARDO MADCUR', NULL, NULL, '20213575490', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20213575490'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ENRIQUE CARRIZO', NULL, NULL, '20213605705', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20213605705'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANDRO DE AMBRIOSO', NULL, NULL, '20214349443', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20214349443'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUSCAGLIA MARCOS ANDRES', NULL, NULL, '20214846870', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20214846870'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EZEQUIEL RIVAROLA', NULL, NULL, '20214961548', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20214961548'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COLLADO MARIO ALBERTO', NULL, NULL, '20215045715', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20215045715'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGUEZ JORGE LUIS', NULL, NULL, '20215535518', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20215535518'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KIOSCO- Ernesto Miguez', NULL, NULL, '20215992684', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20215992684'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIEGO CARLOS MASELLO', NULL, NULL, '20216023405', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20216023405'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PUNTO X PUNTO - CARLOS AUGUSTO TEMPONE', NULL, NULL, '20216440537', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20216440537'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CIRO FABIAN VILTE', NULL, NULL, '20217052069', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20217052069'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO EDUARDO VILLAVERDE', NULL, NULL, '20217207259', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20217207259'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUSTAVO DANIEL DI COSTA', NULL, NULL, '20217301344', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20217301344'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSE GONDELL', NULL, '48990376', '20217966710', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20217966710'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GANEM VICTOR ALBERTO', NULL, NULL, '20218183957', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20218183957'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'STARICCO SEBASTIAN EUGENIO', NULL, NULL, '20218505377', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20218505377'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO J PIRO', NULL, '0341 4406837', '20218856854', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20218856854'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANTIAGO RUBEN CASCARDO', NULL, NULL, '20218863656', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20218863656'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAZZEO FRANCISCO GUSTAVO', NULL, '0', '20219184310', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20219184310'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MIGUEL SILVIO PORTELLA', NULL, NULL, '20219235292', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20219235292'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CRISTIAN CARLOS PAITA', NULL, NULL, '20219240679', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20219240679'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO JORGE ODERIGO', NULL, NULL, '20219383232', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20219383232'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CIANCIARULO GASTON IGNACIO', NULL, NULL, '20219535768', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20219535768'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOUSTEAU  MARTIN', NULL, NULL, '20219540125', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20219540125'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARILA MARIANO', NULL, NULL, '20219541660', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20219541660'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CRESPI  GERMAN ALBERTO', NULL, NULL, '20219666382', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20219666382'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FACUNDO IGNACIO BOLOGNA', NULL, NULL, '20220404626', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20220404626'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESPINOSA LUIS ALBERTO', NULL, NULL, '20220466486', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20220466486'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEONARDO ESTEBAN ARMANINO', NULL, NULL, '20220485588', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20220485588'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARIAS RUBEN EDUARDO', NULL, NULL, '20220969054', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20220969054'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PORCILE MARIANO JAVIER', NULL, NULL, '20221232292', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20221232292'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'STRIER DAMIAN', NULL, NULL, '20221383029', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20221383029'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SCIARROTA FERNANDO LEONARDO', NULL, NULL, '20221570341', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20221570341'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANCHEZ OSCAR ANDRES', NULL, NULL, '20221832710', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20221832710'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROLON WALTER RAMON', NULL, NULL, '20222684456', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20222684456'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VISSANI JORGE FEDERICO', NULL, NULL, '20222804591', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20222804591'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'YMAZ VIDELA ESTEBAN MATIAS', NULL, NULL, '20222930813', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20222930813'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALBERTO RAGGIO', NULL, '4772-1755', '20222971315', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20222971315'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEL CONSULTORES', NULL, '4774-7391', '20223642145', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20223642145'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PARIANI CLAUDIO DAMIAN', NULL, '0', '20223652264', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20223652264'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALEJANDRO BORDOLINI', NULL, NULL, '20224138408', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20224138408'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARTURO IDOYAGA MOLINA', NULL, NULL, '20224307420', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20224307420'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEONEL SANTIAGO PIERRONI', NULL, NULL, '20224488751', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20224488751'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BASANTA SERGIO JESUS', NULL, NULL, '20224712481', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20224712481'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMAN ANDRES AREAN', NULL, NULL, '20224981903', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20224981903'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTIN GUSTAVO BAQUERO', NULL, NULL, '20224993839', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20224993839'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LLITERAS ADRIAN ALBERTO', NULL, NULL, '20225056200', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20225056200'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CHIAPERO ARIEL HUMBERTO', NULL, NULL, '20225232645', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20225232645'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SCHINDELE  CESAR LUIS', NULL, NULL, '20225695254', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20225695254'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Alejandro Salvador Costa', NULL, NULL, '20225881740', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20225881740'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAULS GASTON (P)', NULL, NULL, '20225893080', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20225893080'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HELMAN HERNANDAVID', NULL, NULL, '20225952095', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20225952095'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BLANC GASTON FRANCISCO', NULL, NULL, '20226235516', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20226235516'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIEGO ORTIZ DE GUINEA', NULL, NULL, '20226535765', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20226535765'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CHRISTIAN A GIANI', NULL, NULL, '20226546406', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20226546406'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ERNESTO NICOLAS ALEJANDRO', NULL, NULL, '20226855778', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20226855778'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAURICIO FABIAN MORELLO', NULL, NULL, '20226930559', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20226930559'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEREYRA PABLO NORBERTO', NULL, NULL, '20227187523', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20227187523'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BADANO BRUNO', NULL, NULL, '20227354713', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20227354713'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGO F. ESCRIBANO', NULL, '4245077', '20227765020', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20227765020'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZURETA FERNANDO RAUL MANUEL', NULL, NULL, '20227773414', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20227773414'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CELA GABRIEL GUSTAVO', NULL, NULL, '20227881756', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20227881756'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'diaz caballero javier', NULL, NULL, '20227922479', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20227922479'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRANOVSKY PABLO', NULL, NULL, '20228091341', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20228091341'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCOS ROLANDO ZALAZAR', NULL, NULL, '20228203506', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20228203506'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTIN S.ALZAGA', NULL, NULL, '20228236552', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20228236552'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BORDET ROBERTO MIGUEL', NULL, NULL, '20228490602', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20228490602'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FRANCO CARLOS FABRICIO', NULL, NULL, '20228689107', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20228689107'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPEZ GUEVARA DIEGO MARTIN', NULL, NULL, '20229343344', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20229343344'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARE  JOSÉ JUAN FRANCISCO', NULL, NULL, '20229538366', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20229538366'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'De Los Santos German Guillermo', NULL, NULL, '20229613147', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20229613147'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BONZON MARCELO GABRIEL', NULL, NULL, '20229753763', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20229753763'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPEZ RODRIGO DAMIAN', NULL, NULL, '20230330205', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20230330205'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CRISTIAN CRAGNOLINI', NULL, '0351-4254570', '20230780480', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20230780480'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANCHEZ SARMIENTO  PEDRO NICOLAS', NULL, NULL, '20230781975', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20230781975'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIC. MENAZZI TOMAS MARIA', NULL, NULL, '20230869724', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20230869724'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GONZALEZJOSEALBERTO', NULL, NULL, '20231205900', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20231205900'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BALMACEDA ANDRES', NULL, NULL, '20231346172', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20231346172'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WILCHES ULISES DANIEL', NULL, NULL, '20231348590', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20231348590'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAXIMILIANO GOMEZ AGUIRRE', NULL, NULL, '20231365282', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20231365282'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Garcete Martinez Victor Arturo', NULL, NULL, '20232081571', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20232081571'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SIMAO ANTONIO ALEJANDRO', NULL, NULL, '20233283208', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20233283208'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAPRA BERNARDINO ALFREDO', NULL, NULL, '20233345807', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20233345807'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VALERGA ARAOZ JORGE ALEJANDRO  HIJO', NULL, NULL, '20233551148', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20233551148'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEONARDO JAVIER CAMBIASSO', NULL, NULL, '20233774309', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20233774309'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MANNUCCI MARTIN', NULL, NULL, '20234076346', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20234076346'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMERO  NICOLAS', NULL, NULL, '20234580281', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20234580281'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANDRES PEÑA', NULL, NULL, '20234712897', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20234712897'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BAULO DARHANPE HERNAN', NULL, 'C', '20234788494', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20234788494'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEBASTIAN DA ROSA', NULL, '4942-4559', '20235084997', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20235084997'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAULO VICENTE CANAVA CLAVERO', NULL, NULL, '20235455820', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20235455820'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAMPANARIO SEBASTIAN', NULL, NULL, '20235691060', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20235691060'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DEMARCO PABLO ERNESTO', NULL, '0', '20236057012', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20236057012'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EMILIANO MASCAK', NULL, NULL, '20236287611', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20236287611'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMERO RUBEN SEBASTIAN', NULL, NULL, '20236765041', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20236765041'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOARES MAURO GASTON', NULL, NULL, '20237256426', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20237256426'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TOMBOLINI MATIAS RAUL', NULL, NULL, '20237381514', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20237381514'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELECTRA HOUSE', NULL, '4362-7575', '20237590849', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20237590849'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEBASTIAN VISOTSKY', NULL, NULL, '20237636482', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20237636482'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALEJANDRO SAENZ ROZAS', NULL, NULL, '20237815271', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20237815271'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUSTAVO GUILLERNO GIORGI', NULL, NULL, '20238145776', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20238145776'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HUK FERNANDO SEBASTIAN', NULL, NULL, '20238240345', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20238240345'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JAVIER EDUARDO IZUEL', NULL, NULL, '20238494215', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20238494215'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTINEZ JULIO VICTOR', NULL, NULL, '20238546398', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20238546398'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NELSON A. MALDONADO', NULL, '4813-6131', '20238762635', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20238762635'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARINELLI GABRIEL JEREMIAS', NULL, NULL, '20238774110', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20238774110'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WALTER LOCASCIO', NULL, NULL, '20238997977', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20238997977'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUIDO E. LICHTMAN', NULL, NULL, '20239526986', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20239526986'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAMIREZ LEONARDO ESTEBAN', NULL, NULL, '20239616071', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20239616071'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GONZALEZ DIEGO IGNACIO', NULL, NULL, '20239689370', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20239689370'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUENO ROBERTO ARIEL', NULL, NULL, '20239772626', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20239772626'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GERCHUNOFFALBERTOJAVIER', NULL, NULL, '20239953175', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20239953175'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN CARLOS GIMENEZ', NULL, NULL, '20240081904', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20240081904'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HEVIA GUILLERMO ENRIQUE', NULL, NULL, '20240340012', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20240340012'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAXIMILIANO RUSCONI', NULL, NULL, '20240410932', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20240410932'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERGIO ORLANDO MONACHELLI', NULL, NULL, '20241124291', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20241124291'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARRONDO SIERRA NELSON GUSTAVO', NULL, NULL, '20241284787', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20241284787'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELO IRIBARNE', NULL, NULL, '20241319793', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20241319793'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VILTE JOSE GABRIEL', NULL, NULL, '20241530648', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20241530648'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PARK CRISTIAN ANDRES', NULL, NULL, '20241840574', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20241840574'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASELLA GABRIEL OSCAR', NULL, NULL, '20242271476', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20242271476'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LARROSA FERNANDO HECTOR', NULL, NULL, '20242891407', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20242891407'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTEBAN BALDASARRE', NULL, NULL, '20242923368', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20242923368'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Barbalace Hernan Alberto', NULL, NULL, '20243124272', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20243124272'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KALWILL NICOLAS ALEJANDRO', NULL, NULL, '20243347670', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20243347670'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MATIAS IBARRA', NULL, '4241-8476', '20243533741', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20243533741'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HERNAN RUY MOSSI', NULL, NULL, '20243651361', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20243651361'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDO ESTEBAN RISULEO', NULL, '4758-2538', '20243665303', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20243665303'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO CARLOS BELLUSCIO', NULL, NULL, '20244052380', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20244052380'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAXIMILIANO ARIEL LANDINI', NULL, '0299154584017', '20244053808', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20244053808'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGUIRRE FERNANDO JOSE', NULL, NULL, '20244595376', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20244595376'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO ARIEL JUAREZ', NULL, NULL, '20245292628', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20245292628'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALONSO SCHWARZ GERARDO JOSE', NULL, NULL, '20245726571', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20245726571'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPEZ MARIANO ALEJANDRO', NULL, NULL, '20245963131', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20245963131'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FRIGERIO GERONIMO', NULL, NULL, '20247545930', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20247545930'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MANGINI  RICARDO MARTIN', NULL, NULL, '20247697471', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20247697471'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEDESMA MENDOZA WALTER JOSE LUIS', NULL, '+', '20248163063', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20248163063'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZENOBI DIEGO SEBASTIAN', NULL, NULL, '20248206498', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20248206498'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUCIANO ZERBARINI', NULL, NULL, '20248478897', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20248478897'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEONARDO GUSTAVO VICENTE', NULL, NULL, '20248576724', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20248576724'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROTENBERG ALEJANDRO EZEQUIEL', NULL, NULL, '20248700425', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20248700425'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PILOTTO FERMIN ENRIQUE', NULL, NULL, '20248859165', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20248859165'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMPLIO ESPECTRO-CHRISTIAN S.LYARDET', NULL, NULL, '20248918080', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20248918080'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BISIO ALEJANDRO ALFREDO', NULL, NULL, '20248975823', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20248975823'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPEZ MAURO NAHUIEL', NULL, NULL, '20248998122', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20248998122'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GALARZA ALEJANDRO MARIANO', NULL, NULL, '20249125378', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20249125378'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Sergio Dobkevicius', NULL, NULL, '20249574695', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20249574695'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MALLO LEANDRO NICOLAS', NULL, NULL, '20249600289', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20249600289'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LASTIRE SEBASTIAN', NULL, NULL, '20249984303', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20249984303'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDO JAVIER COLOMBO', NULL, NULL, '20250022655', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20250022655'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMEZAGA SANTIAGO LUIS', NULL, NULL, '20250151439', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20250151439'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BRUNO FULIA', NULL, '0221- 421-7984', '20250166800', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20250166800'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Juan M Fressoli', NULL, '48543674', '20250232943', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20250232943'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DAVID ARIEL AGUIRRE', NULL, NULL, '20250503238', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20250503238'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SILVESTRIN MARCELO', NULL, NULL, '20250960698', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20250960698'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RICARDO GABILONDO', NULL, NULL, '20251241504', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20251241504'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JAVIER BELTRAMO', NULL, NULL, '20251265578', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20251265578'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NICOLAS CENTURION', NULL, '4813-6131', '20251270202', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20251270202'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AVALLE CARLOS', NULL, NULL, '20251616397', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20251616397'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALBERTO OSCAR PALACIOS', NULL, NULL, '20251816477', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20251816477'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERVICOM', NULL, NULL, '20251870463', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20251870463'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CANTARELLI JUAN MANUEL', NULL, NULL, '20252275976', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20252275976'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KERN & ASOCIADOS', NULL, '4778-7184', '20252402471', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20252402471'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTIN GUILLERMO BAEZ', NULL, NULL, '20252467808', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20252467808'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAMINOS  JUAN MANUEL', NULL, NULL, '20252472623', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20252472623'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IACOVONE ARIEL HERNAN', NULL, NULL, '20252483595', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20252483595'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CODESEIRA LUCIANO', NULL, NULL, '20252504568', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20252504568'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOTO FEDERICO', NULL, NULL, '20252518674', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20252518674'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JULIAN FACUNDO CANSECO', NULL, NULL, '20252577921', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20252577921'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEDRO HORACIO MOGLIA', NULL, NULL, '20252783777', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20252783777'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN COLOMBO', NULL, NULL, '20253171880', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20253171880'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BOCHICCHIO   LUCAS EUGENIO', NULL, NULL, '20253438593', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20253438593'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAXIMO SANCHEZ DE BUSTAMANTE', NULL, '0388 154720246', '20253774488', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20253774488'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO PEREZ JAVIER', NULL, NULL, '20254414973', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20254414973'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAMIRO PABLO ESCRIBANO', NULL, NULL, '20254565254', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20254565254'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOMELLO CLAUDIO GERMAN', NULL, NULL, '20254579808', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20254579808'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUCIANO DEL VALLE GUTIERREZ', NULL, NULL, '20254621472', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20254621472'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUILLERMO MATIAS MAZZA', NULL, NULL, '20254912027', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20254912027'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SILVERO JESUS MANUEL', NULL, NULL, '20255049136', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20255049136'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'QUIROGA GERMAN ANDRES', NULL, NULL, '20255501683', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20255501683'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZUKERFELD MARIANO', NULL, NULL, '20255577558', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20255577558'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALEXANDER BRUSCHETTI', NULL, NULL, '20255626273', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20255626273'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RIEZNIK ANDRES ANIBAL', NULL, NULL, '20255978323', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20255978323'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUDUEÑA JOSE MATIAS', NULL, NULL, '20256087082', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20256087082'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEBASTIAN CANTEROS', NULL, NULL, '20256217121', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20256217121'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MENENDEZ ADRIAN LEONARDO', NULL, NULL, '20256698685', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20256698685'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VAMONDE  SERGIO DANIEL', NULL, NULL, '20256743907', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20256743907'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANTONIOLI CARLOS ESTEBAN', NULL, NULL, '20256901588', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20256901588'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CEBALLOS MARCOS ADRIAN', NULL, NULL, '20257500668', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20257500668'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LO CASCIO CARLOS ARIEL', NULL, NULL, '20257504167', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20257504167'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'sabadini mauricio', NULL, NULL, '20257559344', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20257559344'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GONZALEZ DIEGO SEBASTIAN', NULL, NULL, '20257658954', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20257658954'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JULIAN PABLO LA BRUNA', NULL, NULL, '20257704948', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20257704948'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REKTOR JORGESEBASTIAN', NULL, NULL, '20257706916', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20257706916'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGUSTIN BOUILLET', NULL, '46392313', '20258024428', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20258024428'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPEZ GUILLERMO RAFAEL', NULL, NULL, '20258349122', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20258349122'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ORREGO SEBASTIAN ARIEL', NULL, NULL, '20258460244', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20258460244'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERGIO DOMINGUEZ', NULL, NULL, '20258488629', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20258488629'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROBERTO BREPPE', NULL, NULL, '20258918097', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20258918097'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIEGO ALEJANDRO BRAUDE', NULL, '4821-7656', '20258953518', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20258953518'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GARGIULO LEONARDO F', NULL, NULL, '20259144265', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20259144265'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FELIPE CONTEPOMI', NULL, NULL, '20259668736', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20259668736'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUAREZ GABRIEL RODRIGO MARCELO', NULL, NULL, '20259874506', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20259874506'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'D´ONOFRIO VICTOR DAMIAN', 'administracion@fromdoppler.com', NULL, '20260493672', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20260493672'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAZABET RAUL ROBERTO', NULL, NULL, '20260500733', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20260500733'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MONCHIETTI LUIS GABRIEL', NULL, NULL, '20261126649', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20261126649'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZACCARDI RAUL ALBERTO', NULL, NULL, '20261224829', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20261224829'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARRIOS ALEJANDRO ANIBAL', NULL, NULL, '20261359384', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20261359384'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUTELER TRILLO HERNAN LUIS', NULL, NULL, '20261813042', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20261813042'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CRISTHIAN DI DIONISIO', NULL, NULL, '20262758967', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20262758967'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUDANO NESTOR ADRIAN', NULL, NULL, '20262829422', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20262829422'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIANO JOSE MONSERRAT', NULL, NULL, '20262883966', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20262883966'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Bouno Maximiliano Gabriel', NULL, NULL, '20263265557', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20263265557'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GASTON OLIVEIRA WECKESSER', NULL, NULL, '20263422245', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20263422245'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PARTAMIAN CHRISTIAN DAVID', NULL, NULL, '20263649533', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20263649533'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Lucas maximiliano Zacarias', NULL, '15-4935-6413', '20263654448', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20263654448'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARZOLA MATIAS MATEO', NULL, NULL, '20263698895', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20263698895'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RASTELLINO JUAN PEDRO', NULL, NULL, '20263724799', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20263724799'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VITALE DIEGO MARTIN', NULL, NULL, '20264015511', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20264015511'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROSA MOSQUETA DE LLAO LLAO - PROCOPCHUK RODOLFO ARIEL', NULL, NULL, '20264167451', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20264167451'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOROSITO LUIS RODOLFO', NULL, NULL, '20264532990', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20264532990'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROCHA EMAIDES LUCAS ANDRES', NULL, NULL, '20265572686', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20265572686'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BADANO AUGUSTO', NULL, NULL, '20265837264', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20265837264'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUSTAVO ANDRES BARBARAN', NULL, '48543674', '20266270284', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20266270284'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NICOLAS PABLO CARBONATTO', NULL, '15-6657-6628', '20266321997', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20266321997'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN MANUEL GOUARNALUSSE', NULL, NULL, '20266479744', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20266479744'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REYES GUSTAVO', NULL, NULL, '20267770558', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20267770558'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CICCARELLI DIEGO MARTIN', NULL, NULL, '20268148877', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20268148877'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUILLERMO OSCAR PITA', NULL, NULL, '20268215205', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20268215205'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALTIZIO GASTON LEONARDO', NULL, NULL, '20268242482', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20268242482'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GARCIA MATIAS EMILIANO', NULL, NULL, '20268361511', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20268361511'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FRITZLER ARIEL HERNAN (CVU)', NULL, NULL, '20268366327', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20268366327'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Elio Edgardo Lopez', NULL, NULL, '20269297973', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20269297973'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUSTAMANTE GODOY SERGIO MARTIN', NULL, NULL, '20269520389', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20269520389'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPEZ BLANCO  DIEGO', NULL, NULL, '20269523485', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20269523485'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FABRE PAUL ARIEL', NULL, NULL, '20270149155', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20270149155'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOLODKI EDUARDO RAUL', NULL, NULL, '20270365419', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20270365419'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARIM TAICHURE', NULL, NULL, '20270570578', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20270570578'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUASNABAR  MARCOS ANDRES', NULL, '0351-4825483', '20270765298', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20270765298'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MATIAS DIEGO BENEDETTI', NULL, NULL, '20270770011', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20270770011'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DELFINO JUAN DIEGO', NULL, NULL, '20270794735', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20270794735'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GARCIA BAUZA CRISTIAN DARIO', NULL, NULL, '20270828257', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20270828257'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'De Tcherkassky Marcelo Javier', NULL, '0', '20270895132', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20270895132'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BAIRES ILUMINACION - Del Re Cristian Cesar', NULL, NULL, '20271140887', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20271140887'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEDERICO BELTRAMI', NULL, NULL, '20271208341', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20271208341'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDEZ HERNAN LUIS ALBERTO', NULL, NULL, '20271824557', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20271824557'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BOURNOT PABLO', NULL, NULL, '20271990740', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20271990740'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WALTER ARNALDO VIZCARRA', NULL, NULL, '20272022519', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20272022519'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCOS JAVIER PALANCA', NULL, NULL, '20272321753', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20272321753'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASTILLO  ADRIAN ALBERTO', NULL, NULL, '20272472700', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20272472700'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOIDI JONATAN MARCOS', NULL, NULL, '20273546538', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20273546538'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MATIAS ROGELIO IZUEL', NULL, NULL, '20273699512', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20273699512'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEDERICO PABLO MARCELO', NULL, NULL, '20273735772', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20273735772'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MITRE HUGO ALBERTO', NULL, NULL, '20273931733', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20273931733'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDEZ VALDEZ MATIAS', NULL, NULL, '20274509296', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20274509296'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BELTRAN  JUAN MANUEL', NULL, NULL, '20275498182', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20275498182'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VERTICAL WORKS CORDOBA', NULL, NULL, '20275503704', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20275503704'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAGANI HERNAN', NULL, NULL, '20275508730', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20275508730'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARENALES ARIEL JESUS', NULL, NULL, '20276224299', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20276224299'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARRAZA EDUARDO MATIAS', NULL, NULL, '20276909453', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20276909453'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BERTOYA ROMULO SANTIAGO', NULL, NULL, '20277445396', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20277445396'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DANIEL CASABÉ', NULL, NULL, '20277675553', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20277675553'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PONCE JUAN DOMINGO', NULL, NULL, '20277701864', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20277701864'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANCHEZ CRISTIAN ALEJANDRO', NULL, NULL, '20277714222', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20277714222'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IGOLNIKOW EDUARDO FRANCISCO', NULL, NULL, '20277921805', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20277921805'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Solis Alvaro Rodrigo', NULL, NULL, '20278108806', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20278108806'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HERRERO VALENTIN', NULL, NULL, '20278252958', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20278252958'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOAQUIN MUÑOZ', NULL, NULL, '20278668488', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20278668488'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BRUNO ELISSONDO JOSE IGNACIO', NULL, NULL, '20280103242', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20280103242'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAIO SEBASTIAN VICENTE', NULL, NULL, '20280327213', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20280327213'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NICOLAS WELLS', NULL, NULL, '20280555178', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20280555178'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FABRIZIO JUAN NICOLAS', NULL, NULL, '20280785955', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20280785955'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DI GLORIA HECTOR', NULL, NULL, '20280786242', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20280786242'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLAUDIO LEONARDO MOSQUEDA', NULL, NULL, '20280992462', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20280992462'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTEBAN PAOLO ARPESELLA', NULL, NULL, '20281017919', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20281017919'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RUBEN A. NOBLE', NULL, NULL, '20281325249', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20281325249'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPEZ JAVIER IGNACIO', NULL, NULL, '20281670604', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20281670604'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BELDYK MARIANO JAVIER', NULL, NULL, '20281698967', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20281698967'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SAN TELMO CRISTALES', NULL, '4300-2898', '20282330904', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20282330904'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALVAREZ GONZALEZ MARTIN ANDRES', NULL, NULL, '20282432049', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20282432049'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BERETTA ALFREDO ANDRES', NULL, NULL, '20282629292', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20282629292'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SIERRA MARCOS EMANUEL', NULL, NULL, '20282719526', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20282719526'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOROSITO LUCIANO SEBASTIAN', NULL, '+', '20282746485', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20282746485'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MATIAS EMANUEL GIMENEZ', NULL, NULL, '20283047645', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20283047645'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCOS SEBASTIAN BRAVIN', NULL, NULL, '20283412769', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20283412769'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGUILAR DAVID EDUARDO', NULL, NULL, '20283825915', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20283825915'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN MARTIN BLANCO', NULL, NULL, '20283832954', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20283832954'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MEDINA JULIO RICARDO', NULL, '0', '20283847765', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20283847765'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGUEZ RIUS PATRICIO ADOLFO', NULL, NULL, '20284264895', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20284264895'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUTELER RAMIRO', NULL, NULL, '20284304765', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20284304765'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEVRE MARIO IGNACIO', NULL, NULL, '20284626932', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20284626932'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELO EDUARDO GOMEZ', NULL, NULL, '20284780567', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20284780567'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BALMACEDA HUARTE TOMAS', NULL, NULL, '20285021422', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20285021422'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRIVE - Sebastián Quevedo', NULL, '15-5063-9942', '20285077185', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20285077185'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTIN GUILLERMO OLIVETTI', NULL, NULL, '20285859299', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20285859299'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAMINOS JUAN MARCOS AGUSTIN', NULL, NULL, '20286513566', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20286513566'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROCHA JOSE ALBERTO', NULL, NULL, '20286832513', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20286832513'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Chucho Nicolas Vladimir', NULL, NULL, '20286942033', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20286942033'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTEBAN M ESTOMBA', NULL, NULL, '20286973168', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20286973168'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERRETTI DAMIAN JORGE', NULL, NULL, '20287498897', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20287498897'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NESTOR A. CAPUTTO (CVU)', NULL, NULL, '20288134775', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20288134775'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEANDRO VILLAFAÑE CIA', NULL, NULL, '20288536016', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20288536016'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTRELLA EDUARDO RUBEN', NULL, NULL, '20288823309', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20288823309'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JAVIER LUIS PATRI', NULL, '15-4986-3395 CELULAR', '20289096842', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20289096842'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANGELOME NICOLAS ESTEBAN', NULL, NULL, '20289366432', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20289366432'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO DANIEL OSSO', NULL, NULL, '20289503197', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20289503197'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ENRIQUE REYNA CACERES', NULL, NULL, '20290611548', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20290611548'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALFIERE MAURO', NULL, NULL, '20290760632', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20290760632'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOLDEN HUGO DAVID', NULL, NULL, '20290875901', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20290875901'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RICARDO ALBERTO LENTATI', NULL, NULL, '20291047816', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20291047816'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NICOLAS KOIFMAN', NULL, NULL, '20291102973', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20291102973'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUCAS GEDAMINSKA', 'CONCEPTOINTERACTIVO@GMAIL.COM', '0299 6 245131', '20291189211', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20291189211'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GARRAHAN SANTIAGO', NULL, NULL, '20291284028', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20291284028'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FASANO PABLO HERNAN', NULL, NULL, '20291455914', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20291455914'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MONTOYA MARTIN ALBANO', NULL, NULL, '20291554785', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20291554785'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEDERICO MARTIN ARES', NULL, NULL, '20291916172', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20291916172'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAGARIÑOS ALEJO (P)', NULL, NULL, '20291923896', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20291923896'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO DRAGUN', NULL, NULL, '20291930795', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20291930795'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEONARDO DANIEL', NULL, NULL, '20292032162', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20292032162'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GARCIA ZACARIAS RAMIRO', NULL, NULL, '20292403284', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20292403284'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARIEL DAVERIO', NULL, NULL, '20292505192', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20292505192'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VICTOR OMAR SANTOS', NULL, '02994431211', '20293018090', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20293018090'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DANIEL A LOPEZ', NULL, NULL, '20293176311', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20293176311'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DARIO E ROMERO', NULL, NULL, '20293186260', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20293186260'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MANFREDI ADRIEL ARNALDO', NULL, NULL, '20293256072', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20293256072'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PALACIOS  DARIO MIGUEL', NULL, NULL, '20293475491', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20293475491'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AREAN JORGE ALBERTO', NULL, NULL, '20293642142', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20293642142'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN MARTIN CATALDO', NULL, '42493181', '20293644218', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20293644218'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ABERASTEGUI FONSECA EMMANUEL', NULL, NULL, '20293750158', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20293750158'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ORDEIX JUAN JOSE', NULL, NULL, '20293940933', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20293940933'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROBERTO GABRIEL DE JESUS MANSILLA', NULL, NULL, '20294104403', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20294104403'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERRETERIA BANZAS', NULL, NULL, '20294345362', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20294345362'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE LOS SANTOS ANIBAL JULIAN', NULL, NULL, '20295230186', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20295230186'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DREYER MARCOS', NULL, NULL, '20295433710', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20295433710'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RONCORONI JORGE NICOLAS', NULL, NULL, '20296038777', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296038777'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ABELARDO M. LOPEZ', NULL, NULL, '20296084159', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296084159'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MOLINARI ROMERO AGUSTIN', NULL, NULL, '20296094189', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296094189'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CHIAVARINI PAULO', NULL, NULL, '20296186415', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296186415'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAIDANA GABRIEL ALBERTO', NULL, NULL, '20296200205', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296200205'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CURA JORGE NICOLAS', NULL, NULL, '20296201007', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296201007'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEDERIK CARLOS ALBERTO', NULL, NULL, '20296209784', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296209784'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SCHAMMAS PABLO GABRIEL', NULL, NULL, '20296339963', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296339963'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HERNAN LEONARDO BRAUDE', NULL, '4821-7656', '20296360628', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296360628'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'QUINTERO JUAN PABLO', NULL, NULL, '20296536173', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296536173'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAPARROZ NICOLAS FRANCISCO', NULL, NULL, '20296566641', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296566641'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SCHEY MARIANO ALBERTO', NULL, NULL, '20296784843', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296784843'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASTELLANO MAXIMILIANO', NULL, '1560962400', '20296926001', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296926001'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ETCHEBEHERE NICOLAS', NULL, NULL, '20296956156', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20296956156'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FRONTERA JAVIER EDUARDO', NULL, NULL, '20297106083', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20297106083'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MANUEL LOPEZ', NULL, NULL, '20297763726', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20297763726'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BORRUTO GUILLERMO', NULL, NULL, '20298014360', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20298014360'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HERNANDEZ MAURICIO JAVIER', NULL, NULL, '20298082137', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20298082137'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TREJO MANUEL FRANCISCO', NULL, NULL, '20298263336', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20298263336'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIORI NICOLAS HORACIO', NULL, NULL, '20298321166', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20298321166'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SLEK FRANCO LUIS', NULL, NULL, '20298435773', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20298435773'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BENARD UGARTE MARTIN', NULL, NULL, '20298675251', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20298675251'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAINSTERRENA CARLOS MIGUEL', NULL, NULL, '20298823595', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20298823595'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'D''ABATE ANDRES PABLO', NULL, '0', '20299470645', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20299470645'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GERMAN ECHAVARRIA', NULL, NULL, '20299632483', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20299632483'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEVY FEDERICO', NULL, NULL, '20299888844', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20299888844'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE FILIPPO CHRISTIAN MARTIN', NULL, NULL, '20300832890', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20300832890'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAPOGROSO FRANCO MARCELO', NULL, NULL, '20301443790', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20301443790'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MASUT ARIEL', NULL, NULL, '20301675748', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20301675748'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSE MAURO CASTRO', 'info@54fotografia.com', '1559974087', '20301826118', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20301826118'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDEZ JULIO CESAR', NULL, NULL, '20302335517', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20302335517'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTEBAN A. BUFFA', NULL, NULL, '20302385964', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20302385964'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE FERNANDO ALAMINO ALDECO', NULL, NULL, '20302465151', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20302465151'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAZO MARCOS GONZALO', NULL, NULL, '20303175750', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20303175750'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEDERICO NAHUEL RAMIREZ DIAZ', NULL, NULL, '20303333038', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20303333038'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEBASTIAN ACHENBACH', NULL, NULL, '20304012839', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20304012839'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEDERICO DEBIAGGI', NULL, NULL, '20304407167', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20304407167'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RICARDO LAZZARI', NULL, NULL, '20304663406', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20304663406'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CICHERO AGUSTIN', NULL, '0', '20304933659', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20304933659'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CETRANGOLO FEDERICO', NULL, NULL, '20304944111', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20304944111'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HEREDIA CLAUDIO HERNAN', NULL, NULL, '20305045560', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20305045560'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANDRES GABRIEL PARTAMIAN', NULL, NULL, '20305550311', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20305550311'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIEGO MARTIN LANDA', NULL, NULL, '20305573729', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20305573729'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GARCIAS MENA JAVIER EDUARDO', NULL, NULL, '20305984788', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20305984788'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MATEO IGLESIAS COQUETI', NULL, '0299 4965503', '20305987949', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20305987949'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SARMIENTO TEOTIMO JOSE', NULL, NULL, '20306039211', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20306039211'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIANO LOPEZ HERMIDA', NULL, NULL, '20306508327', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20306508327'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARANCIBIA ROBERTO', NULL, NULL, '20307961068', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20307961068'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MUNAR WALTER EZEQUIEL', NULL, NULL, '20307991056', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20307991056'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VOLQUETES SAN IGNACIO', NULL, NULL, '20308161979', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20308161979'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GARGEVCICH EDUARDO JOSE', NULL, NULL, '20308319297', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20308319297'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANTOS PESARESI NAHUEL', 'mazzocarpintería@gmail.com', '1159638309', '20308333931', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20308333931'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARREÑO NICOLAS', NULL, NULL, '20308334601', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20308334601'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ORLANDO JULIAN DIAZ MASA', NULL, NULL, '20308369383', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20308369383'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BALDEZ DIEGO EDGAR', NULL, NULL, '20308423108', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20308423108'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEREZ BIELLO GERMAN RUBEN', NULL, NULL, '20308882609', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20308882609'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANDRES RICARDO CHAMARRA', NULL, NULL, '20308883974', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20308883974'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCOS NIELSEN', NULL, NULL, '20309864639', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20309864639'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GABRIEL VACAS', NULL, NULL, '20310106519', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20310106519'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANDRADE FRANCISCO MANUEL', NULL, '0', '20310197840', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20310197840'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDO SAMARTIN', NULL, NULL, '20310642011', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20310642011'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGO RODRIGUEZ', NULL, '0388 155086388', '20311269918', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20311269918'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NUÑEZ GUILLERMO DANIEL', NULL, NULL, '20312178703', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20312178703'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PISANO JOSE AGUSTIN', NULL, NULL, '20312215641', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20312215641'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TAMARGO BASTERRICA JUAN MANUEL', NULL, NULL, '20312691354', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20312691354'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRIETO FEDERICO HERNAN', NULL, NULL, '20312934990', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20312934990'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DEMIAN ANIBAL AGOSTINELLI', NULL, NULL, '20313034578', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20313034578'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VICINI MONJA FEDERICO', NULL, NULL, '20313434606', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20313434606'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN MANUEL SAGASTI', NULL, NULL, '20313653375', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20313653375'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VICTOR JAVIER FRANCO', NULL, NULL, '20314073046', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20314073046'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VICTOR HUGO PONCE', NULL, NULL, '20314263236', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20314263236'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SFORZA FRANCO SEBASTIAN', NULL, NULL, '20314339941', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20314339941'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANTIAGO GARZON', NULL, '4813-1201', '20314773412', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20314773412'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PENA NICOLÁS ALEJANDRO', 'nicoapena@gmail.com', NULL, '20315195366', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20315195366'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LARA ALEJANDRO CESAR', NULL, NULL, '20315216932', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20315216932'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMERO LUIS JAVIER', NULL, NULL, '20315266026', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20315266026'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONTRONE MARTIN RICARDO', NULL, NULL, '20315475334', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20315475334'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARCE ADRIAN ALBERTO', NULL, NULL, '20315527717', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20315527717'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CUCCHETTI GONZALO SEBASTIAN', NULL, '0', '20316117008', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20316117008'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUCHTER EDGAR JUAN', NULL, NULL, '20316147691', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20316147691'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOLANO MATIAS EZEQUIEL', NULL, NULL, '20316471405', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20316471405'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TOMASELLI PIZA MARIANO', NULL, NULL, '20317798378', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20317798378'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIVIANI ENRICO PAOLO', NULL, NULL, '20318476137', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20318476137'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAZOS MARTIN HORACIO', NULL, '}', '20318598089', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20318598089'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUZMAN ALDO JAVIER', NULL, NULL, '20318948799', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20318948799'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'quiroga pablo nicolas', NULL, NULL, '20319217917', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20319217917'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BILBAO XAVIER LUIS', NULL, NULL, '20319952595', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20319952595'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROJAS RAUL GASTON', NULL, NULL, '20320033846', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20320033846'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Zappi Sebastian', NULL, NULL, '20320726019', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20320726019'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CRISTIAN MATIAS OROS', NULL, NULL, '20321459154', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20321459154'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CINALLI CRISTIAN NICOLAS', NULL, NULL, '20321525262', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20321525262'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO ALEJANDRO BERARDESCA', NULL, NULL, '20321558268', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20321558268'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEDERICO BELLONI', NULL, NULL, '20321915583', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20321915583'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARRETO JUAN MANUEL', NULL, NULL, '20323118605', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20323118605'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VILLAMEA LENADRO', NULL, NULL, '20323230383', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20323230383'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EUGENIO MARIA ERAUSQUIN', NULL, '15-4414-4418', '20323297151', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20323297151'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALBARENQUE NICOLAS', NULL, NULL, '20323467405', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20323467405'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARANDA JOSE EMILIANO', NULL, NULL, '20323478296', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20323478296'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIAZ QUINTANILLA MAURO ADRIAN', NULL, NULL, '20323510955', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20323510955'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COLL IGNACIO', NULL, NULL, '20323727237', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20323727237'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HERNANDEZ ALI JESUS IGNACIO', NULL, NULL, '20324126482', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20324126482'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CORFIELD DIEGO GASTON', NULL, NULL, '20325461501', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20325461501'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MORONI MARTIN MANUEL', NULL, NULL, '20325560348', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20325560348'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CALVO MARIANO ANDRES', NULL, '48324144', '20325759837', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20325759837'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LORENZO GUIDO', NULL, NULL, '20326095584', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20326095584'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HERNANDEZ GABRIEL FEDERICO', NULL, NULL, '20326353958', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20326353958'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOURMET SHOP - CANDIA BRIAN HEBER', NULL, NULL, '20326741249', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20326741249'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REMEDI FACUNDO', NULL, NULL, '20326801861', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20326801861'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAUL NICOLAS ROMERO', NULL, NULL, '20326816710', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20326816710'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JAVIER HERNAN AZAROLA', NULL, NULL, '20327776666', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20327776666'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FRANCO ARIEL ACUÑA', NULL, '0299 156104163', '20327789865', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20327789865'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEDESMA LUIS MARIANO', NULL, NULL, '20327899644', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20327899644'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TOLEDO ANGEL EMILIO', NULL, NULL, '20328395518', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20328395518'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO GABRIEL BASANTA', NULL, NULL, '20328721865', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20328721865'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PALAZZO GABRIEL MARTIN', NULL, NULL, '20328912407', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20328912407'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COLUCCINI  FRANCISCO ALBERTO', NULL, NULL, '20329267033', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20329267033'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANDRES EDGARDO POPOWSKI', NULL, NULL, '20330222493', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20330222493'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARGANARAZ PONESSA JORGE EDUARDO', NULL, '4700', '20330496259', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20330496259'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONCHA BARRAZA RONALD MAXIMILIANO', NULL, NULL, '20331638928', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20331638928'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Alejo Da Bouza', NULL, NULL, '20332032217', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20332032217'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGUSTIN EMANUEL PICCOLO', NULL, NULL, '20333118794', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20333118794'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EYHARCHET JUAN BAUTISTA', NULL, NULL, '20333399130', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20333399130'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NASARIO FRANCO DENIS', NULL, NULL, '20333561329', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20333561329'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RECALDE GONZALO FEDERICO', NULL, NULL, '20333867304', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20333867304'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JIMENEZ CATTALIN JOSE', NULL, NULL, '20334248632', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20334248632'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGUIRRE JUAN PABLO', NULL, NULL, '20334570399', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20334570399'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BRODSKY YAEL', NULL, NULL, '20334997724', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20334997724'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAYNE JASON ALAN', NULL, NULL, '20335040792', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20335040792'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN MANUEL LOPEZ LAMONEGA', NULL, NULL, '20335903715', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20335903715'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANTIAGO ALBERTO BRIGNOLE ARAUJO', NULL, NULL, '20336055017', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20336055017'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOMEZ JUAN FRANCISCO', NULL, NULL, '20336057877', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20336057877'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO GUILLERMO CACERES', NULL, NULL, '20339253235', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20339253235'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMERO GOMEZ EXEQUIEL', NULL, NULL, '20339363529', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20339363529'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN MANUEL GALILEA (P)', NULL, NULL, '20340232306', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20340232306'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COLISKO LLORENS LEANDRO GABRIEL', NULL, NULL, '20340760639', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20340760639'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SALOMON LEANDRO ALEXIS', NULL, NULL, '20341309310', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20341309310'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROLERI JUAN', NULL, NULL, '20343082992', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20343082992'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN PABLO MANGIERI', NULL, NULL, '20343183845', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20343183845'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MOON DAMIAN NICOLAS', NULL, NULL, '20343581700', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20343581700'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARCE VAGO JOSE SEBASTIAN', NULL, NULL, '20343905697', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20343905697'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ERNESTO JONATHAN MACIEL', NULL, NULL, '20343938897', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20343938897'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FRATTESI LEONEL ALEJANDRO', NULL, NULL, '20344545422', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20344545422'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROSSI RENZO LEONEL', 'rossirenzo9@gmail.com', '3487509328', '20344765554', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20344765554'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GULI BRUNO MANUEL', NULL, '4700', '20344944025', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20344944025'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MATIAS LEIBLICH', NULL, NULL, '20345171984', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20345171984'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CUETO LUCAS ANDRES', NULL, NULL, '20345634267', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20345634267'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FRANCISCO SOLARI COSTA', NULL, NULL, '20345835157', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20345835157'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Leandro Agustín Tobares', NULL, NULL, '20347443825', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20347443825'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CHAQUIRES PABLO AUGUSTO', NULL, NULL, '20347943496', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20347943496'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OROS EZEQUIEL ALEJANDRO (P)', NULL, NULL, '20348478606', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20348478606'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN IGNACIO EGOZCUE', NULL, NULL, '20350332902', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20350332902'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOLANS SEBASTIAN DARIO', NULL, NULL, '20351173913', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20351173913'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MASTELLI FRANCO', NULL, NULL, '20351611902', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20351611902'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AIMONE NICOLAS DANIEL', NULL, NULL, '20351716089', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20351716089'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGO DARIO SAGANIAS', NULL, NULL, '20351978016', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20351978016'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BALDINO ALAN EZEQUIEL', NULL, NULL, '20352296342', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20352296342'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EUGENIO GUILLERMO AIME', NULL, NULL, '20352543757', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20352543757'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CWAIK JOAN MILTON', NULL, NULL, '20352664643', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20352664643'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EGUIBAR MARTIN', NULL, NULL, '20353492897', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20353492897'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CORDOBA ACOSTA PEDRO AGUSTIN', NULL, NULL, '20355270530', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20355270530'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RATA LIENDO JULIAN', NULL, NULL, '20355270808', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20355270808'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ORTIZ FEDERICO JAVIER', NULL, NULL, '20355289584', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20355289584'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN AGUSTIN BERTELLA OWEN', NULL, NULL, '20355748120', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20355748120'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTRADA JOAQUIN ARIEL (AMANECER EVENTOS)', NULL, NULL, '20359571225', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20359571225'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIAZ PAOLA EDID', NULL, NULL, '20360250939', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20360250939'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OROS EMILIANO NAHUEL', NULL, '0', '20360859585', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20360859585'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BENITEZ GABRIEL LUCIANO', NULL, NULL, '20361549725', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20361549725'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRANADO OSCAR MATIAS', NULL, NULL, '20362052425', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20362052425'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUCAS NAHUEL ABRAM', NULL, NULL, '20363479570', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20363479570'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IGNACIO AGUSTIN CASARTELLI', NULL, NULL, '20363595503', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20363595503'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MORENO SANTIAGO BAUTISTA', NULL, NULL, '20364012021', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20364012021'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGUEZ PEREZ FRANCISCO JAVIER', NULL, NULL, '20365948551', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20365948551'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IBARRA GABRIEL', NULL, NULL, '20366052616', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20366052616'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALVARO BARBERA', NULL, NULL, '20366281011', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20366281011'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CATTAINI CHRISTIAN FRANCISCO', NULL, NULL, '20366364154', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20366364154'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GONZALEZ ROUCO FEDERICO JORGE', NULL, NULL, '20366883240', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20366883240'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VILARIÑO EZEQUIEL AGUSTIN', NULL, NULL, '20367867842', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20367867842'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PERRY GUIDO NICOLAS', NULL, NULL, '20369300076', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20369300076'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUBO FERMIN GASTON', NULL, NULL, '20370801011', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20370801011'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MATIAS DEL VALLE TOSSEN', NULL, NULL, '20371654292', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20371654292'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FORGUES ALEXIS', NULL, NULL, '20371854143', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20371854143'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPEZ DANTE RAMON ULISES', NULL, NULL, '20372240610', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20372240610'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEBASTIAN GHERTHER', NULL, NULL, '20372347296', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20372347296'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIGUEROA NAHUEL MARTIN', NULL, '+', '20372428512', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20372428512'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN ANDRES SERUR', NULL, NULL, '20375441250', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20375441250'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEIBLICH GERMAN', NULL, NULL, '20378781427', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20378781427'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SCARGIALI FLAVIO ADRIAN', NULL, '15-4414-4418', '20379308911', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20379308911'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NICOLAS FEDERICO PALENCIA', NULL, NULL, '20379318739', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20379318739'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IGNACIO J BENITO', NULL, NULL, '20380670128', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20380670128'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMERO GABRIEL IVAN (P)', NULL, NULL, '20380792487', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20380792487'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NICEFORO RODRIGUEZ NICOLAS', NULL, NULL, '20381564224', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20381564224'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEIVA JUAN IGNACIO', NULL, NULL, '20383074623', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20383074623'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MANGANARO LUIS IVAN', NULL, NULL, '20383457999', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20383457999'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEZCANO ALBERTO ALEJANDRO GABRIEL', NULL, '4372-4005', '20386318205', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20386318205'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NOBILE LUCIANO', NULL, NULL, '20386469246', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20386469246'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Martinez Belkin Matias Ezequiel', NULL, NULL, '20388931141', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20388931141'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARRIO JUAN', NULL, NULL, '20389950689', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20389950689'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SCHMIDT JUAN LAUTARO', NULL, NULL, '20390316101', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20390316101'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALEXIS SOMOGYI', NULL, NULL, '20390668210', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20390668210'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DI LORENZO LUCIANO ARIEL', NULL, NULL, '20393311119', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20393311119'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUBIAN SANTIAGO NICOLAS', NULL, NULL, '20395109031', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20395109031'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANTA CRUZ RODRIGO ALEJANDRO', NULL, NULL, '20395541456', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20395541456'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPE NICOLAS', NULL, NULL, '20396913713', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20396913713'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CABALLERO RAMIRO (CVU)', NULL, NULL, '20397565956', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20397565956'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PETTINATO GASTON OSVALDO', NULL, '0', '20400181471', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20400181471'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGUSTIN VIDELA', NULL, '15-4414-4418', '20401056484', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20401056484'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAOLINI JUAN FEDERICO (P)', NULL, NULL, '20403848507', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20403848507'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MENESES NICOLAS FACUNDO', NULL, NULL, '20413171254', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20413171254'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BELLEMMI LEANDRO EMANUEL', NULL, NULL, '20416636703', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20416636703'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOPES PERERA PABLO', NULL, NULL, '20418003430', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20418003430'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEDERICO FACUNDO', NULL, NULL, '20418029731', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20418029731'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'QUINTELA NICOLAS', NULL, NULL, '20426469015', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20426469015'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PERRONE SEBASTIAN EMANUEL', NULL, NULL, '20427227821', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20427227821'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KALWILL JAVIER', NULL, '0', '20427238408', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20427238408'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CORPORACION MULTIVISION SAC', NULL, NULL, '20451579119', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20451579119'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIVEROS LUCA MANUEL', NULL, NULL, '20462088729', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20462088729'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELO SIMON', NULL, '4393-6485', '20602318355', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20602318355'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RESTREPO LALINDE GUSTAVO ADOLFO', NULL, NULL, '20604447705', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20604447705'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GIMENEZ BAREIRO ANGEL', NULL, NULL, '20921925825', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20921925825'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OTERO BARREIRA FERNANDO ROBERTO', NULL, NULL, '20922268364', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20922268364'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INFO RED', NULL, '4866-3666', '20923147927', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20923147927'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGENCIA EL SUBTE', NULL, NULL, '20923484869', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20923484869'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZEMBORAIN MARTIN RICARDO', NULL, NULL, '20923770799', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20923770799'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KNOBLOVITS DANIEL', NULL, NULL, '20924581981', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20924581981'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARANEDA HERNAN DARIO', NULL, '50318264', '20924756803', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20924756803'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CHRISTIAN NAVNTOFT', NULL, NULL, '20925140393', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20925140393'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WALTER ALBERTO GONZALEZ', NULL, NULL, '20926209486', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20926209486'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE EDUARDO VIEIRA', NULL, '4115-8808', '20926905768', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20926905768'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO ANTONIO ESPINOSA ARAGONESE', NULL, NULL, '20928458777', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20928458777'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELECTRA', NULL, NULL, '20929074514', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20929074514'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KAZAKOV SERGUEI', NULL, NULL, '20935641021', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20935641021'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO FRANCISCO MARIA BELLONI', NULL, NULL, '20936981926', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20936981926'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOTITO AGUSTIN', NULL, NULL, '20937628081', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20937628081'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JULIO MARIA SANCHEZ LOPPACHER', NULL, NULL, '20937811978', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20937811978'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BENITO ABAL DIEZ', NULL, NULL, '20937922214', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20937922214'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DAINOVSKAS CARLOS MANUEL', NULL, NULL, '20938551783', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20938551783'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDO MASCARNHAS (P)', NULL, NULL, '20938930636', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20938930636'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'QUISPE CHUÑOCCA FRANKS JHONATAN', NULL, '0', '20939814672', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20939814672'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MADEIRO GARCIA RICARDO SEBASTIAN', NULL, NULL, '20943210250', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20943210250'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'QUISPE VALLEJOS RONALD', NULL, NULL, '20943589969', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20943589969'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ACOSTA RAMIREZ DANIEL ALEXANDER', NULL, NULL, '20944744402', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20944744402'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PINCHI RAMIREZ WENDELL', NULL, NULL, '20944977040', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20944977040'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CERVANTES JONISLLA ELIAS', NULL, NULL, '20945722194', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20945722194'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAURICIO CASTIBLANCO MONTES', NULL, NULL, '20949189490', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20949189490'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANCHEZ CARVAJAL JULIO ALEJANDRO', NULL, NULL, '20954058426', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20954058426'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIENDO MARTINEZ FREEIWEY LUIS ABRAHAM', NULL, NULL, '20957051570', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20957051570'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEREIRA RAMIREZ JOEL ENCARNACIÓN', NULL, NULL, '20959242497', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '20959242497'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NORBERTO CHAVES', NULL, NULL, '23043957279', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23043957279'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HUMBERTO PODETTI', NULL, NULL, '23044126559', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23044126559'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLARIN', NULL, '4635-7007', '23044159619', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23044159619'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FARIÑO OSCAR UBALDO', NULL, NULL, '23044498979', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23044498979'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTEBAN YMAZ', NULL, NULL, '23045182479', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23045182479'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HECTOR JUAN REIRIS', NULL, NULL, '23045562379', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23045562379'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO DELLECARBONARA', NULL, '307-0020', '23047427959', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23047427959'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS VILLOLDO FOTOGRAFIA', NULL, '4943-4444', '23048801609', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23048801609'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELECTRICIDAD - TELEFONIA MANTENIMIENTO', NULL, '15-4030-6309', '23050992039', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23050992039'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARTIGAS GLORIA MARIA', NULL, NULL, '23056512144', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23056512144'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCHETTO CARLOS ALBERTO', NULL, NULL, '23080766459', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23080766459'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ERNESTO JOSE CAVALLO', NULL, '15-51494654', '23104312829', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23104312829'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ENRIQUE GARCIA ESPIL', NULL, NULL, '23104637329', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23104637329'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE CARLOS  GIMENEZ', NULL, NULL, '23109882739', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23109882739'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'I.S.I.S.', NULL, NULL, '23114994669', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23114994669'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VICIOS - JERZY REKTOR', NULL, '4361-7967', '23115425099', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23115425099'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAZZERI LILIANA ELISA MARIA (P)', NULL, NULL, '23118020634', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23118020634'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Szuchman Silvia Graciela', NULL, NULL, '23119607124', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23119607124'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RIVAROLA EDUARDO FRANCISCO', NULL, NULL, '23119735629', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23119735629'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VITALE DANIEL', NULL, NULL, '23119786959', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23119786959'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DANIEL C COLUCCI', NULL, '02965-428402', '23120216759', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23120216759'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MIGUEL ANGEL BRAVO', NULL, NULL, '23121665409', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23121665409'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELISEO DI PAOLO', NULL, '4717-0077', '23122906329', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23122906329'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CORONEL MARTA NOEMI', NULL, NULL, '23123111664', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23123111664'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PALUMBO LUIS CARMELO', NULL, NULL, '23123155629', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23123155629'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE E. CEDALE', NULL, '312-4979', '23125879179', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23125879179'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTIN-MARTIN', NULL, '8-822-9232', '23126017944', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23126017944'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELO ARMANDO ARGEMI', NULL, NULL, '23126662599', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23126662599'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HECTOR AGUSTIN SALVIA', NULL, NULL, '23126731019', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23126731019'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARLOS DANIEL SCAGLIA', NULL, NULL, '23128603069', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23128603069'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GIORGI GUILLERMO CESAR', NULL, NULL, '23128627049', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23128627049'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEDRO DEL PIERO', NULL, NULL, '23129454989', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23129454989'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NEIL ADRIAN', NULL, NULL, '23129667249', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23129667249'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASTECIND - DANIEL J. STUBELJ', NULL, NULL, '23137102579', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23137102579'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ETCHENIQUE LUIS ALEJANDRO', NULL, NULL, '23138043789', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23138043789'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BRASERO ESTELA TERESA', NULL, NULL, '23139281934', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23139281934'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOSA NORBERTO', NULL, NULL, '23141958259', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23141958259'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEREZ ROZZI SERGIO FABIAN', NULL, NULL, '23143230619', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23143230619'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUIS ALBERTO BARZAN', NULL, NULL, '23143575039', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23143575039'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIANO NARODOWSKI', NULL, NULL, '23145633109', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23145633109'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BELLAGAMBA CARLOS EDUARDO', NULL, NULL, '23145966469', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23145966469'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LACERENZA CARLOS ENRIQUE', NULL, NULL, '23146552099', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23146552099'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SREBROW MILENA (LASER SOLUTIONS GROUP)', NULL, NULL, '23160714824', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23160714824'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NEGRI CLAUDIO MARCELO', NULL, NULL, '23161000809', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23161000809'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELO RUBEN DEFIORI', NULL, NULL, '23161301779', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23161301779'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSE MARIA OCHOA', NULL, NULL, '23162159119', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23162159119'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAMPANA JUAN MANUEL', NULL, NULL, '23164953599', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23164953599'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REYES ELENA BEATRIZ', NULL, NULL, '23166274834', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23166274834'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HUALDE ALBERTO FRANCISCO', NULL, NULL, '23167605699', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23167605699'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ISOLDA RODRIGUEZ VILLEGAS', NULL, NULL, '23168231024', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23168231024'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DARIO ARMANDO FERNANDEZ', NULL, '4361-8778 INT.28', '23170452739', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23170452739'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FABIAN CORDOBA', NULL, NULL, '23171790859', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23171790859'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GERMAN COLOMA', NULL, NULL, '23172255159', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23172255159'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO SANTIAGO COSTAMAGNA', NULL, NULL, '23177141739', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23177141739'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SGA - DANIEL MARCELO DANERI', NULL, NULL, '23177439169', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23177439169'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SILVIA BEATRIZ ANABITARTE', NULL, NULL, '23177543314', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23177543314'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARLENGHI ALEJANDRO LUIS', NULL, NULL, '23180029699', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23180029699'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COLINA JORGE AVELINO', NULL, NULL, '23182563919', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23182563919'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEIC -  COMPUTACION', NULL, '307-1186', '23183178539', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23183178539'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARENA DANIEL SANTIAGO', NULL, NULL, '23183268449', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23183268449'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HERRAJES VEIGA', NULL, '4307-0243', '23184770679', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23184770679'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VAZQUEZ LUCIANA ELENA', NULL, NULL, '23185994724', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23185994724'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUAREZ GUILLERMO RAMON', NULL, NULL, '23200010159', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23200010159'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIGUEROA CORBELLA JOSE', NULL, NULL, '23202858929', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23202858929'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDO DIEGO SEBASTIAN', NULL, NULL, '23204852979', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23204852979'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUARDO MANUEL LOPEZ', NULL, NULL, '23205124179', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23205124179'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA PAULA ROMERO', NULL, NULL, '23206203994', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23206203994'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEGONDS JUAN BAUTISTA', NULL, NULL, '23207238279', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23207238279'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BABY GABRIELA', NULL, NULL, '23207525944', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23207525944'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUGO ANDREA SUSANA', NULL, NULL, '23217189144', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23217189144'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALFARO LORENA CAROLINA', NULL, NULL, '23218332684', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23218332684'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HILDA J. CABALLERO', NULL, NULL, '23219015534', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23219015534'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HERNAN ETIENNOT', NULL, NULL, '23219541589', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23219541589'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BERNARDETTE STELMAN', NULL, NULL, '23219688164', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23219688164'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMEGIALLI FERNANDO', NULL, '0', '23220171019', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23220171019'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIBITETTO FERNANDO MARTIN', NULL, NULL, '23221670329', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23221670329'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KARINA INES BLANCO', NULL, NULL, '23226091084', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23226091084'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NORBERTO RAMON FLORES', NULL, NULL, '23226382739', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23226382739'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERREYRA MARIA MERCEDES', NULL, NULL, '23227951214', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23227951214'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIANA B. FERREIRA', NULL, '4307-5280', '23229635514', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23229635514'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JAVIER STREGER', NULL, NULL, '23230145679', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23230145679'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RUGGIRELLO HERNAN MARIO', NULL, NULL, '23233237639', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23233237639'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VALLVERDU GERMAN GONZALO', NULL, NULL, '23233291129', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23233291129'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAYRA LORENA DIBUR', NULL, NULL, '23233712604', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23233712604'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FRANCISCO DE CILLIS', NULL, '4371-4130/7283', '23239692249', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23239692249'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SICILIANO RAUL ARIEL', NULL, NULL, '23240613379', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23240613379'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DI SIENA  RAFAEL CESAR', NULL, '0351-4560014', '23240942119', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23240942119'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DONA PABLO FERNANDO', NULL, NULL, '23241716139', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23241716139'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANCHEZ  MARIELA ALEJANDRA', NULL, '0351-152159002/4606052', '23242811674', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23242811674'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TAYOGLOUS CLAUDIO EDUARDO', NULL, NULL, '23244303889', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23244303889'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SIAS JUAN PABLO', NULL, NULL, '23246635099', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23246635099'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Alfil producciones', NULL, '4554-1699', '23248734779', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23248734779'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Camejo Ariel Fabian (P)', NULL, NULL, '23248860499', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23248860499'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KARINA E GEREZ', NULL, NULL, '23249274984', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23249274984'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Solange Schneer', NULL, NULL, '23251426724', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23251426724'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSE BENITEZ NIÑO (Refrigeración El Dorado)', NULL, NULL, '23256176769', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23256176769'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMADEO MARIANO', NULL, NULL, '23256414899', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23256414899'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PLANET CLEANING - JOSE IGNACIO AREVALO', NULL, '4822-8214', '23258315529', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23258315529'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WETTEN CRISTIAN ANDRES', NULL, NULL, '23259384699', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23259384699'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANTIAGO MARIN IRABURU', NULL, NULL, '23260891979', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23260891979'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROBERTO MARCOS RODRIGUEZ', NULL, NULL, '23261041359', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23261041359'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN JOSE DELGADO', NULL, '155427-5074', '23266737599', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23266737599'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAGRAN  VICTOR', NULL, NULL, '23269033479', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23269033479'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIGUEROA  VERONICA NOEMI', NULL, NULL, '23271874324', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23271874324'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA TRINIDAD GOYENECHE', NULL, NULL, '23273093974', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23273093974'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALVAREDO MARIA MERCEDES', NULL, NULL, '23274940204', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23274940204'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AYAME VERONICA MERCEDES', NULL, NULL, '23277336804', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23277336804'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAZ GUILLERMO MAURICIO', NULL, NULL, '23281163949', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23281163949'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEBASTIAN AUGUSTO DALLA COSTA', NULL, NULL, '23281583239', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23281583239'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERREYRA GOMEZ GERMAN ATILIO', NULL, NULL, '23282483769', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23282483769'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA SOL FARIÑA', NULL, NULL, '23293187134', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23293187134'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE LEON SANTIAGO LAURO', NULL, NULL, '23296200239', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23296200239'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAREZ GISELA ESTEFANIA', NULL, NULL, '23299154254', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23299154254'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALEMANNO SERGIO EMANUEL', NULL, NULL, '23301235569', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23301235569'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BERTELLI FRANCO SANTIAGO', NULL, NULL, '23306572679', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23306572679'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CERNELLO MAXIMILIANO EZEQUIEL', NULL, '+', '23308148149', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23308148149'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KATZMAN JOHANNA AILIN', NULL, NULL, '23310082554', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23310082554'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LACAZZE LAURA', NULL, NULL, '23310505374', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23310505374'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERRARO GASTON ANIBAL', NULL, NULL, '23310596019', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23310596019'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA MERCEDES GALINDEZ', NULL, NULL, '23318964394', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23318964394'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PADOVANI PABLO', NULL, NULL, '23323863709', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23323863709'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MATIAS TOMASETTO', NULL, NULL, '23325380799', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23325380799'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PARAVAGNA MARIA SOLEDAD', NULL, NULL, '23330877294', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23330877294'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CORREA LEONARDO EZEQUIEL', NULL, NULL, '23334347389', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23334347389'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOL DAIANA DE FILIPPO', NULL, NULL, '23339805474', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23339805474'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDEZ JUAN ANTONIO', NULL, NULL, '23341257719', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23341257719'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NIGRO MALENA', NULL, NULL, '23342250874', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23342250874'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HERNAN CRISTIAN CRIVELLI', NULL, NULL, '23353621629', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23353621629'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GUIRADO GARCIA SANTIAGO NICOLAS', NULL, NULL, '23355057399', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23355057399'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CUELLO MARIA DE LOS ANGELES', NULL, NULL, '23357070694', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23357070694'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCOS DANIEL JUAREZ', NULL, NULL, '23357592909', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23357592909'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUAREZ FACUNDO', NULL, NULL, '23361407369', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23361407369'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CACERES RESLER YESICA SOLEDAD', NULL, NULL, '23361886194', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23361886194'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTORANO AGOSTINA', NULL, NULL, '23370720614', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23370720614'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLORES GABRIEL OMAR', NULL, NULL, '23378495539', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23378495539'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDO YAMIL ROSSI', NULL, NULL, '23389095559', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23389095559'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PISANI BERNARDITA', NULL, NULL, '23430966324', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23430966324'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MACHIN GOMEZ MARIA CRISTIAN', NULL, NULL, '23921257864', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23921257864'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN JOSE CABRERA', NULL, NULL, '23927717719', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23927717719'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLORES TACUARI - MARIA VINCENZI', NULL, NULL, '23932796724', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '23932796724'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SAVERIO COSTANTINI', 'saveriocostantini@hotmail.com', '4371-1107', '24108272623', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '24108272623'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA LUJAN NESPRAL', NULL, NULL, '24223641713', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '24223641713'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IGNACIO M VALDEZ', 'IGMAVAL@YAHOO.COM', '03414567544', '24276365602', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '24276365602'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUSANA KASBARIAN', NULL, '481-2599', '27027785250', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27027785250'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LILIANA BEATRIZ PIÑEYRO', NULL, '4312-2685', '27037995679', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27037995679'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARRANCOS DORA BEATRIZ', NULL, NULL, '27038715203', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27038715203'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LILIA ANA BERTONI', NULL, '47813042', '27042264739', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27042264739'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALICIA GRACIELA VENTURA', NULL, NULL, '27044002685', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27044002685'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DINA EDELSZTEIN (P)', NULL, NULL, '27044006273', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27044006273'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BEATRIZ ERCILIA SARLO SABAJANES', NULL, NULL, '27044412832', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27044412832'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GARCIA ALCIRA BEATRIZ', NULL, '372-7781', '27044820558', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27044820558'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MENENDEZ DORITA ANA', NULL, NULL, '27046127736', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27046127736'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA ISABEL RAMIREZ', NULL, NULL, '27046740055', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27046740055'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BEATRIZ C. SEGNI', NULL, '4784-0964', '27046797448', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27046797448'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PERROTA MARIA ISABEL', NULL, NULL, '27048334011', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27048334011'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZAPATERO MARIA ISABEL', NULL, NULL, '27049515540', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27049515540'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELENA FERRI', NULL, '4552-0351', '27050068574', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27050068574'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ADRIANA MANIGLIA', NULL, NULL, '27052141562', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27052141562'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANGELICA ELSA FLORIDO', NULL, NULL, '27052524127', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27052524127'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LILIA LUISA FRANCISCONI', NULL, NULL, '27054419738', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27054419738'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KORITSCHONER INES MARGARITA', NULL, NULL, '27054866238', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27054866238'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LORENZO CRISTINA', NULL, NULL, '27054982238', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27054982238'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUZ GIORDANO', NULL, NULL, '27057582354', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27057582354'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HILDA MERCEDES MORALES', NULL, NULL, '27059874123', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27059874123'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NORMA BECCHINO', NULL, NULL, '27060265661', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27060265661'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ADRIANA ROSENFELD', NULL, NULL, '27062215653', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27062215653'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NOVOA GRACIELA', NULL, NULL, '27062322905', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27062322905'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MONICA CHEDIEK', NULL, '821-1285/826-9714', '27064129096', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27064129096'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZUNINO ALIDA ADELA', NULL, NULL, '27064961727', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27064961727'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'POO MARIA DEL CARMEN FERNANDA', NULL, NULL, '27065127038', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27065127038'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEONOR ORTIZ ELISSETCHE', NULL, '4811-1071/75', '27065203885', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27065203885'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VICTORIA MASSA SOJO', NULL, '4831-8081', '27065204776', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27065204776'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEREZ PERRONE SILVIA NOEMI', NULL, NULL, '27066898623', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27066898623'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIRPO LILIANA ELBA', NULL, NULL, '27067117080', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27067117080'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HULTON JORGE EDUARDO', NULL, NULL, '27084799721', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27084799721'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANA RODRIGUEZ', NULL, '4371-8033', '27089612131', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27089612131'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA DE LAS NIEVES ESCRIBANO', NULL, '4211951/154591371', '27100520821', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27100520821'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GODFRIN ELENA MARIA', NULL, NULL, '27104256177', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27104256177'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAMONA HERMOSA', NULL, NULL, '27104741083', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27104741083'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRACIELA MARGARITA FERRAZZANO', NULL, NULL, '27105043436', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27105043436'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARCHETTA NOEMI ALBINA', NULL, NULL, '27106443454', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27106443454'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROTH LILIANA ALICIA', NULL, '351-4272032', '27108784062', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27108784062'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASTELLANOS  MARIA EUGENIA', NULL, NULL, '27109047088', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27109047088'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PERRETA MARIA CRISTINA', NULL, NULL, '27109243103', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27109243103'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RUBINFELD  SUSANA', NULL, NULL, '27111895355', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27111895355'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRA-MED', NULL, '4827-5352', '27112314364', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27112314364'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NORA MONICA BARDON', NULL, NULL, '27113173128', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27113173128'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JEANSALLE LIDIA IRENE', NULL, NULL, '27114275226', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27114275226'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PATRICIA BRENNAN', NULL, '4814-5003', '27114508492', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27114508492'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA MARTA TERRERA', NULL, '4824-9898', '27115511268', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27115511268'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA F BOACNERA', NULL, NULL, '27115742677', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27115742677'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANGELA SALVUCCI', NULL, NULL, '27117500875', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27117500875'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANA GABRIELA SCHAFFT', NULL, NULL, '27117539399', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27117539399'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'APES GRACIELA NOEMI', NULL, NULL, '27118159980', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27118159980'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELSA NELIDA TECILLA', NULL, NULL, '27119131079', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27119131079'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INES SANGUINETTI', NULL, NULL, '27120456542', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27120456542'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA CRISTINA PASQUINELLI', NULL, NULL, '27121600477', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27121600477'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LILIANA ANA AVALLONE', NULL, NULL, '27122770031', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27122770031'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GIROTTI SILVIA CLARISA', NULL, NULL, '27122901233', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27122901233'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAGNUM SERVICE de NORA GRISELDA DIAZ', NULL, NULL, '27122902434', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27122902434'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Rojo Maria Soledad', NULL, NULL, '27122956240', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27122956240'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VERLATSKI ANA FLORENCIA', NULL, NULL, '27124622463', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27124622463'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PASCUZZO TERESA CARMEN', NULL, NULL, '27124985868', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27124985868'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NORMA EDITH VERNA', NULL, NULL, '27125108372', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27125108372'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA DEL CARMEN BAZAN', NULL, NULL, '27125426498', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27125426498'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ORIZ CLAUDIA IRENE', NULL, NULL, '27125483823', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27125483823'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LILIANA ESTHER DELGADO VARGAS', NULL, '03875095872', '27125537753', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27125537753'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TRANSNOA VIAJES', NULL, '4212985-4227205', '27126656616', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27126656616'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELI SIRLIN', NULL, '4931-8588', '27131027570', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27131027570'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA ELENA STELLA', NULL, NULL, '27131515613', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27131515613'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA DEL CARMEN BACIGALUPPI', NULL, NULL, '27132138325', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27132138325'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CIBELLI ADRIANA', NULL, NULL, '27133606659', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27133606659'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PATRICIA NATIVIDAD ROBLEDO', NULL, '0299-4474698', '27135249136', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27135249136'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LANZAROTTI MARCIA ELIANA', NULL, NULL, '27136155208', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27136155208'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ADELINA PETEIRA', NULL, '4952-7665/4951-4845', '27137111050', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27137111050'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Garrido Adriana', NULL, NULL, '27137356533', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27137356533'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MERCEDES DEL VALLE', NULL, '4952-4315', '27137408630', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27137408630'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EQUIPAMIENTO MONTALBO - LIDIA THEUNYNCK', NULL, '4572-2121', '27138595876', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27138595876'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELBA BEATRIZ KOZACZEK', NULL, NULL, '27138976071', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27138976071'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TERAN GLORIA BEATRIZ', NULL, NULL, '27139500089', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27139500089'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OLIVIERI LILIANA NORMA', NULL, NULL, '27139588520', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27139588520'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUSANA NELIDA MOURELOS - KALA AMBIENTACIONES', NULL, NULL, '27140109717', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27140109717'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARQUEZ VERA MONICA PATRICIA', NULL, NULL, '27143078898', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27143078898'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BASTIDORES Y PINCELES', NULL, '4307-1446', '27144130230', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27144130230'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Silvia Magno', NULL, NULL, '27144882763', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27144882763'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CRISTINA PESARESI', NULL, '4572-9829', '27145681435', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27145681435'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRACIELA EDITH PEREYRA', NULL, NULL, '27146413434', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27146413434'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COBELLI BEATRIZ DEL CARMEN', NULL, NULL, '27146814099', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27146814099'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SPINELLI MARIA CECILIA', NULL, NULL, '27148579089', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27148579089'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANTUNEZ ELENA BEATRIZ (P)', NULL, NULL, '27148826809', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27148826809'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAQUEL GIULIANI', NULL, NULL, '27149026784', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27149026784'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DAMELIO LETICIA', NULL, NULL, '27149729971', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27149729971'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WILENSKY PATRICIA MONICA', NULL, NULL, '27160557783', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27160557783'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUSANA ELENA VEGA', NULL, NULL, '27163004564', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27163004564'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VAZQUEZ MAZZINI MARISA BEATRIZ', NULL, '}', '27164959142', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27164959142'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIAWOL MARIA SUSANA', NULL, NULL, '27165500216', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27165500216'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SAID CLAUDIA GABRIELA', NULL, NULL, '27167453185', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27167453185'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA DE LAS MERCEDES ESCOBAR', NULL, '(15)6019-6871', '27169119452', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27169119452'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ADRIANA MABEL DE MATEO', NULL, NULL, '27169407121', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27169407121'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE LUCA MARCELA SANDRA', NULL, NULL, '27169961374', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27169961374'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VALDEZ  ALEJANDRA MARIA', 'alejvaldez@hotmail.com', '0351-156831898', '27170023159', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27170023159'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REMISES VIA SAN JUAN', NULL, '4307-5029/4361-2826', '27170362484', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27170362484'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUANTEGUY ELENA MERCEDES', NULL, NULL, '27170841277', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27170841277'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'URIBE LILIANA', NULL, NULL, '27172006715', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27172006715'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HILDA ESTELA PANIAGUA', NULL, '49226000', '27172118688', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27172118688'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA MARCELA HARRIAGUE', NULL, '4784-7858', '27172440121', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27172440121'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DI MARCO LAURA BEATRIZ', NULL, NULL, '27172542641', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27172542641'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FELICITAS LUNA', NULL, NULL, '27173651061', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27173651061'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AUTOEDITOR - SIST.DE EDICION', NULL, NULL, '27175698405', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27175698405'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GIMENEZ MARIANA GRACIELA', NULL, '15-4055-0678', '27176313183', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27176313183'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARISA WIERNY', NULL, NULL, '27176565662', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27176565662'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DEBELJUH PATRICIA LUJAN', NULL, NULL, '27176657907', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27176657907'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WLOSKO VIVIANA ETHEL', NULL, NULL, '27177261241', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27177261241'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PALADINI PAULA MARIA', NULL, NULL, '27178290636', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27178290636'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CECILIA ANDREA CAVEDO (P)', NULL, NULL, '27178291160', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27178291160'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARISA BEATRIZ TROIANO', NULL, '155-364512', '27178719373', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27178719373'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIANA CONTE GRAND', NULL, NULL, '27178755108', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27178755108'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA MARTA SANTARSIERO', NULL, '}', '27180683386', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27180683386'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SONIA MARISA PORTE', NULL, '(0261) 4294604', '27180843065', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27180843065'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA SARA CAFFERATA', NULL, NULL, '27182051050', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27182051050'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA JOSEFINA UBERTI', NULL, NULL, '27182054033', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27182054033'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE MARZIANI JULIETA', NULL, NULL, '27182837194', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27182837194'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Garcia Amigo Maria Nieves', NULL, NULL, '27182848234', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27182848234'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MENICHETTI ADRIANA (P)', NULL, '0', '27182873816', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27182873816'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BASTIANI MARIA DE LOS ANGELES', NULL, NULL, '27183499152', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27183499152'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIRGINIA FRANCISCO', NULL, NULL, '27183537607', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27183537607'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAULA RICCI', NULL, NULL, '27184632581', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27184632581'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CALCATERRA GABRIELA SILVINA', NULL, NULL, '27184836128', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27184836128'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DOTTA SILVIA', NULL, NULL, '27185273453', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27185273453'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FABIANA BENZONI', NULL, NULL, '27185284781', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27185284781'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTUDIO PRIETO BONINO', NULL, '300-9393/307-5245', '27185583827', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27185583827'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELA ALICIA ESCOLAR', NULL, NULL, '27185637560', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27185637560'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGUEZ  MARÍA SILVINA', NULL, NULL, '27186163228', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27186163228'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ORDOÑEZ Y REVUELTA MARIA ELENA', NULL, NULL, '27187676660', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27187676660'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARPEGNA GONZALEZ NATALIA', NULL, '0', '27188147807', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27188147807'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAURA ROSENZWAIG', NULL, NULL, '27200313440', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27200313440'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA ELENA MORALES', NULL, '4632-2766', '27203588963', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27203588963'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARAUJO MARIA JOSE', NULL, NULL, '27204040236', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27204040236'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BALATTI VERONICA', NULL, '312-4979', '27204100433', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27204100433'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTINEZ MARIANA BEATRIZ', NULL, NULL, '27204162153', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27204162153'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WIÑAR LAURA', NULL, '0', '27204253280', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27204253280'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELA F. CASTRO', NULL, NULL, '27204805674', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27204805674'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INES GOLDVARG', NULL, NULL, '27206202241', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27206202241'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAURA SALVATORI', NULL, NULL, '27206275478', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27206275478'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'STEINBERG SILVANA GRISEL', NULL, NULL, '27206387675', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27206387675'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MILONE CECILIA MABEL', NULL, NULL, '27206462871', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27206462871'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ATANOSOPULO LAURA ALEJANDRA', NULL, NULL, '27206829759', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27206829759'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MONICA ALICIA VARONA', NULL, NULL, '27206923313', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27206923313'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANA CRISTINA MAGNANI', NULL, NULL, '27209601031', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27209601031'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SCARIMBOLO SILVINA ANDREA', NULL, '0', '27209859314', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27209859314'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ETHEL IRENE TERRENO', NULL, NULL, '27209967419', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27209967419'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGUEZ ANDREA LILIANA', NULL, NULL, '27211047696', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27211047696'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA FABIANA FERNANDEZ', NULL, NULL, '27211506720', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27211506720'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ENSINCK MARIA GRACIELA', NULL, NULL, '27211784305', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27211784305'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MONICA YERISE', NULL, '4432-0910', '27214756426', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27214756426'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUSANA M RIMOLDI', NULL, NULL, '27214799958', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27214799958'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TIRELLI ALEJANDRA', NULL, NULL, '27214931600', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27214931600'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGUEZ ZALAZAR SOLANA MARIA', NULL, NULL, '27215644257', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27215644257'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLAUDIA DEL CARMEN SOTO', NULL, NULL, '27216656763', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27216656763'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLORENCIA RODRIGUEZ', NULL, NULL, '27217199420', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27217199420'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JIMENA SOLEDAD ESCRIBANO', NULL, '4245077/4254570', '27217546686', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27217546686'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEREI ANA MARIA', NULL, NULL, '27217869523', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27217869523'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INES SAAVEDRA', NULL, '48625458', '27218326337', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27218326337'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AFONSO EDITH GRACIELA', NULL, NULL, '27218447592', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27218447592'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DAL POGGETTO MARINA LAURA', NULL, NULL, '27219826996', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27219826996'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA DE LUJAN PERZHALO', NULL, NULL, '27220016272', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27220016272'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLORENCIA PIZARRO BRAGA', NULL, NULL, '27220809442', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27220809442'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BEVILACQUA  GRISELDA BEATRIZ', NULL, NULL, '27221499811', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27221499811'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GALARZAVERONICABEATRIZ', NULL, NULL, '27222784250', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27222784250'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOLANGE HANSEN', NULL, NULL, '27222936530', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27222936530'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GABRIELA ALEJANDRA COMAS', NULL, '0223-484-0527', '27223414007', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27223414007'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FRYDRYCH OLEJNIK PAULA CAROLINA ROSA', NULL, NULL, '27224108511', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27224108511'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA GABRIELA MIGUEL', NULL, NULL, '27224269353', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27224269353'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BERTA MARIA ELENA', NULL, NULL, '27224962660', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27224962660'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GORJON ALEJANDRA MARIA VICTORIA', NULL, NULL, '27225091108', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27225091108'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INTROCASO MARCELA BEATRIZ', NULL, '4372-4005', '27225732383', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27225732383'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'bulhmann monica liliana', NULL, NULL, '27226341728', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27226341728'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROSANA VANESA PACHECO FERRARI', NULL, NULL, '27226638100', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27226638100'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLORENCIA DEL GIZZO', NULL, NULL, '27226669812', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27226669812'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALICIA VIVIANA MORAN', NULL, NULL, '27227109500', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27227109500'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MACHADO SILVIA VERONICA', NULL, NULL, '27227737668', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27227737668'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRISELDA S. MUÑOZ', NULL, NULL, '27227961932', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27227961932'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIAZ ALARCON MARIA XIMENA', NULL, NULL, '27229651329', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27229651329'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA GUADALUPE DIAZ', NULL, NULL, '27230930738', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27230930738'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PUERTO CAFE - ESTEFANIA DIAZ', NULL, NULL, '27232284752', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27232284752'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LORENA SOMMA', NULL, NULL, '27233267983', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27233267983'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AÑON VAZQUEZ MARIA DE LOS ROCIOS', NULL, NULL, '27233298048', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27233298048'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLAUDIA BEATRIZ BREHM', NULL, NULL, '27233516401', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27233516401'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA JORGELINA MIRANDA', NULL, '4831-4970', '27234140936', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27234140936'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZAPATA MARIANA', NULL, NULL, '27234223831', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27234223831'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TAVELLI MARIA GABRIELA', NULL, NULL, '27234388164', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27234388164'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAULA STERCZEK', NULL, NULL, '27234636141', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27234636141'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELA A R MARTUZZA', NULL, NULL, '27235137440', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27235137440'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CRISTINA ALEJANDRA PEREZ', NULL, NULL, '27235170138', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27235170138'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GONZALEZ LAURA ANDREA', NULL, NULL, '27235309918', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27235309918'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA BELEN OLLER FERNANDEZ', NULL, NULL, '27235812458', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27235812458'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAURA BENITEZ', NULL, NULL, '27235854940', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27235854940'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTINEZ ESTEFANIA', NULL, NULL, '27236435909', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27236435909'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'G/A CONSULTING de ROMINA GAUDIANO', NULL, NULL, '27236705752', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27236705752'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VALVERDE VANINA VALERIA', NULL, NULL, '27237068918', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27237068918'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BOUFFLET MARIA CECILIA', NULL, NULL, '27237565563', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27237565563'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LORENA BARRAU', NULL, NULL, '27237579025', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27237579025'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASADORES DE CAMPO - LORENA PAULA IRAIZOZ', NULL, NULL, '27237716790', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27237716790'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARRANZA  CAROLINA', NULL, NULL, '27238213806', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27238213806'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCONETTO MARIA VALERIA', NULL, NULL, '27238240889', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27238240889'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NELIDA S. BARRIOS', NULL, NULL, '27238258052', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27238258052'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAROLINA EVA SANCHEZ', NULL, NULL, '27239448823', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27239448823'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'POLONSKY LAURA MYRIAN', NULL, NULL, '27239526840', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27239526840'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TOOLVANA (Silvana Elizabeth Mamone) (CVU)', NULL, NULL, '27239586851', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27239586851'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCELA DEL VALLE AGUIRRE', NULL, NULL, '27239852780', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27239852780'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAVALIERI ROMINA', NULL, NULL, '27239956845', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27239956845'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MONICA V. MUSARRA', NULL, NULL, '27240229728', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27240229728'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARLETA VALERIA DEBORA', NULL, NULL, '27240290621', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27240290621'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DAVILA ANA MARCELA', NULL, NULL, '27240656278', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27240656278'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MOLINA  MARIA PIA LOURDES', NULL, NULL, '27240895612', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27240895612'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MALDONADO  MONICA FABIOLA', NULL, NULL, '27241898267', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27241898267'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HORNUS NANCY', NULL, NULL, '27242022012', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27242022012'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INES LAFOURCADE', NULL, NULL, '27242112038', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27242112038'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MIMESSI NATALIA INES', NULL, NULL, '27242471585', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27242471585'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DANIELA ZATTARA', NULL, NULL, '27242983195', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27242983195'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GABRIELA JEIFETZ', NULL, NULL, '27243089072', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27243089072'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GABINO LAURA ANGELICA (P)', NULL, NULL, '27243177923', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27243177923'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'C.M. REGALOS', NULL, '4644-5203  15 4949-0635', '27243412310', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27243412310'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LORENA VANETTI', NULL, NULL, '27243632531', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27243632531'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MENA PAULA MARCELA', NULL, NULL, '27243652028', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27243652028'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REYNOSO MARIA PIA', NULL, NULL, '27243678779', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27243678779'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARINAGA  MARIA BELEN', NULL, NULL, '27243965204', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27243965204'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAULA A. REATO', NULL, NULL, '27244734710', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27244734710'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Andrea Elba Mendez', NULL, NULL, '27245692566', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27245692566'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'YOANA CARLA DANIEL', NULL, NULL, '27246148894', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27246148894'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DEPIANTE JULIETA', NULL, NULL, '27246290976', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27246290976'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLAUDIA ALEJANDRA MARTINEZ', NULL, NULL, '27247031567', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27247031567'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESPAÑOL PAULA IRENE', NULL, NULL, '27247110831', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27247110831'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA SOLEDAD ORCE SCHWARZ', NULL, NULL, '27248755879', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27248755879'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOLANO VIRGINIA', NULL, NULL, '27248810527', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27248810527'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOMEZ MARIA LUZ', NULL, NULL, '27248854710', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27248854710'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SABRINA LORENA SEGUI', NULL, NULL, '27249231962', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27249231962'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUKS ANDREA KARINA', NULL, NULL, '27250380718', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27250380718'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA DE LAS MERCEDES MALVIDO', NULL, NULL, '27250524701', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27250524701'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WOLOSKY DEBORA ESTER', NULL, NULL, '27250941124', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27250941124'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUCERO JUDITH ALEJANDRA', NULL, NULL, '27251054512', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27251054512'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRINCIPE ROMINA ANDREA', NULL, NULL, '27251333519', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27251333519'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'pecora rosalia adriana', NULL, NULL, '27251683803', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27251683803'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROJAS  VIVIANA FERNANDA', NULL, '0351-4891810-4698324', '27252024005', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27252024005'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOTTARDI  ANA ELISA', NULL, NULL, '27252297389', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27252297389'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CABRERA MARCELA', NULL, NULL, '27252682665', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27252682665'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BISOGNO MARIA VICTORIA', NULL, '4700', '27253148476', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27253148476'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA JORGELINA CIBRARO', NULL, NULL, '27253411851', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27253411851'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FED CAM', NULL, NULL, '27253747736', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27253747736'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA JAZMIN FELIÚ', NULL, NULL, '27254044003', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27254044003'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRANE MERCEDES INES', NULL, '47739125', '27254301006', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27254301006'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LARRALDE MARTINA', NULL, NULL, '27254535635', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27254535635'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BOBBIO MARIA GABRIELA', NULL, NULL, '27254805055', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27254805055'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEREDA MARIANA SOLEDAD', NULL, NULL, '27255114099', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27255114099'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAOLA LORENZO', NULL, NULL, '27256306854', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27256306854'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIA LORENA MIRANDA', NULL, NULL, '27256640789', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27256640789'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA INES BELTRAMINO', NULL, NULL, '27257003057', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27257003057'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLABIA ADRIANA MOREL', NULL, NULL, '27257752203', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27257752203'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARENA MARIA CECILIA', NULL, NULL, '27257900369', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27257900369'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIDRIERIA RG - RAO MARIA SOLEDAD', NULL, NULL, '27257976632', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27257976632'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA NOEL SANCHEZ (DOBKE)', NULL, '0', '27258012947', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27258012947'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GAMING-CITY COMPUTACIÓN', NULL, NULL, '27258678481', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27258678481'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AURORA GALLERANO', NULL, NULL, '27259175610', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27259175610'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NOELIA NATALIA ROMERO TABARES', NULL, NULL, '27259181475', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27259181475'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SALAS MARIA LAURA', NULL, NULL, '27259186973', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27259186973'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CORREA MERCEDES', NULL, NULL, '27259406302', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27259406302'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VERONICA MASINI', NULL, NULL, '27260477094', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27260477094'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RABAINI MARIANA', NULL, NULL, '27260726329', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27260726329'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUSS JACOB MARIA SOLEDAD', NULL, NULL, '27261552952', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27261552952'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PETRONI PAULA', NULL, NULL, '27261570276', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27261570276'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAULA ANDREA SADOVNIK', NULL, NULL, '27261945091', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27261945091'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUCH TAY ANA', NULL, NULL, '27262170778', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27262170778'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGUEZ CECILIA INES', NULL, '+', '27262588721', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27262588721'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IRULEGUI MARIA JULIA', NULL, NULL, '27262813555', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27262813555'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GISELA LAURA GONZALEZ', NULL, NULL, '27263174513', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27263174513'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA CANDELARIA FERNANDEZ', NULL, NULL, '27263714690', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27263714690'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MOLINAS FERNANDEZ  CARMEN DEL ROSARIO', NULL, NULL, '27263896756', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27263896756'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SILVA MARIELA DEL CARMEN', NULL, NULL, '27264811207', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27264811207'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAULA ANDREA ROMANO', NULL, NULL, '27264862618', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27264862618'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMINA G. DI CARLO', NULL, NULL, '27265254964', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27265254964'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARINA GEROLIMETTI (P)', NULL, NULL, '27265613123', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27265613123'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMDAN MARIA LAURA', NULL, NULL, '27265886200', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27265886200'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROSANA ALEJANDRA BARROSO', 'rosana.barroso@speedy.com.ar', '4224-6967', '27266697908', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27266697908'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OLMEDO DEL AZAR MANUELA', NULL, NULL, '27266996247', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27266996247'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TAU DANIELA LEONOR', NULL, NULL, '27268654017', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27268654017'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA NIEVES SPIDALIERI', NULL, NULL, '27268966493', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27268966493'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTINEZ SILVANA CAROLINA', NULL, NULL, '27269262554', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27269262554'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARRAPODI ANABELIA CELESTE', NULL, NULL, '27271506452', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27271506452'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JAIMOVICH DESIREE ROXANA', NULL, NULL, '27271704572', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27271704572'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DOLORES CUENYA', NULL, NULL, '27271831604', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27271831604'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANDRA MABEL ROSALES', NULL, NULL, '27272059905', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27272059905'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE ARMAS CAROLINA ALEJANDRA', NULL, NULL, '27272150058', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27272150058'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOFIA BISTUE COBOS', NULL, NULL, '27272982150', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27272982150'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VILARRASA MARIA LAURA', NULL, NULL, '27273981255', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27273981255'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE ROSA MARIA LAURA', NULL, NULL, '27274194184', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27274194184'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OGA FIORELLA JAZMIN', NULL, NULL, '27274635245', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27274635245'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA LUISA GARCIA', NULL, '4554-6400', '27274871925', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27274871925'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DURO MARIA BELEN', NULL, NULL, '27275706995', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27275706995'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VASALISSA - FEDERICA MARINUCCI', NULL, NULL, '27276806675', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27276806675'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RUA BESUSCHIO MARIA MARTINA', NULL, NULL, '27277185178', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27277185178'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'YANINA ANDREA MANCILLA', NULL, NULL, '27277684840', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27277684840'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TONDELLO VALERIA', NULL, '4348-5000', '27278591110', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27278591110'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGOSTINA EMILIA MENEGUZZI', NULL, NULL, '27279407704', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27279407704'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'di siena teresa de lourdes', NULL, NULL, '27279567361', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27279567361'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIBIGER NATALIA MARIA', NULL, NULL, '27280036523', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27280036523'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GENTILE CECILIA', NULL, NULL, '27280138075', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27280138075'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOLIVER VERONICA ANDREA', NULL, NULL, '27281593272', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27281593272'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DELLA COSTA LAURA ANDREA', NULL, NULL, '27281659222', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27281659222'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SCHUTT CIRILA SARA', NULL, NULL, '27281680353', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27281680353'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMINA CARBONATTO', NULL, '46374224', '27281680566', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27281680566'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DONOVAN FLORENCIA', NULL, NULL, '27281685185', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27281685185'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA FLORENCIA BARLETTA', NULL, NULL, '27282408460', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27282408460'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEVY MARIA JIMENA', NULL, '0', '27283072059', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27283072059'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAURA M. SIMAN POLLASTRI', NULL, NULL, '27283485507', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27283485507'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOTO PAOLA VERONICA', NULL, NULL, '27285085441', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27285085441'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAMIRO PAMELA CAROLINA', NULL, NULL, '27285644432', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27285644432'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMINA NANNINI', NULL, NULL, '27285664468', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27285664468'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MALANO CARINA DEL VALLE', NULL, NULL, '27285817647', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27285817647'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTIN LUCIANA', NULL, NULL, '27286454076', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27286454076'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAWSON NOELIA ELEONORA', NULL, NULL, '27286577321', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27286577321'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CERRUTI CAROLINA', NULL, NULL, '27286756838', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27286756838'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VACCAREZZA LAURA MARIA', NULL, NULL, '27287516547', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27287516547'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGUSTINA VEXLER', NULL, NULL, '27288038010', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27288038010'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NATALIA DEMARIA', NULL, NULL, '27288166124', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27288166124'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AYERDI ROSARIO', NULL, NULL, '27288680359', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27288680359'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE NICOLO GABRIELA SUSANA', NULL, NULL, '27289083648', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27289083648'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DI MARTINO GILDA MELISA', NULL, '15-4414-4418', '27289846021', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27289846021'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUCIA MERDECES CANITROT', NULL, NULL, '27289859646', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27289859646'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INGENITO MARIA CECILIA', NULL, NULL, '27289970164', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27289970164'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSEFINA MORENO', NULL, NULL, '27290418831', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27290418831'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAROLINA ROCIO GOMEZ', NULL, NULL, '27291689669', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27291689669'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VALENZUELA JULIETA VERONICA', NULL, NULL, '27291932164', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27291932164'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA PAULA MANCINI', NULL, NULL, '27291961776', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27291961776'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CICERO ROMINA CECILIA', NULL, NULL, '27292298353', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27292298353'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BEYOT TATIANA', NULL, NULL, '27292300331', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27292300331'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BASTANCHURI MARIA SOFIA', NULL, NULL, '27292499480', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27292499480'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CEBEY MARIA CAROLINA', NULL, NULL, '27292612805', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27292612805'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BINETTI DIANA PRUSILA ROSA', NULL, '03794429043', '27293074467', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27293074467'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE MARCO SOLEDAD CINTIA', NULL, NULL, '27293184815', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27293184815'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAURA ANALIA DUPEY', NULL, NULL, '27293196465', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27293196465'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAMON BADIA MARIA BELEN', NULL, NULL, '27293924037', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27293924037'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MONACO PAOLA MABEL', NULL, NULL, '27294656850', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27294656850'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MUSA VERONICA GISELLA', NULL, NULL, '27295430635', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27295430635'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DATES MERCEDES', NULL, NULL, '27295807585', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27295807585'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CHIACCHIARI NATALIA MABEL', NULL, NULL, '27296000189', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27296000189'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'martin maria paula', NULL, NULL, '27296069952', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27296069952'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTOGLIO  ROMINA', NULL, NULL, '27296080697', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27296080697'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PERAL MARIA VIRGINIA', NULL, NULL, '27296081758', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27296081758'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COSENTINO MARIA LUJAN', NULL, NULL, '27296351186', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27296351186'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CYNTHIA GISELLE CANZANI', NULL, NULL, '27296981368', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27296981368'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COCUCCI LUCRECIA ANAHI', NULL, NULL, '27297104697', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27297104697'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAURA ROMINA CARRIZO', NULL, NULL, '27297137862', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27297137862'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTHER SILVANA STRASORIER', NULL, NULL, '27297949867', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27297949867'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA PAULA BRAMBILLA ECHEGARAY', NULL, NULL, '27299118857', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27299118857'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIANA BARRERA', NULL, NULL, '27299409657', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27299409657'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VALERIA PEDICONI', NULL, '4923-6814', '27299863749', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27299863749'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NATALIA BORETTO RAMIREZ', NULL, NULL, '27300833689', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27300833689'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LARREA CECILIA VANINA', NULL, '0', '27301812251', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27301812251'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DEAMBROGGIO GARRETT CYNTHIA CARLA DIANA', NULL, NULL, '27301828255', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27301828255'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Natalia Garcia', NULL, NULL, '27302115333', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27302115333'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIANA SANGUINETTI', NULL, NULL, '27302196872', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27302196872'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEREZ VASARO DANIELA CECILIA', NULL, NULL, '27302763939', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27302763939'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MADGALENA DE TEZANOS PINTO', NULL, NULL, '27303670004', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27303670004'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA LAURA PONCE', NULL, NULL, '27304685307', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27304685307'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA FLORENCIA ROMERO', NULL, NULL, '27306111626', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27306111626'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NUÑEZ SILVIA ROCIO', NULL, NULL, '27306324174', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27306324174'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RUIZ DIAZ ELIZABETH LILIANA', NULL, NULL, '27307282726', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27307282726'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BERARDI ROMINA', NULL, NULL, '27307468129', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27307468129'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Gallardo Marcia Salome', 'mgallardodg@gmail.com', NULL, '27308508736', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27308508736'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CRESPI VERONICA INES', NULL, '4700', '27309255823', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27309255823'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MOORE PILAR', NULL, NULL, '27309288853', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27309288853'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MINETTO JIMENA FERNANDA', NULL, NULL, '27309794546', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27309794546'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUBRINA XIMENA MARIEL DEL VALLE', NULL, NULL, '27309864366', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27309864366'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MEDINA ICAZA MARIA DE LOS ANGELES', NULL, NULL, '27309891584', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27309891584'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VALERIA BARBARA MUÑOZ', NULL, NULL, '27310182163', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27310182163'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MORAS MANUELA', NULL, NULL, '27310275927', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27310275927'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SABRINA M ROMERO', NULL, NULL, '27310327196', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27310327196'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA GOSO', NULL, NULL, '27310549954', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27310549954'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA LAURA SANGIORGIO', NULL, NULL, '27311762422', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27311762422'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERNANDEZ MELINA', NULL, NULL, '27312315322', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27312315322'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VERCHELLI CABRAL VANESA SOLEDAD', NULL, NULL, '27312955348', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27312955348'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FALIVENE ROMINA FERNANDA', NULL, NULL, '27313160470', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27313160470'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RUIZ MARIA CELESTE DEL VALLE', NULL, NULL, '27313994967', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27313994967'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOZADA CATALINA', NULL, NULL, '27314490121', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27314490121'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BAROLO CINTHIA VERONICA', NULL, NULL, '27315074520', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27315074520'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANDREA YOLANDA TONDELLO', NULL, NULL, '27315076396', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27315076396'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZAPATA CARLA VALERIA', NULL, NULL, '27315117106', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27315117106'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMOROSO CAROLINA LAURA', NULL, NULL, '27315204513', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27315204513'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA AGUSTINA SCLARANDI', NULL, NULL, '27316047748', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27316047748'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FARIAS MICAELA BEATRIZ', NULL, NULL, '27317509559', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27317509559'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA DEL ROCIO GIORDANO', NULL, NULL, '27318314263', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27318314263'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAWSON  BRENDA', NULL, '0351-5899898', '27318439759', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27318439759'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PEZZATI MARIA EMILIA (P)', NULL, NULL, '27320939912', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27320939912'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA LAURA MACHADO', NULL, NULL, '27321152762', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27321152762'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GARCIA LUNA MICAELA BETSABE', NULL, NULL, '27323177363', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27323177363'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA PIA GIRAUDO', NULL, NULL, '27324316820', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27324316820'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMERO NADIA SOLEDAD', NULL, NULL, '27325076114', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27325076114'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MUSTAFA AIXA SOLEDAD', NULL, NULL, '27325996795', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27325996795'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROJAS ADRIANA', NULL, NULL, '27326658036', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27326658036'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'María Florencia Mileta', NULL, NULL, '27326750501', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27326750501'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLORENCIA CECILIA SANVITALE', NULL, NULL, '27326773900', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27326773900'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KRISTAL DENISE LEA (P)', NULL, NULL, '27326785984', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27326785984'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGUIRRE MARIA FERNANDA', NULL, '4700', '27328081682', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27328081682'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NATALI DENISE RIVADERA', NULL, NULL, '27330200540', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27330200540'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MACARENA ASENSIO', NULL, NULL, '27330221130', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27330221130'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARDISSONO RISSO NATALIA LUJAN', NULL, NULL, '27330364985', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27330364985'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARENGO FLORENCIA', NULL, NULL, '27332707847', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27332707847'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA AGUSTINA FERNANDEZ', NULL, NULL, '27333463852', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27333463852'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PESEK MARIA VIRGINIA', NULL, NULL, '27334614714', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27334614714'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARINA GERBI', NULL, NULL, '27334807830', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27334807830'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GAUNA FLORENCIA DANIELA', NULL, NULL, '27335351032', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27335351032'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GONZALEZ ESTEFANIA', NULL, NULL, '27336215655', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27336215655'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TOURN CECILIA LILIAN', NULL, NULL, '27336876147', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27336876147'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SORIA PAMELA JACQUELINE', NULL, NULL, '27337056038', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27337056038'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARRETO AYELEN', NULL, NULL, '27337831538', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27337831538'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GALLO CATALINA ANDREA', NULL, NULL, '27337899353', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27337899353'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CALLES JIMENA', NULL, NULL, '27338305422', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27338305422'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Garzon Sanchez Emilse Jimena', NULL, NULL, '27339606000', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27339606000'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOZAMI BETINA ANDREA', NULL, NULL, '27340141763', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27340141763'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAULA MARIA BENARDONI', NULL, NULL, '27340347280', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27340347280'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SECO LEDA MARINA', NULL, '4700', '27342192330', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27342192330'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AYUS CACOPARDO MARIA LUZ', NULL, NULL, '27342457873', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27342457873'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MURA SUYAY', NULL, NULL, '27343194280', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27343194280'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA PAULA WAJNSZYLD', NULL, NULL, '27344349113', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27344349113'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARRETO MAGDALENA', NULL, NULL, '27344881605', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27344881605'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RODRIGUEZ MARIA INES', NULL, NULL, '27345475651', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27345475651'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOMEZ AGUSTINA', NULL, NULL, '27345525918', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27345525918'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Williams Victoria', NULL, NULL, '27348458901', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27348458901'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRADO AGUSTINA', NULL, NULL, '27350733952', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27350733952'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALBA INDIRA AILIN', NULL, NULL, '27351182038', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27351182038'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIAZ MARIBEL NOELIA', NULL, NULL, '27351469841', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27351469841'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'STEFANIA BELEN GODEAS', NULL, NULL, '27352298420', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27352298420'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT NULL, NULL, '0351-5899898', '27355379308', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27355379308'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOURDY ALLENDE ROSARIO', NULL, NULL, '27355808160', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27355808160'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALVAREZ NARA MAGALI', NULL, NULL, '27357550187', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27357550187'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MIRANDA LIA NOYA GASPARETTI', NULL, NULL, '27359423131', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27359423131'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BEK MARELLI TALI SUYAY', NULL, NULL, '27359629163', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27359629163'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GONZALEZ MARIA GABRIELA', NULL, NULL, '27360907622', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27360907622'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BOTTINO PAMELA', NULL, NULL, '27365479238', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27365479238'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRABADOS CONQUER', NULL, NULL, '27365937635', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27365937635'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MADINA PAULA AYELEN', NULL, NULL, '27366308941', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27366308941'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA SOL PASQUALINI', NULL, NULL, '27366374707', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27366374707'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSTANTINO  JULIETA SOLEDAD', NULL, NULL, '27366461472', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27366461472'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'STENDEL ELIANA JUDITH', NULL, '0', '27366871336', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27366871336'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GONZALEZ ALU JUMENA YAMILA', NULL, NULL, '27367218814', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27367218814'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAINELLI FLORENCIA PAULA', NULL, NULL, '27367271138', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27367271138'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOMEZ PALACIOS ANA SOFIA', NULL, NULL, '27368556470', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27368556470'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CRESCENTE CATALINA (P)', NULL, NULL, '27371248515', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27371248515'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIPSZYC JAZMIN', NULL, NULL, '27371714923', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27371714923'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOFIA SOLEDAD PIROLO', NULL, NULL, '27371793785', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27371793785'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DHARMA VIAJES (BERTOSSI AGOSTINA)', NULL, NULL, '27371990874', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27371990874'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PALOMA CORTES AYUSA', NULL, NULL, '27373119836', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27373119836'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERRANO MARIA FLORENCIA', NULL, NULL, '27374127646', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27374127646'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MUNTANER LUCILA', NULL, NULL, '27375574662', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27375574662'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLORENCIA MATTEODA', NULL, NULL, '27377034339', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27377034339'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLORENCIA VALLEJOS', NULL, NULL, '27377530697', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27377530697'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GONZALEZ ANTONELLA', NULL, NULL, '27378452436', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27378452436'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRIEGO MARTINA', NULL, NULL, '27379483017', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27379483017'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MONTENEGRO MALVA MARINA', NULL, NULL, '27384439689', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27384439689'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HERMANOVICH MARIA NAZARETH', NULL, NULL, '27385700984', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27385700984'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'YAMILA NOELIA CARRIZO', NULL, NULL, '27387552273', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27387552273'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BOOM ART SPACE (MEDERO CAMILA)', NULL, NULL, '27387733006', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27387733006'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRECO FLORENCIA', NULL, NULL, '27387842905', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27387842905'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BRENDA RUHL', NULL, NULL, '27388431763', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27388431763'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GONZALEZ MARINA SOFIA', NULL, NULL, '27389925204', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27389925204'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA BELEN CHIARA VIEYRA', NULL, NULL, '27389949626', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27389949626'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARROYO VERONICA SILVANA', NULL, '0', '27392868750', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27392868750'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARLETTAZ VALENTINA', NULL, NULL, '27394955367', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27394955367'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COLLIA CATALINA BAHIA', NULL, '15-4414-4418', '27401310695', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27401310695'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CERUTI FLORENCIA LUCIA', NULL, NULL, '27401849926', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27401849926'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SALINAS DAIANA MICAELA', NULL, NULL, '27406507845', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27406507845'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WILCHES CATALINA', NULL, NULL, '27407318841', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27407318841'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COIFMAN JOHANA IALE', NULL, NULL, '27414705273', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27414705273'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANCHEZ ALBERTTI ANASTASIA MILENA', NULL, NULL, '27418249310', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27418249310'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REYES CAMILA AGUSTINA', NULL, '0', '27423408176', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27423408176'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TEMPONE MALENA', NULL, NULL, '27424697759', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27424697759'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NARBAITZ EMILIA', NULL, NULL, '27431958363', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27431958363'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INGARAMO ATHIANA ABIGAIL', NULL, NULL, '27433770388', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27433770388'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANCHEZ FILIBERT IMARINA VICTORIA', NULL, NULL, '27434520768', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27434520768'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PETTINATO MARTINA LARA', NULL, NULL, '27457489043', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27457489043'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUCIA MACHADO RODRIGUEZ', NULL, '15-6657-6628', '27603827738', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27603827738'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIZ MAGDALENA BOGADO AYALA (P)', NULL, NULL, '27921437957', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27921437957'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'URANGA BETANCUR ANA MARIA', NULL, NULL, '27924937659', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27924937659'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARGARITA CARRATU', NULL, '4552-8948', '27925280211', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27925280211'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VILLEGAS ESCALERA YULY KARINA', NULL, '15-4414-4418', '27925842740', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27925842740'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JIN YI HWANG', NULL, NULL, '27927264418', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27927264418'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CACIANO DONAYRE NORMA ISABEL', NULL, NULL, '27932682309', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27932682309'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TURISMO CUENCA DEL PLATA', NULL, NULL, '27934812552', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27934812552'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CECILIA BIANCHI BORRAZAS', NULL, NULL, '27937608158', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27937608158'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NORMA ZARATE CALLALLI', NULL, '4867 1392', '27940326384', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27940326384'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AYGUL SAFIULLINA', NULL, NULL, '27944384567', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27944384567'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LERTORA CALLIRGOS MABEL CLAUDIA', NULL, '0', '27946677065', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27946677065'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MORO TORRES ANNETE ALEJANDRA', NULL, NULL, '27959851498', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '27959851498'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SMG COMPA#IA ARGENTINA DE SEGUROS S.A', NULL, NULL, '30500031960', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500031960'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BERKLEY INTERNATIONAL SEGUROS S.A.', NULL, NULL, '30500035788', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500035788'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZURICH ASEGURADORA ARGENTINA S.A.', NULL, NULL, '30500036393', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500036393'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Compañía de Seguros La Mercantil Andina S.A.', NULL, NULL, '30500036911', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500036911'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA CONSTRUCCION CIA.SEG.', NULL, NULL, '30500050620', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500050620'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RIO URUGUAY COOP. DE SEGUROS LTDA', NULL, '0', '30500061711', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500061711'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA NACION', NULL, '4319-1600', '30500089624', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500089624'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EL CRONISTA - RECOLETOS ARGENTINA S.A.', NULL, '4121-9300', '30500090029', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500090029'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SA ENTRE RIOS', NULL, NULL, '30500092315', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500092315'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA VOZ DEL INTERIOR SA', NULL, '0351-4757100', '30500095527', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500095527'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EL CONSTRUCTOR S.R.L.', NULL, NULL, '30500096515', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500096515'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BOLSA DE CEREALES', NULL, '4312-2000', '30500103414', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500103414'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA LEY S.A.E.eI.', NULL, '49-5481  49-5489', '30500106316', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500106316'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDITORIAL JORNADA SA', NULL, NULL, '30500112383', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500112383'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARTE GRAFICO EDITORIAL ARG SA', NULL, '4307-0330', '30500124152', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500124152'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERVICIOS DE RADIO Y TELEVISION DE LA UNIVERSIDAD NACIONAL DE CORDOBA S.A.', NULL, NULL, '30500139990', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500139990'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REVISTA VIVIENDA S.R.L.', NULL, '4381-1831', '30500166157', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500166157'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SBAFFI Y CIA S.A.', NULL, NULL, '30500343903', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500343903'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AKZO NOBEL ARGENTINA SA', NULL, '4773-1131', '30500529454', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500529454'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROQUE COLOSIMO E HIJO SRL', NULL, '4362-1459', '30500651985', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500651985'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TERRABUSI S.A.I.C.', NULL, NULL, '30500686304', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500686304'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUCESORES DE JOSE SALGADO SA', NULL, NULL, '30500727639', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500727639'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMANO MADERERA SA', NULL, '0', '30500758305', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30500758305'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ACINDAR IND. ARG. DE ACEROS S.A.', NULL, '4719-8500', '30501199253', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30501199253'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BONAFIDE SAIyC', NULL, '4738-7000', '30501214589', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30501214589'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BARUGEL AZULAY & CIA. S.A.I.C.', NULL, '4704-1500', '30501345195', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30501345195'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VALENTIN BIANCHI S.A.C.I.F.', NULL, '54-02627-422046', '30501678321', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30501678321'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INSTITUTO DEL CEMENTO PORTLAND ARGENTINO', NULL, NULL, '30501759127', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30501759127'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSE J CHEDIACK SAICA', NULL, NULL, '30502256005', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30502256005'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INDUSTRIAS BACO SAIC', NULL, NULL, '30503069365', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30503069365'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SIEMENS S.A.', NULL, '768-3192  768-3388', '30503364898', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30503364898'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GALLO Y MANCA SRL', NULL, NULL, '30503852213', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30503852213'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BERTINI REVESTIMIENTOS SRL', NULL, '4923-0376/922-4233', '30504982285', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30504982285'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ENVASES NORTE SRL.', NULL, '4717-0472', '30505341429', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30505341429'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IBERIA LINEAS ARGETINAS S.A.', NULL, '4131-1000', '30506792548', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30506792548'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TURISUR SRL', NULL, NULL, '30506949471', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30506949471'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OESTETOUR S.R.L.', NULL, '322-2022  322-1952', '30515516944', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30515516944'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VINOTECA FRAPPE - ALUF', NULL, NULL, '30515974748', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30515974748'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TALLERES JUJUY SACI', NULL, NULL, '30516283781', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30516283781'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELEPRINT SA', NULL, NULL, '30516645543', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30516645543'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASA MILLER S.R.L', NULL, NULL, '30516869107', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30516869107'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOCIACION AMIGOS DEL MUSEO NACIONAL DE BELLAS ARTES', NULL, '48034062', '30517089849', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30517089849'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HOTELES SHERATON DE ARGENTINA S.A.C.', NULL, '4318-9000', '30517175621', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30517175621'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARITAS ARGENTINA COMISION NACIONAL', NULL, NULL, '30517312904', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30517312904'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OCEANTUR SA', NULL, NULL, '30517527765', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30517527765'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ENRIQUE BERDASCO Y CIA SRL', NULL, NULL, '30517613165', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30517613165'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PINTURERIA SZUMIK SA', NULL, NULL, '30517676590', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30517676590'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLAMINGO S.A', NULL, '0', '30517949503', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30517949503'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HOTEL SAN MARTIN SRL', NULL, NULL, '30518136662', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30518136662'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IRUÑA SCA', NULL, NULL, '30518171565', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30518171565'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PERFIMET COMERCIAL E INDUSTRIAL S.R.L.', NULL, '923-7287 - 922-9120', '30519492136', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30519492136'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BIZZOTO E HIJOS SRL', NULL, '0383-4430123', '30519536435', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30519536435'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALLTRON SA.', NULL, NULL, '30519769278', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30519769278'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TALLERES GRAFICOS UNIVERSAL SRL', NULL, '4582-0396', '30520075921', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30520075921'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NICO PUBLICIDAD', NULL, '552-6152/6422', '30520772231', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30520772231'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TTS VIAJES SA', NULL, NULL, '30521151818', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30521151818'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANSELMI IND. PUBLICITARIA', NULL, '4855-4683', '30521169555', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30521169555'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMOBLAMIENTOS LEM SRL', NULL, NULL, '30521261095', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30521261095'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOC DE EMPRESARIOS DE LA VIVIENDA Y DESARROLLOS INMOBILIARIOS', NULL, NULL, '30522447990', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30522447990'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA EUROPEA - MURESCO S.A.', NULL, '814-0123/815-1429', '30522520086', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30522520086'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TRONADOR S.A.C', NULL, NULL, '30522581506', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30522581506'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIIC FEDERACION INTERAMERICANA', 'alberto.abila@fiic.lac', '424.74.57-42474.58', '30525441969', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30525441969'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLUB AMERICANO DE BUENOS AIRES', NULL, NULL, '30525521083', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30525521083'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Antonio Luquin', NULL, NULL, '30525558246', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30525558246'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IRAM', NULL, '4346-0600', '30525562782', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30525562782'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CENTRO ARGENTINO DE INGENIEROS', NULL, '4811-0570/4133', '30525649381', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30525649381'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOCIACIÓN MUTUAL ISRAELITA ARGENTINA', NULL, '4700', '30525661187', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30525661187'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOCIEDAD CENTRAL DE ARQUITECTOS', NULL, NULL, '30525709511', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30525709511'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FONDO COOPERADOR S.A.I.J.', NULL, '4331-8008/9/6134', '30525755742', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30525755742'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INSTITUTO ARG.SEGURIDAD', NULL, '372-0042', '30525842203', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30525842203'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAR DEL PLATA GOLF CLUB', NULL, NULL, '30525978938', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30525978938'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DELOITTE & CO. S.R.L.', NULL, NULL, '30526124916', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30526124916'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FRAVEGA SACI', NULL, NULL, '30526874249', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30526874249'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALVEAR PALACE HOTEL SA', NULL, NULL, '30527225988', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30527225988'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DELEGACION DE ASOC ISRAELITAS ARGENTINAS', NULL, NULL, '30527487656', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30527487656'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNION INDUSTRIAL ARGENTINA', NULL, NULL, '30527508548', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30527508548'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DARLING TENNIS CLUB', NULL, '15-4414-4418', '30528052645', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30528052645'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA CASA DEL CELULOIDE SRL', NULL, '0', '30528587700', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30528587700'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EMBOTELLADORA DEL ATLANTICO S.A.', NULL, '0351-4968888/26', '30529135943', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30529135943'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARVAL Y O`FARREL', NULL, NULL, '30529278566', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30529278566'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUNHAUT S.A.', NULL, NULL, '30530173700', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30530173700'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIORDS AGUA POTABLE', NULL, '555-5181', '30531397408', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30531397408'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAMARA DE INDUSTRIA Y COMERCIO ARGENTINO - ALEMANA', NULL, '5219-4000', '30531634558', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30531634558'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BAZAR AVENIDA SA', NULL, NULL, '30532847547', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30532847547'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOCIACION ARGENTINA DE CARRETERAS', NULL, '4362-0898', '30533688051', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30533688051'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MIGUEL SCHEIMBERG SACIFI', NULL, NULL, '30536244596', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30536244596'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDALEU FUNDACION PARA COMBATIR LA LEUCEMIA', NULL, NULL, '30536333416', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30536333416'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEON SARFATI SA', NULL, '4334-4360', '30537040587', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30537040587'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COMERCIAL FEYRO SA', NULL, NULL, '30537208291', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30537208291'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOITEGUI SA', NULL, NULL, '30537458263', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30537458263'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CABRALES S.A.', NULL, NULL, '30537745742', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30537745742'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INSTITUTO PARA EL DESARROLLO EMPRESARIAL DE LA ARG', NULL, NULL, '30537908196', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30537908196'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DARSIE Y CIA SACI', NULL, NULL, '30537926240', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30537926240'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HIJOS DE GARBER SRL', NULL, '4855-5731/0259', '30538057068', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30538057068'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AREAN S.A', NULL, NULL, '30538271310', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30538271310'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION CULTURAL ARGENTINA', NULL, NULL, '30538605545', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30538605545'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CALIFORNIA SA', NULL, NULL, '30539523410', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30539523410'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SAN JUAN BURSATIL S.A.', NULL, NULL, '30539556785', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30539556785'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEMACO SAC', NULL, '}', '30539599220', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30539599220'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'U.A.P.E.', NULL, '4381-2586', '30539732923', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30539732923'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARIZMENDI S.A.', NULL, '811-0025  811-0030', '30540036736', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30540036736'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DUN & BRADSTREET S.A.', NULL, '318-3100', '30540041403', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30540041403'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GARBARINO S.A.I.C.E.I.', NULL, NULL, '30540088213', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30540088213'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIEL  (FUND. INV. ECONOM. LATIN.)', NULL, '314-1990', '30540103301', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30540103301'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELECTRO TUCUMAN S.A.', NULL, NULL, '30540284659', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30540284659'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASA EL TUCUMANO SA', NULL, '4382-1964', '30540920822', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30540920822'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'XEROX ARGENTINA I.C.S.A.', NULL, '703-7700/01', '30541682372', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30541682372'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INSTITUTO TECNOLOGICO DE BUENOS AIRES', NULL, '4314-7778', '30541689474', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30541689474'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DINO CONTE SA', NULL, NULL, '30543264535', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30543264535'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELECTRONICA MEGATONE S.A', NULL, NULL, '30543659734', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30543659734'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INGENIERIA Y ASISTENCIA TECNICA ARGENTINA SA', NULL, NULL, '30543791500', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30543791500'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BOLSA DE COMERCIO DE CORDOBA', NULL, NULL, '30545189719', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30545189719'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALPI ASOCIACION CIVIL', NULL, NULL, '30546089777', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30546089777'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZENIT TRANSPORTE SRL', NULL, NULL, '30546401517', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30546401517'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNIVERSIDAD DE BUENOS AIRES - FACULTAD DE INGENIERIA', NULL, NULL, '30546666561', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30546666561'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNIVERSIDAD NACIONAL DE LA PLATA', NULL, NULL, '30546666707', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30546666707'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNIVERSIDAD NACIONAL DE CORDOBA', NULL, NULL, '30546670623', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30546670623'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FACULTAD REGIONAL DE BUENOS AIRES', NULL, NULL, '30546671166', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30546671166'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Organización de Servicios Directos (OSDE)', NULL, '4348-5000', '30546741253', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30546741253'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OBRA SOCIAL DEL PERSONAL DIRECTIVO DE LA INDUSTRIA DE LA CONSTRUCCION', NULL, '4829-9180', '30546777282', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30546777282'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUNCADELLA S.A.', NULL, '4585-8391/2/3/4/5', '30546969874', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30546969874'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SHERATON LIBERTADOR HOTEL', NULL, '4322-8800/6622', '30548944046', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30548944046'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OMINT SOCIEDAD ANONIMA DE SERVICIOS', NULL, NULL, '30550245309', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30550245309'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRANRIO SA', NULL, NULL, '30552558754', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30552558754'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INSTALACIONES COMERCIALES TISERA S.A.', NULL, NULL, '30554807301', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30554807301'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSORCIO PROPIETARIOS PASEO COLON 823', NULL, 'INT.223', '30555390293', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30555390293'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOCIACION DIRIGENTES DE EMPRESA', NULL, NULL, '30555789692', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30555789692'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAMARA DE LA VIVIENDA Y EQUIPAMIENTO URBANO DE LA REPUBLICA ARGENTINA', NULL, NULL, '30556828608', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30556828608'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IMPRESORA CHUBUTENSE S.A', NULL, NULL, '30557342199', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30557342199'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BACIGALUPPI HNOS S.A.', NULL, NULL, '30557990980', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30557990980'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNION DOCENTES ARGENTINOS', NULL, '4700', '30559074558', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30559074558'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COMISION PERMANENTE DEL ASFALTO (P)', NULL, '331-4921', '30560752543', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30560752543'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COMUNICACIONES VISUALES', NULL, '811-0505', '30564188421', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30564188421'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EXPRESO LUJAN CUYO S.A.', NULL, NULL, '30566258869', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30566258869'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION MEDITERRANEA', NULL, '0351 4630000', '30566584200', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30566584200'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA CASA DE LAS CAJAS SA', NULL, '49538181', '30568451100', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30568451100'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CATAMARCA VIDRIO S.C.', NULL, NULL, '30570940925', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30570940925'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CABLEVISION SA', NULL, NULL, '30573652084', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30573652084'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AADI CAPIF', NULL, NULL, '30574449967', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30574449967'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLUB NEWMAN', NULL, '4700', '30575852420', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30575852420'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BLACK, CARBAJAL Y CIA S.A.', NULL, NULL, '30576250769', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30576250769'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARPAS D''ANGIOLA', NULL, '4240-8811', '30576344321', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30576344321'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESCUELA SUPERIOR DE ECONOMIA Y ADMINISTRACION DE EMPREAS', NULL, '47735825', '30576354734', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30576354734'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSEJO ARGENTINO PARA LAS RELACIONES INTERNACIONALES', NULL, NULL, '30576639445', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30576639445'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MABA PUBLICITARIA Y SELECTORA  SA', NULL, NULL, '30576846807', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30576846807'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PINTURERIAS PRESTIGIO S.A.', NULL, '4381-0674', '30577428618', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30577428618'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIARIO AMBITO FINANCIERO-ED.AMFIN S.A.', NULL, '4349-1500', '30577801114', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30577801114'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MANPOWER - COTECSUD S.A.S.E.', NULL, '5550-6698', '30577873654', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30577873654'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAPA LINEAS AEREAS PRIV. ARG.', NULL, '812-0953  812-2108', '30577922620', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30577922620'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EXO S.A.', NULL, '4021 5430/4021 5427', '30579607552', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30579607552'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION DEL SUR PARA EL DESARROLLO TECNOLÓGICO', NULL, NULL, '30580003970', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30580003970'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SARSY S.A. CONSULTORES', NULL, '4521-9090', '30580166861', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30580166861'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DI SUR S.R.L.', NULL, '924-2755  924-2756', '30581592597', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30581592597'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOCIACION DE DESARROLLO Y CAPACITACION DE LA ARGENTINA', NULL, NULL, '30582059833', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30582059833'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ERREPAR', NULL, '4370-2002', '30582622945', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30582622945'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INFOREXCO S.A.', NULL, '383-5399/9964', '30585117095', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30585117095'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BRANCAL SA', NULL, NULL, '30586483737', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30586483737'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNIVERSIDAD NACIONAL DE LA PATAGONIA SAN JUAN BOSCO', NULL, '02965-428402', '30586761583', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30586761583'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PANATEL S.A.', NULL, '4348-5000', '30587197215', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30587197215'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARIZMENDI COMPUTOS SA', NULL, '52357000', '30588311844', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30588311844'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIDITEC S.A.', NULL, '4308-4884', '30590151013', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30590151013'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CENCOSUD S.A.', NULL, NULL, '30590360763', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30590360763'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ED GAR S.A', NULL, NULL, '30592097482', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30592097482'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CETROGAR S.A.', NULL, NULL, '30592845748', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30592845748'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA PRENSA - EDITORIAL LA CAPITAL S.A.', NULL, '478-8490', '30593143216', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30593143216'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALBERTO RAMOS & ASOCIADOS SA', NULL, '42041001', '30593286521', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30593286521'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HORMI-BLOCK S.A.', NULL, NULL, '30594333108', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30594333108'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEDERAL EXPRESS CORP.', NULL, NULL, '30594494187', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30594494187'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOCIACION CIVIL DE ESTUDIOS SUPERIORES', NULL, '(02322)481000', '30594950913', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30594950913'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BOSTON FILM SA', NULL, '0342-4531360', '30596043212', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30596043212'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTUDIOS DE GRABACION CAB SRL', NULL, NULL, '30596318688', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30596318688'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNESCO VILLA OCAMPO', NULL, NULL, '30596425654', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30596425654'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Hotel del Sol SRL', NULL, '0', '30597236006', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30597236006'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERRERO Y MATTIO S.R.L.', 'contaduria@camarco.org.ar', NULL, '30598272588', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30598272588'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TRANSMAR TRAVEL S.C. DE E.D.C. Y CIA.', NULL, '4322-2015', '30600229210', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30600229210'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DEXEL S.R.L.', NULL, NULL, '30601770039', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30601770039'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INGEMATICA S.A.', NULL, '4314-1500', '30601820923', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30601820923'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TECNIC LIMP S.A.', NULL, NULL, '30602143194', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30602143194'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'POLIETILENOS ASAMBLEA S.A.', NULL, NULL, '30602671530', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30602671530'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLACSO ARGENTINA (Posgrado)', NULL, NULL, '30602675730', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30602675730'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VALOT', NULL, '381-3095  381-3099', '30603808238', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30603808238'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JUAN ARMANDO CASTELLI', NULL, '15-4414-4418', '30604467256', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30604467256'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOCIACION DE INGENIEROS ESTRUCTURALES', NULL, NULL, '30605000963', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30605000963'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'A.A.H.P.I.', NULL, '4576-7194/95', '30605030021', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30605030021'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EMPRESA CIUDAD DE GUALEGUAYCHU SRL', NULL, NULL, '30605970725', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30605970725'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AUTOSERVICIO  MAYORISTA DIARCO S.A.', NULL, NULL, '30607371799', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30607371799'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TRANSATLANTICA SA', NULL, NULL, '30610060672', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30610060672'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INTERNATIONAL HEALTH SERVICES ARGENTINA SA', NULL, '4323-0310', '30610298601', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30610298601'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'S.O.S. EMERGENCIAS MEDICAS', NULL, '331-5376  331-6616', '30610458463', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30610458463'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COPILEIDY S.R.L.', NULL, '4315-2699', '30610614953', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30610614953'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PREFEMAR S.A.', NULL, '4552-0532', '30611870031', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30611870031'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARBONATTO IMPRESIONES', NULL, '4208-8454/4228-5136', '30611959091', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30611959091'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDICIONES MANANTIAL SRL', NULL, '383-7350', '30612052111', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30612052111'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOLUCIONES INFORMATICAS ARGENTINAS S.A.', NULL, NULL, '30612201710', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30612201710'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EQUAPHON SISTEMAS DE SONIDO S R L', NULL, NULL, '30612212801', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30612212801'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDITORIAL LA PAGINA S.A.-PAGINA 12', NULL, '6772-4400', '30612700776', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30612700776'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIEJO AGUARIBAY S.A', NULL, '0', '30613918716', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30613918716'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EPSON ARGENTINA S.R.L.', NULL, '5167-0300', '30614104712', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30614104712'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BORA PRODUCCIONES', NULL, '4773-8594/4782-6793', '30614522808', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30614522808'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KPMG', NULL, NULL, '30614587144', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30614587144'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARANDU SRL', NULL, NULL, '30615174552', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30615174552'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COMERCIAL SUMA SRL', NULL, '0351-4260623/626/627', '30615419938', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30615419938'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EQUIPO MEDICO DE EMERGENCIAS CORRIENTES SA', NULL, NULL, '30615481617', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30615481617'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EMERGENCIA MEDICA INTEGRAL S A', 'emi@emi.com.ar', '0351-4149000/9014', '30615567155', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30615567155'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CIRCE', NULL, '4342-4504', '30615678496', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30615678496'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TURISMO VITTORIO SRL', NULL, '4204000', '30616323438', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30616323438'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRAFICA VALERO', NULL, '4302-8000', '30617438492', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30617438492'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JONIA S.A.C.I.eI.', NULL, '343-8405', '30617830899', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30617830899'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INTERIORES ALICIA HELU', NULL, NULL, '30618464497', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30618464497'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROBERTO GUREVICH S.R.L.', NULL, '961-6882  962-5600', '30618488108', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30618488108'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUFFA SISTEMAS SRL', NULL, '52734400', '30618539225', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30618539225'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELECTRO JUNIN SRL', NULL, '03794429043', '30618834375', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30618834375'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FERROCRUZ', NULL, NULL, '30621554472', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30621554472'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HCA S.A.', NULL, '4700', '30621630225', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30621630225'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION MUSEO DEL AUTOMOVILISMO JUAN MANUEL FANGIO', NULL, NULL, '30624416127', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30624416127'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MOVICOM S.A.', NULL, '325-5220', '30624418650', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30624418650'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RED HOTELERA IBEROAMERICANA SA', NULL, NULL, '30626538971', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30626538971'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INSTRUMENTAL PASTEUR SRL', NULL, NULL, '30626629942', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30626629942'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IMPSAT S.A.', NULL, NULL, '30626747171', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30626747171'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BDFM SA', NULL, NULL, '30626824605', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30626824605'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUPERMERCADOS MAYORISTAS YAGUAR SOCIEDAD ANONIMA', NULL, '0', '30629642672', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30629642672'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TELLEX S.A.', NULL, '4854-2550', '30630402073', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30630402073'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LADRILLOS MERLINO SRL', NULL, NULL, '30630507347', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30630507347'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIRECTORY-COMUNIC. EMPRESARIAS S.A.', NULL, '381-7023  381-5357', '30631021839', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30631021839'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CENTRO DE COPIADO LA COPIA SRL', NULL, NULL, '30631500451', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30631500451'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION AMALIA LACROZE DE FORTABAT', NULL, NULL, '30631617049', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30631617049'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AXOFT ARGENTINA SA', NULL, '50318264', '30631658810', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30631658810'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA AGENCIA PUBLICIDAD S.A.', NULL, '}', '30631818818', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30631818818'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TP/MA CONSULTING SERVICES S.A.', NULL, '328-8954/9216/6475/7907', '30633635680', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30633635680'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERVICIOS PUBLICITARIOS DE NUDELMAN JULIO', NULL, '4863-6953', '30633644175', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30633644175'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION UNIVERSIDAD NACIONAL DE SAN JUAN', NULL, NULL, '30635552774', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30635552774'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ACRILICOS LASER S.A.', NULL, '4342-3127/4331-3443', '30635773746', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30635773746'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INDUSTRIAS MAYA SRL', NULL, NULL, '30636097523', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30636097523'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DAST INFORMATICA S.R.L.', NULL, '4371-32780', '30636168536', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30636168536'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUMITRONICS SA.', NULL, NULL, '30636552743', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30636552743'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ACADEMIA NACIONAL DE INGENIERIA', NULL, '48071137', '30636991712', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30636991712'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUENOS AIRES GOLF CLUB ASOCIACION CIVIL', NULL, NULL, '30637689297', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30637689297'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RENT A TOOL', NULL, '4795-5222', '30637828483', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30637828483'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTINDALE NORTE CC S.A.', NULL, NULL, '30638124730', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30638124730'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'STRAT S.A.', NULL, '4815-9652', '30639058502', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30639058502'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REPERTORIO ALADI S.R.L.', NULL, '958-3437  981-1767', '30639398001', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30639398001'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TELECOM ARGENTINA SA (DA)', NULL, NULL, '30639453738', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30639453738'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DVD ADVANCE MANAGEMENT SYSTEMS', NULL, '4771-9833/4777-3280', '30639963337', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30639963337'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'STARTEL S.A.', NULL, '318-6000  312-4827', '30640020551', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30640020551'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARONA SA', NULL, NULL, '30640605363', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30640605363'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSULTORIO MEDICOS LABORALES', NULL, '861-6458  864-1216', '30640645144', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30640645144'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MURATA S.A.', NULL, NULL, '30641063378', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30641063378'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA NUEVA S.A.', NULL, NULL, '30641500131', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30641500131'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DECIBEL SUDAMERICANA SA', NULL, NULL, '30641672064', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30641672064'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SISERPEM S.A.', NULL, NULL, '30641784601', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30641784601'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RADIODIFUSORA DEL CENTRO S.A.', NULL, NULL, '30642010944', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30642010944'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNION INDUSTRIAL DE LA PAMPA', NULL, NULL, '30642164720', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30642164720'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION PODER CIUDADANO', NULL, NULL, '30642739812', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30642739812'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CHOCOLATE COLONIAL S.A.', NULL, '4641-1703', '30642796204', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30642796204'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NYSNET', NULL, '4234555', '30642813206', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30642813206'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KIT PRODUCCION Y DIS. S.A.', NULL, '4862-7485/4865', '30643208853', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30643208853'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AEROLINEAS ARGENTINAS', NULL, '315-1000', '30643541323', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30643541323'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIA BARILOCHE SA', NULL, NULL, '30643922157', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30643922157'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UBATEC SA', NULL, NULL, '30644259486', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30644259486'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASINO CLUB SOCIEDAD ANONIMA', NULL, NULL, '30644286025', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30644286025'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EPOCA', NULL, '4372-6595', '30644464179', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30644464179'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNIVERSIDAD NACIONAL DE LA MATANZA', NULL, NULL, '30646228685', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30646228685'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BONINA SRL', NULL, '4672-3434', '30646254929', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30646254929'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARTESA TOURS SRL', NULL, NULL, '30646396790', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30646396790'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MUSEO DE ARTE DECORATIVO', NULL, NULL, '30646475135', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30646475135'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACIÓN TZEDAKÁ', 'vanina@tzedaka.org.ar', NULL, '30646663691', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30646663691'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRODEN SA', NULL, NULL, '30646712285', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30646712285'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOFTLAND ARGENTINA SA', NULL, '4701-3800 o 4703-7600', '30646941136', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30646941136'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FINNING ARGENTINA SA', NULL, NULL, '30647227119', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30647227119'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALVIMER SA.', NULL, '4958-3636', '30647346959', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30647346959'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FULLCOP S.A.', NULL, NULL, '30647481481', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30647481481'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDIFICOR SRL', NULL, NULL, '30647551641', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30647551641'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LANWARE S.R.L.', NULL, '4896-1100', '30648547931', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30648547931'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ATECOR', NULL, '0351 4684006', '30649619383', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30649619383'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEPRIT S.A.', NULL, '583-2882  584-3045', '30649861648', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30649861648'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOCIACION ARGENTINA DE INGENIERIA SANITARIA Y CIENCIAS DEL AMBIENTE', NULL, NULL, '30650163091', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30650163091'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSEJO INTERAMERICANO DE COMERCIO Y PRODUCCION (P)', NULL, NULL, '30650421198', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30650421198'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PECTAGAR SRL', NULL, NULL, '30650600238', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30650600238'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INDEC INSTITUTO NACIONAL DE ESTADISTICAS', NULL, NULL, '30650669777', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30650669777'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BONAPARTE 48 S.A.', NULL, '4334-7675/7676 4343-2272', '30651116844', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30651116844'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NETCO S.A.', NULL, '381-4002', '30651505484', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30651505484'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NATIONAL SERVICE ARGENTINA S.A.', NULL, NULL, '30652010489', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30652010489'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION DE LA UNIVERSIDAD NACIONAL DE ROSARIO', NULL, NULL, '30652190053', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30652190053'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PERSUACION S.A.', NULL, '4807-3300', '30652258510', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30652258510'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'P.G.I.S.A.', NULL, '4321-7500', '30653291953', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30653291953'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOCIACION ARGENTINA DE ESTUDIO E INVESTIG. EN PSICODIAGNOSTICO', 'adeip@arnet.com.ar', NULL, '30653373747', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30653373747'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA RAZON S.A.', NULL, '4309-6000', '30654261314', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30654261314'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSTRUCTORA SAN NICOLAS SRL', NULL, NULL, '30654560281', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30654560281'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CON AID ARGENTINA  S.A.', NULL, NULL, '30654585748', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30654585748'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DISTRIBUIDORA PRAL SOCIEDAD ANONIMA', NULL, '0343 4233806', '30654671830', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30654671830'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'QUALITAS', NULL, '3272786', '30654855168', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30654855168'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BANK S.A.', NULL, '4762-4110', '30654929692', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30654929692'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION SILATAJ', NULL, NULL, '30655115761', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30655115761'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BOSAN SA', NULL, NULL, '30655186693', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30655186693'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HIPODROMO ARGENTINO DE PALERMO SA', NULL, NULL, '30655300186', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30655300186'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TREE CAPACITACION INFORMATICA SRL', NULL, NULL, '30655530882', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30655530882'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'C & S S.R.L.', NULL, '4957-1625', '30655584583', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30655584583'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TAC S.A.', NULL, NULL, '30655688796', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30655688796'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FALABELLA SA', NULL, NULL, '30655725829', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30655725829'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ADECCO ARGENTINA SA', NULL, '4131-9900', '30656760172', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30656760172'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AIR INTERNATIONAL S.A.', NULL, NULL, '30657352396', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30657352396'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MADERERA LLAVALLOL SA', 'ventas@maderera.com.ar', '4298-1669', '30657715383', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30657715383'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'METROGAS S.A. (DA)', NULL, '309-1000', '30657863676', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30657863676'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CALLE LAS HERAS SRL', NULL, NULL, '30657977434', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30657977434'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION APERTURA', NULL, NULL, '30658305901', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30658305901'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOLUCIONES GRAFICAS SRL', NULL, '0351-4240611', '30658342718', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30658342718'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALBERGUS S.A.', NULL, NULL, '30658446300', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30658446300'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NORDELTA S.A.', NULL, NULL, '30658660892', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30658660892'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FOSDIC', NULL, NULL, '30658711845', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30658711845'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DINAR LINEAS AEREAS S.A.', NULL, NULL, '30659024779', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30659024779'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AYSA', NULL, '303-4000  375-3280', '30659563750', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30659563750'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSULTORES DEL PLATA SA', NULL, NULL, '30659697951', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30659697951'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COR LOVE SRL', NULL, NULL, '30659813285', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30659813285'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OFIR TECNOLOGIA GRAFICA SRL', NULL, NULL, '30660948054', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30660948054'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIDRIO SRL', NULL, '4682-4373/1963', '30661293981', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30661293981'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MICROSYSTEM ARGENTINA S.A.', NULL, '4306-0011', '30661490620', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30661490620'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERVICIOS SAN TELMO', NULL, NULL, '30661519467', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30661519467'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MICROGLOBAL ARGENTINA SA', NULL, NULL, '30661535225', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30661535225'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION UOCRA', NULL, NULL, '30661556893', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30661556893'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NOVADATA S.A.', NULL, NULL, '30661797130', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30661797130'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASAP - ASOC.ARG.DE PTO. Y ADM.FCIERA PUB', NULL, '4383-7061/9759/4382-6901', '30661893946', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30661893946'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION CENTRO DE ESTUDIOS AMERICANOS', NULL, '0', '30661996540', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30661996540'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OPTAR S.A.', NULL, NULL, '30662109602', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30662109602'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SARRO HNOS SA', NULL, NULL, '30662234342', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30662234342'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLIMATIZAR S A', NULL, NULL, '30663167819', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30663167819'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSEJO FEDERAL DE ENTIDADES DE SERVICIOS SANITARIOS', NULL, NULL, '30663168041', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30663168041'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INNOVAT', NULL, NULL, '30663170364', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30663170364'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEN TECH S.A.', NULL, '4792-7800', '30663460745', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30663460745'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MACAIR JET S.A.', NULL, '4319-8600', '30663512850', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30663512850'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLAMOR DIST.', NULL, '242-5401/202-9869', '30663598690', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30663598690'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TURISMO EL PUENTE S.A.', NULL, NULL, '30663622419', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30663622419'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REX AGENCIA DE PUBLICIDAD SRL', NULL, NULL, '30664156489', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30664156489'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CABAÑA PIEDRAS BLANCAS SRL', 'info@piedrasblancas.com.ar', NULL, '30665133970', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30665133970'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAYOFER SRL', NULL, NULL, '30667242726', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30667242726'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NIVEL S.A.', NULL, NULL, '30668080266', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30668080266'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'QUINTO CENTENARIO SA', NULL, '03515269000', '30668432782', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30668432782'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LX ARGENTINA S.A.', NULL, NULL, '30669701639', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30669701639'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROCA SRL', NULL, NULL, '30671842754', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30671842754'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AUDIO VIDEO SYSTEM SRL', NULL, NULL, '30671905403', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30671905403'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'POSADAS PINTURAS SRL', NULL, NULL, '30672396618', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30672396618'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MICRO ALL SRL', NULL, '02994471320', '30672714326', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30672714326'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EL PATACON RESTAURANTE ARGENTINO', NULL, NULL, '30672990323', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30672990323'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIGA SALTENA DE FUTBOL', NULL, NULL, '30673097339', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30673097339'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA VELOZ HOTELES SA', NULL, '3874000000', '30673132622', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30673132622'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MONEY TUR SRL', NULL, NULL, '30673246938', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30673246938'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'J. HERMIDA E HIJOS S.R.L.', NULL, NULL, '30675984057', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30675984057'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ILUMINEXPO SRL', NULL, NULL, '30676012040', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30676012040'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OPTIONS DESIGN S.A.', NULL, '5199-2876 / 0707', '30676564191', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30676564191'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ORLANDO J FERRERES Y ASOCIADOS SA', NULL, NULL, '30676601089', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30676601089'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JORGE GUSTAVO VENTURA Y JOSE FERNANDO VENTURA', NULL, NULL, '30676978123', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30676978123'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DPA CONSULTORES SA', NULL, '4812-8570', '30677268022', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30677268022'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IMPRENTA DORREGO SRL', NULL, '+', '30677706569', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30677706569'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BURSON-MARSTELLER S.A.', NULL, NULL, '30677750029', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30677750029'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION PASTORAL UNIVERSITARIA SAN LUCAS', NULL, NULL, '30677787976', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30677787976'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERVICE NET SA.', NULL, '4323-3333 INT.341', '30677909621', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30677909621'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CENTRO MEDICO ESMERALDA', NULL, '313-6769  313-8197', '30677913548', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30677913548'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION DE LA FACULTAD DE INGENIERIA', NULL, NULL, '30677980032', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30677980032'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WAL- MART ARGENTINA SOCIEDAD DE RESPONSABILIDAD LIMITADA', NULL, NULL, '30678138300', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30678138300'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAMARA ARGENTINA DE CONSULTORAS DE INGENIERIA', NULL, NULL, '30678141549', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30678141549'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONGRESS RENTAL SA.', NULL, NULL, '30678216379', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30678216379'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TELEFONICA UNIFON', NULL, NULL, '30678814357', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30678814357'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LATIN GRAFICA SRL (P)', NULL, NULL, '30679107220', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30679107220'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEADER ELECTRONIC SA', NULL, NULL, '30679202045', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30679202045'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COMITE ARGENTINO DE PRESAS', NULL, '43079810', '30679500542', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30679500542'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CALL CORPORATION SRL', NULL, '47010493', '30679653578', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30679653578'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'STRADIVARIUS S.A.', NULL, '322-3313  326-3665', '30679849812', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30679849812'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COPY JET DE ANDRADE Y BIAFORE', NULL, NULL, '30679907995', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30679907995'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SONY ARGETNINA SA', NULL, '48965200', '30679928879', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30679928879'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARCO MARCCUCHI  Y SUSANA VIVIAN SH', NULL, NULL, '30680287615', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30680287615'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IGLESIAS LAZARO Y ASOC.', NULL, '292-3888 / 245-0274', '30680380143', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30680380143'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIBRERIA SIGLO VEINTIUNO', NULL, '4361-5952', '30680632584', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30680632584'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION UNIVERSIDAD EMPRESARIAL SIGLO 21 CORDOBA', NULL, '0358-465-3437', '30680950047', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30680950047'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONFISER SA', NULL, NULL, '30681341567', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30681341567'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HENRY MARTIN, LISDERO Y ASOCIADOS', NULL, '4875-4875', '30681488525', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30681488525'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANNIE MILLET TRANSFERS S.A.', NULL, NULL, '30681524351', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30681524351'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SICOAR S.R.L.', NULL, '825-7410', '30681529922', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30681529922'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEMISA SRL', NULL, NULL, '30681695121', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30681695121'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PROFUTURO', NULL, '4325-2255/2299', '30682088318', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30682088318'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION AMIGOS DEL TEATRO SAN MARTIN', NULL, '4374-9661', '30682380566', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30682380566'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TRANSPORTES DEL PLATA SRL', NULL, NULL, '30682468773', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30682468773'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MACH ELECTRONICS SA', NULL, '08102226224', '30682580891', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30682580891'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEMINARIO Y ASOCIADOS S.A.', NULL, '315-5225', '30682665587', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30682665587'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNIVERSIDAS NACIONAL DE LANUS', NULL, NULL, '30682873864', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30682873864'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA MARCHI SRL', NULL, NULL, '30684174440', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30684174440'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ENTRECOMILLAS IMPRESORES', NULL, '0221-425-8497', '30684856053', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30684856053'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERH SA', NULL, '4322 1854', '30685171372', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30685171372'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DAGNINO PASTORE,COSTA Y ASOC. S.A.', NULL, '4812-8570', '30685189492', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30685189492'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VEIBA PRODUCCIONES SA', NULL, NULL, '30685193244', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30685193244'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EXPOLAJAS CORDOBA SRL', NULL, NULL, '30685367471', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30685367471'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HAUSE MOBEL', NULL, NULL, '30685409794', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30685409794'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMERIAN HOTEL GALA SA', NULL, NULL, '30686067412', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30686067412'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CIDI COM S.A', NULL, NULL, '30686273578', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30686273578'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WINNER PRODUCCIONES', NULL, '4383-0534  4382-4183/3963', '30686293773', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30686293773'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARSEC S.A.', NULL, '4361-1480/4307-7700/1970', '30686348233', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30686348233'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDICION LIMITADA S.R.L.', NULL, '374-9733', '30686867257', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30686867257'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIA NET.WORKS ARGENTINA S.A.', NULL, NULL, '30687145387', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30687145387'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PARAMEDIC', NULL, '4375-1873', '30687185613', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30687185613'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TEMAS GRUPO EDITORAL SRL', NULL, NULL, '30687279588', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30687279588'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PROYECCIONES DIGITALES S.A.', NULL, NULL, '30687289753', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30687289753'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JEBSEN S.A.', NULL, '4315-9304', '30687294420', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30687294420'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INC SA', NULL, NULL, '30687310434', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30687310434'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EL CHUCUPAL SRL', NULL, NULL, '30687357244', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30687357244'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NESMAR EMPRESA CONSTRUCTORA SRL', NULL, NULL, '30687385183', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30687385183'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BAIRES FLY SA', NULL, '0', '30687490319', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30687490319'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUENOS AIRES SHOWS LASER SRL', NULL, '4703-4074', '30687519775', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30687519775'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RIO URUGUAR SRL', NULL, NULL, '30687841081', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30687841081'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DANIEL Y FERNANDO MAS', NULL, NULL, '30688093240', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30688093240'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MELQART S.A.', NULL, '4343-2464', '30688941136', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30688941136'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COMERCIAL BARCA S.R.L.', NULL, '343-3464/3557', '30688947487', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30688947487'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEGURIDAD BULLDOG S.R.L.', NULL, '4371-8670', '30688977920', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30688977920'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION INSTITUTO DE DESARROLLO REGIONAL DE ROSARIO', NULL, '0341 4855301', '30689197597', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30689197597'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VALMAR', NULL, '4201-5534', '30689370833', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30689370833'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'R.P.I. -RED PROV. INFORM.', NULL, '542-6270 / 544-6591/6931', '30689672775', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30689672775'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LUIS LOSI SA', NULL, NULL, '30690504797', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30690504797'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CENTROFICINA EQUIPAMIENTO S.A.', NULL, NULL, '30690509292', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30690509292'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MOINE HNOS SA', NULL, NULL, '30690530585', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30690530585'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INTERBANKING S.A.', NULL, NULL, '30690783521', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30690783521'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NUEVA COMUNICACION SA', NULL, NULL, '30690913395', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30690913395'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TELCOMNET S.A.', NULL, '4983-1263', '30690961128', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30690961128'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDICIONES ADUANERAS S.R.L.', NULL, '981-1767  958-3437', '30690972456', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30690972456'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGALTE S.A.', NULL, NULL, '30691012073', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30691012073'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EL PORFIDO S.A.', NULL, NULL, '30691082152', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30691082152'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA RED COMPUTACION SRL', NULL, NULL, '30691144816', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30691144816'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ADVANCE TELECOMUNICACIONES S.A.', NULL, NULL, '30691191652', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30691191652'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PUBLIWAY S.A.', NULL, NULL, '30691206021', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30691206021'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HILTON - SOUTH CONVENTION CENTER S.A.', NULL, '4891-0000', '30692188310', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30692188310'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'B&D SA', NULL, NULL, '30692284670', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30692284670'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LANYARD S.R.L.', NULL, NULL, '30692326136', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30692326136'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MILENIUM SA', NULL, NULL, '30693012941', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30693012941'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EQUIPO ELE S.A.', NULL, NULL, '30693137345', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30693137345'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'M.D. CONS. SA.', NULL, NULL, '30693211049', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30693211049'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PLAZA REAL SA', NULL, NULL, '30693717031', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30693717031'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TRECC S.A.', NULL, '4343-5264/9007', '30693737237', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30693737237'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSTRULUZ SA', NULL, NULL, '30693765176', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30693765176'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PERFIL', NULL, '4341-9000', '30693774809', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30693774809'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEDERACION AGENCIA PARA EL DESARROLLO ECONOMICO DE LA CIUDAD DE CORDOBA', 'info@adec.org.ar', '0351-4341636/37/39', '30694301785', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30694301785'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BLEAR', NULL, NULL, '30694569257', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30694569257'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CEO TRAVEL NET S.A.', NULL, NULL, '30694667739', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30694667739'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SIL SISTEMA DE INFORMES LABORALES', NULL, '02302-42261877-3280', '30694853761', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30694853761'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRAFICA EXPRESS', NULL, '4831-4970 / 15-4194-0587', '30695486061', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30695486061'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SYNC TECHNOLOGIES SRL', NULL, NULL, '30695496237', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30695496237'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BRAINAK SA', NULL, NULL, '30695512240', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30695512240'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DECISIONES SUPPORT S.A.', NULL, NULL, '30695562671', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30695562671'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MEDIA RESEARCH WORKS S.A.', NULL, '4962-2004', '30695602398', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30695602398'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INDUSTRIA GRAFICA SA PARODI', NULL, '4923-3906', '30696104537', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30696104537'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PINTURERIA LIBERATO S.R.L.', NULL, NULL, '30696106068', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30696106068'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GARCIA SANTAS Y ASOCIADOS SRL', NULL, '5272-1000', '30696135513', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30696135513'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CATEYCO SA', NULL, NULL, '30696214197', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30696214197'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CEVEN S.A.', NULL, NULL, '30696692951', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30696692951'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TABACO & FOOD SA', NULL, NULL, '30696716362', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30696716362'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALILEO SRL', NULL, NULL, '30696848412', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30696848412'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CPS COMUNICACIONES SA (DA)', 'INFO@METROTEL.COM.AR', '60911000', '30696850972', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30696850972'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GCM INFORMATICA S.R.L.', NULL, NULL, '30696893892', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30696893892'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'THE JEFFREY GROUP ARGENTINA S.A.', NULL, NULL, '30697304386', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30697304386'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMFORTIS SRL', NULL, NULL, '30697577838', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30697577838'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA MARTINITA SRL', NULL, NULL, '30697581371', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30697581371'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA RURAL SA', NULL, NULL, '30697583048', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30697583048'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COMPAÑIA PULIRE S.A.', NULL, '4776-6999', '30697620245', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30697620245'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Paper U S.R.L.', NULL, NULL, '30697666067', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30697666067'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PLANETA SRL', NULL, NULL, '30697877556', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30697877556'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAYORAL CONSULTORES SA.', NULL, NULL, '30697991898', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30697991898'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SYSTEM ONE S.R.L.', NULL, NULL, '30698299505', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30698299505'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DINOSAURIO S.A.', NULL, NULL, '30698471472', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30698471472'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JCL SA', NULL, '03514995007', '30698911375', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30698911375'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLOFEA SRL', NULL, '4334-0427', '30699027320', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30699027320'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TOQUICHEN SA', NULL, NULL, '30699377232', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30699377232'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DISTRIBUIDORA HERRAFE SA', NULL, NULL, '30699407476', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30699407476'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INVERSIONES MAIPO S.A.', NULL, NULL, '30699533412', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30699533412'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOMALU S.A.', NULL, NULL, '30699649321', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30699649321'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUPERTEC SA', NULL, NULL, '30699657138', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30699657138'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SER MAN SRL', NULL, NULL, '30700040727', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30700040727'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GIJON SA', NULL, NULL, '30700503891', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30700503891'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAZZETTO-LOPEZ-ROD.CORDOBA Y ASOC.', NULL, '4811-1071', '30700523787', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30700523787'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMBA EDITORES SRL.', NULL, '4374-7086/4372-3519', '30700896176', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30700896176'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DE SOUSA Y ASOC.', NULL, NULL, '30700986779', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30700986779'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SIGNCRAFT S.A.', NULL, '4738-1417', '30701299082', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30701299082'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NANCY SOSA PROD. SRL.', NULL, '4384-0846 / 4382-3799', '30701301621', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30701301621'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GESTION TECNOLOGICA SA', NULL, NULL, '30701652521', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30701652521'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASSOLINO Y CIA SRL.', NULL, '4954-2225', '30701794911', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30701794911'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNIPEC S.A.', NULL, NULL, '30701816966', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30701816966'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NARDELLI & ASOCIADOS S.A.', NULL, NULL, '30701965791', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30701965791'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'I.T. COLLEGE S.A.', NULL, NULL, '30701991105', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30701991105'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EMPORIO CARTEL', NULL, '4554-4040', '30702650999', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30702650999'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WINERY - DAYCHE SA', NULL, '4331-3040', '30702659767', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30702659767'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RED COMPUTER S.A.', NULL, '4776-6999', '30703038340', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30703038340'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DORENAVANT S.A.', NULL, NULL, '30703121221', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30703121221'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROVI SA', NULL, NULL, '30704578527', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30704578527'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INTEGRITY SEGUROS ARGENTINA S.A.', NULL, NULL, '30704961983', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30704961983'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUMERAN', NULL, NULL, '30706053812', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30706053812'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EL PORTEÑO APARTMENTS LLC', NULL, NULL, '30707003061', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707003061'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TASSO S.R.L.', NULL, '4771-4580 Pablo 15-3196-3287', '30707009213', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707009213'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TODOVISION SA', NULL, NULL, '30707040900', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707040900'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CADENA DE HOTELES RH SA', NULL, '02965434702/03', '30707057633', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707057633'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MATySER S.A.', NULL, NULL, '30707078797', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707078797'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA CABAÑA DE BUENOS AIRES S.A.', NULL, NULL, '30707148663', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707148663'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARGENMEDIOS S.R.L.', NULL, '4432-2512/0094', '30707158790', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707158790'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLOWER POWER S.A.', NULL, NULL, '30707173544', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707173544'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PANOS S.A.', NULL, NULL, '30707183817', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707183817'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VELOCOM-SILICA NEEETWORKS ARGENTINA SA', NULL, '4316-1441  0810-777-5555', '30707193170', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707193170'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EXECUTIVE DEVELOPMENT INTERNATIONAL S.A.', NULL, NULL, '30707214690', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707214690'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LLAO LLAO RESORTS S.A.', NULL, NULL, '30707243607', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707243607'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PERMASUR S.A.', NULL, NULL, '30707253513', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707253513'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONFEDERACION INTERNACIONAL APOYO FAMILIAR', NULL, NULL, '30707264876', 'C'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707264876'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NEW VISION SRL', NULL, '4342-5905', '30707268766', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707268766'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MULTIFUNCIONAL S.A.', NULL, NULL, '30707269428', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707269428'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EL FONTANERO S.A.', NULL, '4824-8658', '30707272798', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707272798'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SIFEME S.A.', NULL, NULL, '30707289542', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707289542'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CENTRO DE CAPACITACION Y EMPRESA SA', NULL, NULL, '30707291903', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707291903'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EUROBIND S.A.', NULL, '6380-5005', '30707296395', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707296395'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MEDIOS DE COMUNICACION ENTRE RIOS SA', NULL, NULL, '30707299556', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707299556'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VENETA SYSTEM ARGENTINA S.R.L.', NULL, NULL, '30707306684', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707306684'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTUDIO ALEGRIA', NULL, '4811-6060/4812-5500/', '30707313087', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707313087'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CALIFORNIA 2082 S.R.L.', NULL, '4703-4074', '30707323716', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707323716'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DAMEG SRL', NULL, NULL, '30707330658', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707330658'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'E.PEXO', NULL, '4136-3500', '30707391983', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707391983'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLORES SIMO HNOS SA', NULL, NULL, '30707393056', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707393056'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION EDUCANDO', NULL, NULL, '30707420398', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707420398'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOCIACION CIVIL DE INGENIERIA GEOTECNICA', NULL, NULL, '30707422811', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707422811'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARCADIA CONSULTORA', NULL, NULL, '30707423400', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707423400'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MEDRI S.A', NULL, NULL, '30707437851', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707437851'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION MARGARITA BARRIENTOS', NULL, NULL, '30707440062', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707440062'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELSERVER S.R.L. (db)', NULL, '5236-7070', '30707447504', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707447504'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARPATAG SRL', NULL, NULL, '30707450823', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707450823'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TX COM COMUNICACION E INFORMATICA', NULL, '48521300, 4779-2233 / 1003', '30707453156', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707453156'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PUERTO PAJARITO - GALDAR SA', NULL, '4806-3668 / 0247', '30707460829', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707460829'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JHI CONSULTING SA', NULL, '4811-1071', '30707462333', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707462333'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALTOS DE LA VIÑA SRL', NULL, NULL, '30707474951', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707474951'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TECH AS SERVICE SRL', NULL, NULL, '30707491619', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707491619'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESCUELA ESPAÑOLA DE NEGOCIOS', NULL, '4816-8908', '30707493476', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707493476'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AIR TOTAL SRL', NULL, '038344441419', '30707500316', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707500316'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SYSTEMS CONSULTING SRL', NULL, NULL, '30707526544', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707526544'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REBOMAX', NULL, '43826579', '30707543759', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707543759'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TALLER 4 SA', 'central@taller4.com', '4343-0343', '30707577874', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707577874'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION METROPOLITANA', NULL, NULL, '30707578307', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707578307'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DECALOGO SRL', NULL, NULL, '30707587217', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707587217'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERVICIOS EMPRESARIALES BANDRIX S.A.', NULL, '45238-6545', '30707588108', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707588108'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EMPRESA DE TRANSPORTE ARGENTUR SRL', NULL, NULL, '30707589856', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707589856'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROAD SEGURIDAD S.A.', NULL, NULL, '30707594752', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707594752'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIÑEDOS DE LA PATAGONIA SRL', NULL, NULL, '30707623876', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707623876'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CEIBOTEL S.A.', NULL, NULL, '30707634401', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707634401'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MEC COMPUTACION DE TECH BROKERS SRL', NULL, NULL, '30707638520', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707638520'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MERCADO DE LA OFICINA S.A.', NULL, NULL, '30707661492', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707661492'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TARU PARQ SRL', NULL, NULL, '30707685162', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707685162'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EMPRENDIMIENTOS INMOBILIARIOS SA', NULL, '0261-524-5000', '30707714219', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707714219'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLS S.A.', NULL, '5217-1300', '30707730419', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707730419'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NUEVA CASA SANTIAGO SRL', NULL, NULL, '30707747540', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707747540'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'H & M ASOCIADOS S.A.', NULL, NULL, '30707756329', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707756329'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'E-BUYPLACE SA', NULL, NULL, '30707768785', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707768785'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TINTORERIA SANDOZ', NULL, '4867-1153 / 4865-3357', '30707768882', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707768882'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'M200 S.A.', NULL, '4307-2626', '30707779795', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707779795'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NEWTECH SOLUTIONS', NULL, '4343-4060 / 4796-8000', '30707788948', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707788948'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MASTERTEXTO S.R.L.', NULL, NULL, '30707795758', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707795758'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JULIO CESAR SA', NULL, NULL, '30707801332', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707801332'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RECYCLE EXPRESS', NULL, '4966-1557', '30707808663', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707808663'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DINATECH', NULL, '4300-8077', '30707830960', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707830960'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SIMBOLOS PATRIOS SRL', NULL, NULL, '30707833765', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707833765'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GLOBALGATE SRL', NULL, NULL, '30707836802', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707836802'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INFO WATER SRL', NULL, NULL, '30707839984', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707839984'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAMA GRAFICA', NULL, NULL, '30707840664', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707840664'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'METALURGICA URBANA SRL', NULL, NULL, '30707853189', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707853189'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INTERTRON S.A.', NULL, NULL, '30707872027', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707872027'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DISCOVER ARGENTINA S.A.', NULL, NULL, '30707890882', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707890882'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HOTELOM SRL', NULL, NULL, '30707917861', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707917861'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIGITAL GENERAL SERVICE S.A.', NULL, NULL, '30707929320', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707929320'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PINTURERIAS COLON DE ARGENTINA SA', NULL, NULL, '30707936513', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707936513'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BAUMOL S.A.', NULL, '4700', '30707939113', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707939113'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HOTELNEW SRL', NULL, NULL, '30707961186', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707961186'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DESARROLLOS HOTELEROS S.A.', NULL, '4508-5757', '30707969675', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707969675'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COMERCIO Y JUSTICIA COOP. TRABAJO', NULL, NULL, '30707974466', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707974466'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOLUTION BOX SRL', NULL, NULL, '30707975020', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707975020'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'POLYTEMP SA', NULL, NULL, '30707992618', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30707992618'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BLL ASUNTOS PUBLICOS Y PARLAMENTARIOS SRL', NULL, NULL, '30708016531', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708016531'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TECNOLOGIA E INSUMOS S.R.L.', NULL, '4775-6699 o 4774-2133', '30708034343', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708034343'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FOIA SRL', NULL, '4954-6236', '30708035013', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708035013'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EXPOSICIONES Y FERIAS DE LA CONSTRUCCION ARGENTINA SA', NULL, '4343-7020', '30708072938', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708072938'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NUEVO PLAZA HOTEL MENDOZA SA', NULL, NULL, '30708073519', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708073519'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAMUSCHKA S.R.L.', NULL, NULL, '30708107758', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708107758'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEONI NORA GRACIELA Y MENDEZ CLAUDIA ANGELICA SH', NULL, NULL, '30708179910', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708179910'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MEDYC SRL', NULL, NULL, '30708183020', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708183020'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PISTRELLI, HENRY MARTIN Y ASOC. S.R.L.', NULL, '4318-1600', '30708185864', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708185864'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INTELIGENCIA ESTRATEGICA SA', NULL, NULL, '30708200391', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708200391'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALSAPEMA SERVICIOS S.A.', NULL, NULL, '30708218614', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708218614'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VALLE ALTO SA', NULL, NULL, '30708224894', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708224894'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NELL JOY IND MENDOZA SA', NULL, NULL, '30708227419', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708227419'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DATA EXPRESS', NULL, '4792 7800', '30708251573', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708251573'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSULTORA DE ESTUDIOS BONAERENSE SA', NULL, NULL, '30708259019', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708259019'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ULTRASUR S.A.', NULL, NULL, '30708266902', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708266902'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BEXPO SRL', NULL, NULL, '30708269251', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708269251'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KLP EMPRENDIMIENTOS S.A.', NULL, NULL, '30708282096', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708282096'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'URBANO EXPRESS ARGENTINA S.A.', NULL, '4305-2111', '30708286431', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708286431'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRIMERA LINEA SRL', NULL, NULL, '30708292318', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708292318'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAMCOR SRL', NULL, NULL, '30708334487', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708334487'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SAN ISIDRO COCINAS S.R.L', NULL, NULL, '30708356863', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708356863'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UN TECHO PARA ARGENTINA A.C.', NULL, NULL, '30708357363', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708357363'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGRUPACION DE COLABORACION GRUPO PARAMEDIC', NULL, '0', '30708358130', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708358130'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LINKNOTICIAS S.A.', NULL, '5238-1485', '30708358564', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708358564'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ATAP S.A.', NULL, NULL, '30708389060', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708389060'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CIUDAD DE LA PAZ2123 SRL', NULL, '4784-3966', '30708390158', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708390158'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUEGOTECNIC SRL', NULL, NULL, '30708390220', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708390220'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GEO LOGIC S.A.', NULL, NULL, '30708408049', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708408049'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COMPAÑIA METROPOLITANA DE SEGURIDAD S.A.', NULL, NULL, '30708414898', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708414898'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GROSMAN ILUMINACION SRL', NULL, '4314-9239/4315-6564', '30708429259', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708429259'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COMUNICACIONES AUDITADAS SA', NULL, NULL, '30708463910', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708463910'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NECXUS NEGOCIOS INFORMATICO SA', NULL, NULL, '30708477148', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708477148'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ABATECH S.A', NULL, NULL, '30708478373', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708478373'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ACAD S.A.', NULL, NULL, '30708495502', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708495502'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CERRADURAS Y HERRAJES VEIGA SRL', NULL, NULL, '30708508221', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708508221'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NOVOTECH SRL', NULL, NULL, '30708522941', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708522941'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PROFILE INTERNATIONAL CONSULTANTS SA', NULL, '4343-3586/4342-6172', '30708528885', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708528885'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BAILOGY - JORGE SOED Y DIEGO MORONTA SH', NULL, '4331-6556', '30708545747', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708545747'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PC ARTS ARGENTINA SA', NULL, NULL, '30708602309', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708602309'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'STAR GOLF SRL', NULL, NULL, '30708611715', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708611715'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AVANTI SA', NULL, NULL, '30708661879', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708661879'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WORTMAN JOFRE- ISOLA  ABOGADOS', NULL, NULL, '30708678739', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708678739'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HUDDLE GROUP SA', 'info@huddle.com.ar', '5032-1070', '30708705132', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708705132'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'A BUEN PUERTO SRL', NULL, NULL, '30708713763', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708713763'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MULTI GROUP SRL', NULL, NULL, '30708728396', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708728396'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'YURITI S.A.', NULL, NULL, '30708737107', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708737107'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CERRAMIENTOS Y ESTRUCTURAS SA', NULL, NULL, '30708739940', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708739940'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEZGON S.R.L.', NULL, NULL, '30708751223', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708751223'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DRAGONES SERVICIOS SRL', NULL, NULL, '30708797657', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708797657'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CROSS SOLUCIONES SA', NULL, NULL, '30708821388', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708821388'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EVENTMEDIA SRL', NULL, NULL, '30708823429', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708823429'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZEITER SRL', NULL, NULL, '30708851325', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708851325'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COOPERATIVA DE PROVISION DE SERV. EDUCACION ASISTENCIALES', NULL, NULL, '30708880171', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708880171'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TROVATO G. F. Y TROVATO G. F. SH DE TROVATO', NULL, NULL, '30708889586', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708889586'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HOTEL LA CANDELA', NULL, '54387-421-0254', '30708908238', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708908238'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NUTRI SERVICE S.R.L.', NULL, '0', '30708921447', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708921447'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NIJAR S.A', NULL, NULL, '30708927933', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708927933'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MEDICINA LABORAL RP SALUD SA', NULL, '4372-4005', '30708932309', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708932309'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MADERO TANGO SA', NULL, NULL, '30708937327', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708937327'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAPELERA LOPE DE VEGA', NULL, '15-4414-4418', '30708945842', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708945842'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TOTAL QUALITY SERVICE S.A.', NULL, NULL, '30708949988', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708949988'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NORTH COMPUTERS S.R.L.', NULL, NULL, '30708959851', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708959851'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MERENGO S.A.', NULL, NULL, '30708981903', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30708981903'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'E.D.S.I. TREND ARGENTINA S.A.', NULL, NULL, '30709006564', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709006564'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TRADESHOW SA', NULL, NULL, '30709010448', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709010448'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LILUS SA', NULL, NULL, '30709017647', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709017647'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARMOLERIA GRANIMAR', NULL, NULL, '30709060208', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709060208'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RED ARGENTINA DE BANCOS DE ALIMENTOS', NULL, NULL, '30709070548', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709070548'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CHOCOLATES 1950 S.A.', NULL, '46391999', '30709092460', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709092460'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ILUMINACION SUDAMERICANA S.R.L.', 'ILUMINACIONSUDAMERICANA@FIBERTEL.COM.AR', NULL, '30709140910', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709140910'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALPATACO SRL', NULL, NULL, '30709158585', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709158585'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELECTRICA 631 SRL', NULL, NULL, '30709163074', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709163074'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DALAXO S.A. (EL DESCANSO)', NULL, NULL, '30709166642', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709166642'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BRUCHOU, FERNANDEZ MADERO, LOMBARDI & MITRANI', NULL, '4021-2300 / 5288-2300', '30709170046', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709170046'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GIACOBBE Y ASOCIADOS OPINION PUBLICA SA', NULL, NULL, '30709175269', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709175269'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'L M GUERRISI SRL', NULL, NULL, '30709182222', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709182222'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASS SRL', NULL, NULL, '30709200077', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709200077'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Construccines RM SRL', NULL, NULL, '30709201332', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709201332'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GALDO S.A.', NULL, NULL, '30709228664', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709228664'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'N.G.A. SRL', NULL, NULL, '30709256420', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709256420'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KLEIN S.A.', NULL, NULL, '30709273775', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709273775'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TOP 3 S.R.L.', NULL, '4912-3700', '30709276057', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709276057'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Producciones SAC SA', NULL, NULL, '30709284165', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709284165'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ROMPIENDOMOLDES SA', NULL, NULL, '30709291846', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709291846'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TAEDA S.A.', NULL, NULL, '30709311049', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709311049'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INXS DJS SRL', NULL, NULL, '30709332909', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709332909'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'C&M ARGENTINA S.A.', NULL, NULL, '30709333557', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709333557'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DOS-VEINTE PRODUCCIONES S.A.', NULL, NULL, '30709343935', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709343935'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DAYS TOUR S.A.', NULL, NULL, '30709353116', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709353116'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MS ARGENTINA S.R.L.', NULL, NULL, '30709360708', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709360708'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MOBINT SRL', NULL, NULL, '30709366617', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709366617'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERVICONSULT SA', NULL, NULL, '30709386340', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709386340'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRINT MASTER SRL', 'contacto@printmastersrl.com.ar', '0351-4636363', '30709396168', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709396168'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RULES SRL', NULL, NULL, '30709396834', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709396834'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AREAS GLOBALES - ALICIA ESTEBAN Y GRACIELA LIRA S de H', NULL, NULL, '30709420093', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709420093'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CENTRO DE ESTUDIOS NUEVA MAYORIA SRL', NULL, NULL, '30709443107', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709443107'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA JUNIOR SRL', NULL, NULL, '30709459399', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709459399'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TECH SECURITY SRL', NULL, NULL, '30709463469', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709463469'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASA DE ADOBE SRL', NULL, NULL, '30709466409', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709466409'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'US ELECTRICAR SRL', NULL, NULL, '30709467251', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709467251'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NETSCOM GROUP SA', NULL, NULL, '30709504793', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709504793'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HOTEL CLUB FRANCES SA', NULL, NULL, '30709524573', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709524573'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CENTRO DE DISTRIBUCION SUR SRL', NULL, '4924-2755 / 2756', '30709531960', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709531960'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TOUAREG SA', NULL, NULL, '30709532568', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709532568'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPO NET SA', NULL, NULL, '30709555878', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709555878'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANALISYS ONE SRL', NULL, NULL, '30709564370', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709564370'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AYSA S.A. (DA)', NULL, NULL, '30709565075', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709565075'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Lugares Urbanos S. A.', NULL, NULL, '30709600539', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709600539'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IDENTIMAX S.A.', NULL, '4541-2200', '30709625833', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709625833'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BASIC BS AS SERVICIOS INTEGRALES DE COMPUTACION SRL', NULL, '4326-1664', '30709634948', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709634948'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NEYD SRL', NULL, NULL, '30709636762', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709636762'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GABRIEL RUBINSTEIN & ASOCIADOS', NULL, NULL, '30709637351', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709637351'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANA BRANDAN NORMA ESPINOSA Y OTROS', NULL, NULL, '30709638722', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709638722'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CINCOSENTIDOS SRL', NULL, NULL, '30709707643', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709707643'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASINO PUERTO SANTA FE S.A', NULL, NULL, '30709753661', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709753661'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CENTRO DEL DOCUMENTO SA', NULL, NULL, '30709770973', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709770973'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRAFICA B612 SRL', NULL, '0', '30709804274', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709804274'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ID NORTE SRL', NULL, NULL, '30709820717', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709820717'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIDEICOMISO LA ANGELINA', NULL, NULL, '30709853437', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709853437'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION OBSERVATORIO PYME', NULL, NULL, '30709855529', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709855529'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARG.- CI SOCIEDAD DE RESPONSABILIDAD LIMITADA', NULL, NULL, '30709857203', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709857203'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIBREMENTE S.A.', NULL, NULL, '30709868418', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709868418'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANALISIS DE COYUNTURA MACROECONOMICA CONSULTORA Y DE MANDATOS SA', NULL, NULL, '30709869791', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709869791'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPO JERONIMO S.A.', NULL, NULL, '30709877115', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709877115'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MOTIVARTE S.A.', NULL, NULL, '30709894664', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709894664'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRISMA SOLUCIONES TECNOLOGICAS SRL', NULL, NULL, '30709901474', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709901474'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TRIMOTION SRL', NULL, NULL, '30709911038', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709911038'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'QUICK INFORMATICA S.A.', NULL, NULL, '30709911267', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709911267'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NEOGAME S.A.', NULL, NULL, '30709924172', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709924172'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FOOD AND DRINKS SA', NULL, NULL, '30709962511', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709962511'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMERIFLIGHT S.A', NULL, NULL, '30709966401', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709966401'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LYC INFORMATICA SRL', NULL, '4700', '30709966908', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709966908'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BOLDT IMPRESORES S.A.', NULL, NULL, '30709968250', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709968250'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IAPP SA', NULL, NULL, '30709968625', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709968625'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NANNINI TECHNOLOGIES SRL', NULL, NULL, '30709992151', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30709992151'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOLUCIONES INFORMATICAS', NULL, '5353-0370', '30710010931', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710010931'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALBERTO MENENDEZ E HIJOS S.A.', NULL, NULL, '30710043767', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710043767'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MB S.R.L.', NULL, NULL, '30710043848', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710043848'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AZULADO S.A.', NULL, NULL, '30710053215', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710053215'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TURISMO YROGOYEN', NULL, NULL, '30710065817', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710065817'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELIZABETH ILUNDAIN', NULL, NULL, '30710081790', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710081790'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'KUANTICA S.A.', NULL, NULL, '30710097263', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710097263'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FORAIN S.A.', NULL, '0', '30710100345', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710100345'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CATERER SA', NULL, NULL, '30710112017', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710112017'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SYMONDS S.A', NULL, NULL, '30710114176', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710114176'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PALACIO & ASOCIADOS SOCIEDAD CIVIL', NULL, NULL, '30710127154', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710127154'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TERRITORIO DIGITAL SA', NULL, NULL, '30710147627', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710147627'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Ing Leonardo Till y Asociados SRL', NULL, NULL, '30710150911', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710150911'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GHM SRL', NULL, NULL, '30710156731', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710156731'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TANTRA SOFT S.A.', NULL, NULL, '30710161328', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710161328'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DATTATEC.COM S.R.L.', NULL, NULL, '30710173652', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710173652'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TEATRO METRO SA', NULL, NULL, '30710192851', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710192851'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA LUCIA SRL', NULL, NULL, '30710216718', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710216718'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRAPE S.A.', NULL, NULL, '30710247915', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710247915'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASA DE LA COSTA EVENTOS SRL', NULL, NULL, '30710282478', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710282478'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMDEST S.A', NULL, '}', '30710296002', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710296002'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAC STATION', NULL, NULL, '30710298692', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710298692'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MATIAS MATIAS S.A.', NULL, NULL, '30710316496', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710316496'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAVA S.A.', NULL, NULL, '30710321899', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710321899'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNDERPAR S.A.', NULL, NULL, '30710339828', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710339828'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FAN ZONE SA', NULL, NULL, '30710344902', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710344902'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IDEAS EN RED S.A.', NULL, NULL, '30710363087', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710363087'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION COPAIPA', NULL, NULL, '30710371926', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710371926'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TOKIO GASTRONOMIA SRL', NULL, NULL, '30710383533', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710383533'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MICRO FAST S.R.L.', NULL, '0', '30710388888', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710388888'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPO QUINTÁS SRL', NULL, NULL, '30710394780', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710394780'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'QUART PRODUCCIONES SRL', NULL, NULL, '30710434863', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710434863'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GONZALEZ DEL RIO PEÑA SRL', NULL, NULL, '30710435096', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710435096'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIEGO R. GARCIA Y MARCELO CARRIZO S.H.', NULL, NULL, '30710441371', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710441371'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ORGANIZACION INTEGRAL DE GASTRONOMIA SA', NULL, NULL, '30710443773', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710443773'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HACIENDO CAMINO ASOCIACION CIVIL', NULL, NULL, '30710448031', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710448031'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GEXCORP HOLDING SA (tj)', NULL, '15-4414-4418', '30710461526', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710461526'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MS TECHNOLOGIES S.A.', NULL, NULL, '30710463669', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710463669'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TENAGLIA OLGA ESTER', NULL, '4952-7665', '30710485743', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710485743'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOLVER BSI SRL', NULL, NULL, '30710498004', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710498004'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AE INTERNACIONAL S.R.L.', NULL, NULL, '30710532997', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710532997'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PILOT SA', NULL, NULL, '30710538472', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710538472'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AC EASTWAY S.A.', NULL, NULL, '30710545665', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710545665'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SISTEMA VISUAL SA', NULL, NULL, '30710552130', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710552130'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMAKOR S.A.', NULL, '4828-0888', '30710587147', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710587147'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CUATRO B SA', NULL, NULL, '30710591039', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710591039'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TECNO DEPOT S.A.', NULL, NULL, '30710596359', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710596359'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SARAVIA FRIAS SOC. CIVIL', NULL, NULL, '30710625731', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710625731'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARKETING Y EVENTOS SA', NULL, '4345-6552/57', '30710627483', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710627483'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAZCOM SA', NULL, NULL, '30710662130', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710662130'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DISEÑO CINCO SRL', NULL, NULL, '30710671822', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710671822'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NAVARRO CASTEX', NULL, '5277-2220', '30710679289', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710679289'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ATENCIO MARCOS BERNARDO Y LONCARIC VICTOR HUGO EXPEDITO SOCIEDAD DE HECHO', NULL, NULL, '30710707606', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710707606'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIQUE DOS SA', NULL, NULL, '30710711131', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710711131'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACIÓN UVITEC', NULL, NULL, '30710713223', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710713223'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FAMEN & CIA SA', NULL, NULL, '30710765452', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710765452'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'URBEOS SRL', NULL, NULL, '30710774230', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710774230'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INSTITUTO ARGENTINO DE ANALISIS FISCAL', NULL, '0351 4815037', '30710775407', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710775407'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRODAJA SRL', NULL, NULL, '30710790643', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710790643'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT '360 REGIONAL S.R.L.', 'receptivo@360regional.com.ar', '0351-4215540', '30710794401', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710794401'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'L.C. COMUNICACION VISUAL SRL', NULL, NULL, '30710796684', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710796684'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOCIACION CIVIL PARA LA DIFUSION DE EDIFICIOS SUSTENTABLES ARGENTINA GREEN BUILDING COUNCIL', NULL, NULL, '30710859384', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710859384'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REFLEXION SRL', NULL, NULL, '30710874596', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710874596'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COMPAÑIA DE HOTELES IRIGOYEN', NULL, NULL, '30710907397', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710907397'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INSUMOS QUIRURGICOS SRL', NULL, NULL, '30710912560', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710912560'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MONTE AVENTINO SRL', NULL, NULL, '30710919441', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710919441'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TURISMO PATAGONIA ANDINA SRL', NULL, NULL, '30710930011', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710930011'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAZZETO LOPEZ RODRIGUEZ CORDOBA S.R.L.', NULL, '4811-1071', '30710956428', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710956428'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DICTA SA', NULL, NULL, '30710958676', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710958676'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SILLAS MESAS SA', NULL, '45679987', '30710979541', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710979541'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AYNI S.A', NULL, NULL, '30710985754', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30710985754'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RIHOTEL S.A.', NULL, NULL, '30711004943', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711004943'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOCBI S.A.', NULL, NULL, '30711058903', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711058903'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MINIBARES', NULL, NULL, '30711064695', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711064695'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BIDCOM SRL', NULL, '0', '30711069360', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711069360'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'METERTECH S.A.', NULL, NULL, '30711105693', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711105693'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SAFE S.A', NULL, '429-6052', '30711139709', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711139709'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA HUELLA - DEL CASTILLO SANTIAGO Y GONZALEZ DEL CERRO JOAQUIN SH', NULL, NULL, '30711144583', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711144583'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERVICIOS GRAFICOS S.R.L. - REY-CAR', NULL, NULL, '30711251266', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711251266'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TREBOL 4 SRL', NULL, NULL, '30711266603', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711266603'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TRESON S.R.L', NULL, NULL, '30711275513', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711275513'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PUNTO BAIRES S.A.', NULL, NULL, '30711279063', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711279063'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NETWORKTECH CORPORATE SERVICES SRL', NULL, NULL, '30711283818', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711283818'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EQUANET S.A.', NULL, NULL, '30711303673', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711303673'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONGRESS', NULL, NULL, '30711353662', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711353662'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ITG S.A.', NULL, NULL, '30711354561', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711354561'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPO ARGOS BAHIA S.A.', NULL, NULL, '30711372993', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711372993'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOFTLINE INTERNATIONAL S.A.', NULL, '5555-1439', '30711384282', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711384282'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'W COMUNICACION INTEGRAL SA', NULL, NULL, '30711389594', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711389594'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NODO MENDOZA RAP PERSONERIA JURIDICA 2137/09', NULL, NULL, '30711402809', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711402809'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PLOT S.A.', NULL, NULL, '30711419272', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711419272'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DAS TRAVEL SA', NULL, NULL, '30711444838', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711444838'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PROSINERGIA SA', NULL, NULL, '30711447144', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711447144'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAHUMA SA', NULL, NULL, '30711457964', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711457964'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BLACK SRL', NULL, NULL, '30711459002', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711459002'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPO PETIRIBI SA', NULL, NULL, '30711483493', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711483493'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TECNISON S.A.', NULL, NULL, '30711499799', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711499799'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALIMENA S.R.L.', NULL, NULL, '30711530009', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711530009'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FS GLORIA S.R.L.', NULL, NULL, '30711537100', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711537100'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COMPAÑIA DE BUENAS IDEAS SRL', NULL, NULL, '30711559791', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711559791'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IDEAS DEL LAGO SA', NULL, NULL, '30711571317', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711571317'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RUEMEN TECNOLOGIA S.A.', NULL, NULL, '30711576122', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711576122'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CREX SRL', NULL, NULL, '30711577463', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711577463'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSTRUCTORA DE IMAGEN SRL', NULL, NULL, '30711662487', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711662487'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARGENSYS SRL', NULL, NULL, '30711669341', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711669341'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AIRE VISUAL SRL', NULL, '3434218094', '30711674809', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711674809'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HELIOS PHARMA S.A.', NULL, '15-4414-4418', '30711698570', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711698570'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALTA CORDOBA S.R.L.', NULL, NULL, '30711707480', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711707480'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SALAS SERGIO ADRIAN Y PEREZ REYNA LILIANA SOCIEDAD DE HECHO', NULL, NULL, '30711708266', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711708266'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COOPERATIVA DE TRABAJO PERIODISTICO NUEVO DIA LIMITADA', NULL, NULL, '30711724318', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711724318'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOUP INTERACTIVE SRL', NULL, NULL, '30711735891', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711735891'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANKLO SRL', NULL, NULL, '30711761698', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711761698'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BE SINGULAR S.A.', NULL, NULL, '30711770441', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711770441'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLUDEBA SA', NULL, NULL, '30711779465', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711779465'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BRACAR CONSTRUCCIONES SRL', NULL, NULL, '30711790531', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711790531'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PROMETEO SRL', NULL, NULL, '30711833354', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711833354'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRINT HOUSE', NULL, NULL, '30711834512', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711834512'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'P. SANTA MARIA, A. MENENDEZ Y C. ACOSTA SH', NULL, NULL, '30711844763', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711844763'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DRIMCOM S.A', NULL, NULL, '30711858993', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711858993'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARKETING & ESTADISTICA SRL', NULL, NULL, '30711863741', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711863741'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PABLO SOLARI Y NORMA SOLARI SH', NULL, NULL, '30711865442', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711865442'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FLORES FERNANDO IVAN Y FLORES LUCAS MIGUEL S.H.', NULL, NULL, '30711870195', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711870195'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DECATA SRL', NULL, NULL, '30711875081', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711875081'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TAPIA MULTIMEDIA S.A.', NULL, NULL, '30711885710', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711885710'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CANARIA HISPANA SA UTE', NULL, NULL, '30711903964', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711903964'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALIEXPRESS1 S.R.L.', NULL, NULL, '30711922543', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711922543'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'T5 ARGENTINA SRL', NULL, NULL, '30711924783', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711924783'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HIT 1 S.A.', NULL, NULL, '30711967555', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30711967555'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANITARIOS SANZ HNOS', NULL, NULL, '30712049967', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712049967'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ENTRE MEDIOS SA', NULL, NULL, '30712061363', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712061363'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PARAM S.R.L.', 'laura.pautasso@novecento.com', NULL, '30712073159', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712073159'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MA EVENTOS SRL', NULL, NULL, '30712073604', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712073604'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Asoc. Civil instituto de Economia del Bienestar', NULL, NULL, '30712100067', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712100067'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEGMA SRL', 'MROSELLI@SEGMASRL.COM', NULL, '30712111360', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712111360'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PYMEDIA S.A.', NULL, NULL, '30712118926', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712118926'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOUTHAPPS S.A.', NULL, NULL, '30712188975', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712188975'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CHIARELLO MAXIMILIANO  Y GUISER AXEL S.H.', NULL, NULL, '30712192468', 'N'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712192468'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EL EBANO DESIGN SRL', NULL, '4300-7616', '30712212795', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712212795'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ECONOMIC TRENDS S.A.', NULL, NULL, '30712249494', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712249494'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TATAKY BAHIA SRL', NULL, NULL, '30712249869', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712249869'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MyT DESARROLLOS GASTRONOMICOS SRL', NULL, NULL, '30712261257', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712261257'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REVUMAR SA', NULL, NULL, '30712300120', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712300120'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ELYPSIS SRL', NULL, NULL, '30712325433', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712325433'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MDS CONSULTORES S.A.', NULL, NULL, '30712354301', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712354301'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'THE WHY FACTORY SA', NULL, NULL, '30712370978', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712370978'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EVENTOS NANNINI SA', NULL, NULL, '30712377786', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712377786'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PLAYIT SOLUCIONES DIGITALES SRL', NULL, NULL, '30712378596', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712378596'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CEIS CONSULTORIA EVALUCIÓN E INVESTIGACION SOCIAL SRL', NULL, NULL, '30712383352', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712383352'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DALCARE S.A.', NULL, NULL, '30712421254', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712421254'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NIEUW SA', NULL, NULL, '30712445099', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712445099'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WOODEN CROSS S.A.', NULL, NULL, '30712467114', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712467114'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CHK SERVICIOS AUDIOVISUALES SRL', NULL, '50318264', '30712477241', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712477241'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PROAUDIO CENTER S.A.', NULL, NULL, '30712485872', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712485872'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RSM AR SRL', NULL, '4811-1071', '30712487050', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712487050'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SANTIAGO BILINKIS Y INES H. HERCOVICH S.H.', NULL, NULL, '30712493328', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712493328'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CELEBRAR SRL', NULL, NULL, '30712495592', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712495592'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUSTENTABLE SRL', NULL, NULL, '30712505652', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712505652'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NUEVOS EMPRENDIMIENTOS SRL', NULL, NULL, '30712506721', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712506721'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INTERMESTICA SA', NULL, NULL, '30712507620', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712507620'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AMAUTA SRL', NULL, NULL, '30712521321', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712521321'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INMENTAL INTERACTIVE SRL', NULL, NULL, '30712523944', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712523944'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERVICIOS INTEGRALES LA PLATA SRL', NULL, NULL, '30712539018', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712539018'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FAMESA SRL', NULL, NULL, '30712557105', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712557105'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGUILAR V.L. Y BENAVIDES I. SH', NULL, NULL, '30712645306', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712645306'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PUNTO CBA SA', NULL, NULL, '30712708103', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712708103'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZANINOVICH INGENIERIA Y CONSTRUCCIONES SA', NULL, NULL, '30712904808', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30712904808'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HARDWARE EXPRESS SRL', NULL, NULL, '30713160802', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30713160802'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIA LAURA LANZILLOTTA Y ANICETO SANABRIA SH', NULL, NULL, '30713303700', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30713303700'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAX EQUIPAMIENTOS SRL', NULL, NULL, '30713424206', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30713424206'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SGK SRL - CANCHA GOLF HOTEL LLAO LLAO', NULL, NULL, '30713517204', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30713517204'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WOLOX S.A.', NULL, NULL, '30713587903', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30713587903'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'QUASAR VENTURES ARGENTINA SA', NULL, NULL, '30713608900', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30713608900'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TENTENPIE SRL', NULL, NULL, '30713790008', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30713790008'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT '40SUR SRL', NULL, NULL, '30713804505', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30713804505'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BONIFACIO CHOCOLATES - STAR PATAGONIA SRL', NULL, NULL, '30713821108', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30713821108'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZERBARINI LUCIANO Y LEGUIZAMON SEBASTIAN MARCOS S.H', NULL, NULL, '30713830808', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30713830808'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DECAWEI SRL', NULL, NULL, '30714040681', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714040681'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CRITICAL POWER ARGENTINA SRL', NULL, NULL, '30714043893', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714043893'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPO ESENCIAL SRL', NULL, NULL, '30714061611', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714061611'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOC DE ESPECIALISTAS EN RELACONES LABORALES EX BECARIOS', NULL, NULL, '30714084212', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714084212'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FULL COMMERCE SRL', NULL, NULL, '30714108170', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714108170'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LATAM TECHNOLOGY S.A', NULL, '0', '30714114820', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714114820'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIGILOGIX', NULL, NULL, '30714128716', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714128716'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DFC EDICIONES SRL', NULL, NULL, '30714140732', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714140732'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIDEICOMISO ALTOS DE BOULEVARD', NULL, NULL, '30714161667', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714161667'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TALLERES GRAFICOS M.T. S.R.L.', NULL, NULL, '30714181382', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714181382'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AFEF', NULL, NULL, '30714182583', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714182583'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LPH EVENT S.A.', NULL, NULL, '30714209872', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714209872'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NANOTEC SRL', NULL, NULL, '30714236888', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714236888'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SILGAR SRL', NULL, NULL, '30714246638', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714246638'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PANIFICADORA ALTAS CUMBRES S.R.L.', NULL, NULL, '30714259586', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714259586'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GERMANY HOTEL SRL', NULL, '50318264', '30714276359', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714276359'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIDER RENTAL SA', NULL, NULL, '30714285013', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714285013'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SAN FRANCISCO EVENTOS SA', NULL, '}', '30714318078', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714318078'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CATANESE SRL', NULL, NULL, '30714348392', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714348392'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGUILERA NATACHA Y RODRIGUEZ LAHITTE DANIEL ALBERTO  Y AGRIELLO', NULL, NULL, '30714367346', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714367346'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MECAFER SRL', NULL, NULL, '30714369292', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714369292'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TELFS SA', NULL, NULL, '30714369578', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714369578'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COPILAN SRL', NULL, '0', '30714372382', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714372382'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ECOEXIST SRL', NULL, NULL, '30714381551', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714381551'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GALENO SEGUROS S.A.', NULL, NULL, '30714395196', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714395196'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BALTO ESTUDIO S.A.', NULL, NULL, '30714410365', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714410365'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CORDOBA CLEAN SRL', NULL, NULL, '30714423904', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714423904'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MY HOTELES ARGENTINA SRL', NULL, NULL, '30714426792', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714426792'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BR CONSTRUCCIONES SRL', NULL, NULL, '30714436348', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714436348'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIANO LINOVICH Y MAXIMILIANO LINOVICH SH', NULL, NULL, '30714436593', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714436593'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BILBAO CONSTRUCCIONES SRL', NULL, NULL, '30714438642', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714438642'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TALLER DE CARTELES SRL', NULL, NULL, '30714450340', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714450340'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BALCARCE BUSINESS HOTEL SA', NULL, NULL, '30714453471', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714453471'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAULO BARBERIS Y MAURO MIGUEL', NULL, NULL, '30714459410', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714459410'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AUSTRAL AÑELCO SRL', NULL, NULL, '30714469882', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714469882'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NET VALUE SRL', NULL, NULL, '30714481874', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714481874'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ECOTECNA S.A.', NULL, NULL, '30714558664', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714558664'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CHCH PRODUCCIONES SRL', NULL, NULL, '30714591815', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714591815'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOLDIN DAVID L. Y LOPEZ ALCOBA PABLO A. SH', NULL, NULL, '30714601128', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714601128'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIGITAL DISPLAYS S.A.', NULL, NULL, '30714616265', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714616265'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GESTIONES GLOBALES SRL', NULL, NULL, '30714643998', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714643998'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSTRUCCIONES CHAQUEÑAS SA', NULL, NULL, '30714726427', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714726427'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOMAT INGENIERIA SRL', NULL, NULL, '30714744336', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714744336'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ECOTUBOS SA', NULL, NULL, '30714745464', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714745464'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EBOX S.A.', NULL, NULL, '30714749206', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714749206'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GO AR PUBLICIDAD S.H.', NULL, '011 46357007', '30714791318', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714791318'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION UNTREF', NULL, NULL, '30714795100', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714795100'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ISSOR SA', NULL, NULL, '30714813281', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714813281'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RESTAURANTE MAR DEL PLATA GOLF', NULL, NULL, '30714836230', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714836230'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION INVAP', NULL, NULL, '30714848409', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714848409'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PARKING DE LAS ARTES S.R.L.', NULL, NULL, '30714867772', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714867772'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TRAVELITE SRL', NULL, NULL, '30714882615', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714882615'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FORVILLE SA', NULL, NULL, '30714924377', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714924377'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SIMPLEX VILI SA', 'CONTACTO@SIMPLEXVILI.COM.AR', '52637173', '30714928577', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714928577'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOS SOCAVONES SA', NULL, NULL, '30714930970', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714930970'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SPIQUERS S.A.', NULL, NULL, '30714937762', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714937762'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BALLERO LANDONI Y ASOCIADOS SA', NULL, NULL, '30714987417', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30714987417'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRES SRL', NULL, NULL, '30715008757', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715008757'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DATAGLOBAL SRL', NULL, NULL, '30715035886', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715035886'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MR PRO VISUAL SRL', NULL, NULL, '30715040553', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715040553'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COSMOPOLITAN SOCIEDAD ANONIMA', NULL, NULL, '30715044249', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715044249'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BBH ARGENTINA SA.', NULL, NULL, '30715062050', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715062050'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MYSTRA SRL', NULL, 'C', '30715082787', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715082787'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HOTELES Y GESTION SRL', NULL, NULL, '30715098306', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715098306'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'POLO SU SRL', NULL, NULL, '30715108301', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715108301'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COOPERATIVA DE TRABAJO ESQUINA LIBERTAD LIMITADA', NULL, NULL, '30715123319', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715123319'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ITPROUSER', NULL, NULL, '30715123483', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715123483'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPO AUSTRAL CHUBUT S.R.L.', NULL, NULL, '30715137441', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715137441'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MARIANA I FERNANDEZ Y MARCELO L SANTINI S.S', NULL, NULL, '30715147722', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715147722'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPO INVERSOR VELSKI SA', NULL, NULL, '30715204696', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715204696'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DESTACC SRL', NULL, NULL, '30715235664', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715235664'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CABIFY S.A. (DA)', NULL, '0', '30715245120', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715245120'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CENTRAL CONSULTORES SRL', NULL, NULL, '30715262734', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715262734'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONCEPTOS HOTELEROS SRL', NULL, NULL, '30715280260', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715280260'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GASTRONOMIA MILLENIUM SA', NULL, NULL, '30715281593', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715281593'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DEVENTAS S.A.', NULL, '0', '30715294938', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715294938'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOMOS NM SRL', NULL, NULL, '30715322184', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715322184'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRASET SRL', NULL, NULL, '30715323628', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715323628'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DOBLAS 2096 SRL', NULL, NULL, '30715349996', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715349996'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FEDERICO H. PRIETO Y LEONARDO. M. MARQUES DOS SANTOS', NULL, NULL, '30715363026', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715363026'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MY CONTACTS SRL', NULL, NULL, '30715378759', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715378759'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FDG S.A.', NULL, NULL, '30715379453', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715379453'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NET PRODUCTORA S.H.', NULL, NULL, '30715395467', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715395467'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION ESPARTANOS', NULL, NULL, '30715396749', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715396749'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'B + T DISEÑO SRL', NULL, NULL, '30715401033', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715401033'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACIÓN JEAN MAGGI', NULL, NULL, '30715409808', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715409808'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAPPELLETTI INFORMATICA SRL', NULL, NULL, '30715420828', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715420828'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INVERSIONES HOTELERA SALTA S.A', NULL, NULL, '30715423843', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715423843'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PIPELINE MEDIA S.R.L.', NULL, NULL, '30715437623', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715437623'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VENEX SA', NULL, NULL, '30715473204', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715473204'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OBSERVATORIO FISCAL FEDERAL', NULL, NULL, '30715566032', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715566032'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IMAGINE LAB ARG S.A.', NULL, NULL, '30715595326', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715595326'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EVENTEAR 325 S.R.L.', NULL, NULL, '30715612972', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715612972'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GI - KRAMER SOLUCIONES MÉDICAS', NULL, NULL, '30715630989', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715630989'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PANAMBÍ', NULL, NULL, '30715656228', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715656228'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUTELER Y SPIDALIRI SOCIEDAD DE LA SECCION IV LGS ART 21 A 26 LGS', NULL, NULL, '30715658271', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715658271'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BELLARGEN S.A.', NULL, NULL, '30715668471', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715668471'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EVENTS GROUP SA', NULL, NULL, '30715673491', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715673491'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SM ROLLER SRL', NULL, NULL, '30715696459', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715696459'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SIETE ONZAS S.R.L.', NULL, NULL, '30715697714', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715697714'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NEXT INSUMOS SRL', NULL, NULL, '30715702491', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715702491'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SHAREWOOD PARK S.A.', NULL, NULL, '30715706748', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715706748'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'QUINTO IMPACTO SRL', NULL, NULL, '30715709267', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715709267'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ATOMIC LAB SAS', NULL, NULL, '30715717588', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715717588'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CC PRINTDE CORVALAN SEBASTIAN FERNANDO Y CONCARO LILIANA', NULL, NULL, '30715741314', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715741314'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PATAGONIA PROFUNDA S.A.', NULL, NULL, '30715762710', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715762710'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FS COMPUTERS SRL', NULL, NULL, '30715767127', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715767127'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Palermo Suites BA S.R.L', NULL, NULL, '30715784242', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715784242'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ACREDITACIONES DATAEXPRESS  SRL', NULL, NULL, '30715791931', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715791931'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NP FLOORS S.A.', NULL, NULL, '30715879022', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715879022'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PMI CORDOBA ARGENTINA CHAPTER', NULL, NULL, '30715879219', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715879219'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARGENSEGUR S.R.L.', NULL, NULL, '30715886924', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715886924'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DAWAXPROJECT S.R.L.', NULL, NULL, '30715907069', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715907069'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIESTAS EN CARPA S.R.L.', NULL, NULL, '30715907956', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715907956'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NO PAIN SRL', NULL, NULL, '30715939157', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715939157'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'WILDLIFE ADVENTURE SRL', NULL, NULL, '30715947893', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715947893'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOUT SRL', NULL, NULL, '30715971972', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715971972'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PORTAL INSUMOS SRL', NULL, NULL, '30715979213', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30715979213'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA TOSTADA SRL', NULL, NULL, '30716001896', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716001896'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALMACEN JABUGO SRL', NULL, NULL, '30716006367', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716006367'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SALTICO SAS', NULL, NULL, '30716019604', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716019604'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SIROS S.A.S.', NULL, NULL, '30716026163', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716026163'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PXQ CONSULTORA DE EMMANUEL ANTONIO ALVAREZ AGIS Y CYNTHIA L', NULL, NULL, '30716033445', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716033445'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERVICIO SUSTENTABLE SRL', NULL, NULL, '30716045494', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716045494'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'muroscons srl', NULL, NULL, '30716071940', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716071940'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SIGRA DESARROLLOS S.A.S', NULL, NULL, '30716080478', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716080478'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FABRICA DE BANDERAS SRL', NULL, NULL, '30716098512', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716098512'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FYD COMMUNITY S.A.S', NULL, NULL, '30716103664', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716103664'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CARPAS Y EVENTOS S.R.L. (TENTIKLE)', NULL, NULL, '30716104989', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716104989'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAZADOR DE TALENTOS SAS', NULL, NULL, '30716133423', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716133423'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OPTIMA LIMPIEZA SAS', NULL, NULL, '30716145359', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716145359'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VISIONE PUBLICIDAD', NULL, NULL, '30716146940', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716146940'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DOS57 SRL', NULL, NULL, '30716175061', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716175061'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GREENGIFT S.A.S.', NULL, NULL, '30716176513', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716176513'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PUNTO A PUNTO EDITORIAL S.A.S.', NULL, NULL, '30716237318', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716237318'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIBUS S.A', NULL, NULL, '30716239744', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716239744'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PUMERAL SRL (PMA)', NULL, NULL, '30716246651', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716246651'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CORDOBA LIMPIA SAS', 'contaduria@camarco.org.ar', 'xxxxxxxxx', '30716253313', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716253313'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOULU SERVICIOS GASTRONOMICOS S.A.S.', NULL, NULL, '30716261863', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716261863'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAYORLED SRL', NULL, NULL, '30716276658', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716276658'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PLISTECH SAS', NULL, NULL, '30716306913', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716306913'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CANNELE S.A.', NULL, NULL, '30716324016', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716324016'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEMAN SA', NULL, NULL, '30716333481', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716333481'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'S.G. ILUMINACIÓN SAS', NULL, NULL, '30716336596', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716336596'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MITOAS S.A.', NULL, NULL, '30716350939', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716350939'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTRATEGIA Y GESTION MDQ S.R.L.', NULL, NULL, '30716405806', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716405806'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GALE SERVICIOS S.A.', NULL, NULL, '30716410133', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716410133'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CATALIZADORES DE VALORES SAS', NULL, NULL, '30716425173', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716425173'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LACKY SAS', NULL, NULL, '30716487950', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716487950'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLASSIQUE PRESENT S.A.S.', NULL, NULL, '30716498901', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716498901'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CRAWELL S.A.S.', NULL, '0', '30716523906', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716523906'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOS SUCHO INVESMENT', NULL, NULL, '30716549409', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716549409'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HEYBUZZ SAS', NULL, NULL, '30716577887', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716577887'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOLUCIONES ALIMENTICIAS DEL SUR SAS', NULL, NULL, '30716609002', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716609002'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BUSINESS & SUSTAINABILITY', NULL, NULL, '30716620383', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716620383'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOOLI S.A.S.', NULL, NULL, '30716682982', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716682982'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Los Croods', NULL, NULL, '30716685728', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716685728'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BEREC S.A.S.', NULL, NULL, '30716695553', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716695553'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HIGIA EVENTOS SA', NULL, NULL, '30716719940', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716719940'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRID DIGITAL', NULL, '}', '30716841878', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716841878'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIDER TROFEOS Y REGALOS SAS', NULL, NULL, '30716877805', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716877805'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPO MEXX S.R.L.', NULL, NULL, '30716932245', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716932245'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT '9 de diciembre del 2018', NULL, NULL, '30716981076', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30716981076'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERVICIOS DE RESPUESTA INMEDIATA SAS', NULL, NULL, '30717002314', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717002314'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA FERNETERIA ALCORTA S.A.', NULL, NULL, '30717045323', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717045323'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'USINA DEL CONOCIMIENTO S.R.L.', NULL, NULL, '30717104036', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717104036'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MONTCHRESTIEN S.A', NULL, NULL, '30717153266', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717153266'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COOP DE TRABAJO COODESOFT LTDA', NULL, NULL, '30717168603', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717168603'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GM PROMOCIONES S.A.', NULL, NULL, '30717201287', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717201287'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESTILO GPL SRL', NULL, NULL, '30717203816', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717203816'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPO KELUAR S.A.', NULL, NULL, '30717246736', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717246736'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERVICIOS DE LIMPIEZA ECOLOGICA', NULL, NULL, '30717287300', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717287300'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BLACKTORO CONSULTING SAU', NULL, NULL, '30717289222', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717289222'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RYOKAN S.A.S.', NULL, NULL, '30717358852', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717358852'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Canal Oficial S.R.L. (tj)', NULL, '15-4414-4418', '30717394492', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717394492'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DIGITAL MARKET S.A.', NULL, NULL, '30717475646', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717475646'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INCLUIR MAS S.R.L.', NULL, NULL, '30717567907', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717567907'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CORPORA S.A.S.', NULL, NULL, '30717569578', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717569578'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SAN ISIDRO OPEN TICKET', NULL, NULL, '30717572609', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717572609'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DUEK MATIAS NICOLAS Y DUEK RUBEN GUILLERMO S. CAP I SECC IV', NULL, NULL, '30717583953', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717583953'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANDOMAT 611 EN FORMACION S.R.L.', NULL, '2291513167', '30717612503', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717612503'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRIMERA A S.A.S (SANSÓN)', NULL, NULL, '30717626156', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717626156'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPO R2M2 S.R.L.', NULL, NULL, '30717718603', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717718603'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'Grafica Papilo', 'mpazos@camarco.org.ar', NULL, '30717764346', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717764346'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COOPERATIVA DE TRABAJO BOOTCOOP', NULL, NULL, '30717778991', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717778991'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA CAJA BUSINESS SRL', NULL, NULL, '30717790835', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717790835'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LA TOPPI S.A.S.', NULL, NULL, '30717822397', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717822397'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ORSON CAPITAL', NULL, NULL, '30717842479', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717842479'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SOLUCIONES PARA EVENTOS SAS', NULL, NULL, '30717856895', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717856895'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TELONES BENITO SRL', NULL, NULL, '30717895653', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717895653'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BLUE LOG SRL', NULL, NULL, '30717963276', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717963276'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GREGORIO COCINA DE AUTOR', NULL, '0', '30717978893', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30717978893'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NEOPARANA SA', NULL, NULL, '30718006208', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30718006208'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BATBAIK SA', NULL, '0', '30718086988', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30718086988'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAROLE S.A.S', NULL, NULL, '30718092384', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30718092384'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PARQUE DE INNOVACION-EPI E.D.P NO E.', NULL, '0', '30718095847', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30718095847'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CUMBRE ASOCIACIÓN CIVIL', NULL, NULL, '30718144937', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30718144937'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OUR PLACE IN THE WORLD (GRANADOS BAR) (CVU)', NULL, '4372-4005', '30718227883', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30718227883'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MUNDEX PO S.R.L', NULL, NULL, '30718343352', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30718343352'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CGE EVENTOS SRL', NULL, NULL, '30718353277', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '30718353277'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IMPRESORA INTERNACIONAL DE VALORES SAIC', NULL, NULL, '33500355609', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33500355609'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MUNDIAL SA', 'mundial@mundial.com.ar', '4303-3141', '33500365019', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33500365019'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MILLAN S.A.', NULL, NULL, '33503850929', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33503850929'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESAU STUDIO.', NULL, '4816-1560/2797', '33516766439', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33516766439'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CAMARA ARGENTINA DEL LIBRO', NULL, NULL, '33525495669', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33525495669'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SADAIC', NULL, NULL, '33525688939', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33525688939'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CONSEJO PROFESIONAL DE INGENIERIA CIVIL', NULL, NULL, '33527948059', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33527948059'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASTESIANO Y CIA. SA.', NULL, '4866-3600', '33528094029', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33528094029'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HOTEL WALDORF  SA', NULL, NULL, '33536076099', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33536076099'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'C.A.T.A. Internacional Empresa: Limitada', NULL, NULL, '33546628839', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33546628839'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HOTEL PRESIDENTE ROSARIO S.A.', NULL, NULL, '33558643639', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33558643639'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MEROLI HOGAR S.A', NULL, NULL, '33563671209', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33563671209'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAGARDE S.A.', NULL, '0261-4980011', '33567905719', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33567905719'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDITORIAL ABACO DE RODOLFO DEPALMA SRL', NULL, NULL, '33575318709', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33575318709'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HIJOS DE ROBERTO CANCIO DEMONTE S.A.', NULL, NULL, '33578089239', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33578089239'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERRANO SA', NULL, NULL, '33587343849', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33587343849'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOCIACION ARG DEL HOMIGON ELABORADO', NULL, NULL, '33588212519', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33588212519'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CORREGIDOR S.A.', NULL, '4700', '33593283319', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33593283319'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERVICINTAS S.A.', NULL, '4342-6047', '33606072169', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33606072169'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LAS DINAS SRL', NULL, NULL, '33606956849', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33606956849'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VICRIES SRL', NULL, NULL, '33607282949', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33607282949'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDICIONES COLOS S.A.', NULL, NULL, '33609770789', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33609770789'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TRAS NASHUA SRL.', NULL, '4374-6641', '33613842689', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33613842689'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PAPELERA PACOLON SA', NULL, '0', '33615679009', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33615679009'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PROMINENTE', NULL, NULL, '33620499779', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33620499779'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT '5M PATAGONIA S.A', NULL, NULL, '33629209889', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33629209889'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'POLYTECH S.A.', NULL, NULL, '33643358749', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33643358749'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUTUREKIDS SA', NULL, NULL, '33654854799', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33654854799'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EJES S.A. (P)', NULL, NULL, '33663419949', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33663419949'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MULTIPOINT  S.A.', NULL, NULL, '33677414419', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33677414419'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAIPACH S.A.', NULL, NULL, '33681142229', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33681142229'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ABDENUR HERMANOS SRL', NULL, NULL, '33681265339', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33681265339'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION PLEXO', NULL, '5279-6530/32', '33687277509', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33687277509'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REBOMAX SRL', NULL, '4382-6579/7219', '33688281879', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33688281879'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EMECON S.A.', NULL, '15-5317-2843', '33690178589', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33690178589'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'REBOR SEGURIDAD S.A.', NULL, NULL, '33690211969', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33690211969'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BAE SA.', NULL, NULL, '33691213469', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33691213469'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALMURFE S.R.L. - POSTA DEL TRIUNFO', NULL, '4733-0863', '33691285079', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33691285079'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'M&M BOMCHIL ABOGADOS', NULL, '4321-7500', '33691549599', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33691549599'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OFFICENET S.A.', NULL, NULL, '33692148229', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33692148229'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TELMEX ARGENTINA S.A.', NULL, NULL, '33695098419', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33695098419'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CURAT, MARTINEZ LARREA & ASOC.', NULL, NULL, '33695534669', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33695534669'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'POSTA TRANSPORTE S.A.', NULL, '4923-0206/4924-2579', '33696114639', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33696114639'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LIFTEC SA', NULL, '4342-9195', '33696407539', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33696407539'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRACIELA JUAREZ SRL', NULL, NULL, '33696868099', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33696868099'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'S & L INFORMATICA-TELEFONIA', NULL, '4383-8757', '33697102219', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33697102219'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNIVERSITA DI BOLOGNA', NULL, '4878-2900', '33697315549', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33697315549'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TIEMPO PUBLICITARIO SRL.', NULL, '4374-7086/4372-3519', '33698020569', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33698020569'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CORREO ANDREANI SA', NULL, '4016-0700', '33699685459', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33699685459'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASA DEL AUDIO - MARANSI S.A.', NULL, NULL, '33700871199', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33700871199'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAPFRE', NULL, NULL, '33700893729', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33700893729'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SAINT PIPER SA', NULL, NULL, '33700897929', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33700897929'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ICS COMERCIAL SA', NULL, '5031-4200', '33700983639', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33700983639'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PROYECTAR - CONNECT S.A.', NULL, '4011-1996', '33701271489', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33701271489'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AGENCIA CORDOBA TURISMO SEM', NULL, NULL, '33704569349', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33704569349'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAIMOS S.A.', NULL, NULL, '33707037089', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33707037089'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ARS TECHNOLOGIES SRL', NULL, NULL, '33707149049', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33707149049'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION CIPPEC', NULL, NULL, '33707241379', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33707241379'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEGUROS SA', NULL, NULL, '33707366589', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33707366589'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIPA * GORFINKEL PABLO Y G.JULIO SH', NULL, '4709-1917', '33707373259', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33707373259'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PATAGONIA TRANSFER S.A.', NULL, '4925-5023', '33707428819', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33707428819'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PRAGMATICA TECHNOLOGIES S.A.', NULL, NULL, '33707563589', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33707563589'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ANECTIS  S.A.', NULL, '46186969', '33707889379', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33707889379'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LOS MOLINOS SRL', NULL, NULL, '33708068999', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33708068999'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NEXPROM S.A.', NULL, NULL, '33708205759', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33708205759'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GODO S.A.', NULL, NULL, '33708341059', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33708341059'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'INSTITUTO PARA EL DESARROLLO SOCIAL ARGENTINNO ASOCIACION CIVIL', NULL, NULL, '33708482469', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33708482469'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DAMARFU S.A.', NULL, NULL, '33708543409', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33708543409'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TEALOSOPHY S.A.', NULL, NULL, '33708606559', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33708606559'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ENELEC S.A', NULL, NULL, '33708749589', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33708749589'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DISTECNA S.A.', NULL, NULL, '33708844379', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33708844379'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERCAP INSUMOS S.R.L', NULL, NULL, '33708907869', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33708907869'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RYDEX S.A.', NULL, '15-4414-4418', '33709108129', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33709108129'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RICARDO J SUAREZ SRL', NULL, NULL, '33709250219', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33709250219'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FAST PRINT SRL', NULL, NULL, '33709384649', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33709384649'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DON CORNELIO S.A.', NULL, NULL, '33709744599', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33709744599'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GMK SA', NULL, NULL, '33709773769', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33709773769'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ZEROTH SRL', NULL, NULL, '33709846529', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33709846529'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RICHTER-DAHL ROCHA Y ASOCIADOS SA', NULL, '4811-1071', '33709906939', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33709906939'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'METALURGICA VILLA SARMIENTO SRL', NULL, NULL, '33710123379', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33710123379'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BONVA SA', NULL, NULL, '33710237919', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33710237919'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LQNET. S.A', NULL, NULL, '33710325109', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33710325109'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RING SA', NULL, '4313-6376', '33710408179', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33710408179'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LLENSA N. JAVIER Y ACEVEDO ADOLFO C S.H.', NULL, NULL, '33710522559', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33710522559'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EXOSOUND SRL', NULL, NULL, '33710684869', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33710684869'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MULTIDEAS SRL', NULL, '153062-8748', '33710699009', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33710699009'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IN SITU SOLUCIONES GRAFICAS SRL', NULL, NULL, '33710721179', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33710721179'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DEVITUR S.A.', NULL, NULL, '33710836499', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33710836499'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIÑAS EN FLOR SRL', NULL, '0', '33710956699', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33710956699'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION UNIVERSIDAD DE SAN ANDRES', NULL, NULL, '33711134609', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33711134609'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRUPO NISUL S.A.', NULL, NULL, '33711252709', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33711252709'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PIRGUI SRL', NULL, NULL, '33711304989', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33711304989'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'AHASA S.A. (NOVOTEL)', NULL, NULL, '33711363969', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33711363969'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ENERGE S.A.', NULL, NULL, '33711409179', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33711409179'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TRIBUCREATIVA SRL', NULL, NULL, '33711414849', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33711414849'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GRAFICA SAO PAULO', NULL, NULL, '33711617669', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33711617669'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CASINOS DEL LITORAL SA', NULL, '0379 4462244', '33711634849', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33711634849'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JOSUE ECHENIQUE S.A.', NULL, NULL, '33711673569', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33711673569'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GIRAUDO EQUIPAMIENTO S.A.', 'info@giraudoequipamiento.com', '4405555/58/59', '33712013589', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33712013589'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ASOCIACION ARGENTINA DE TUNELES Y ESPACIOS SUBTERRANEOS-AATES', NULL, NULL, '33712101429', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33712101429'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VDS RENT SRL', NULL, NULL, '33712175929', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33712175929'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'COOPERATIVA DE TRABAJO FIQUS LTDA', 'INFO@FIQUS.COM', NULL, '33712225659', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33712225659'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SUNSHINE TURISMO S.A.', NULL, NULL, '33712552129', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33712552129'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'M. PEIRANO INFORMES Y ESTUDIOS ECONOMICOS SRL', NULL, NULL, '33713158009', 'M'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33713158009'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TALLER DEL PREMIO SRL', NULL, NULL, '33713671709', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33713671709'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TR & ASOCIADOS SRL', NULL, NULL, '33713830009', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33713830009'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'PALATINUM SA', NULL, NULL, '33713972709', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33713972709'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDICIONES ETICA Y ECONOMIA S.A.', NULL, NULL, '33714018359', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33714018359'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SEIZE MARKET S.A.', NULL, NULL, '33714215979', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33714215979'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'NUAGE SISTEMS S.A.', NULL, NULL, '33714232199', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33714232199'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ESPACIOS ACTUALES SRL', NULL, NULL, '33714292949', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33714292949'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ERG NORANDINA SRL', NULL, NULL, '33714361339', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33714361339'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'UNIBIND ARGENTINA SA', NULL, NULL, '33714424829', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33714424829'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUNDACION FUNDAEDU', NULL, NULL, '33714479739', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33714479739'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'de ROGA CHEF S.A.', NULL, '0', '33714540969', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33714540969'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BE4 ADVISORS SRL', NULL, NULL, '33714768579', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33714768579'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TB & ASOCIADOS S.A.', NULL, NULL, '33714838429', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33714838429'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'MAKING EXPERIENCE SRL', NULL, NULL, '33714893489', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33714893489'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LCDTH SRL', NULL, NULL, '33715040579', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33715040579'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'IMPRESOS ANDINO SA', NULL, NULL, '33715098259', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33715098259'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'penny black srl', NULL, NULL, '33715263209', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33715263209'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FIDEICOMISO MADERO URBANO SUITES', NULL, NULL, '33715266089', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33715266089'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TECH LIFE SA', NULL, NULL, '33715298959', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33715298959'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RAUL O MATEOS SA', NULL, NULL, '33715443479', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33715443479'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALGO LIGHT S.R.L', NULL, '0351-4245924', '33715597239', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33715597239'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'OFFIDESK S.R.L.', NULL, NULL, '33715646329', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33715646329'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'DAM SQUAD SAS', NULL, NULL, '33715840109', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33715840109'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ECHEGARAY CATERING SRL', NULL, NULL, '33715863699', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33715863699'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CLARA VERA S.A.S.', NULL, NULL, '33715930329', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33715930329'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'JIJIJI S.R.L.', NULL, NULL, '33716363029', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33716363029'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EDUCORP SRL', NULL, NULL, '33716378549', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33716378549'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ALTO PIC SRL', NULL, NULL, '33716488069', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33716488069'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CIRCUS GROUP', NULL, NULL, '33716639229', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33716639229'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'EXO MINDSET S.A.S.', NULL, NULL, '33716695749', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33716695749'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'RIO CEBALLOS FLORES S.A.S.', NULL, NULL, '33717416649', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33717416649'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BAD DUCK CLEAN SRL.', NULL, '0', '33717863149', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33717863149'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BBL BERNARDO BARCENA LIDERAZGO S.R.L', NULL, NULL, '33718069349', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33718069349'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'VIGRIMO S.R.L.', NULL, NULL, '33718796089', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '33718796089'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'CIRSOC', NULL, '4349-8520/8524', '34546687068', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '34546687068'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'GOBIERNO DE LA CIUDAD DE BUENOS AIRES', NULL, NULL, '34999032089', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '34999032089'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'SERGIO BITAR CHACRA', NULL, NULL, '50000000032', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '50000000032'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'HUBSPOT INC', NULL, NULL, '50000002124', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '50000002124'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'ADOBE SYSTEMS SOFTWARE', NULL, NULL, '50000004151', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '50000004151'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'FUTURO 3030 SPA', NULL, NULL, '55000000034', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '55000000034'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'LEIGH BUREAU INTERNATIONAL', NULL, NULL, '55000002126', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '55000002126'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'BCC CONFERENCIANTES SL', NULL, NULL, '55000004102', 'I'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '55000004102'
);

INSERT INTO customers (name, email, phone, cuit_cuil, iva_condition)
SELECT 'TEAMVIEWER GmbH', NULL, NULL, '55000004382', 'E'
WHERE NOT EXISTS (
  SELECT 1 FROM customers WHERE cuit_cuil = '55000004382'
);

