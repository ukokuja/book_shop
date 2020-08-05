create table address
(
  address_id    int unsigned auto_increment
    primary key,
  street_name   varchar(20)  not null,
  street_number int unsigned not null,
  city          varchar(20)  not null
);

create table author
(
  author_id  int unsigned auto_increment
    primary key,
  first_name varchar(20) not null,
  last_name  varchar(20) not null
);

create table book
(
  book_id   int unsigned auto_increment
    primary key,
  book_name varchar(20) not null,
  constraint book_name
  unique (book_name)
);

create table book_author
(
  book_author_id int unsigned auto_increment
    primary key,
  author_id      int unsigned not null,
  book_id        int unsigned not null,
  constraint author_id
  unique (author_id, book_id)
);

create index book_id
  on book_author (book_id);

alter table book_author
  add constraint book_author_ibfk_1
foreign key (book_id) references book (book_id);

alter table book_author
  add constraint book_author_ibfk_2
foreign key (author_id) references author (author_id);

create table book_copy
(
  book_copy_id      int unsigned auto_increment
    primary key,
  original_price    float unsigned not null,
  profit            float unsigned not null,
  condition_id      int unsigned   not null,
  editorial_book_id int unsigned   not null
);

create index condition_id
  on book_copy (condition_id);

create index editorial_book_id
  on book_copy (editorial_book_id);

create table book_sale
(
  book_sale_id int unsigned auto_increment
    primary key,
  book_copy_id int unsigned not null,
  sale_id      int unsigned not null,
  constraint book_copy_id
  unique (book_copy_id, sale_id)
);

create index sale_id
  on book_sale (sale_id);

alter table book_sale
  add constraint book_sale_ibfk_2
foreign key (book_copy_id) references book_copy (book_copy_id);

create table book_sale_delivery
(
  book_delivery_id int unsigned auto_increment
    primary key,
  delivery_id      int unsigned not null,
  book_sale_id     int unsigned not null,
  constraint delivery_id
  unique (delivery_id, book_sale_id)
);

create index book_sale_id
  on book_sale_delivery (book_sale_id);

alter table book_sale_delivery
  add constraint book_sale_delivery_ibfk_1
foreign key (book_sale_id) references book_sale (book_sale_id);

create table book_storage
(
  book_storage_id int unsigned auto_increment
    primary key,
  book_copy_id    int unsigned not null,
  storage_id      int unsigned not null,
  start_date      date         not null,
  end_date        date         null,
  constraint book_copy_id_3
  unique (book_copy_id, storage_id, start_date),
  constraint book_copy_id_4
  unique (book_copy_id, storage_id, end_date),
  constraint book_copy_id
  unique (book_copy_id, start_date),
  constraint book_copy_id_2
  unique (book_copy_id, end_date)
);

create index storage_id
  on book_storage (storage_id);

alter table book_storage
  add constraint book_storage_ibfk_1
foreign key (book_copy_id) references book_copy (book_copy_id);

create table book_translation
(
  book_translation_id int unsigned auto_increment
    primary key,
  language_name       varchar(20)  not null,
  translator_id       int unsigned not null,
  book_id             int unsigned not null,
  constraint language_name
  unique (language_name, translator_id, book_id)
);

create index book_id
  on book_translation (book_id);

create index translator_id
  on book_translation (translator_id);

alter table book_translation
  add constraint book_translation_ibfk_1
foreign key (book_id) references book (book_id);

create table calendar
(
  dd varchar(20) not null,
  constraint dd
  unique (dd)
);

create table ccondition
(
  condition_id   int unsigned auto_increment
    primary key,
  condition_name varchar(20) not null,
  constraint condition_name
  unique (condition_name)
);

alter table book_copy
  add constraint book_copy_ibfk_2
foreign key (condition_id) references ccondition (condition_id);

create table client
(
  client_id     int unsigned auto_increment
    primary key,
  first_name    varchar(20) not null,
  last_name     varchar(20) not null,
  phone_number  varchar(20) not null,
  mobile_number varchar(20) not null,
  created_date  date        not null,
  constraint client_name
  unique (first_name, last_name),
  constraint phone_number
  unique (phone_number),
  constraint mobile_number
  unique (mobile_number)
);

create table communication
(
  communication_id int unsigned auto_increment
    primary key,
  order_id         int unsigned not null,
  created_date     date         not null,
  constraint order_id
  unique (order_id)
);

create table delivery
(
  delivery_id        int unsigned auto_increment
    primary key,
  tracking_number    varchar(36)  not null,
  delivery_type_id   int unsigned not null,
  delivery_status_id int unsigned not null,
  constraint tracking_number
  unique (tracking_number)
);

alter table book_sale_delivery
  add constraint book_sale_delivery_ibfk_2
foreign key (delivery_id) references delivery (delivery_id);

create index delivery_status_id
  on delivery (delivery_status_id);

create index delivery_type_id
  on delivery (delivery_type_id);

create table delivery_status
(
  delivery_status_id   int unsigned auto_increment
    primary key,
  delivery_status_name varchar(20) not null,
  constraint delivery_status_name
  unique (delivery_status_name)
);

alter table delivery
  add constraint delivery_ibfk_2
foreign key (delivery_status_id) references delivery_status (delivery_status_id);

