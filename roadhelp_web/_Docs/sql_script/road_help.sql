
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
    `email`               VARCHAR(128) UNIQUE         NOT NULL,
    `password`            VARCHAR(64)               NOT NULL,

    `image`               VARCHAR(128),
    `gender`              int, #1 nam, 2 nữ
    `first_name`          VARCHAR(64),
    `last_name`           VARCHAR(64),
    `phone`               VARCHAR(16),
    `address`               VARCHAR(128),
    `rate_avg`               double default null,

    `active`             BOOLEAN      DEFAULT TRUE,

    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT 'Codedy',
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
    `province_id`                  INT NOT NULL,
    `district_id`                  INT NOT NULL,
    `ward_id`                  INT NOT NULL,

    `name`            VARCHAR(64)         NOT NULL,
    `phone`               VARCHAR(16),
    `rate_avg`            double        NULL,
    `address`             VARCHAR(128),

    `longitude`           double,
    `latitude`           double,

    `description`             VARCHAR(500),
    `active`             BOOLEAN      DEFAULT TRUE,
    `is_featured`             BOOLEAN,

    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
    ) ENGINE InnoDB;

DROP TABLE IF EXISTS `garageImage`;
CREATE TABLE IF NOT EXISTS `garageImage`
(
    `id`         INT AUTO_INCREMENT,

    `garage_id`   INT NOT NULL,
    `image`  VARCHAR(128) NOT NULL,

    `created_by` NVARCHAR(32) DEFAULT 'Codedy',
    `created_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by` NVARCHAR(32) DEFAULT 'Codedy',
    `updated_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`    INT          DEFAULT 1,
    `deleted`    BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `ratingIssues`;
CREATE TABLE IF NOT EXISTS `ratingIssues`
(
    `id`                  INT AUTO_INCREMENT,
    `user_member_id`                  INT NOT NULL,
     `issue_id`                  INT NOT NULL,
    `rate_point`                  INT NOT NULL,
    `comment`            VARCHAR(256)         NULL,

    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT 'Codedy',
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
    `user_member_id`                  INT NOT NULL,

    `rate_point`                  INT NOT NULL,
    `comment`            VARCHAR(256)         NULL,

    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
    ) ENGINE InnoDB;

DROP TABLE IF EXISTS `issue`;
CREATE TABLE IF NOT EXISTS `issue`
(
    `id`                  INT AUTO_INCREMENT,
    `user_member_id`                  INT NOT NULL,
    `user_partner_id`                  int NULL,

    `longitude`           double,
    `latitude`           double,

    `phone`               VARCHAR(16),
    `address`             VARCHAR(128),
    `category`             INT null,
    `description`             VARCHAR(500),

    `status`             int      DEFAULT 1,#     1. vừa gửi chưa có ai nhận giúp | 2. chờ xác nhận | 3. đã được partner xác nhận tới giúp | 4. hủy bởi user | 5. thành công
    `created_by`          NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT 'Codedy',
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

    `created_by` NVARCHAR(32) DEFAULT 'Codedy',
    `created_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by` NVARCHAR(32) DEFAULT 'Codedy',
    `updated_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`    INT          DEFAULT 1,
    `deleted`    BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;



# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                             Insert Data                                             #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Default password: 123456
#region Insert Users
INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (1, 'Host', 'host.codedy@gmail.com', '$2y$10$oW..IGNT/CH2muKpN/8LAuNJ1ahnwLoyCBWRQyBj4p6ITOJFb.gs2','host.jpg', 1, 'CODEDY', 'Host', '032 87 99 000','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (2, 'Admin', 'admin.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','admin.jpg', 1, 'CODEDY', 'Admin', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (3, 'Member', 'admin_demo.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','admin_demo.jpg', 1, 'CODEDY', 'Admin Demo', '0868 6633 15','HN', FALSE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (4, 'Partner', 'staff_a.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','staff_a.jpg', 1, 'CODEDY', 'Staff A', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (5, 'Hung', 'staff_b.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','staff_b.jpg', 2, 'CODEDY', 'Staff B', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (6, 'Huy', 'codedy.demo@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','customer.jpg', 1, 'CODEDY', 'Customer', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (7, 'Hieu', 'AnhNTTH1908059@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','AnhNTTH1908059.jpg', 1, 'Nguyễn Trung', 'Anh', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (8, 'Hoa', 'HuyVQTH1909003@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','HuyVQTH1909003.jpg', 1, 'Vũ Quang', 'Huy', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (9, 'Vu', 'HungNPMTH1908050@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','HungNPMTH1908050.jpg', 1, 'Nông Phan Mạnh', 'Hùng', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (10, 'TrungAnh', 'HieuNDTH1908028@fpt.edu.vn', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','DinhHieu9999.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (11, 'ManhHung', 'ThiDK@fpt.edu.vn ', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','ManhHung.jpg', 2, 'Đặng Kim', 'Thi', '0868 6633 15','HN', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,address, phone, active)
VALUE (12, 'Staff_C', 'staff_c.codedy@gmail.com', '$2y$10$//Od0OmEqRwFepW3wynrYOwslyvaS.snzBbpWwskF1Zrg5fNI.eTe','staff_c.jpg', 1, 'CODEDY', 'Staff C', '0868 6633 15','HN', TRUE);

#endregion

#region Insert garage
INSERT INTO garage (id,partner_id,district_id,province_id,ward_id,name,rate_avg,longitude,latitude,  address, description, phone, active,is_featured)
VALUE (1,1,1,1, 1,'Host', 4.0,123, 123, 'CODEDY', 'Host', '032 87 99 000', TRUE,1);

INSERT INTO garage (id,partner_id,district_id,province_id,ward_id,name,rate_avg,longitude,latitude,  address, description, phone, active,is_featured)
VALUE (2,2,2,2, 2,'Admin', 4.1,456, 456, 'CODEDY', 'Admin', '0868 6633 15', TRUE,0);

INSERT INTO garage (id,partner_id,district_id,province_id,ward_id,name,rate_avg,longitude,latitude,  address, description, phone, active,is_featured)
VALUE (3,3,3,3, 3,'Admin_Demo', 4.2,789, 789, 'CODEDY', 'Admin Demo', '0868 6633 15', FALSE,0);

INSERT INTO garage (id,partner_id,district_id,province_id,ward_id,name,rate_avg,longitude,latitude,  address, description, phone, active,is_featured)
VALUE (4,4,4,4, 4,'Staff_A', 4.3,1122, 1122, 'CODEDY', 'Staff A', '0868 6633 15', TRUE,0);

INSERT INTO garage (id,partner_id,district_id,province_id,ward_id,name,rate_avg,longitude,latitude,  address, description, phone, active,is_featured)
VALUE (5,5,5,5, 5,'Staff_B', 4.4,1455, 1455, 'CODEDY', 'Staff B', '0868 6633 15', TRUE,0);

INSERT INTO garage (id,partner_id,district_id,province_id,ward_id,name,rate_avg,longitude,latitude,  address, description, phone, active,is_featured)
VALUE (6,6,6,6, 6,'Customer', 4.5,1788, 1788, 'CODEDY', 'Customer', '0868 6633 15', TRUE,0);

INSERT INTO garage (id,partner_id,district_id,province_id,ward_id,name,rate_avg,longitude,latitude,  address, description, phone, active,is_featured)
VALUE (7,7,7,7, 7,'AnhNTTH1908059', 4.6,2121, 2121, 'Nguyễn Trung', 'Anh', '0868 6633 15', TRUE,0);

INSERT INTO garage (id,partner_id,district_id,province_id,ward_id,name,rate_avg,longitude,latitude,  address, description, phone, active,is_featured)
VALUE (8,8,8,8, 8,'HuyVQTH1909003', 4.7,2454, 2454, 'Vũ Quang', 'Huy', '0868 6633 15', TRUE,0);

INSERT INTO garage (id,partner_id,district_id,province_id,ward_id,name,rate_avg,longitude,latitude,  address, description, phone, active,is_featured)
VALUE (9,9,9,9, 9,'HungNPMTH1908050', 4.8,2787, 2787, 'Nông Phan Mạnh', 'Hùng', '0868 6633 15', TRUE,0);

INSERT INTO garage (id,partner_id,district_id,province_id,ward_id,name,rate_avg,longitude,latitude,  address, description, phone, active,is_featured)
VALUE (10,10,10,10, 10,'DinhHieu9999', 4.9,3120, 3120, 'Nguyễn Đình', 'Hiếu', '0868 6633 15', TRUE,0);

INSERT INTO garage (id,partner_id,district_id,province_id,ward_id,name,rate_avg,longitude,latitude,  address, description, phone, active,is_featured)
VALUE (11,11,11,11, 11,'ManhHung', 4.1,3453, 3453, 'Đặng Kim', 'Thi', '0868 6633 15', TRUE,0);

INSERT INTO garage (id,partner_id,district_id,province_id,ward_id,name,rate_avg,longitude,latitude,  address, description, phone, active,is_featured)
VALUE (12,12,12,12, 12,'Staff_C', 5.0,3453, 3453, 'CODEDY', 'Staff C', '0868 6633 15', TRUE,0);



#endregion

#region Insert garage image
INSERT INTO garageimage (id, garage_id,image)
VALUE (1, 1, 'tiem1.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (2, 2, 'tiem2.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (3, 3, 'tiem3.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (4, 4, 'tiem4.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (5, 5, 'tiem5.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (6, 6, 'tiem6.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (7, 7, 'tiem7.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (8, 8, 'tiem8.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (9, 9, 'tiem9.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (10, 10, 'tiem10.jpg');



#endregion

# #region Insert issue
INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status)
VALUE (1, 1, 1, '333', '333','1',  '123456789',  'HN','', '1');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status)
VALUE (2, 2, 2, '5555', '5555','1',  '123456789',  'HN','', '1');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status)
VALUE (3, 3, 3, '6665', '6665','2',  '123456789',  'HN','', '1');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status)
VALUE (4, 4, 4, '775', '775','1',  '123456789',  'HN','', '1');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status)
VALUE (5, 5, 5, '88', '333','1',  '123456789',  'HN','', '1');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status)
VALUE (6, 6, 6, '333', '5555','2',  '123456789',  'HN','', '1');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status)
VALUE (7, 7, 7, '5555', '6665','1',  '123456789',  'HN','', '1');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status)
VALUE (8, 8, 8, '6665', '775','1',  '123456789',  'HN','', '1');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status)
VALUE (9, 9, 9, '775', '333','2',  '123456789',  'HN','', '1');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status)
VALUE (10, 10, 10, '88', '5555','1',  '123456789',  'HN','', '1');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status)
VALUE (11, 11, 11, '775', '6665','1',  '123456789',  'HN','', '1');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status)
VALUE (12, 12, 12, '88', '775','2',  '123456789',  'HN','', '1');


