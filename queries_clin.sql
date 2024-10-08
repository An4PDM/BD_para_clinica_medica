-- Consultas
USE clinica_medica;
SHOW TABLES;

-- Junção de clínica com doutor
SELECT * FROM clinica;
SELECT * FROM doutor;
SELECT * FROM clinica_doutor;

SELECT d.nome, c.nome FROM clinica c, doutor d, clinica_doutor cd
WHERE c.idC = cd.idC AND d.crm=cd.idD;

-- Identificação de doutor em mais de uma clinica
SELECT * FROM clinica_doutor cd INNER JOIN doutor d
ON cd.idD=d.crm INNER JOIN clinica c
ON c.idC = cd.idC
WHERE d.nome='Luana';

