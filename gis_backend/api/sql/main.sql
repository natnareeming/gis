CREATE DATABASE IF NOT EXISTS gis_database;

USE gis_database;

CREATE TABLE IF NOT EXISTS tb_user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(255) NOT NULL,
    user_lastname VARCHAR(255) NOT NULL,
    user_address VARCHAR(255) NOT NULL,
    user_tambon VARCHAR(255) NOT NULL,
    user_amphure VARCHAR(255) NOT NULL,
    user_province VARCHAR(255) NOT NULL,
    user_postcode VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    user_type INT NOT NULL DEFAULT 1,
    user_create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    user_status INT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS tb_usertype (
    usertype_id INT PRIMARY KEY AUTO_INCREMENT,
    usertype_name VARCHAR(255) NOT NULL,
    usertype_create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usertype_update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usertype_status INT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
