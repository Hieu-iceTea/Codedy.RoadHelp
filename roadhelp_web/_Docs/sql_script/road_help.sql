
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                           Create DataBase                                           #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# SET @DATABASE_Name = 'road_help';

DROP DATABASE IF EXISTS `road_help`;
CREATE DATABASE IF NOT EXISTS `road_help` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `road_help`;

SET time_zone = '+07:00';
ALTER DATABASE `road_help` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

# SET SQL_MODE = 'ALLOW_INVALID_DATES';

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                            Create Tables                                            #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Create Table users
DROP TABLE IF EXISTS `users`;

CREATE TABLE IF NOT EXISTS `users`
(
    `id`                  INT AUTO_INCREMENT,

    `username`            VARCHAR(64) UNIQUE         NOT NULL,
    `email`               VARCHAR(64) UNIQUE         NOT NULL,
    `password`            VARCHAR(128)               NOT NULL,

    `email_verified_at`   DATETIME,
    `verification_code`   VARCHAR(8)   DEFAULT NULL,
    `reset_password_code` VARCHAR(16)  DEFAULT NULL,
    `remember_token`      VARCHAR(128) DEFAULT NULL,

    `image`               VARCHAR(128),
    `gender`              BOOLEAN,
    `first_name`          VARCHAR(64),
    `last_name`           VARCHAR(64),
    `phone`               VARCHAR(16),
    `active`             BOOLEAN      DEFAULT TRUE,

    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT NULL,
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
    ) ENGINE InnoDB;

CREATE TABLE IF NOT EXISTS `partner`
(
    `id`                  INT AUTO_INCREMENT,

    `username`            VARCHAR(64) UNIQUE         NOT NULL,
    `email`               VARCHAR(64) UNIQUE         NOT NULL,
    `password`            VARCHAR(128)               NOT NULL,

    `email_verified_at`   DATETIME,
    `verification_code`   VARCHAR(8)   DEFAULT NULL,
    `reset_password_code` VARCHAR(16)  DEFAULT NULL,
    `remember_token`      VARCHAR(128) DEFAULT NULL,

    `image`               VARCHAR(128),
    `gender`              BOOLEAN,
    `first_name`          VARCHAR(64),
    `last_name`           VARCHAR(64),
    `phone`               VARCHAR(16),
    `rate`            FLOAT(1)            NULL,

    `active`             BOOLEAN      DEFAULT TRUE NOT NULL,

    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT NULL,
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
    ) ENGINE InnoDB;


CREATE TABLE IF NOT EXISTS `admin`
(
    `id`                  INT AUTO_INCREMENT,

    `username`            VARCHAR(64) UNIQUE         NOT NULL,
    `email`               VARCHAR(64) UNIQUE         NOT NULL,
    `password`            VARCHAR(128)               NOT NULL,

    `email_verified_at`   DATETIME,
    `verification_code`   VARCHAR(8)   DEFAULT NULL,
    `reset_password_code` VARCHAR(16)  DEFAULT NULL,
    `remember_token`      VARCHAR(128) DEFAULT NULL,

    `image`               VARCHAR(128),
    `gender`              BOOLEAN,
    `first_name`          VARCHAR(64),
    `last_name`           VARCHAR(64),
    `phone`               VARCHAR(16),
    `address`             VARCHAR(128),

    `active`             BOOLEAN      DEFAULT TRUE NOT NULL,

    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT NULL,
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
    ) ENGINE InnoDB;

CREATE TABLE IF NOT EXISTS `garage`
(
    `id`                  INT AUTO_INCREMENT,
    `partner_id`                  INT NOT NULL,
    `district_id`                  INT NOT NULL,
    `province_id`                  INT NOT NULL,

    `name`            VARCHAR(64)         NOT NULL,
    `rate`            FLOAT(1)            NULL,

    `image`               VARCHAR(128),
    `commune`          VARCHAR(64),
    `longitude`           VARCHAR(64),
    `latitude`           VARCHAR(64),
    `phone`               VARCHAR(16),
    `address`             VARCHAR(128),
    `description`             VARCHAR(500),
    `active`             BOOLEAN      DEFAULT TRUE,

    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT NULL,
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
    ) ENGINE InnoDB;

CREATE TABLE IF NOT EXISTS `ratingPartner`
(
    `id`                  INT AUTO_INCREMENT,
    `partner_id`                  INT NOT NULL,
    `user_id`                  INT NOT NULL,
    `rate_point`                  INT NOT NULL,
    `comment`            VARCHAR(256)         NULL,

    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT NULL,
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
    ) ENGINE InnoDB;

CREATE TABLE IF NOT EXISTS `ratingGarage`
(
    `id`                  INT AUTO_INCREMENT,
    `garage_id`                  INT NOT NULL,
    `user_id`                  INT NOT NULL,
    `rate_point`                  INT NOT NULL,
    `comment`            VARCHAR(256)         NULL,

    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT NULL,
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
    ) ENGINE InnoDB;


