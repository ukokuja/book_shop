create database if not exists book_store;
use book_store;

create table if not exists book(
	book_id int unsigned auto_increment primary key,
	book_name varchar(20) not null unique
);


insert into book (book_name) values ('Harry potter');
insert into book (book_name) values ('ESSKEETIT');
insert into book (book_name) values ('Mask Off');
insert into book (book_name) values ('Kream');
insert into book (book_name) values ('LOVE');
insert into book (book_name) values ('Jumpman');
insert into book (book_name) values ('X');
insert into book (book_name) values ('Slippery');
insert into book (book_name) values ('Humble');
insert into book (book_name) values ('Kings Dead');

create table if not exists ccondition (
	condition_id int unsigned auto_increment primary key,
	condition_name varchar(20) not null unique
);

insert into ccondition (condition_name) values ('New');
insert into ccondition (condition_name) values ('Used');
insert into ccondition (condition_name) values ('Like new');
insert into ccondition (condition_name) values ('Bad');




create table if not exists editorial_book (
		editorial_book_id int unsigned auto_increment primary key,
    book_id int unsigned not null,
    publication_year int unsigned not null,
    weight float unsigned not null,
    amount_pages int unsigned not null,
    foreign key(book_id) references book(book_id),
		constraint  unique (book_id, publication_year, weight, amount_pages)
);

insert into editorial_book (book_id, publication_year, weight, amount_pages) values (1, 2010, 0.1, 200);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (2, 2010, 1.5, 100);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (3, 2011, 1, 300);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (4, 2012, 0.3, 200);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (5, 2003, 0.7, 111);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (6, 2004, 0.6, 100);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (7, 2005, 0.6, 900);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (8, 2006, 0.8, 200);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (9, 2007, 0.9, 150);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (1, 1999, 0.3, 110);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (2, 1999, 0.2, 200);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (3, 1999, 0.3, 130);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (4, 1999, 0.5, 200);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (5, 1999, 0.3, 140);
insert into editorial_book (book_id, publication_year, weight, amount_pages) values (6, 1999, 0.3, 200);


create table if not exists book_copy (
	book_copy_id int unsigned auto_increment primary key,
	original_price float unsigned not null,
  profit float unsigned not null,
	condition_id int unsigned not null,
  editorial_book_id int unsigned not null,
  foreign key(editorial_book_id) references editorial_book(editorial_book_id),
  foreign key(condition_id) references ccondition(condition_id)
);

insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 20, 1, 1);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (5, 15, 2, 2);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (16, 23, 3, 1);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (25, 22, 3, 1);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 10, 1, 1);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (5, 30, 4, 9);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 20, 1, 8);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (18, 13, 1, 8);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (8, 14, 2, 1);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (16, 23, 3, 1);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (25, 22, 3, 8);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (14, 10, 1, 1);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (5, 30, 4, 6);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 13, 1, 7);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 13, 1, 2);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (5, 15, 2, 5);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (16, 23, 3, 6);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (25, 22, 3, 1);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 10, 1, 1);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (5, 30, 4, 4);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 21, 1, 5);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (16, 23, 3, 1);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (25, 22, 3, 4);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 10, 1, 3);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (5, 30, 4, 9);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 21, 1, 7);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 21, 1, 2);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (5, 15, 2, 4);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (16, 23, 3, 2);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (25, 22, 3, 10);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 10, 1, 10);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (5, 30, 4, 1);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 20, 1, 2);

insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (16, 23, 3, 11);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (25, 22, 3, 10);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 10, 1, 10);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (5, 30, 4, 11);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 21, 1, 11);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 21, 1, 10);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (5, 15, 2, 11);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (16, 23, 3, 11);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (25, 22, 3, 11);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 10, 1, 10);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (5, 30, 4, 11);
insert into book_copy (original_price, profit, condition_id, editorial_book_id) values (15, 20, 1, 11);


create table if not exists storage (
	storage_id int unsigned auto_increment primary key,
	storage_name varchar(20) not null unique
);

insert into storage (storage_name) values ('Store');
insert into storage (storage_name) values ('Warehouse');


