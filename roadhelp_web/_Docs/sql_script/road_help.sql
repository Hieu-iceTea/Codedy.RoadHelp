
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
    `id`         INT AUTO_INCREMENT,

    `username`   VARCHAR(64) UNIQUE  NOT NULL,
    `email`      VARCHAR(128) UNIQUE NOT NULL,
    `password`   VARCHAR(64)         NOT NULL,

    `image`      VARCHAR(128),
    `gender`     int, #1 nam, 2 nữ
    `first_name` VARCHAR(64),
    `last_name`  VARCHAR(64),
    `phone`      VARCHAR(16),
    `address`    VARCHAR(128),
    `rate_avg`   double       default null,

    `active`     BOOLEAN      DEFAULT TRUE,

    `created_by` NVARCHAR(32) DEFAULT 'Codedy',
    `created_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by` NVARCHAR(32) DEFAULT 'Codedy',
    `updated_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`    INT          DEFAULT 1,
    `deleted`    BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;


DROP TABLE IF EXISTS `garage`;
CREATE TABLE IF NOT EXISTS `garage`
(
    `id`              INT AUTO_INCREMENT,

    `user_partner_id` INT         NOT NULL,
    `province_id`     INT         NOT NULL,
    `district_id`     INT         NOT NULL,
    `ward_id`         INT         NOT NULL,

    `name`            VARCHAR(64) NOT NULL,
    `phone`           VARCHAR(16),
    `rate_avg`        double      NULL,
    `address`         VARCHAR(128),
    `longitude`       double,
    `latitude`        double,
    `description`     VARCHAR(500),
    `active`          BOOLEAN      DEFAULT TRUE,
    `is_featured`     BOOLEAN,

    `created_by`      NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`      TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`      NVARCHAR(32) DEFAULT 'Codedy',
    `updated_at`      TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`         INT          DEFAULT 1,
    `deleted`         BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `garageImage`;
CREATE TABLE IF NOT EXISTS `garageImage`
(
    `id`         INT AUTO_INCREMENT,

    `garage_id`  INT          NOT NULL,
    `image`      VARCHAR(128) NOT NULL,

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
    `id`             INT AUTO_INCREMENT,
    `user_member_id` INT          NOT NULL,
    `issue_id`       INT          NOT NULL,
    `rate_point`     INT          NOT NULL,
    `comment`        VARCHAR(256) NULL,

    `created_by`     NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`     TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`     NVARCHAR(32) DEFAULT 'Codedy',
    `updated_at`     TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`        INT          DEFAULT 1,
    `deleted`        BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `ratingGarage`;
CREATE TABLE IF NOT EXISTS `ratingGarage`
(
    `id`             INT AUTO_INCREMENT,

    `garage_id`      INT          NOT NULL,
    `user_member_id` INT          NOT NULL,

    `rate_point`     INT          NOT NULL,
    `comment`        VARCHAR(256) NULL,

    `created_by`     NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`     TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`     NVARCHAR(32) DEFAULT 'Codedy',
    `updated_at`     TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`        INT          DEFAULT 1,
    `deleted`        BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;

DROP TABLE IF EXISTS `issue`;
CREATE TABLE IF NOT EXISTS `issue`
(
    `id`              INT AUTO_INCREMENT,
    `user_member_id`  INT NOT NULL,
    `user_partner_id` int NULL,

    `longitude`       double,
    `latitude`        double,

    `phone`           VARCHAR(16),
    `address`         VARCHAR(128),
    `category`        INT null,
    `description`     VARCHAR(500),

    `status`          int          DEFAULT 0,#     0. vừa gửi chưa có ai nhận giúp | 1. chờ xác nhận | 2. đã được userPartner xác nhận tới giúp | 3. hủy bởi user | 4. thành công
    `created_by`      NVARCHAR(32) DEFAULT 'Codedy',
    `created_at`      TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`      NVARCHAR(32) DEFAULT 'Codedy',
    `updated_at`      TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`         INT          DEFAULT 1,
    `deleted`         BOOLEAN      DEFAULT FALSE,

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
INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,phone,address, active)
VALUE (1, 'Host12345', 'host.codedy@gmail.com', '$2a$10$x8vxT2qqizH3gs3C49vhMehH0gpl24ObvY41q55Bta0XyxhP84xA.','host.jpg', 1, 'CODEDY', 'Host', '032 87 99 000','Hà Nội', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,phone,address, active)
VALUE (2, 'Admin1234', 'admin.codedy@gmail.com', '$2a$10$x8vxT2qqizH3gs3C49vhMehH0gpl24ObvY41q55Bta0XyxhP84xA.','admin.jpg', 1, 'CODEDY', 'Admin', '0868 6633 15','Hoàn Kiếm', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,phone,address, active)
VALUE (3, 'Admin_Demo', 'admin_demo.codedy@gmail.com', '$2a$10$x8vxT2qqizH3gs3C49vhMehH0gpl24ObvY41q55Bta0XyxhP84xA.','admin_demo.jpg', 1, 'CODEDY', 'Admin Demo', '0868 6633 16','Hồ Tây', FALSE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,phone,address, active)
VALUE (4, 'Staff_A123', 'staff_a.codedy@gmail.com', '$2a$10$x8vxT2qqizH3gs3C49vhMehH0gpl24ObvY41q55Bta0XyxhP84xA.','staff_a.jpg', 1, 'CODEDY', 'Staff A', '0868 6633 17','Hà Đông', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,phone,address, active)
VALUE (5, 'Staff_B123', 'staff_b.codedy@gmail.com', '$2a$10$x8vxT2qqizH3gs3C49vhMehH0gpl24ObvY41q55Bta0XyxhP84xA.','staff_b.jpg', 2, 'CODEDY', 'Staff B', '0869 6633 18','Hà tây', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,phone,address, active)
VALUE (6, 'Customer123', 'codedy.demo@gmail.com', '$2a$10$x8vxT2qqizH3gs3C49vhMehH0gpl24ObvY41q55Bta0XyxhP84xA.','customer.jpg', 1, 'CODEDY', 'Customer', '0869 6633 19','Hà tây', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,phone,address, active)
VALUE (7, 'AnhNTTH1908059', 'AnhNTTH1908059@fpt.edu.vn', '$2a$10$x8vxT2qqizH3gs3C49vhMehH0gpl24ObvY41q55Bta0XyxhP84xA.','AnhNTTH1908059.jpg', 1, 'Nguyễn Trung', 'Anh', '0869 6633 20','Hà tây', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,phone,address, active)
VALUE (8, 'HuyVQTH1909003', 'HuyVQTH1909003@fpt.edu.vn', '$2a$10$x8vxT2qqizH3gs3C49vhMehH0gpl24ObvY41q55Bta0XyxhP84xA.','HuyVQTH1909003.jpg', 1, 'Vũ Quang', 'Huy', '0870 6633 21','Hà tây', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,phone,address, active)
VALUE (9, 'HungNPMTH1908050', 'HungNPMTH1908050@fpt.edu.vn', '$2a$10$x8vxT2qqizH3gs3C49vhMehH0gpl24ObvY41q55Bta0XyxhP84xA.','HungNPMTH1908050.jpg', 1, 'Nông Phan Mạnh', 'Hùng', '0870 6633 22','Hà tây', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,phone,address, active)
VALUE (10, 'DinhHieu9999', 'HieuNDTH1908028@fpt.edu.vn', '$2a$10$x8vxT2qqizH3gs3C49vhMehH0gpl24ObvY41q55Bta0XyxhP84xA.','DinhHieu9999.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0870 6633 23','Hà tây', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,phone,address, active)
VALUE (11, 'ManhHung', 'ThiDK@fpt.edu.vn ', '$2a$10$x8vxT2qqizH3gs3C49vhMehH0gpl24ObvY41q55Bta0XyxhP84xA.','ManhHung.jpg', 2, 'Đặng Kim', 'Thi', '0871 6633 24','Hà tây', TRUE);

INSERT INTO users (id, username, email, password, image, gender, first_name, last_name,phone,address, active)
VALUE (12, 'Staff_C123', 'staff_c.codedy@gmail.com', '$2a$10$x8vxT2qqizH3gs3C49vhMehH0gpl24ObvY41q55Bta0XyxhP84xA.','staff_c.jpg', 1, 'CODEDY', 'Staff C', '0871 6633 25','Hà tây', TRUE);


#endregion

#region Insert garage
INSERT INTO garage (id,user_partner_id,district_id,province_id,ward_id,name,rate_avg,latitude, longitude, address, description, phone, active,is_featured)
VALUE (1,1,32,2, 476,'Sửa xe, bơm vá Vũ Hòa', 4.0,21.012252, 105.840863, 'Đường Lê Duẩn', 'chuyên sửa xe', '032 87 99 000', TRUE,1);

INSERT INTO garage (id,user_partner_id,district_id,province_id,ward_id,name,rate_avg,latitude, longitude, address, description, phone, active,is_featured)
VALUE (2,2,32,2, 476,'Garage Quang Huy', 4.1,21.012125, 105.839031, 'Đường Lê Duẩn', 'chuyên sửa xe', '0868 6633 15', TRUE,0);

INSERT INTO garage (id,user_partner_id,district_id,province_id,ward_id,name,rate_avg,latitude, longitude, address, description, phone, active,is_featured)
VALUE (3,3,32,2, 476,'Showroom Đình Hiếu', 4.2,21.010844, 105.839912, 'Ven Hồ Ba Mẫu', 'chuyên sửa xe', '0869 6633 16', FALSE,0);

INSERT INTO garage (id,user_partner_id,district_id,province_id,ward_id,name,rate_avg,latitude, longitude, address, description, phone, active,is_featured)
VALUE (4,4,32,2, 476,'Sửa xe Mạnh Hùng', 4.3,21.009477, 105.841029, 'Ven Hồ Ba Mẫu', 'chuyên sửa xe', '0869 6633 51', TRUE,0);

INSERT INTO garage (id,user_partner_id,district_id,province_id,ward_id,name,rate_avg,latitude, longitude, address, description, phone, active,is_featured)
VALUE (5,5,32,2, 476,'Sửa xe Trung Anh', 4.4,21.008315, 105.841887, 'Ven Hồ Ba Mẫu', 'chuyên sửa xe', '0870 6633 52', TRUE,0);

INSERT INTO garage (id,user_partner_id,district_id,province_id,ward_id,name,rate_avg,latitude, longitude, address, description, phone, active,is_featured)
VALUE (6,6,32,2, 476,'Sửa xe, bơm vá Vũ Vũ', 4.5,21.008075, 105.843947, 'Ven Hồ Ba Mẫu', 'chuyên sửa xe', '0870 6633 45', TRUE,0);

INSERT INTO garage (id,user_partner_id,district_id,province_id,ward_id,name,rate_avg,latitude, longitude, address, description, phone, active,is_featured)
VALUE (7,7,32,2, 476,'Sửa xe Hoa Hoa', 4.6,21.008706, 105.845481, 'Ven Hồ Ba Mẫu', 'chuyên sửa xe', '0871 6633 11', TRUE,0);

INSERT INTO garage (id,user_partner_id,district_id,province_id,ward_id,name,rate_avg,latitude, longitude, address, description, phone, active,is_featured)
VALUE (8,8,32,2, 476,'Garage Hoa Hồng', 4.7,21.009637, 105.845857, 'Ven Hồ Ba Mẫu', 'chuyên sửa xe', '0871 6633 33', TRUE,0);

INSERT INTO garage (id,user_partner_id,district_id,province_id,ward_id,name,rate_avg,latitude, longitude, address, description, phone, active,is_featured)
VALUE (9,9,32,2, 476,'Garage Hoa Hồng 2', 4.8,21.011054, 105.846041, 'Ven Hồ Ba Mẫu', 'chuyên sửa xe', '0872 6633 44', TRUE,0);

INSERT INTO garage (id,user_partner_id,district_id,province_id,ward_id,name,rate_avg,latitude, longitude, address, description, phone, active,is_featured)
VALUE (10,10,32,2, 476,'Garage Quang Huy 2', 4.9,21.013774, 105.841152, 'Đường Lê Duẩn', 'chuyên sửa xe', '0872 6633 55', TRUE,0);

INSERT INTO garage (id,user_partner_id,district_id,province_id,ward_id,name,rate_avg,latitude, longitude, address, description, phone, active,is_featured)
VALUE (11,11,32,2, 476,'Garage Quang Huy 3', 4.1,21.014415, 105.840133, 'Đường Lê Duẩn', 'chuyên sửa xe', '0873 6633 66', TRUE,0);

INSERT INTO garage (id,user_partner_id,district_id,province_id,ward_id,name,rate_avg,latitude, longitude, address, description, phone, active,is_featured)
VALUE (12,12,32,2, 476,'Garage Quang Huy 4', 5.0,21.013804, 105.839543, 'Đường Lê Duẩn', 'chuyên sửa xe', '0873 6633 22', TRUE,0);


#endregion

#region Insert garage image
INSERT INTO garageimage (id, garage_id,image)
VALUE (1, 1, 'tiem1.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (2, 1, 'tiem2.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (3, 1, 'tiem3.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (4, 2, 'tiem4.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (5, 2, 'tiem5.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (6, 2, 'tiem6.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (7, 3, 'tiem7.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (8, 4, 'tiem8.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (9, 5, 'tiem9.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (10, 6, 'tiem10.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (11, 7, 'tiem10.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (12, 8, 'tiem10.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (13, 9, 'tiem10.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (14, 10, 'tiem9.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (15, 11, 'tiem6.jpg');

INSERT INTO garageimage (id, garage_id,image)
VALUE (16, 12, 'tiem8.jpg');




#endregion

# #region Insert issue
INSERT INTO issue(id, user_member_id, longitude, latitude,category, phone,address,description, status)
VALUE (1, 1,  '21.012252', '105.840863','1',  '032 87 99 000',  'Đường Lê Duẩn','', '0');

INSERT INTO issue(id, user_member_id, longitude, latitude,category, phone,address,description, status)
VALUE (2, 2,  '21.012125', '105.839031','1',  '0868 6633 15',  'Đường Lê Duẩn','', '0');

INSERT INTO issue(id, user_member_id, longitude, latitude,category, phone,address,description, status)
VALUE (3, 3, '21.010844', '105.839912','2',  '0868 6633 16',  'Ven Hồ Ba Mẫu','', '0');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status) 
VALUE (4, 4, 9, '21.009477', '105.841029','1',  '0868 6633 17',  'Ven Hồ Ba Mẫu','', '5');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status) 
VALUE (5, 5, 8, '21.008315', '105.841887','1',  '0869 6633 18',  'Ven Hồ Ba Mẫu','', '5');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status) 
VALUE (6, 6, 7, '21.008075', '105.843947','2',  '0869 6633 19',  'Ven Hồ Ba Mẫu','', '5');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status) 
VALUE (7, 7, 6, '21.008706', '105.845481','1',  '0869 6633 20',  'Ven Hồ Ba Mẫu','', '5');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status) 
VALUE (8, 8, 5, '21.009637', '105.845857','1',  '0870 6633 21',  'Ven Hồ Ba Mẫu','', '5');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status) 
VALUE (9, 9, 4, '21.011054', '105.846041','2',  '0870 6633 22',  'Ven Hồ Ba Mẫu','', '5');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status) 
VALUE (10, 10, 3, '21.013774', '105.841152','1',  '0870 6633 23',  'Đường Lê Duẩn','', '5');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status) 
VALUE (11, 11, 2, '21.014415', '105.840133','1',  '0871 6633 24',  'Đường Lê Duẩn','', '5');

INSERT INTO issue(id, user_member_id,user_partner_id, longitude, latitude,category, phone,address,description, status) 
VALUE (12, 12, 1, '21.013804', '105.839543','2',  '0871 6633 25',  'Đường Lê Duẩn','', '5');


#endregion


#region Insert ratingGarage
INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment) 
VALUE (1, 1, 12, 3, 'Tàm tạm.');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment) 
VALUE (2, 2, 11, 5, 'Tốt');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment) 
VALUE (3, 3, 10, 5, 'Tốt');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment) 
VALUE (4, 4, 9, 5, 'Tốt');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment) 
VALUE (5, 5, 8, 5, 'Tốt');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment) 
VALUE (6, 6, 7, 4, 'Tốt');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment) 
VALUE (7, 7, 6, 4, 'Tốt');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment) 
VALUE (8, 8, 5, 4, 'Tốt');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment) 
VALUE (9, 9, 4, 4, 'Tốt');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment) 
VALUE (10, 10, 3, 4, 'Tốt');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment) 
VALUE (11, 11, 2, 4, 'Tốt');

INSERT INTO ratingGarage (id, user_member_id, garage_id, rate_point, comment) 
VALUE (12, 12, 1, 5, 'Tốt');


#endregion
#region Insert ratingIssues
INSERT INTO ratingIssues(id, user_member_id, issue_id, rate_point, comment) 
VALUE (1, 4, 4, 3, 'Tạm được');

INSERT INTO ratingIssues(id, user_member_id, issue_id, rate_point, comment) 
VALUE (2, 5, 5, 5, 'Tốt');

INSERT INTO ratingIssues(id, user_member_id, issue_id, rate_point, comment) 
VALUE (3, 6, 6, 5, 'Tốt');

INSERT INTO ratingIssues(id, user_member_id, issue_id, rate_point, comment) 
VALUE (4, 7, 7, 5, 'Tốt');

INSERT INTO ratingIssues(id, user_member_id, issue_id, rate_point, comment) 
VALUE (5, 8, 8, 5, 'Tốt');

INSERT INTO ratingIssues(id, user_member_id, issue_id, rate_point, comment) 
VALUE (6, 9, 9, 4, 'Tốt');

INSERT INTO ratingIssues(id, user_member_id, issue_id, rate_point, comment) 
VALUE (7, 10, 10, 4, 'Tốt');

INSERT INTO ratingIssues(id, user_member_id, issue_id, rate_point, comment) 
VALUE (8, 11, 11, 4, 'Tốt');

INSERT INTO ratingIssues(id, user_member_id, issue_id, rate_point, comment) 
VALUE (9, 12, 12, 4, 'Tốt');



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
