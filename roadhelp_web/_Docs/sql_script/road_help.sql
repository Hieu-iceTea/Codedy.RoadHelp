
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

DROP TABLE IF EXISTS `partner`;
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

DROP TABLE IF EXISTS `admin`;
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

DROP TABLE IF EXISTS `garage`;
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

DROP TABLE IF EXISTS `ratingPartner`;
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

DROP TABLE IF EXISTS `ratingGarage`;
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

DROP TABLE IF EXISTS `issues_detail`;
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
DROP TABLE IF EXISTS `issues`;
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

DROP TABLE IF EXISTS `note_list`;
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
#
# INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
# VALUES
# (13, 'Hieu_iceTea', 'DinhHieu8896@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '1996-08-08', 'Hieu_iceTea.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0868 6633 15', TRUE),
# (12, 'ThiDK', 'ThiDK@fpt.edu.vn ', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'ThiDK.jpg', 2, 'Đặng Kim', 'Thi', '0868 6633 15', TRUE),
# (11, 'DinhHieu8896', 'HieuNDTH1908028@fpt.edu.vn', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'DinhHieu8896.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0868 6633 15', TRUE),
# (10, 'HungNPMTH1908050', 'HungNPMTH1908050@fpt.edu.vn', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'HungNPMTH1908050.jpg', 1, 'Nông Phan Mạnh', 'Hùng', '0868 6633 15', TRUE),
# (9, 'HuyVQTH1909003', 'HuyVQTH1909003@fpt.edu.vn', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'HuyVQTH1909003.jpg', 1, 'Vũ Quang', 'Huy', '0868 6633 15', TRUE),
# (8, 'AnhNTTH1908059', 'AnhNTTH1908059@fpt.edu.vn', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'AnhNTTH1908059.jpg', 1, 'Nguyễn Trung', 'Anh', '0868 6633 15', TRUE),
# (7, 'Customer', 'codedy.demo@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'customer.jpg', 1, 'CODEDY', 'Customer', '0868 6633 15', TRUE),
# (6, 'Staff_C', 'staff_c.codedy@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_c.jpg', 1, 'CODEDY', 'Staff C', '0868 6633 15', TRUE),
# (5, 'Staff_B', 'staff_b.codedy@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_b.jpg', 2, 'CODEDY', 'Staff B', '0868 6633 15', TRUE),
# (4, 'Staff_A', 'staff_a.codedy@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_a.jpg', 1, 'CODEDY', 'Staff A', '0868 6633 15', TRUE),
# (3, 'Admin_ReadOnly', 'admin_readOnly.codedy@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'admin_readOnly.jpg', 1, 'CODEDY', 'Admin ReadOnly', '0868 6633 15', TRUE),
# (2, 'Admin', 'admin.codedy@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'admin.jpg', 1, 'CODEDY', 'Admin', '0868 6633 15', TRUE),
# (1, 'Host', 'host.codedy@gmail.com', '{bcrypt}$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'host.jpg', 1, 'CODEDY', 'Host', '032 87 99 000', TRUE);
#region Insert Users
INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (1, 'Host', 'host.codedy@gmail.com', '$2y$10$oW..IGNT/CH2muKpN/8LAuNJ1ahnwLoyCBWRQyBj4p6ITOJFb.gs2', '2021-08-08', 'host.jpg', 1, 'CODEDY', 'Host', '032 87 99 000', TRUE);

INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (2, 'Admin', 'admin.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'admin.jpg', 1, 'CODEDY', 'Admin', '0868 6633 15', TRUE);

INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (3, 'Admin_Demo', 'admin_demo.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'admin_demo.jpg', 1, 'CODEDY', 'Admin Demo', '0868 6633 15', FALSE);

INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (4, 'Staff_A', 'staff_a.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_a.jpg', 1, 'CODEDY', 'Staff A', '0868 6633 15', TRUE);

INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (5, 'Staff_B', 'staff_b.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_b.jpg', 2, 'CODEDY', 'Staff B', '0868 6633 15', TRUE);

INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (6, 'Customer', 'codedy.demo@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'customer.jpg', 1, 'CODEDY', 'Customer', '0868 6633 15', TRUE);

INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (7, 'AnhNTTH1908059', 'AnhNTTH1908059@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'AnhNTTH1908059.jpg', 1, 'Nguyễn Trung', 'Anh', '0868 6633 15', TRUE);

INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (8, 'HuyVQTH1909003', 'HuyVQTH1909003@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'HuyVQTH1909003.jpg', 1, 'Vũ Quang', 'Huy', '0868 6633 15', TRUE);

INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (9, 'HungNPMTH1908050', 'HungNPMTH1908050@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'HungNPMTH1908050.jpg', 1, 'Nông Phan Mạnh', 'Hùng', '0868 6633 15', TRUE);

INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (10, 'DinhHieu9999', 'HieuNDTH1908028@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'DinhHieu9999.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0868 6633 15', TRUE);

INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (11, 'ManhHung', 'ThiDK@fpt.edu.vn ', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'ManhHung.jpg', 2, 'Đặng Kim', 'Thi', '0868 6633 15', TRUE);

INSERT INTO users (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (12, 'Staff_C', 'staff_c.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_c.jpg', 1, 'CODEDY', 'Staff C', '0868 6633 15', TRUE);


#endregion

#region Insert Admin
INSERT INTO admin (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (12, 'Staff_C', 'staff_c.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_c.jpg', 1, 'CODEDY', 'Staff C', '0868 6633 15', TRUE);

INSERT INTO admin (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (11, 'ManhHung', 'ThiDK@fpt.edu.vn ', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'ManhHung.jpg', 2, 'Đặng Kim', 'Thi', '0868 6633 15', TRUE);

INSERT INTO admin (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (10, 'DinhHieu9999', 'HieuNDTH1908028@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'DinhHieu9999.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0868 6633 15', TRUE);

INSERT INTO admin (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (9, 'HungNPMTH1908050', 'HungNPMTH1908050@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'HungNPMTH1908050.jpg', 1, 'Nông Phan Mạnh', 'Hùng', '0868 6633 15', TRUE);

INSERT INTO admin (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (8, 'HuyVQTH1909003', 'HuyVQTH1909003@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'HuyVQTH1909003.jpg', 1, 'Vũ Quang', 'Huy', '0868 6633 15', TRUE);

INSERT INTO admin (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (7, 'AnhNTTH1908059', 'AnhNTTH1908059@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'AnhNTTH1908059.jpg', 1, 'Nguyễn Trung', 'Anh', '0868 6633 15', TRUE);

INSERT INTO admin (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (6, 'Customer', 'codedy.demo@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'customer.jpg', 1, 'CODEDY', 'Customer', '0868 6633 15', TRUE);

INSERT INTO admin (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (5, 'Staff_B', 'staff_b.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_b.jpg', 2, 'CODEDY', 'Staff B', '0868 6633 15', TRUE);

INSERT INTO admin (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (4, 'Staff_A', 'staff_a.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_a.jpg', 1, 'CODEDY', 'Staff A', '0868 6633 15', TRUE);

INSERT INTO admin (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (3, 'Admin_Demo', 'admin_demo.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'admin_demo.jpg', 1, 'CODEDY', 'Admin Demo', '0868 6633 15', FALSE);

INSERT INTO admin (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (2, 'Admin', 'admin.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'admin.jpg', 1, 'CODEDY', 'Admin', '0868 6633 15', TRUE);

INSERT INTO admin (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (1, 'Host', 'host.codedy@gmail.com', '$2y$10$oW..IGNT/CH2muKpN/8LAuNJ1ahnwLoyCBWRQyBj4p6ITOJFb.gs2', '2021-08-08', 'host.jpg', 1, 'CODEDY', 'Host', '032 87 99 000', TRUE);


#endregion
#region Insert partner
INSERT INTO partner (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (12, 'Staff_C', 'staff_c.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_c.jpg', 1, 'CODEDY', 'Staff C', '0868 6633 15', TRUE);

INSERT INTO partner (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (11, 'ManhHung', 'ThiDK@fpt.edu.vn ', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'ManhHung.jpg', 2, 'Đặng Kim', 'Thi', '0868 6633 15', TRUE);

INSERT INTO partner (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (10, 'DinhHieu9999', 'HieuNDTH1908028@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'DinhHieu9999.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0868 6633 15', TRUE);

INSERT INTO partner (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (9, 'HungNPMTH1908050', 'HungNPMTH1908050@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'HungNPMTH1908050.jpg', 1, 'Nông Phan Mạnh', 'Hùng', '0868 6633 15', TRUE);

INSERT INTO partner (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (8, 'HuyVQTH1909003', 'HuyVQTH1909003@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'HuyVQTH1909003.jpg', 1, 'Vũ Quang', 'Huy', '0868 6633 15', TRUE);

INSERT INTO partner (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (7, 'AnhNTTH1908059', 'AnhNTTH1908059@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'AnhNTTH1908059.jpg', 1, 'Nguyễn Trung', 'Anh', '0868 6633 15', TRUE);

INSERT INTO partner (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (6, 'Customer', 'codedy.demo@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'customer.jpg', 1, 'CODEDY', 'Customer', '0868 6633 15', TRUE);

INSERT INTO partner (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (5, 'Staff_B', 'staff_b.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_b.jpg', 2, 'CODEDY', 'Staff B', '0868 6633 15', TRUE);

INSERT INTO partner (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (4, 'Staff_A', 'staff_a.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'staff_a.jpg', 1, 'CODEDY', 'Staff A', '0868 6633 15', TRUE);

INSERT INTO partner (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (3, 'Admin_Demo', 'admin_demo.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'admin_demo.jpg', 1, 'CODEDY', 'Admin Demo', '0868 6633 15', FALSE);

INSERT INTO partner (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (2, 'Admin', 'admin.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe', '2021-08-08', 'admin.jpg', 1, 'CODEDY', 'Admin', '0868 6633 15', TRUE);

INSERT INTO partner (id, username, email, password, email_verified_at, image, gender, first_name, last_name, phone, active)
VALUE (1, 'Host', 'host.codedy@gmail.com', '$2y$10$oW..IGNT/CH2muKpN/8LAuNJ1ahnwLoyCBWRQyBj4p6ITOJFb.gs2', '2021-08-08', 'host.jpg', 1, 'CODEDY', 'Host', '032 87 99 000', TRUE);

#endregion
#region Insert garage
INSERT INTO garage (id,partner_id,district_id,province_id,name,rate,commune,longitude,latitude,  image , address, description, phone, active)
VALUE (1,'1','1','1', 'Host', '4', '', '', '','host.jpg',  'CODEDY', 'Host', '032 87 99 000', TRUE);

INSERT INTO garage (id,partner_id,district_id,province_id,name,rate,commune,longitude,latitude,  image , address, description, phone, active)
VALUE (2,'2','2','2', 'Admin', '5', '', '', '','admin.jpg',  'CODEDY', 'Admin', '0868 6633 15', TRUE);

INSERT INTO garage (id,partner_id,district_id,province_id,name,rate,commune,longitude,latitude,  image , address, description, phone, active)
VALUE (3,'3','3','3', 'Admin_Demo', '4', '', '', '','admin_demo.jpg',  'CODEDY', 'Admin Demo', '0868 6633 15', FALSE);

INSERT INTO garage (id,partner_id,district_id,province_id,name,rate,commune,longitude,latitude,  image , address, description, phone, active)
VALUE (4,'4','4','4', 'Staff_A', '5', '', '', '','staff_a.jpg',  'CODEDY', 'Staff A', '0868 6633 15', TRUE);

INSERT INTO garage (id,partner_id,district_id,province_id,name,rate,commune,longitude,latitude,  image , address, description, phone, active)
VALUE (5,'5','5','5', 'Staff_B', '4', '', '', '','staff_b.jpg',  'CODEDY', 'Staff B', '0868 6633 15', TRUE);

INSERT INTO garage (id,partner_id,district_id,province_id,name,rate,commune,longitude,latitude,  image , address, description, phone, active)
VALUE (6,'6','6','6', 'Customer', '5', '', '', '','customer.jpg',  'CODEDY', 'Customer', '0868 6633 15', TRUE);

INSERT INTO garage (id,partner_id,district_id,province_id,name,rate,commune,longitude,latitude,  image , address, description, phone, active)
VALUE (7,'7','7','7', 'AnhNTTH1908059', '4', '', '', '','AnhNTTH1908059.jpg',  'Nguyễn Trung', 'Anh', '0868 6633 15', TRUE);

INSERT INTO garage (id,partner_id,district_id,province_id,name,rate,commune,longitude,latitude,  image , address, description, phone, active)
VALUE (8,'8','8','8', 'HuyVQTH1909003', '5', '', '', '','HuyVQTH1909003.jpg',  'Vũ Quang', 'Huy', '0868 6633 15', TRUE);

INSERT INTO garage (id,partner_id,district_id,province_id,name,rate,commune,longitude,latitude,  image , address, description, phone, active)
VALUE (9,'9','9','9', 'HungNPMTH1908050', '4', '', '', '','HungNPMTH1908050.jpg',  'Nông Phan Mạnh', 'Hùng', '0868 6633 15', TRUE);

INSERT INTO garage (id,partner_id,district_id,province_id,name,rate,commune,longitude,latitude,  image , address, description, phone, active)
VALUE (10,'10','10','10', 'DinhHieu9999', '5', '', '', '','DinhHieu9999.jpg',  'Nguyễn Đình', 'Hiếu', '0868 6633 15', TRUE);

INSERT INTO garage (id,partner_id,district_id,province_id,name,rate,commune,longitude,latitude,  image , address, description, phone, active)
VALUE (11,'11','11','11', 'ManhHung', '4', '', '', '','ManhHung.jpg',  'Đặng Kim', 'Thi', '0868 6633 15', TRUE);

INSERT INTO garage (id,partner_id,district_id,province_id,name,rate,commune,longitude,latitude,  image , address, description, phone, active)
VALUE (12,'12','12','12', 'Staff_C', '5', '', '', '','staff_c.jpg',  'CODEDY', 'Staff C', '0868 6633 15', TRUE);



#endregion
#region Insert notelist
INSERT INTO note_list(id, description)
VALUE (1, 'hết xăng');

INSERT INTO note_list(id, description)
VALUE (2, 'chết máy');

INSERT INTO note_list(id, description)
VALUE (3, 'thủng xăm');


#endregion
#region Insert issuesdetail
INSERT INTO issues_detail(id, user_id, commune, longitude, latitude, phone,address, note_list_id, description, status)
VALUE (1, 1, 'VietNam', '333', '333',  '123456789',  'HN',  '1','', '0');

INSERT INTO issues_detail(id, user_id, commune, longitude, latitude, phone,address, note_list_id, description, status)
VALUE (2, 2, 'VietNam', '5555', '5555',  '123456789',  'HN',  '2','', '0');

INSERT INTO issues_detail(id, user_id, commune, longitude, latitude, phone,address, note_list_id, description, status)
VALUE (3, 3, 'VietNam', '6665', '6665',  '123456789',  'HN',  '1','', '0');

INSERT INTO issues_detail(id, user_id, commune, longitude, latitude, phone,address, note_list_id, description, status)
VALUE (4, 4, 'VietNam', '775', '775',  '123456789',  'HN',  '3','', '0');

INSERT INTO issues_detail(id, user_id, commune, longitude, latitude, phone,address, note_list_id, description, status)
VALUE (5, 5, 'VietNam', '88', '333',  '123456789',  'HN',  '2','', '0');

INSERT INTO issues_detail(id, user_id, commune, longitude, latitude, phone,address, note_list_id, description, status)
VALUE (6, 6, 'VietNam', '333', '5555',  '123456789',  'HN',  '1','', '0');

INSERT INTO issues_detail(id, user_id, commune, longitude, latitude, phone,address, note_list_id, description, status)
VALUE (7, 7, 'VietNam', '5555', '6665',  '123456789',  'HN',  '3','', '0');

INSERT INTO issues_detail(id, user_id, commune, longitude, latitude, phone,address, note_list_id, description, status)
VALUE (8, 8, 'VietNam', '6665', '775',  '123456789',  'HN',  '2','', '0');

INSERT INTO issues_detail(id, user_id, commune, longitude, latitude, phone,address, note_list_id, description, status)
VALUE (9, 9, 'VietNam', '775', '333',  '123456789',  'HN',  '1','', '0');

INSERT INTO issues_detail(id, user_id, commune, longitude, latitude, phone,address, note_list_id, description, status)
VALUE (10, 10, 'VietNam', '88', '5555',  '123456789',  'HN',  '3','', '0');

INSERT INTO issues_detail(id, user_id, commune, longitude, latitude, phone,address, note_list_id, description, status)
VALUE (11, 11, 'VietNam', '775', '6665',  '123456789',  'HN',  '2','', '0');

INSERT INTO issues_detail(id, user_id, commune, longitude, latitude, phone,address, note_list_id, description, status)
VALUE (12, 12, 'VietNam', '88', '775',  '123456789',  'HN',  '1','', '0');



#endregion
#region Insert issues
INSERT INTO issues(id, issues_detail_id, total_issue)
VALUE (1, 100,100);

INSERT INTO issues(id, issues_detail_id, total_issue)
VALUE (2, 200,200);

INSERT INTO issues(id, issues_detail_id, total_issue)
VALUE (3, 300,300);

INSERT INTO issues(id, issues_detail_id, total_issue)
VALUE (4, 400,400);

INSERT INTO issues(id, issues_detail_id, total_issue)
VALUE (5, 500,500);

INSERT INTO issues(id, issues_detail_id, total_issue)
VALUE (6, 600,600);

INSERT INTO issues(id, issues_detail_id, total_issue)
VALUE (7, 700,700);

INSERT INTO issues(id, issues_detail_id, total_issue)
VALUE (8, 800,800);

INSERT INTO issues(id, issues_detail_id, total_issue)
VALUE (9, 900,900);

INSERT INTO issues(id, issues_detail_id, total_issue)
VALUE (10, 1000,1000);

INSERT INTO issues(id, issues_detail_id, total_issue)
VALUE (11, 1100,1100);

INSERT INTO issues(id, issues_detail_id, total_issue)
VALUE (12, 1200,1200);


#endregion
#region Insert ratingGarage
INSERT INTO ratingGarage (id, user_id, garage_id, rate_point, comment)
VALUE (1, 1, '1', '3', 'Very good.');

INSERT INTO ratingGarage (id, user_id, garage_id, rate_point, comment)
VALUE (2, 2, '2', '5', 'Good ');

INSERT INTO ratingGarage (id, user_id, garage_id, rate_point, comment)
VALUE (3, 3, '3', '5', 'Very good.');

INSERT INTO ratingGarage (id, user_id, garage_id, rate_point, comment)
VALUE (4, 4, '4', '5', 'Very good.');

INSERT INTO ratingGarage (id, user_id, garage_id, rate_point, comment)
VALUE (5, 5, '5', '5', 'Good ');

INSERT INTO ratingGarage (id, user_id, garage_id, rate_point, comment)
VALUE (6, 6, '6', '4', 'Very good.');

INSERT INTO ratingGarage (id, user_id, garage_id, rate_point, comment)
VALUE (7, 7, '7', '4', 'Very good.');

INSERT INTO ratingGarage (id, user_id, garage_id, rate_point, comment)
VALUE (8, 8, '8', '4', 'Very good.');

INSERT INTO ratingGarage (id, user_id, garage_id, rate_point, comment)
VALUE (9, 9, '9', '4', 'very good.');

INSERT INTO ratingGarage (id, user_id, garage_id, rate_point, comment)
VALUE (10, 10, '10', '4', 'Good ');

INSERT INTO ratingGarage (id, user_id, garage_id, rate_point, comment)
VALUE (11, 11, '11', '4', 'Good ');

INSERT INTO ratingGarage (id, user_id, garage_id, rate_point, comment)
VALUE (12, 12, '12', '5', 'Good ');


#endregion
#region Insert ratingPartner
INSERT INTO ratingPartner (id, user_id, partner_id, rate_point, comment)
VALUE (1, 1, '1', '3', 'Very good.');

INSERT INTO ratingPartner (id, user_id, partner_id, rate_point, comment)
VALUE (2, 2, '2', '5', 'Good ');

INSERT INTO ratingPartner (id, user_id, partner_id, rate_point, comment)
VALUE (3, 3, '3', '5', 'Very good.');

INSERT INTO ratingPartner (id, user_id, partner_id, rate_point, comment)
VALUE (4, 4, '4', '5', 'Very good.');

INSERT INTO ratingPartner (id, user_id, partner_id, rate_point, comment)
VALUE (5, 5, '5', '5', 'Good ');

INSERT INTO ratingPartner (id, user_id, partner_id, rate_point, comment)
VALUE (6, 6, '6', '4', 'Very good.');

INSERT INTO ratingPartner (id, user_id, partner_id, rate_point, comment)
VALUE (7, 7, '7', '4', 'Very good.');

INSERT INTO ratingPartner (id, user_id, partner_id, rate_point, comment)
VALUE (8, 8, '8', '4', 'Very good.');

INSERT INTO ratingPartner (id, user_id, partner_id, rate_point, comment)
VALUE (9, 9, '9', '4', 'very good.');

INSERT INTO ratingPartner (id, user_id, partner_id, rate_point, comment)
VALUE (10, 10, '10', '4', 'Good ');

INSERT INTO ratingPartner (id, user_id, partner_id, rate_point, comment)
VALUE (11, 11, '11', '4', 'Good ');

INSERT INTO ratingPartner (id, user_id, partner_id, rate_point, comment)
VALUE (12, 12, '12', '5', 'Good ');


#endregion


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