create table if not exists book_storage (
		book_storage_id int unsigned auto_increment primary key,
		book_copy_id int unsigned not null,
  	storage_id int unsigned not null,
		start_date date not null,
  	end_date date null,
    foreign key(book_copy_id) references book_copy(book_copy_id),
    foreign key(storage_id) references storage(storage_id),
		constraint unique(book_copy_id, start_date),
		constraint unique(book_copy_id, end_date),
		constraint unique(book_copy_id, storage_id, start_date),
		constraint unique(book_copy_id, storage_id, end_date)
);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (1, 1, '2018-03-23', '2020-07-06');
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (2, 1, '2020-01-03', '2020-01-03');
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (3, 1, '1997-05-28', null);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (4, 1, '2015-12-13', null);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (5, 1, '2012-03-11', '2013-03-11');
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (6, 1, '2019-12-01', null);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (7, 1, '2015-01-18', null);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (8, 1, '1994-12-01', null);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (9, 1, '2018-05-17', null);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (10, 2, '2004-05-29', '2005-05-14');
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (11, 2, '2001-02-05', null);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (12, 2, '1999-01-25', '2001-06-22');
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (13, 2, '1998-11-02', null);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (14, 2, '2003-10-17', null);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (15, 2, '2001-11-17', null);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (16, 2, '2004-10-24', null);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (17, 2, '1997-11-07', null);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (18, 2, '2008-12-31', null);
insert into book_storage (book_copy_id, storage_id, start_date, end_date) values (19, 2, '2003-06-29', null);


create table if not exists author (
	author_id int unsigned auto_increment primary key,
	first_name varchar(20) not null,
	last_name varchar (20) not null
);

insert into author (first_name, last_name) values ('John', 'Perez');
insert into author (first_name, last_name) values ('Charles', 'Perez');
insert into author (first_name, last_name) values ('John', 'Smith');
insert into author (first_name, last_name) values ('Jose', 'Chilavert');
insert into author (first_name, last_name) values ('Fernando', 'Cavenaghi');
insert into author (first_name, last_name) values ('Emilio', 'Diaz');
insert into author (first_name, last_name) values ('Pepe', 'Basualdo');
insert into author (first_name, last_name) values ('Mariano', 'Closs');
insert into author (first_name, last_name) values ('Diego', 'Latorre');
insert into author (first_name, last_name) values ('Gonzalo', 'Bonadeo');
insert into author (first_name, last_name) values ('German', 'Paoloski');


create table if not exists translator (
	translator_id int unsigned auto_increment primary key,
	first_name varchar(20) not null,
	last_name varchar (20) not null
);

insert into translator (first_name, last_name) values ('Charles', 'Perez');
insert into translator (first_name, last_name) values ('John', 'Perez');
insert into translator (first_name, last_name) values ('Jose', 'Smith');
insert into translator (first_name, last_name) values ('Fernando', 'Chilavert');
insert into translator (first_name, last_name) values ('Emilio', 'Cavenaghi');
insert into translator (first_name, last_name) values ('Pepe', 'Diaz');
insert into translator (first_name, last_name) values ('Mariano', 'Basualdo');
insert into translator (first_name, last_name) values ('Diego', 'Closs');
insert into translator (first_name, last_name) values ('Gonzalo', 'Latorre');
insert into translator (first_name, last_name) values ('Chicho', 'Bonadeo');
insert into translator (first_name, last_name) values ('Pepo', 'Paoloski');



create table if not exists book_author (
		book_author_id int unsigned auto_increment primary key,
		author_id int unsigned not null,
		book_id int unsigned not null,
    foreign key(book_id) references book(book_id),
    foreign key(author_id) references author(author_id),
		constraint unique (author_id, book_id)
);

insert into book_author (author_id, book_id) values (1, 5);
insert into book_author (author_id, book_id) values (2, 6);
insert into book_author (author_id, book_id) values (3, 7);
insert into book_author (author_id, book_id) values (4, 8);
insert into book_author (author_id, book_id) values (5, 9);
insert into book_author (author_id, book_id) values (6, 1);
insert into book_author (author_id, book_id) values (7, 1);
insert into book_author (author_id, book_id) values (8, 2);
insert into book_author (author_id, book_id) values (9, 2);
insert into book_author (author_id, book_id) values (1, 2);
insert into book_author (author_id, book_id) values (1, 3);
insert into book_author (author_id, book_id) values (1, 4);


