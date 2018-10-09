-- -----------------------------------------------------
-- Database ahres
-- -----------------------------------------------------

-- ***********************************************************************
-- Create Database
-- ***********************************************************************
CREATE DATABASE IF NOT EXISTS ahres ;
USE ahres ;

-- -----------------------------------------------------
-- Drop Tables If Exists
-- -----------------------------------------------------
DROP TABLE IF EXISTS ahres.reservation_tables;
DROP TABLE IF EXISTS ahres.reservation_menu;
DROP TABLE IF EXISTS ahres.reservations;
DROP TABLE IF EXISTS ahres.login_history;
DROP TABLE IF EXISTS ahres.users_history;
DROP TABLE IF EXISTS ahres.user_feedback;
DROP TABLE IF EXISTS ahres.promotions;
DROP TABLE IF EXISTS ahres.users;
DROP TABLE IF EXISTS ahres.tables;
DROP TABLE IF EXISTS ahres.menu;

-- ***********************************************************************
-- Create Tables
-- ***********************************************************************
-- Table ahres.users
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ahres.users (
  id INT(8) NOT NULL auto_increment,
  type NVARCHAR(10) NOT NULL ,
  name NVARCHAR(50) NOT NULL ,
  password NVARCHAR(100) NOT NULL ,
  contact_no NVARCHAR(20) NULL ,
  email NVARCHAR(100) NULL ,
  created_date DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  updated_date DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted_date DATETIME NULL ,
  PRIMARY KEY (id)  );


-- -----------------------------------------------------
-- Table ahres.tables
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ahres.tables (
  id INT(8) NOT NULL auto_increment,
  no_of_pax INT NOT NULL ,
  PRIMARY KEY (id)  )
;


-- -----------------------------------------------------
-- Table ahres.reservations
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ahres.reservations (
  id INT(8) NOT NULL auto_increment,
  user_id INT(8) NOT NULL ,
  reserved_date DATE NOT NULL ,
  reserved_time TIME NOT NULL ,
  total_pax INT NOT NULL ,
  remarks NVARCHAR(300) NULL ,
  created_date DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  updated_date DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  cancelled_date DATETIME NULL ,
  PRIMARY KEY (id)  ,
  INDEX fk_tblREVERSATION_tblUSERS_idx (user_id ASC)  ,
  CONSTRAINT fk_tblREVERSATION_tblUSERS
    FOREIGN KEY (user_id)
    REFERENCES ahres.users (id))
;


-- -----------------------------------------------------
-- Table ahres.menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ahres.menu (
  id INT(8) NOT NULL auto_increment,
  type NVARCHAR(20) NOT NULL ,
  name NVARCHAR(50) NOT NULL ,
  image NVARCHAR(300) NULL ,
  desc_eng NVARCHAR(300) NULL ,
  desc_chinese NVARCHAR(300) NULL ,
  price INT NOT NULL ,
  PRIMARY KEY (id)  )
;


-- -----------------------------------------------------
-- Table ahres.user_feedback
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ahres.user_feedback (
  id INT(8) NOT NULL auto_increment,
  user_id INT(8) NOT NULL ,
  comments NVARCHAR(500) NULL ,
  rate INT NOT NULL ,
  show_flag NVARCHAR(1) NOT NULL ,
  created_date DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)  ,
  INDEX fk_tblUSERS_FEEDBACK_tblUSERS1_idx (user_id ASC)  ,
  CONSTRAINT fk_tblUSERS_FEEDBACK_tblUSERS1
    FOREIGN KEY (user_id)
    REFERENCES ahres.users (id))
;


-- -----------------------------------------------------
-- Table ahres.reservation_tables
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ahres.reservation_tables (
  reservation_id INT(8) NOT NULL ,
  table_id INT(8) NOT NULL ,
  INDEX fk_tblRESERVATION_DETAILS_tblREVERSATION1_idx (reservation_id ASC)  ,
  INDEX fk_reservation_tables_tables1_idx (table_id ASC)  ,
  CONSTRAINT fk_tblRESERVATION_DETAILS_tblREVERSATION1
    FOREIGN KEY (reservation_id)
    REFERENCES ahres.reservations (id),
  CONSTRAINT fk_reservation_tables_tables1
    FOREIGN KEY (table_id)
    REFERENCES ahres.tables (id))
;


