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