create table if not exists book_translation (
		book_translation_id int unsigned auto_increment primary key,
		language_name varchar(20) not null,
  	translator_id int unsigned not null,
		book_id int unsigned not null,
    foreign key(book_id) references book(book_id),
    foreign key(translator_id) references translator(translator_id),
		constraint unique (language_name, translator_id, book_id)
);

insert into book_translation (book_id, language_name, translator_id) values (1, 'English', 1);
insert into book_translation (book_id, language_name, translator_id) values (2, 'Spanish', 2);
insert into book_translation (book_id, language_name, translator_id) values (3, 'Portuguese', 3);
insert into book_translation (book_id, language_name, translator_id) values (4, 'English', 4);
insert into book_translation (book_id, language_name, translator_id) values (5, 'English', 5);
insert into book_translation (book_id, language_name, translator_id) values (6, 'English', 6);
insert into book_translation (book_id, language_name, translator_id) values (6, 'English', 1);
insert into book_translation (book_id, language_name, translator_id) values (6, 'English', 2);




-- PURCHASE

create table if not exists purchase (
	purchase_id int unsigned auto_increment primary key,
    book_copy_id int unsigned not null,
    created_date date not null,
    foreign key(book_copy_id) references book_copy(book_copy_id)
);

insert into purchase (book_copy_id, created_date) values (1, '1997-04-05');
insert into purchase (book_copy_id, created_date) values (2, '2010-01-04');
insert into purchase (book_copy_id, created_date) values (3, '2010-04-23');
insert into purchase (book_copy_id, created_date) values (4, '2000-12-10');
insert into purchase (book_copy_id, created_date) values (5, '2007-12-18');
insert into purchase (book_copy_id, created_date) values (6, '2016-05-27');
insert into purchase (book_copy_id, created_date) values (7, '2010-03-08');
insert into purchase (book_copy_id, created_date) values (8, '2008-06-30');
insert into purchase (book_copy_id, created_date) values (9, '2018-09-29');
insert into purchase (book_copy_id, created_date) values (10, '2020-04-08');
insert into purchase (book_copy_id, created_date) values (11, '1997-02-27');
insert into purchase (book_copy_id, created_date) values (12, '2013-12-05');
insert into purchase (book_copy_id, created_date) values (13, '2002-10-29');
insert into purchase (book_copy_id, created_date) values (14, '2006-07-13');
insert into purchase (book_copy_id, created_date) values (15, '2003-08-05');




-- client
create table if not exists client (
		client_id int unsigned auto_increment primary key,
    first_name varchar(20) not null,
		last_name varchar (20) not null,
    phone_number varchar (20) not null UNIQUE,
    mobile_number varchar (20) not null UNIQUE,
		created_date date not null,
		CONSTRAINT client_name UNIQUE (first_name,last_name)

);


insert into client (first_name, last_name, phone_number, mobile_number, created_date) values ('Pepe', 'Buljubasich', '7755550127', '2025550183', '2005-03-06');
insert into client (first_name, last_name, phone_number, mobile_number, created_date) values ('Marcelo', 'Gallardo', '7755550139', '2025550198', '2019-07-28');
insert into client (first_name, last_name, phone_number, mobile_number, created_date) values ('Martiniano', 'Molina', '7755550137', '2025550134', '1994-07-13');
insert into client (first_name, last_name, phone_number, mobile_number, created_date) values ('German', 'Lux', '7755550118', '2025550185', '2018-09-04');
insert into client (first_name, last_name, phone_number, mobile_number, created_date) values ('Pity', 'Martinez', '7755550180', '2025550119', '2007-01-29');
insert into client (first_name, last_name, phone_number, mobile_number, created_date) values ('Juanfer', 'Quintero', '7755550153', '2025550166', '2013-07-18');
insert into client (first_name, last_name, phone_number, mobile_number, created_date) values ('Rafael', 'Borre', '7755550160', '2025550121', '1998-07-13');
insert into client (first_name, last_name, phone_number, mobile_number, created_date) values ('Franco', 'Armani', '7755550168', '2025550144', '2013-08-01');
insert into client (first_name, last_name, phone_number, mobile_number, created_date) values ('Lucas', 'Pratto', '7755550106', '2025550171', '1996-12-25');
insert into client (first_name, last_name, phone_number, mobile_number, created_date) values ('Nacho', 'Fernandez', '7755550169', '2025550135', '2005-09-23');
insert into client (first_name, last_name, phone_number, mobile_number, created_date) values ('Leo', 'Ponzio', '7755550194', '2025550149', '2017-02-09');
insert into client (first_name, last_name, phone_number, mobile_number, created_date) values ('Gonzalo', 'Montiel', '7755550102', '2025550107', '2020-05-29');