-- -----------------------------------------------------
-- Table ahres.reservation_menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ahres.reservation_menu (
  reservation_id INT(8) NOT NULL ,
  menu_id INT(8) NOT NULL ,
  INDEX fk_reservation_menu_menu1_idx (menu_id ASC)  ,
  CONSTRAINT fk_reservation_menu_reservation1
    FOREIGN KEY (reservation_id)
    REFERENCES ahres.reservations (id),
  CONSTRAINT fk_reservation_menu_menu1
    FOREIGN KEY (menu_id)
    REFERENCES ahres.menu (id))
;


-- -----------------------------------------------------
-- Table ahres.login_history
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ahres.login_history (
  users_id INT(8) NOT NULL ,
  event_type NVARCHAR(6) NOT NULL ,
  event_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_login_history_users1
    FOREIGN KEY (users_id)
    REFERENCES ahres.users (id))
;


-- -----------------------------------------------------
-- Table ahres.users_history
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ahres.users_history (
  users_id INT(8) NOT NULL ,
  type NVARCHAR(10) NOT NULL ,
  name NVARCHAR(50) NOT NULL ,
  password NVARCHAR(100) NOT NULL ,
  contact_no NVARCHAR(20) NULL ,
  email NVARCHAR(100) NULL ,
  logged_date DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_users_history_users1
    FOREIGN KEY (users_id)
    REFERENCES ahres.users (id))
;


-- -----------------------------------------------------
-- Table ahres.promotions
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ahres.promotions (
  id INT(8) NOT NULL auto_increment,
  menu_id INT(8) NOT NULL ,
  start_date DATETIME NOT NULL ,
  end_date DATETIME NOT NULL ,
  promoted_price INT NOT NULL ,
  PRIMARY KEY (id)  ,
  INDEX fk_promotions_menu1_idx (menu_id ASC)  ,
  UNIQUE INDEX menu_id_UNIQUE (menu_id ASC)  ,
  UNIQUE INDEX start_date_UNIQUE (start_date ASC)  ,
  UNIQUE INDEX end_date_UNIQUE (end_date ASC)  ,
  CONSTRAINT fk_promotions_menu1
    FOREIGN KEY (menu_id)
    REFERENCES ahres.menu (id))
;


-- ***********************************************************************
-- Insert Sample Records into Tables
-- ***********************************************************************
-- -----------------------------
-- tables
-- -----------------------------
insert into ahres.tables (no_of_pax) values (2);
insert into ahres.tables (no_of_pax) values (2);
insert into ahres.tables (no_of_pax) values (2);
insert into ahres.tables (no_of_pax) values (4);
insert into ahres.tables (no_of_pax) values (4);
insert into ahres.tables (no_of_pax) values (4);
insert into ahres.tables (no_of_pax) values (5);
insert into ahres.tables (no_of_pax) values (5);
insert into ahres.tables (no_of_pax) values (5);
insert into ahres.tables (no_of_pax) values (5);
insert into ahres.tables (no_of_pax) values (6);
insert into ahres.tables (no_of_pax) values (6);
insert into ahres.tables (no_of_pax) values (8);
insert into ahres.tables (no_of_pax) values (8);
insert into ahres.tables (no_of_pax) values (8);
insert into ahres.tables (no_of_pax) values (10);
insert into ahres.tables (no_of_pax) values (10);

-- -----------------------------
-- menu
-- -----------------------------
insert into ahres.menu (type, name, image, desc_eng, price) values ('Seafood','Prawn BBQ','https://res.cloudinary.com/wkwsci/image/upload/ci6206/prawn-bbq.jpg','Prawn BBQ with clear soup.', 16);
insert into ahres.menu (type, name, image, desc_eng, price) values ('Seafood','Homemade Crab Cakes','https://res.cloudinary.com/wkwsci/image/upload/ci6206/homemade-crab-cakes.jpg','We use pure lump crab meat to make this special recipe broiled crabe cakes and ', 20);
insert into ahres.menu (type, name, image, desc_eng, price) values ('Seafood','Broiled Fish Fillet','https://res.cloudinary.com/wkwsci/image/upload/ci6206/broiled-fish-fillet.jpg','Broiled fresh whitefish fillet topped with garlic butter, lemon and pepper', 18);
insert into ahres.menu (type, name, image, desc_eng, price) values ('Seafood','Smoked Seafood Salad','https://res.cloudinary.com/wkwsci/image/upload/ci6206/smoked-seafood-salad.jpg','Smoked and marinated with avocadoes in vinaigrette.', 15);
insert into ahres.menu (type, name, image, desc_eng, price) values ('Vegetables','Green Papaya Salad','https://res.cloudinary.com/wkwsci/image/upload/ci6206/green-papaya-salad.jpg','Spicy salad made from shredded unripe papaya.', 7);

