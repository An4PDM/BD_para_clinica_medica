USE clinica_medica;

-- Alteração do nome
ALTER TABLE consultorio RENAME TO clinica;
SHOW TABLES;

-- Renomeando e modificando coluna
ALTER TABLE clinica RENAME COLUMN sala TO gerente;
ALTER TABLE clinica MODIFY gerente VARCHAR(45);
DESC clinica;


ALTER TABLE cons_dou RENAME TO consultorio_doutor;
ALTER TABLE pasc_dou RENAME TO paciente_doutor;
ALTER TABLE consultorio_doutor RENAME TO clinica_doutor;

CREATE TABLE copia_clinica LIKE clinica;
INSERT INTO copia_clinica SELECT * FROM clinica;

CREATE VIEW teste AS
select * from copia_clinica;
DROP VIEW teste;

ALTER TABLE copia_clinica ADD COLUMN novacol INT;
DROP TABLE copia_clinica;

ALTER TABLE paciente MODIFY cpfP INT(11);
ALTER TABLE paciente RENAME COLUMN cpfP TO idP;
ALTER TABLE paciente ADD COLUMN cpfP CHAR(11) UNIQUE;
DESC paciente;

INSERT INTO paciente VALUES 
(1,'Ronaldo','1980-04-25','rua laravel, n 64',1),
(2,'Amanda','1990-08-27','rua Piton, n 45',1),
(3,'Alana','2001-05-30','rua 123, n 12',2),
(4,'Bob','1988-03-23','rua 456, n 09',2);
SELECT * FROM paciente;
UPDATE paciente SET idCP = 2 WHERE idP=2;
UPDATE paciente SET idCP = 3 WHERE idP=3;
UPDATE paciente SET idCP = 4 WHERE idP=4;

INSERT INTO paciente VALUES 
(5,'Juliana','2000-06-20','rua Vinil, n 78',5,'10101010101'),
(6,'Amanda','1990-08-27','rua Piton, n 45',6,'12121212121'),
(7,'Alana','2001-05-30','rua 123, n 12',7,'13131313131'),
(8,'Bob','1988-03-23','rua 456, n 09',8,'14141414141'),
(9,'Alana','2001-05-30','rua 123, n 12',9,'51515151515'),
(10,'Bob','1988-03-23','rua 456, n 09',10,'89898989898');


UPDATE paciente SET cpfP = '12334567890'
WHERE idP=1;
UPDATE paciente SET cpfP = '12234567890'
WHERE idP=2;
UPDATE paciente SET cpfP = '11234567890'
WHERE idP=3;
UPDATE paciente SET cpfP = '12345678900'
WHERE idP=4;

INSERT INTO doutor VALUES 
(1,'12345678901','Ana','2001-09-25'),
(2,'12234567890','Josi','1991-03-16'),
(3,'12334567890','Luana','2000-04-18'),
(4,'12344567890','Armando','1998-09-17'),
(5,'12345567890','Suelen','1986-04-15');
SELECT * FROM doutor;

INSERT INTO doutor VALUES 
(6,'09876543211','Luiz','1990-09-18'),
(7, '09876543210','Geraldo','2000-10-25'),
(8, '12389076543','Lidia','1998-07-16'),
(9, '11122233432','Mauro','1996-12-20'),
(10, '11222333441','Katia','1998-06-25');

INSERT INTO clinica (nome,gerente,endereco, UF) VALUES 
('Albert Einstein','José','rua abc, n 34','SP'),
('Clínica Vinte de Julho','Nicolas','rua def, n 45','MG'),
('Hospital das Rosas','Maria','rua ghi, n 12','SP'),
('Getúlio Matos','Luisa','rua jkl, n 98','SP');
SELECT * FROM clinica;
INSERT INTO clinica (nome,gerente,endereco, UF) VALUES 
('Hospital São Judas','Leticia','rua abcde, n 234','SP'),
('Clínica JP','Nadja','rua defff, n 455','MG'),
('Clínica de Ferraz','Carla','rua ghiaa, n 1112','SP'),
('Hospital RJ','Luis','rua jklSSS, n 23','RJ'),
('Clínica ABC','Suzana','rua hira, n 1212','SP'),
('Clínica MMs','Luis','rua jkluSS, n 23','RJ');

