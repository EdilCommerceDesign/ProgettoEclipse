DROP DATABASE IF EXISTS edil_commerce_design;
CREATE DATABASE edil_commerce_design;

DROP USER IF EXISTS 'edil_user'@'localhost';
CREATE USER 'edil_user'@'localhost'identified BY 'edil_user';
grant ALL ON edil_commerce_design.* to 'edil_user'@'localhost'; 

USE edil_commerce_design;

DROP TABLE IF EXISTS categoria;
CREATE TABLE categoria (
immagine			varchar(50)    		not null,
nome				varchar(20)	    not null,
descrizione			varchar(50)		not null,
primary key (nome)
);

DROP TABLE IF EXISTS articolo;
CREATE TABLE articolo (
codiceArticolo		char(5)			not null,
nome				varchar(30)		not null,
immagine			blob    		not null,
descrizione			varchar(30)		not null,
costo				double			not null,
nomeCategoria      varchar(20)		not null,
primary key (codiceArticolo),
foreign key (nomeCategoria) references categoria (nome)
);

DROP TABLE IF EXISTS pagamento;
CREATE TABLE pagamento (
numeroPagamento		int auto_increment		not null,
data				date                 	not null,
modalità    		varchar(20)				not null,
importo				double					not null,
primary key (numeroPagamento)
) auto_increment=1;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
username   	    varchar(20)   	not null,
nome			varchar(20)		not null,
cognome			varchar(20)		not null,
email			varchar(20)		not null,
telefono		varchar(15)		not null,
indirizzo		varchar(20)		not null,
userPassword	varchar(20)		not null,
primary key (username)
);

DROP TABLE IF EXISTS ruolo;
CREATE TABLE ruolo (
nome			varchar(20)		not null,
primary key (nome)
);

DROP TABLE IF EXISTS ordine;
CREATE TABLE ordine (
numeroOrdine 		int auto_increment		not null,
data				date 					not null,	
username			varchar(20)				not null,
primary key (numeroOrdine),
foreign key (username) references user (username) ON UPDATE CASCADE
)    auto_increment=1;

DROP TABLE IF EXISTS compone;
CREATE TABLE compone (
numeroOrdine			int		not null,
codiceArticolo    		char(5)		not null,
quantità				int			not null,
primary key (numeroOrdine, codiceArticolo),
foreign key (numeroOrdine) references ordine (numeroOrdine),
foreign key (codiceArticolo) references articolo (codiceArticolo)
);

DROP TABLE IF EXISTS recensisce;
CREATE TABLE recensisce (
codiceArticolo    		char(5)						not null,
username				varchar(20) 				not null,
data					date						not null,
valore					enum ("1","2","3","4","5")	not null,
testo					text(500)					not null,
primary key (username, codiceArticolo),
foreign key (username) references user (username) ON UPDATE CASCADE,
foreign key (codiceArticolo) references articolo (codiceArticolo)
);

DROP TABLE IF EXISTS ruoloUser;
CREATE TABLE ruoloUser (
username   	    varchar(20)   	not null,
nome			varchar(20)		not null,
primary key (username, nome),
foreign key (username) references user (username) ON UPDATE CASCADE,
foreign key (nome) references ruolo (nome)
);

INSERT INTO ruolo(nome) VALUES ("user");
INSERT INTO ruolo(nome) VALUES ("admin");

INSERT INTO user VALUES ("admin", "nome", "cognome", "admin@email.com", "telefono", "indirizzo", "admin");

INSERT INTO ruoloUser VALUES ("admin", "user");
INSERT INTO ruoloUser VALUES ("admin", "admin");

insert into categoria values
("arredamento_interno.jpg", "Arredamento interno", "Mobili e accessori per ambienti interni ");
insert into categoria values
("esterno.jpg", "Arredamento esterno", "Mobili e accessori per ambienti esterni");
insert into categoria values
("rivestimento.jpg", "Rivestimento", "");
insert into categoria values
("vernici.jpg", "Vernici", "");
insert into categoria values
("ferramenta.jpg", "Ferramnenta", "");
insert into categoria values
("utensileria.jpg", "Utensileria", "");
insert into categoria values
("materiali.jpg", "Materiali", "");
insert into categoria values
("copertua.jpg", "Copertura", "");
insert into categoria values
("strutture.jpg", "Struttura", "")