-- EMPLOYEE

create table if not exists address (
	address_id int unsigned auto_increment primary key,
	street_name varchar(20) not null,
	street_number int unsigned not null,
    city varchar(20) not null
);

insert into address (street_name, street_number, city) values ('Beruti', 3340, 'Buenos aires');
insert into address (street_name, street_number, city) values ('Virasoro', 940, 'Buenos aires');
insert into address (street_name, street_number, city) values ('Coronel diaz', 54, 'Corrientes');
insert into address (street_name, street_number, city) values ('Azriel', 31, 'Quilmes');
insert into address (street_name, street_number, city) values ('Bulnes', 78, 'Mendoza');
insert into address (street_name, street_number, city) values ('Diaz velez', 5, 'Rio de janeiro');
insert into address (street_name, street_number, city) values ('Dizengoff', 12, 'Tel aviv');


create table if not exists employee (
		employee_id int unsigned auto_increment primary key,
		first_name varchar(20) not null,
		last_name varchar (20) not null,
		address_id int unsigned not null,
    mobile_number varchar (20) not null unique,
    foreign key(address_id) references address(address_id)

);



insert into employee (first_name, last_name, address_id, mobile_number) values ('Pepe', 'Montiel', 1, '6035550189');
insert into employee (first_name, last_name, address_id, mobile_number) values ('Pipi', 'Romagnoli', 2, '6035550146');
insert into employee (first_name, last_name, address_id, mobile_number) values ('Pipi', 'Lux', 3, '6035550131');
insert into employee (first_name, last_name, address_id, mobile_number) values ('Marcelo', 'Molina', 4, '6035550141');
insert into employee (first_name, last_name, address_id, mobile_number) values ('Martiniano', 'Lux', 5, '6035550166');
insert into employee (first_name, last_name, address_id, mobile_number) values ('German', 'Borre', 5, '6035550151');
insert into employee (first_name, last_name, address_id, mobile_number) values ('Pity', 'Quintero', 6, '6035550130');
insert into employee (first_name, last_name, address_id, mobile_number) values ('Juanfer', 'Borre', 7, '6035550120');
insert into employee (first_name, last_name, address_id, mobile_number) values ('Rafael', 'Fernandez', 1, '6035550181');
insert into employee (first_name, last_name, address_id, mobile_number) values ('Franco', 'Pratto', 2, '6035550123');
insert into employee (first_name, last_name, address_id, mobile_number) values ('Lucas', 'Fernandez', 4, '6035550104');
insert into employee (first_name, last_name, address_id, mobile_number) values ('Nacho', 'Ponzio', 5, '6035550152');
insert into employee (first_name, last_name, address_id, mobile_number) values ('Leo', 'Montiel', 7, '6035550153');



create table if not exists payment_type (
	payment_type_id int unsigned auto_increment primary key,
    payment_name varchar(20) not null unique
);

insert into payment_type (payment_name) values ('Bit');
insert into payment_type (payment_name) values ('Transfer');
insert into payment_type (payment_name) values ('Credit card');


