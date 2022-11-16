create database Onlux;
use Onlux;
drop database Onlux;
CREATE TABLE empresa (
  idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30),
  CEP CHAR(9),
  numero INT,
  CNPJ CHAR(18),
  telefone VARCHAR(20)
  );
  
CREATE TABLE usuario (
  idusuario INT PRIMARY KEY auto_increment,
  nome VARCHAR(45) ,
  email VARCHAR(100) ,
  senha VARCHAR(20) ,
  fkEmpresa INT ,
  FOREIGN KEY (fkEmpresa) REFERENCES empresa (idEmpresa));

select * from usuario;
  
create table setor (
idSetor int primary key auto_increment,
nome_setor varchar(50),
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
);


create table sensor (
idSensor int primary key auto_increment,
nome_sensor varchar(50),
fkSetor int,
foreign key (fkSetor) references setor(idSetor)
);

create table historico (
idHistorico int primary key auto_increment,
luminosidade_L float,
data_hora datetime default current_timestamp,
fkSensor int,
foreign key (fkSensor) references sensor(idSensor)
);

insert into  empresa (nome, cep , numero, CNPJ, telefone) VALUES
('lux_lux', '09551020', '158', '03455894658754', '5511998765321'),
('Lumi' , '09754250' , '1020' , '05875412596548', '5511965305579'),
('Tech_lux' , '09754015' , '1649' , '04896578454121' , '5511963254479');

insert into usuario (nome, email, senha, fkEmpresa) values  
('Fernando Brandao', 'brandao@sptech.school' , 'sptech123*', 1),
('Caio Santos' , 'caio.santos@sptech.school' , 'sptech456*', 1),
('Thiago Bonacelli' , ' bonacelli@sptech.school' , 'sptech789*', 2 );

insert into setor (nome_setor, fkEmpresa) values  
		('setor1' , 1),
		('setor2' , 1),
        ('setor3' , 1),
        ('setor1' , 2),
        ('setor2' , 2),
        ('setor1' , 3),
        ('setor2' , 3),
        ('setor3' , 3);

insert into sensor (nome_sensor, fkSetor)  values  
		('sensorA' , 1),
		('sensorB' , 2),
        ('sensorC' , 3),
        ('sensorD' , 4),
        ('sensorE' , 5),
        ('sensorF' , 6),
        ('sensorG' , 7),
        ('sensorH' , 8);
  
insert into historico (luminosidade_L , fkSensor)	values
		(23 , 1 ),
		(25 , 2 ),
        (22 , 3 ),
        (23 , 4 ),
        (26 , 5 ),
        (24 , 6 ),
        (29 , 7 ),
        (27 , 8 );
