CREATE DATABASE clinica_medica;
USE clinica_medica;
 
 CREATE TABLE consultorio (
	idC INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    sala INT NOT NULL,
    endereco TEXT,
    UF CHAR(2)
);
 
CREATE TABLE paciente (
	cpfP INT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco TEXT,
    idCP INT,
    FOREIGN KEY (idCP) REFERENCES consultorio(idC)
);
 
CREATE TABLE doutor (
	crm INT PRIMARY KEY,
    cpfD CHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(45) NOT NULL,
    data_nascimento DATE NOT NULL  
);
 
 
CREATE TABLE receita_medica (
	idRC INT PRIMARY KEY AUTO_INCREMENT,
    idPRC INT,
    idD INT,
    data_emissao DATE NOT NULL,
    medicamento VARCHAR(45),
    CID VARCHAR(45),
    FOREIGN KEY (idPRC) REFERENCES paciente(cpfP),
    FOREIGN KEY (idD) REFERENCES doutor(crm)
);
 
CREATE TABLE especializacao (
	idE INT PRIMARY KEY,
    nome VARCHAR(45)
);

CREATE TABLE cons_dou (
	idC INT,
    idD INT,
    PRIMARY KEY (idC,idD),
	CONSTRAINT fk_cons_dou_consultorio FOREIGN KEY (idC) REFERENCES consultorio(idC),
    CONSTRAINT fk_cons_dou_doutor FOREIGN KEY (idD) REFERENCES doutor(crm)
);

CREATE TABLE pasc_dou (
	idP INT,
    idD INT,
    PRIMARY KEY(idP,idD),
    CONSTRAINT fk_pasc_dou_paciente FOREIGN KEY (idP) REFERENCES paciente(cpfP),
    CONSTRAINT fk_pasc_dou_doutor FOREIGN KEY (idD) REFERENCES doutor(crm)
);

CREATE TABLE doutor_especializacao (
	idD INT,
    idE INT,
    PRIMARY KEY (idD,idE),
    CONSTRAINT fk_dou_espe_doutor FOREIGN KEY (idD) REFERENCES doutor(crm),
    CONSTRAINT fk_dou_espe_especializacao FOREIGN KEY (idE) REFERENCES especializacao(idE)
);