create table if not exists sale (
	sale_id int unsigned auto_increment primary key,
	payment_type_id int unsigned not null,
  client_id int unsigned not null,
  employee_id int unsigned not null,
  created_date date not null,
  foreign key(payment_type_id) references payment_type(payment_type_id),
	foreign key(client_id) references client(client_id),
	foreign key(employee_id) references employee(employee_id)
);

insert into sale (payment_type_id, client_id, employee_id, created_date) values (1, 1, 4, '2020-07-29');
insert into sale (payment_type_id, client_id, employee_id, created_date) values (2, 2, 6, '2020-07-29');
insert into sale (payment_type_id, client_id, employee_id, created_date) values (3, 3, 2, '2020-07-29');
insert into sale (payment_type_id, client_id, employee_id, created_date) values (1, 4, 9, '2020-07-29');
insert into sale (payment_type_id, client_id, employee_id, created_date) values (2, 5, 3, '2020-07-29');
insert into sale (payment_type_id, client_id, employee_id, created_date) values (3, 6, 4, '2020-07-29');
insert into sale (payment_type_id, client_id, employee_id, created_date) values (1, 7, 5, '2002-10-30');
insert into sale (payment_type_id, client_id, employee_id, created_date) values (2, 8, 6, '2020-07-29');
insert into sale (payment_type_id, client_id, employee_id, created_date) values (1, 9, 7, '2015-11-26');
insert into sale (payment_type_id, client_id, employee_id, created_date) values (2, 1, 8, '1993-08-16');
insert into sale (payment_type_id, client_id, employee_id, created_date) values (2, 2, 1, '2020-07-29');
insert into sale (payment_type_id, client_id, employee_id, created_date) values (2, 9, 9, '2017-12-11');
insert into sale (payment_type_id, client_id, employee_id, created_date) values (1, 8, 7, '2020-07-29');


create table if not exists book_sale (
		book_sale_id int unsigned auto_increment primary key,
    book_copy_id int unsigned not null unique,
    sale_id int unsigned not null,
    foreign key(sale_id) references sale(sale_id),
    foreign key(book_copy_id) references book_copy(book_copy_id),
		constraint unique(book_copy_id, sale_id)
);


insert into book_sale (book_copy_id, sale_id) values (1, 1);
insert into book_sale (book_copy_id, sale_id) values (2, 2);
insert into book_sale (book_copy_id, sale_id) values (3, 3);
insert into book_sale (book_copy_id, sale_id) values (4, 4);
insert into book_sale (book_copy_id, sale_id) values (5, 5);
insert into book_sale (book_copy_id, sale_id) values (6, 6);
insert into book_sale (book_copy_id, sale_id) values (7, 7);
insert into book_sale (book_copy_id, sale_id) values (8, 8);
insert into book_sale (book_copy_id, sale_id) values (9, 9);
insert into book_sale (book_copy_id, sale_id) values (10, 1);
insert into book_sale (book_copy_id, sale_id) values (11, 2);
insert into book_sale (book_copy_id, sale_id) values (12, 9);
insert into book_sale (book_copy_id, sale_id) values (13, 9);


create table if not exists delivery_type (
	delivery_type_id int unsigned auto_increment primary key,
	delivery_name varchar(20) not null,
	company_name varchar(20) not null,
	price_per_kilo float unsigned not null,
	constraint unique (delivery_name, company_name)
);

insert into delivery_type (delivery_name, company_name, price_per_kilo) values ('Registered mail', 'Israel mail', 100);
insert into delivery_type (delivery_name, company_name, price_per_kilo) values ('Regular mail', 'Israel mail', 50);
insert into delivery_type (delivery_name, company_name, price_per_kilo) values ('Fast mail', 'Israel mail', 150);
insert into delivery_type (delivery_name, company_name, price_per_kilo) values ('Pick up', 'XPress', 10);
insert into delivery_type (delivery_name, company_name, price_per_kilo) values ('Door to door', 'XPress', 200);

create table if not exists delivery_status (
	delivery_status_id int unsigned auto_increment primary key,
  delivery_status_name varchar(20) not null unique
);

insert into delivery_status (delivery_status_name) values ('Preparation');
insert into delivery_status (delivery_status_name) values ('Sent');
insert into delivery_status (delivery_status_name) values ('Waiting for pick up');
insert into delivery_status (delivery_status_name) values ('Delivered');