-- -----------------------------
-- promotions
-- -----------------------------
insert into ahres.promotions (menu_id,start_date,end_date,promoted_price) values (1,STR_TO_DATE('25-09-2018', '%d-%m-%Y'),STR_TO_DATE('10-10-2018', '%d-%m-%Y'),13);
insert into ahres.promotions (menu_id,start_date,end_date,promoted_price) values (4,STR_TO_DATE('21-10-2018', '%d-%m-%Y'),STR_TO_DATE('12-11-2018', '%d-%m-%Y'),12);

-- -----------------------------
-- users
-- -----------------------------
insert into ahres.users (type,name,password,contact_no,email,created_date,updated_date,deleted_date) values ('admin','Natalya','123','98456239','natalya002@e.ntu.edu.sg', sysdate(),null,null);
insert into ahres.users (type,name,password,contact_no,email,created_date,updated_date,deleted_date) values ('admin','Junzhi','TZcTJL8eKdov','54567353','junzhi001@e.ntu.edu.sg', sysdate(),null,null);
insert into ahres.users (type,name,password,contact_no,email,created_date,updated_date,deleted_date) values ('admin','Aleng','TZcTJL8eKdou','65746345','aleng001@e.ntu.edu.sg', sysdate(),sysdate(),null);
insert into ahres.users (type,name,password,contact_no,email,created_date,updated_date,deleted_date) values ('admin','Widi','TZcTJL8eKdop','73456345','widi0003@e.ntu.edu.sg', sysdate(),null,null);
insert into ahres.users (type,name,password,contact_no,email,created_date,updated_date,deleted_date) values ('admin','Ayenu','TZcTJL8eKdoo','45232534','ayenu001@e.ntu.edu.sg', sysdate(),null,null);
insert into ahres.users (type,name,password,contact_no,email,created_date,updated_date,deleted_date) values ('cust','Cust1','123','67545643','natalya002@ntu.edu.sg', sysdate(),sysdate(),null);
insert into ahres.users (type,name,password,contact_no,email,created_date,updated_date,deleted_date) values ('cust','Cust2','TZcTJL8eKdoq','78656674','junzhi001@ntu.edu.sg', sysdate(),null,null);
insert into ahres.users (type,name,password,contact_no,email,created_date,updated_date,deleted_date) values ('cust','Cust3','TZcTJL8eKdol','98765243','aleng001@ntu.edu.sg', sysdate(),null,null);
insert into ahres.users (type,name,password,contact_no,email,created_date,updated_date,deleted_date) values ('cust','Cust4','TZcTJL8eKdok','65774583','widi0003@ntu.edu.sg', sysdate(),null,sysdate());
insert into ahres.users (type,name,password,contact_no,email,created_date,updated_date,deleted_date) values ('cust','Cust5','TZcTJL8eKdos6w==','76568765','ayenu001@ntu.edu.sg', sysdate(),null,null);

-- -----------------------------
-- users_history
-- -----------------------------
insert into ahres.users_history (users_id,type,name,password,contact_no,email,logged_date) values (3,'admin','Aleng','TZcTJ123456','65746345','aleng001@e.ntu.edu.sg',sysdate());
insert into ahres.users_history (users_id,type,name,password,contact_no,email,logged_date) values (6,'cust','Cust1','TZcTJL8eKdor','67545643','natalya002@e.ntu.edu.sg',sysdate());
insert into ahres.users_history (users_id,type,name,password,contact_no,email,logged_date) values (9,'cust','Cust4','TZcTJL8eKdok','65774583','widi0003@e.ntu.edu.sg',sysdate());

-- -----------------------------
-- login_history
-- -----------------------------
insert into ahres.login_history (users_id,event_type,event_datetime) values (1,'login',sysdate());
insert into ahres.login_history (users_id,event_type,event_datetime) values (1,'logout',sysdate());

-- -----------------------------
-- reservations
-- -----------------------------
insert into ahres.reservations (user_id, reserved_date, reserved_time, total_pax, remarks, created_date, updated_date,cancelled_date) values (6,date_add(curdate(),interval 8 day),curtime(),10,'wants big table',sysdate(),null,null);
insert into ahres.reservations (user_id, reserved_date, reserved_time, total_pax, remarks, created_date, updated_date,cancelled_date) values (7,date_add(curdate(),interval 8 day),curtime(),5,null,sysdate(),sysdate(),null);
insert into ahres.reservations (user_id, reserved_date, reserved_time, total_pax, remarks, created_date, updated_date,cancelled_date) values (8,date_add(curdate(),interval 8 day),curtime(),4,'no spicy',sysdate(),null,null);
insert into ahres.reservations (user_id, reserved_date, reserved_time, total_pax, remarks, created_date, updated_date,cancelled_date) values (9,date_add(curdate(),interval 9 day),curtime(),10,null,sysdate(),null,sysdate());

