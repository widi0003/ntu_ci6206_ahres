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
