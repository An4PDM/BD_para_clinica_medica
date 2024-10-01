USE clinica_medica;

-- Alteração do nome
ALTER TABLE consultorio RENAME TO clinica;
SHOW TABLES;

-- Renomeando e modificando coluna
ALTER TABLE clinica RENAME COLUMN sala TO gerente;
ALTER TABLE clinica MODIFY gerente VARCHAR(45);
DESC clinica;

INSERT INTO clinica (nome,gerente,endereco, UF) VALUES 
('Albert Einstein','José','rua abc, n 34','SP'),
('Clínica Vinte de Julho','Nicolas','rua def, n 45','MG'),
('Hospital das Rosas','Maria','rua ghi, n 12','SP'),
('Getúlio Matos','Luisa','rua jkl, n 98','SP');

ALTER TABLE cons_dou RENAME TO consultorio_doutor;
ALTER TABLE pasc_dou RENAME TO paciente_doutor;

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

-- Criar table de medicamento!!
INSERT INTO receita_medica 
(idPRC,idD,data_emissao,medicamento,CID) VALUES
(1,1,'2024-07-23','Dipirona'),
(2,1),
(3,5),
(4,2);