-- -----------------------------
-- reservation_menu
-- -----------------------------
insert into ahres.reservation_menu (reservation_id,menu_id) values (1,1);
insert into ahres.reservation_menu (reservation_id,menu_id) values (1,2);
insert into ahres.reservation_menu (reservation_id,menu_id) values (1,3);
insert into ahres.reservation_menu (reservation_id,menu_id) values (2,3);
insert into ahres.reservation_menu (reservation_id,menu_id) values (2,4);
insert into ahres.reservation_menu (reservation_id,menu_id) values (3,2);
insert into ahres.reservation_menu (reservation_id,menu_id) values (3,4);
insert into ahres.reservation_menu (reservation_id,menu_id) values (4,1);

-- -----------------------------
-- reservation_tables
-- -----------------------------
insert into ahres.reservation_tables (reservation_id,table_id) values (1,16);
insert into ahres.reservation_tables (reservation_id,table_id) values (2,8);
insert into ahres.reservation_tables (reservation_id,table_id) values (3,4);
insert into ahres.reservation_tables (reservation_id,table_id) values (4,13);
insert into ahres.reservation_tables (reservation_id,table_id) values (4,2);

-- -----------------------------
-- user_feedback
-- -----------------------------
insert into ahres.user_feedback (user_id,comments,rate,show_flag,created_date) values (6,'taste is very nice and also service is good.','4','Y',sysdate());
insert into ahres.user_feedback (user_id,comments,rate,show_flag,created_date) values (10,'fresh meal','3','N',sysdate());

-- ***********************************************************************
-- Views
-- ***********************************************************************
CREATE OR REPLACE VIEW AHRES.V_RESERVATION_TBL_DTL
AS SELECT r.id				as resrv_id
		  , r.user_id		as user_id
		  , r.reserved_date as reserved_date
		  , r.reserved_time as reserved_time
		  , r.total_pax		as total_pax
		  , r.remarks		as remarks
		  , r.created_date	as resrv_created_date
		  , r.updated_date  as resrv_updated_date
		  , r.cancelled_date as cancelled_date
		  , u.type		     as type
		  , u.name           as name
		  , u.password	     as passwords
		  , u.contact_no     as contact_no
		  , u.email          as email
		  , u.created_date   as user_created_date
		  , u.updated_date   as user_updated_date
		  , u.deleted_date   as user_deleted_date
		  , rt.table_id      as table_id
          , t.no_of_pax      as no_of_pax
FROM AHRES.reservations r 
INNER JOIN AHRES.users u ON r.user_id = u.id
INNER JOIN AHRES.reservation_tables rt ON r.id = rt.reservation_id
INNER JOIN AHRES.tables t ON rt.table_id = t.id
;
-------------------------------
CREATE OR REPLACE VIEW AHRES.V_RESERVATION_MENU_DTL
AS SELECT r.id				as resrv_id
		  , r.user_id		as user_id
		  , r.reserved_date as reserved_date
		  , r.reserved_time as reserved_time
		  , r.total_pax		as total_pax
		  , r.remarks		as remarks
		  , r.created_date	as resrv_created_date
		  , r.updated_date  as resrv_updated_date
		  , r.cancelled_date as cancelled_date
		  , u.type		     as type
		  , u.name           as name
		  , u.password	     as passwords
		  , u.contact_no     as contact_no
		  , u.email  as email
		  , u.created_date   as user_created_date
		  , u.updated_date   as user_updated_date
		  , u.deleted_date   as user_deleted_date
		  , rm.menu_id       as menu_id
          , m.type           as menu_type
          , m.name           as menu_name
          , m.image          as image
          , m.desc_eng       as desc_eng
          , m.desc_chinese   as desc_chinese
          , m.price          as price
FROM AHRES.reservations r 
INNER JOIN AHRES.users u ON r.user_id = u.id
INNER JOIN AHRES.reservation_menu rm ON r.id = rm.reservation_id
INNER JOIN AHRES.menu m ON rm.menu_id = m.id
;
-------------------------------
commit;