#endregion


#region Insert ratingGarage
INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment)
VALUE (1, 1, 1, 3, 'Very good.');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment)
VALUE (2, 2, 2, 5, 'Good ');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment)
VALUE (3, 3, 3, 5, 'Very good.');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment)
VALUE (4, 4, 4, 5, 'Very good.');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment)
VALUE (5, 5, 5, 5, 'Good ');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment)
VALUE (6, 6, 6, 4, 'Very good.');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment)
VALUE (7, 7, 7, 4, 'Very good.');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment)
VALUE (8, 8, 8, 4, 'Very good.');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment)
VALUE (9, 9, 9, 4, 'very good.');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment)
VALUE (10, 10, 10, 4, 'Good ');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment)
VALUE (11, 11, 11, 4, 'Good ');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment)
VALUE (12, 12, 12, 5, 'Good ');

#endregion
#region Insert ratingIssues
INSERT INTO ratingIssues (id, user_member_id, issue_id, rate_point, comment)
VALUE (1, 1, 1, 3, 'Very good.');

INSERT INTO ratingIssues (id, user_member_id, issue_id, rate_point, comment)
VALUE (2, 2, 2, 5, 'Good ');

INSERT INTO ratingIssues (id, user_member_id, issue_id, rate_point, comment)
VALUE (3, 3, 3, 5, 'Very good.');

