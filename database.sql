/*
CREATE TABLE IF NOT EXISTS users (
id int(11) NOT NULL auto_increment,
type VARCHAR(20) NOT NULL,
name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
password VARCHAR(100) NOT NULL,
phone VARCHAR(20),
created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deleted_date DATETIME,
PRIMARY KEY ( id )
);

INSERT INTO users (type, name, email, password) VALUES
('active', 'Natalya Kosenko', 'sergodeeva@gmail.com', '123');
*/

-- -----------------------------------------------------
-- Database ahres
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Database ahres
-- -----------------------------------------------------
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

-- -----------------------------------------------------
-- Table ahres.users
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ahres.users (
  id INT(8) NOT NULL auto_increment,
  type NVARCHAR(10) NOT NULL ,
  name NVARCHAR(50) NOT NULL ,
  password NVARCHAR(100) NOT NULL ,
  contact_no NVARCHAR(20) NULL ,
  email_address NVARCHAR(100) NULL ,
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
  email_address NVARCHAR(100) NULL ,
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
