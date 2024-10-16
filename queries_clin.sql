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

SELECT * FROM clinica_doutor cd INNER JOIN doutor d
ON cd.idD=d.crm INNER JOIN clinica c
ON c.idC = cd.idC
WHERE d.nome='Josi';

-- Criação de join com repetição de valores (proposital)
SELECT d.cpfD,d.nome,c.nome 
FROM doutor d, clinica_doutor cd INNER JOIN clinica c
ON cd.idC=c.idC WHERE c.nome='Clínica de Ferraz';

-- Junção de tabelas coerente
SELECT cpfD as 'CPF', d.nome as 'Doutor', c.nome as 'Local de Trabalho'
FROM doutor d, clinica c, clinica_doutor cd 
WHERE cd.idC=c.idC AND cd.idD=d.crm;

-- Contagem de pacientes por doutor
SELECT * FROM paciente;
DESC paciente;
SELECT * FROM doutor;
SELECT * FROM paciente_doutor;

SELECT COUNT(p.nome) AS Quantidade_pacientes, d.nome AS doutor
FROM paciente p, doutor d, paciente_doutor pd
WHERE p.idP=pd.idP AND d.crm=pd.idD GROUP BY d.nome;

-- Procedure de inserção de pacientes
DELIMITER /
CREATE PROCEDURE insere_paciente (id INT, n VARCHAR(45), d DATE, e TEXT, idC INT, c CHAR(11))
BEGIN
	INSERT INTO paciente
    VALUES (id, n, d, e, idC, c);
    SELECT * FROM paciente;
END /
DELIMITER ;

DROP PROCEDURE insere_paciente;
CALL insere_paciente (11, 'Alexandre','2000-08-24','rua aladim, n 445',1,'48472264732');
CALL insere_paciente (12, 'Paola','1991-10-18','rua zebra, n 15',1,'49382202313');

-- Trigger de inserção automática de paciente na tabela paciente_doutor
DELIMITER /
CREATE TRIGGER insert_paciente_doutor 
AFTER INSERT ON paciente
FOR EACH ROW
BEGIN
    INSERT INTO paciente_doutor (idD)
    VALUES (1);
	INSERT INTO paciente_doutor
    SET idP = NEW.idP;
END /
DELIMITER ;

DROP TRIGGER insert_paciente_doutor;
CALL insere_paciente (14, 'Laura','2000-10-20','rua ornio, n 15',1,'41182102313');
SELECT * FROM paciente_doutor;
-- ## Ambos os ids devem estar preenchidos na tabela ##

-- Trigger para dados removidos de receita médica
SELECT * FROM receita_medica;
CREATE TABLE rec_del LIKE receita_medica;
SELECT * FROM rec_del;

DELIMITER /
CREATE TRIGGER receitas_deletadas 
AFTER DELETE ON receita_medica
FOR EACH ROW
BEGIN
	INSERT INTO rec_del VALUES 
    (OLD.idRC,OLD.idPRC,OLD.idD,OLD.data_emissao,OLD.CID);
END /
DELIMITER ;

DELETE FROM receita_medica WHERE idRC = 10;

-- Seleção de pacientes e respectivos doutores
SELECT p.nome AS paciente, d.nome AS doutor
FROM paciente p, doutor d, paciente_doutor pd
WHERE p.idP=pd.idP AND d.crm=pd.idD;

-- Seleção de receitas medicas com os respectivos medicamentos
SELECT * FROM receita_medica;
SELECT * FROM medicamento;
SELECT * FROM receita_medicamento;

SELECT cpfP, CID, nome as paciente, data_emissao FROM receita_medica rm
INNER JOIN paciente p ON p.idP=rm.idPRC;

-- Alterando dados repetidos na tabela 'paciente'
UPDATE paciente SET nome='Katia Ribeiro' WHERE idP=6;
UPDATE paciente SET nome='Alan Lima' WHERE idP=7;
UPDATE paciente SET nome='Carla Fontes' WHERE idP=8;
UPDATE paciente SET nome='Tailson' WHERE idP=9;
UPDATE paciente SET nome='Marcia' WHERE idP=10;

-- Especialização de cada doutor e se existem doutores com mais de uma
SELECT * FROM especializacao;
SELECT * FROM doutor;
SELECT * FROM doutor_especializacao;

SELECT d.nome as DOUTOR, e.nome as RAMO
FROM especializacao e, doutor d, doutor_especializacao de
WHERE de.idD=d.crm AND de.idE=e.idE;

-- Criação de views 


-- Criação de função que calcula o preço do medicamento


-- Criação de trigger que é acionada quando um dado é excluído





