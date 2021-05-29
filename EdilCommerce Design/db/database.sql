DROP DATABASE IF EXISTS edil_commerce_design;
CREATE DATABASE edil_commerce_design;

DROP USER IF EXISTS 'edil_user'@'localhost';
CREATE USER 'edil_user'@'localhost'identified BY 'edil_user';
grant ALL ON edil_commerce_design.* to 'edil_user'@'localhost'; 

USE edil_commerce_design;

DROP TABLE IF EXISTS categoria;
CREATE TABLE categoria (
immagine			varchar(100)    not null,
nome				varchar(20)	    not null,
descrizione			varchar(50)		not null,
primary key (nome)
);

DROP TABLE IF EXISTS articolo;
CREATE TABLE articolo (
codiceArticolo		char(5)			not null,
nome				varchar(50)		not null,
immagine			varchar(100)	not null,
descrizione			varchar(300)		not null,
costo				double			not null,
nomeCategoria      varchar(20)		not null,
primary key (codiceArticolo),
foreign key (nomeCategoria) references categoria (nome)
);

DROP TABLE IF EXISTS pagamento;
CREATE TABLE pagamento (
numeroPagamento		int auto_increment		not null,
data				date                 	not null,
modalità     		varchar(20)				not null,
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
quantità 				int			not null,
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
("/EdilCommerce_Design/img/categoria/arredamento_interno.jpg", "Arredamento interno", "");
insert into categoria values
("/EdilCommerce_Design/img/categoria/esterno.jpg", "Arredamento esterno", "");
insert into categoria values
("/EdilCommerce_Design/img/categoria/rivestimento.jpg", "Rivestimento", "");
insert into categoria values
("/EdilCommerce_Design/img/categoria/vernici.jpg", "Vernici", "");
insert into categoria values
("/EdilCommerce_Design/img/categoria/ferramenta.jpg", "Ferramenta", "");
insert into categoria values
("/EdilCommerce_Design/img/categoria/utensileria.jpg", "Utensileria", "");
insert into categoria values
("/EdilCommerce_Design/img/categoria/materiali.jpg", "Materiali", "");
insert into categoria values
("/EdilCommerce_Design/img/categoria/copertura.jpg", "Copertura", "");
insert into categoria values
("/EdilCommerce_Design/img/categoria/strutture.jpg", "Struttura", "");

# arredamento Interno
insert into articolo values 
("ART00", "poltrona bianca", "/EdilCommerce_Design/img/categoria/ArredamentoInterno/poltrona.jpg", "poltrona in pelle bianca, dotata di un ottimo comfort ed eleganza (90x150)", "79.99", "Arredamento interno");
insert into articolo values 
("ART01", "tavolo", "/EdilCommerce_Design/img/categoria/ArredamentoInterno/tavolo.jpg", "tavolo in stile classico in legno di faggio (100x200)", "144.90", "Arredamento interno");
insert into articolo values
("ART02", "tavolino", "/EdilCommerce_Design/img/categoria/ArredamentoInterno/tavolino.jpg", "tavolino da salotto in stile moderno ed elegante (70x90)", "99.90", "Arredamento interno");

#arredamento Esterno
insert into articolo values
("ART03", "sdraio", "/EdilCommerce_Design/img/categoria/ArredamentoEsterno/sdraio.jpg", "sdraio per coppie dotato di copertuta per il sole (200x190)", "339.90", "Arredamento esterno");
insert into articolo values
("ART04", "barbecue", "/EdilCommerce_Design/img/categoria/ArredamentoEsterno/barbecue.jpg", "barbecue moderno adatto a tutte le fasce di età e facile da utlizzare", "289.99", "Arredamento esterno");

#Rivestimento
insert into articolo values 
("ART05", "paraschizzi da cucina", "/EdilCommerce_Design/img/categoria/Rivestimento/paraschizzi.jpg", "paraschizzi in marmo di calcare binaco con rifinture grigie", "29.90", "Rivestimento");
insert into articolo values 
("ART06", "paraschizzi per bagni", "/EdilCommerce_Design/img/categoria/Rivestimento/paraschizziBagno.jpg", "elegante paraschizzi di intarsio grigio", "24.90", "Rivestimento");

# Vernici
insert into articolo values
("ART07", "vernice verde", "/EdilCommerce_Design/img/categoria/Vernici/verde.jpg", "vernice adatta a qualsiasi tipo di superficie", "14.90", "Vernici");
insert into articolo values
("ART08", "vernice rossa", "/EdilCommerce_Design/img/categoria/Vernici/rosso.jpg", "vernice adatta a qualsiasi tipo di superficie", "14.90", "Vernici");

# Ferramenta
insert into articolo values
("ART09", "chiodo liscio", "/EdilCommerce_Design/img/categoria/Ferramenta/chiodoLiscio.jpg", "chiodo liscio da 9 cm con testina piatta", "20.00", "Ferramenta");

# Utensileria


# Materiali

# Copertura 

#Struttura