SELECT * FROM receita_medica;
ALTER TABLE receita_medica DROP COLUMN medicamento;

CREATE TABLE medicamento (
	idM INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    dose FLOAT NOT NULL,
    frequencia VARCHAR(3) NOT NULL
);

CREATE TABLE receita_medicamento (
	idRCM INT,
    idMRC INT,
    PRIMARY KEY (idRCM, idMRC),
    CONSTRAINT fk_receita_medicamento_receita FOREIGN KEY (idRCM) REFERENCES receita_medica (idRC),
    CONSTRAINT fk_receita_medicamento_medicamento FOREIGN KEY (idMRC) REFERENCES medicamento (idM)
);

-- Inserindo dados na tabela medicamento
INSERT INTO medicamento (nome, dose, frequencia) VALUES 
('Paracetamol', 500, '24h'),
('Ibuprofeno', 400, '8h'),
('Amoxicilina', 250, '12h'),
('Dipirona', 1000, '8h'),
('Losartana', 50, '24h'),
('Atorvastatina', 20, '24h'),
('Metformina', 500, '12h'),
('Omeprazol', 20, '24h'),
('Salbutamol', 100, '8h'),
('Simvastatina', 10, '24h');
SELECT * FROM medicamento;
-- Inserindo dados na tabela especializacao
INSERT INTO especializacao (idE, nome) VALUES 
(1, 'Cardiologia'), 
(2, 'Pediatria'), 
(3, 'Dermatologia'), 
(4, 'Ginecologia'), 
(5, 'Oftalmologia'), 
(6, 'Ortopedia'), 
(7, 'Psiquiatria'), 
(8, 'Cirurgia Geral'), 
(9, 'Neurologia'), 
(10, 'Endocrinologia');
SELECT * FROM especializacao;

-- Inserindo dados na tabela consultorio_doutor
INSERT INTO clinica_doutor (idC, idD) VALUES 
(1, 1),
(2, 6),
(3, 7),
(4, 3),
(5, 9),
(6, 5),
(7, 2),
(8, 8),
(9, 4),
(10, 3);

-- Inserindo dados na tabela paciente_doutor
INSERT INTO paciente_doutor (idP, idD) VALUES 
(1, 1),
(2, 6),
(3, 7),
(4, 3),
(5, 9),
(6, 5),
(7, 2),
(8, 8),
(9, 4),
(10, 3);

-- Inserindo dados na tabela receita_medica
INSERT INTO receita_medica (idPRC, idD, data_emissao, CID) VALUES 
(1, 1, '2023-07-01', 'J02.9'),
(2, 6, '2023-07-02', 'M54.5'),
(3, 7, '2023-07-03', 'A70'),
(4, 3, '2023-07-04', 'R50'),
(5, 9, '2023-07-05', 'I10'),
(6, 5, '2023-07-06', 'E78'),
(7, 2, '2023-07-07', 'E11.9'),
(8, 8, '2023-07-08', 'K21.0'),
(9, 4, '2023-07-09', 'R06.2'),
(10, 3, '2023-07-10', 'E78.5');
SELECT * FROM receita_medica;

-- Inserindo dados na tabela receita_medicamento
INSERT INTO receita_medicamento (idRCM, idMRC) VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(3, 4),
(4, 3),
(4, 5),
(5, 2),
(5, 6);
SELECT * FROM receita_medicamento;

INSERT INTO doutor_especializacao VALUES 
(1,2),
(1,8),
(2,1),
(3,7),
(3,5),
(4,2),
(5,9),
(5,4),
(6,10),
(7,3),
(8,2),
(9,8),
(10,1);