create table if not exists delivery (
		delivery_id int unsigned auto_increment primary key,
		tracking_number varchar(36) not null unique,
    delivery_type_id int unsigned not null,
    delivery_status_id int unsigned not null,
    foreign key(delivery_type_id) references delivery_type(delivery_type_id),
    foreign key(delivery_status_id) references delivery_status(delivery_status_id)
);


insert into delivery (tracking_number, delivery_type_id, delivery_status_id) values (uuid(), 1, 1);
insert into delivery (tracking_number, delivery_type_id, delivery_status_id) values (uuid(), 2, 2);
insert into delivery (tracking_number, delivery_type_id, delivery_status_id) values (uuid(), 3, 3);
insert into delivery (tracking_number, delivery_type_id, delivery_status_id) values (uuid(), 4, 4);
insert into delivery (tracking_number, delivery_type_id, delivery_status_id) values (uuid(), 1, 1);
insert into delivery (tracking_number, delivery_type_id, delivery_status_id) values (uuid(), 5, 2);
insert into delivery (tracking_number, delivery_type_id, delivery_status_id) values (uuid(), 2, 3);
insert into delivery (tracking_number, delivery_type_id, delivery_status_id) values (uuid(), 4, 4);
insert into delivery (tracking_number, delivery_type_id, delivery_status_id) values (uuid(), 1, 2);
insert into delivery (tracking_number, delivery_type_id, delivery_status_id) values (uuid(), 4, 1);




create table if not exists book_sale_delivery (
		book_delivery_id int unsigned auto_increment primary key,
    delivery_id int unsigned not null,
    book_sale_id int unsigned not null,
    foreign key(book_sale_id) references book_sale(book_sale_id),
    foreign key(delivery_id) references delivery(delivery_id),
		constraint unique (delivery_id, book_sale_id)
);

insert into book_sale_delivery (delivery_id, book_sale_id) values (1, 1);
insert into book_sale_delivery (delivery_id, book_sale_id) values (2, 2);
insert into book_sale_delivery (delivery_id, book_sale_id) values (3, 3);
insert into book_sale_delivery (delivery_id, book_sale_id) values (4, 4);
insert into book_sale_delivery (delivery_id, book_sale_id) values (5, 5);
insert into book_sale_delivery (delivery_id, book_sale_id) values (6, 6);
insert into book_sale_delivery (delivery_id, book_sale_id) values (7, 7);
insert into book_sale_delivery (delivery_id, book_sale_id) values (8, 8);
insert into book_sale_delivery (delivery_id, book_sale_id) values (9, 9);
insert into book_sale_delivery (delivery_id, book_sale_id) values (10, 10);


-- STORE_BUY
-- ORDER

create table if not exists oorder (
		order_id int unsigned auto_increment primary key,
		client_id int unsigned not null,
		book_id int unsigned not null,
    created_date date not null,
		foreign key(client_id) references client(client_id),
		foreign key(book_id) references book(book_id),
		CONSTRAINT UNIQUE (client_id, book_id)
);

insert into oorder (client_id, book_id, created_date) values (1, 1, '1994-01-28');
insert into oorder (client_id, book_id, created_date) values (2, 2, '2018-03-24');
insert into oorder (client_id, book_id, created_date) values (3, 3, '2006-03-14');
insert into oorder (client_id, book_id, created_date) values (4, 4, '2010-06-27');
insert into oorder (client_id, book_id, created_date) values (5, 5, '2013-04-07');
insert into oorder (client_id, book_id, created_date) values (6, 6, '2014-04-16');
insert into oorder (client_id, book_id, created_date) values (7, 7, '2011-01-27');
insert into oorder (client_id, book_id, created_date) values (8, 8, '2019-04-19');
insert into oorder (client_id, book_id, created_date) values (9, 9, '2015-04-26');
insert into oorder (client_id, book_id, created_date) values (1, 2, '1998-02-09');
insert into oorder (client_id, book_id, created_date) values (1, 3, '2006-02-26');
insert into oorder (client_id, book_id, created_date) values (1, 4, '2015-11-14');
insert into oorder (client_id, book_id, created_date) values (1, 5, '2012-12-03');
insert into oorder (client_id, book_id, created_date) values (1, 6, '1996-06-08');
insert into oorder (client_id, book_id, created_date) values (1, 7, '2004-12-17');
insert into oorder (client_id, book_id, created_date) values (1, 8, '2014-12-06');
insert into oorder (client_id, book_id, created_date) values (1, 9, '2011-10-23');