INSERT INTO ratingIssues (id, user_member_id, issue_id, rate_point, comment)
VALUE (4, 4, 4, 5, 'Very good.');

INSERT INTO ratingIssues (id, user_member_id, issue_id, rate_point, comment)
VALUE (5, 5, 5, 5, 'Good ');

INSERT INTO ratingIssues (id, user_member_id, issue_id, rate_point, comment)
VALUE (6, 6, 6, 4, 'Very good.');

INSERT INTO ratingIssues (id, user_member_id, issue_id, rate_point, comment)
VALUE (7, 7, 7, 4, 'Very good.');

INSERT INTO ratingIssues (id, user_member_id, issue_id, rate_point, comment)
VALUE (8, 8, 8, 4, 'Very good.');

INSERT INTO ratingIssues (id, user_member_id, issue_id, rate_point, comment)
VALUE (9, 9, 9, 4, 'very good.');

INSERT INTO ratingIssues (id, user_member_id, issue_id, rate_point, comment)
VALUE (10, 10, 10, 4, 'Good ');

INSERT INTO ratingIssues (id, user_member_id, issue_id, rate_point, comment)
VALUE (11, 11, 11, 4, 'Good ');

INSERT INTO ratingIssues (id, user_member_id, issue_id, rate_point, comment)
VALUE (12, 12, 12, 5, 'Good ');

#endregion

INSERT INTO authorities (username, authority)
VALUES
('Admin', 'ROLE_ADMIN'),
('Member', 'ROLE_MEMBER'),
('Partner', 'ROLE_PARTNER'),
('Hung', 'ROLE_MEMBER'),
('Huy', 'ROLE_MEMBER'),
('Hieu', 'ROLE_PARTNER'),
('Vu', 'ROLE_MEMBER'),
('TrungAnh', 'ROLE_MEMBER'),
('Hoa', 'ROLE_PARTNER');