create table delivery_type
(
  delivery_type_id int unsigned auto_increment
    primary key,
  delivery_name    varchar(20)    not null,
  company_name     varchar(20)    not null,
  price_per_kilo   float unsigned not null,
  constraint delivery_name
  unique (delivery_name, company_name)
);

alter table delivery
  add constraint delivery_ibfk_1
foreign key (delivery_type_id) references delivery_type (delivery_type_id);

create table editorial_book
(
  editorial_book_id int unsigned auto_increment
    primary key,
  book_id           int unsigned   not null,
  publication_year  int unsigned   not null,
  weight            float unsigned not null,
  amount_pages      int unsigned   not null,
  constraint book_id
  unique (book_id, publication_year, weight, amount_pages)
);

alter table book_copy
  add constraint book_copy_ibfk_1
foreign key (editorial_book_id) references editorial_book (editorial_book_id);

alter table editorial_book
  add constraint editorial_book_ibfk_1
foreign key (book_id) references book (book_id);

create table employee
(
  employee_id   int unsigned auto_increment
    primary key,
  first_name    varchar(20)  not null,
  last_name     varchar(20)  not null,
  address_id    int unsigned not null,
  mobile_number varchar(20)  not null,
  constraint mobile_number
  unique (mobile_number)
);

create index address_id
  on employee (address_id);

alter table employee
  add constraint employee_ibfk_1
foreign key (address_id) references address (address_id);

create table employee_history
(
  employee_history_id int unsigned auto_increment
    primary key,
  employee_id         int unsigned not null,
  hourly_salary       int unsigned not null,
  start_date          date         not null,
  end_date            date         null,
  constraint employee_id
  unique (employee_id, start_date)
);

alter table employee_history
  add constraint employee_history_ibfk_1
foreign key (employee_id) references employee (employee_id);

create table employee_schedule
(
  employee_schedule_id int unsigned auto_increment
    primary key,
  employee_id          int unsigned not null,
  month_id             int unsigned not null,
  year_id              int unsigned not null,
  hours_count          int unsigned not null,
  constraint employee_id
  unique (employee_id, month_id, year_id)
);

alter table employee_schedule
  add constraint employee_schedule_ibfk_1
foreign key (employee_id) references employee (employee_id);

create table expenses
(
  expenses_id      int unsigned auto_increment
    primary key,
  expenses_type_id int unsigned not null,
  month_id         int unsigned not null,
  year_id          int unsigned not null,
  amount           int unsigned not null,
  constraint expenses_type_id
  unique (expenses_type_id, month_id, year_id)
);

create table expenses_type
(
  expenses_type_id int unsigned auto_increment
    primary key,
  type_name        varchar(20) not null,
  constraint type_name
  unique (type_name)
);

alter table expenses
  add constraint expenses_ibfk_1
foreign key (expenses_type_id) references expenses_type (expenses_type_id);

create table oorder
(
  order_id     int unsigned auto_increment
    primary key,
  client_id    int unsigned not null,
  book_id      int unsigned not null,
  created_date date         not null,
  constraint client_id
  unique (client_id, book_id)
);

alter table communication
  add constraint communication_ibfk_1
foreign key (order_id) references oorder (order_id);

create index book_id
  on oorder (book_id);

alter table oorder
  add constraint oorder_ibfk_1
foreign key (client_id) references client (client_id);

alter table oorder
  add constraint oorder_ibfk_2
foreign key (book_id) references book (book_id);

create table payment_type
(
  payment_type_id int unsigned auto_increment
    primary key,
  payment_name    varchar(20) not null,
  constraint payment_name
  unique (payment_name)
);

create table purchase
(
  purchase_id  int unsigned auto_increment
    primary key,
  book_copy_id int unsigned not null,
  created_date date         not null
);

create index book_copy_id
  on purchase (book_copy_id);

alter table purchase
  add constraint purchase_ibfk_1
foreign key (book_copy_id) references book_copy (book_copy_id);

create table sale
(
  sale_id         int unsigned auto_increment
    primary key,
  payment_type_id int unsigned not null,
  client_id       int unsigned not null,
  employee_id     int unsigned not null,
  created_date    date         not null
);

alter table book_sale
  add constraint book_sale_ibfk_1
foreign key (sale_id) references sale (sale_id);

create index client_id
  on sale (client_id);

create index employee_id
  on sale (employee_id);

create index payment_type_id
  on sale (payment_type_id);

alter table sale
  add constraint sale_ibfk_1
foreign key (payment_type_id) references payment_type (payment_type_id);

alter table sale
  add constraint sale_ibfk_2
foreign key (client_id) references client (client_id);

alter table sale
  add constraint sale_ibfk_3
foreign key (employee_id) references employee (employee_id);

create table storage
(
  storage_id   int unsigned auto_increment
    primary key,
  storage_name varchar(20) not null,
  constraint storage_name
  unique (storage_name)
);

alter table book_storage
  add constraint book_storage_ibfk_2
foreign key (storage_id) references storage (storage_id);

create table translator
(
  translator_id int unsigned auto_increment
    primary key,
  first_name    varchar(20) not null,
  last_name     varchar(20) not null
);

alter table book_translation
  add constraint book_translation_ibfk_2
foreign key (translator_id) references translator (translator_id);