create table if not exists employee_schedule (
		employee_schedule_id int unsigned auto_increment primary key,
		employee_id int unsigned not null,
		month_id int unsigned not null,
		year_id int unsigned not null,
		hours_count int unsigned not null,
    foreign key(employee_id) references employee(employee_id),
		CONSTRAINT UNIQUE (employee_id, month_id, year_id)
);


insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (1, 1, 2020, 30);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (2, 1, 2020, 31);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (3, 1, 2020, 32);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (4, 1, 2020, 33);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (5, 1, 2020, 34);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (6, 1, 2020, 35);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (7, 1, 2020, 36);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (8, 1, 2020, 37);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (9, 1, 2020, 38);

insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (1, 2, 2020, 35);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (2, 2, 2020, 36);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (3, 2, 2020, 37);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (4, 2, 2020, 38);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (5, 2, 2020, 39);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (6, 2, 2020, 26);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (7, 2, 2020, 36);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (8, 2, 2020, 37);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (9, 2, 2020, 38);

insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (1, 3, 2020, 37);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (2, 3, 2020, 38);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (3, 3, 2020, 39);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (4, 3, 2020, 26);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (5, 3, 2020, 36);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (6, 3, 2020, 37);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (7, 3, 2020, 36);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (8, 3, 2020, 37);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (9, 3, 2020, 38);

insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (1, 4, 2020, 39);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (2, 4, 2020, 26);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (3, 4, 2020, 36);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (4, 4, 2020, 37);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (5, 4, 2020, 36);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (6, 4, 2020, 37);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (7, 4, 2020, 36);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (8, 4, 2020, 37);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (9, 4, 2020, 38);

insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (1, 5, 2020, 30);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (2, 5, 2020, 39);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (3, 5, 2020, 26);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (4, 5, 2020, 36);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (5, 5, 2020, 37);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (6, 5, 2020, 36);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (7, 5, 2020, 37);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (8, 5, 2020, 20);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (9, 5, 2020, 38);

insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (1, 6, 2020, 39);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (2, 6, 2020, 26);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (3, 6, 2020, 20);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (4, 6, 2020, 37);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (5, 6, 2020, 36);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (6, 6, 2020, 37);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (7, 6, 2020, 35);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (8, 6, 2020, 21);
insert into employee_schedule (employee_id, month_id, year_id, hours_count) values (9, 6, 2020, 15);


create table if not exists employee_history (
		employee_history_id int unsigned auto_increment primary key,
    employee_id int unsigned not null,
    hourly_salary int unsigned not null,
		start_date date not null,
		end_date date null,
    foreign key(employee_id) references employee(employee_id),
		CONSTRAINT UNIQUE (employee_id, start_date)
);

insert into employee_history (employee_id, hourly_salary, start_date) values (1, 44, '1993-09-03');
insert into employee_history (employee_id, hourly_salary, start_date) values (2, 30, '1994-07-03');
insert into employee_history (employee_id, hourly_salary, start_date) values (3, 30, '1998-04-19');
insert into employee_history (employee_id, hourly_salary, start_date) values (4, 29, '2014-10-13');
insert into employee_history (employee_id, hourly_salary, start_date) values (5, 33, '2003-09-06');
insert into employee_history (employee_id, hourly_salary, start_date) values (6, 30, '2008-03-25');
insert into employee_history (employee_id, hourly_salary, start_date) values (7, 67, '2009-07-18');
insert into employee_history (employee_id, hourly_salary, start_date) values (8, 50, '2002-06-14');
insert into employee_history (employee_id, hourly_salary, start_date) values (9, 53, '2017-10-20');
insert into employee_history (employee_id, hourly_salary, start_date) values (10, 45, '2006-04-27');
insert into employee_history (employee_id, hourly_salary, start_date) values (11, 100, '2012-05-15');
insert into employee_history (employee_id, hourly_salary, start_date) values (12, 80, '1994-12-08');
insert into employee_history (employee_id, hourly_salary, start_date) values (13, 70, '1999-02-16');