CREATE TABLE IF NOT EXISTS `issues_detail`
(
    `id`                  INT AUTO_INCREMENT,
    `user_id`                  INT NOT NULL,

    `commune`          VARCHAR(64),
    `longitude`           VARCHAR(64),
    `latitude`           VARCHAR(64),
    `phone`               VARCHAR(16),
    `address`             VARCHAR(128),
    `note_list_id`             INT null,
    `description`             VARCHAR(500),

    `status`             BOOLEAN      DEFAULT false NOT NULL,

    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT NULL,
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
    ) ENGINE InnoDB;
CREATE TABLE IF NOT EXISTS `issues`
(
    `id`                  INT AUTO_INCREMENT,
    `issues_detail_id`    INT NOT NULL,
    `total_issue`    INT NOT NULL,

    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT NULL,
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
    ) ENGINE InnoDB;

CREATE TABLE IF NOT EXISTS `note_list`
(
    `id`                  INT AUTO_INCREMENT,
    `description`    ENUM('Thủng xăm','Chết máy','Hết xăng'),

    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT NULL,
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
    ) ENGINE InnoDB;


# Create Table authorities
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE IF NOT EXISTS `authorities`
(
    `id`         INT AUTO_INCREMENT,

    `username`   VARCHAR(64)  NOT NULL,
    `authority`  VARCHAR(128) NOT NULL,

    `created_by` NVARCHAR(32) DEFAULT 'Hieu_iceTea',
    `created_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by` NVARCHAR(32) DEFAULT NULL,
    `updated_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`    INT          DEFAULT 1,
    `deleted`    BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                             Insert Data                                             #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Default password: 123456

INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUES
(13, 'Hieu_iceTea', 'DinhHieu8896@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '1996-08-08', 'Hieu_iceTea.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0868 6633 15', TRUE),
(12, 'ThiDK', 'ThiDK@fpt.edu.vn ', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'ThiDK.jpg', 2, 'Đặng Kim', 'Thi', '0868 6633 15', TRUE),
(11, 'DinhHieu8896', 'HieuNDTH1908028@fpt.edu.vn', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'DinhHieu8896.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0868 6633 15', TRUE),
(10, 'HungNPMTH1908050', 'HungNPMTH1908050@fpt.edu.vn', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'HungNPMTH1908050.jpg', 1, 'Nông Phan Mạnh', 'Hùng', '0868 6633 15', TRUE),
(9, 'HuyVQTH1909003', 'HuyVQTH1909003@fpt.edu.vn', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'HuyVQTH1909003.jpg', 1, 'Vũ Quang', 'Huy', '0868 6633 15', TRUE),
(8, 'AnhNTTH1908059', 'AnhNTTH1908059@fpt.edu.vn', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'AnhNTTH1908059.jpg', 1, 'Nguyễn Trung', 'Anh', '0868 6633 15', TRUE),
(7, 'Customer', 'codedy.demo@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'customer.jpg', 1, 'CODEDY', 'Customer', '0868 6633 15', TRUE),
(6, 'Staff_C', 'staff_c.codedy@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_c.jpg', 1, 'CODEDY', 'Staff C', '0868 6633 15', TRUE),
(5, 'Staff_B', 'staff_b.codedy@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_b.jpg', 2, 'CODEDY', 'Staff B', '0868 6633 15', TRUE),
(4, 'Staff_A', 'staff_a.codedy@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_a.jpg', 1, 'CODEDY', 'Staff A', '0868 6633 15', TRUE),
(3, 'Admin_ReadOnly', 'admin_readOnly.codedy@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'admin_readOnly.jpg', 1, 'CODEDY', 'Admin ReadOnly', '0868 6633 15', TRUE),
(2, 'Admin', 'admin.codedy@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'admin.jpg', 1, 'CODEDY', 'Admin', '0868 6633 15', TRUE),
(1, 'Host', 'host.codedy@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'host.jpg', 1, 'CODEDY', 'Host', '032 87 99 000', TRUE);


INSERT INTO authorities (username, authority)
VALUES
('Host', 'ROLE_HOST'),
('Admin', 'ROLE_ADMIN'),
('Admin_ReadOnly', 'ROLE_ADMIN_ReadOnly'),
('Staff_A', 'ROLE_STAFF'),
('Staff_B', 'ROLE_STAFF'),
('Staff_C', 'ROLE_STAFF'),
('Customer', 'ROLE_CUSTOMER'),
('DinhHieu8896', 'ROLE_CUSTOMER'),
('Hieu_iceTea', 'ROLE_HOST'),
('Hieu_iceTea', 'ROLE_ADMIN'),
('Hieu_iceTea', 'ROLE_STAFF'),
('Hieu_iceTea', 'ROLE_CUSTOMER');