create table if not exists expenses_type (
		expenses_type_id int unsigned auto_increment primary key,
    type_name varchar(20) not null unique
);

insert into expenses_type (type_name) values ('Rental');
insert into expenses_type (type_name) values ('Arnona');
insert into expenses_type (type_name) values ('Water');
insert into expenses_type (type_name) values ('Electricity');
insert into expenses_type (type_name) values ('Phone');
insert into expenses_type (type_name) values ('Mobile');
insert into expenses_type (type_name) values ('Delivery');
insert into expenses_type (type_name) values ('Salary');
insert into expenses_type (type_name) values ('Other');



create table if not exists expenses (
		expenses_id int unsigned auto_increment primary key,
		expenses_type_id int unsigned not null,
		month_id int unsigned not null,
		year_id int unsigned not null,
    amount int unsigned not null,
    foreign key(expenses_type_id) references expenses_type(expenses_type_id),
		CONSTRAINT UNIQUE (expenses_type_id, month_id, year_id)
);

insert into expenses (expenses_type_id, month_id, year_id, amount) values (1, 1, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (2, 1, 2020, 100);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (3, 1, 2020, 300);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (4, 1, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (5, 1, 2020, 111);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (6, 1, 2020, 100);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (7, 1, 2020, 900);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (8, 1, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (9, 1, 2020, 150);

insert into expenses (expenses_type_id, month_id, year_id, amount) values (1, 2, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (2, 2, 2020, 100);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (3, 2, 2020, 300);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (4, 2, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (5, 2, 2020, 111);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (6, 2, 2020, 100);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (7, 2, 2020, 900);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (8, 2, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (9, 2, 2020, 150);

insert into expenses (expenses_type_id, month_id, year_id, amount) values (1, 3, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (2, 3, 2020, 100);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (3, 3, 2020, 300);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (4, 3, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (5, 3, 2020, 111);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (6, 3, 2020, 100);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (7, 3, 2020, 900);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (8, 3, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (9, 3, 2020, 150);

insert into expenses (expenses_type_id, month_id, year_id, amount) values (1, 4, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (2, 4, 2020, 100);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (3, 4, 2020, 300);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (4, 4, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (5, 4, 2020, 111);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (6, 4, 2020, 100);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (7, 4, 2020, 900);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (8, 4, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (9, 4, 2020, 150);

insert into expenses (expenses_type_id, month_id, year_id, amount) values (1, 5, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (2, 5, 2020, 100);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (3, 5, 2020, 300);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (4, 5, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (5, 5, 2020, 111);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (6, 5, 2020, 100);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (7, 5, 2020, 900);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (8, 5, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (9, 5, 2020, 150);

insert into expenses (expenses_type_id, month_id, year_id, amount) values (1, 6, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (2, 6, 2020, 100);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (3, 6, 2020, 300);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (4, 6, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (5, 6, 2020, 111);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (6, 6, 2020, 100);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (7, 6, 2020, 900);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (8, 6, 2020, 200);
insert into expenses (expenses_type_id, month_id, year_id, amount) values (9, 6, 2020, 150);




create table if not exists communication (
		communication_id int unsigned auto_increment primary key,
		order_id int unsigned not null,
    created_date date not null,
    foreign key(order_id) references oorder(order_id),
		CONSTRAINT UNIQUE (order_id)
);


insert into communication (order_id, created_date) values (1, '2020-07-01');
insert into communication (order_id, created_date) values (2, '2020-07-05');
insert into communication (order_id, created_date) values (3, '2020-05-07');
insert into communication (order_id, created_date) values (4, '2020-07-28');
insert into communication (order_id, created_date) values (5, '2020-07-28');
insert into communication (order_id, created_date) values (6, '2016-03-05');
