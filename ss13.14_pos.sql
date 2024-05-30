/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50739 (5.7.39)
 Source Host           : localhost:3306
 Source Schema         : ss13.14_pos

 Target Server Type    : MySQL
 Target Server Version : 50739 (5.7.39)
 File Encoding         : 65001

 Date: 30/05/2024 09:01:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` (`id`, `name`, `description`) VALUES (1, 'Drink', NULL);
INSERT INTO `category` (`id`, `name`, `description`) VALUES (2, 'Beer', NULL);
INSERT INTO `category` (`id`, `name`, `description`) VALUES (3, 'Food', NULL);
INSERT INTO `category` (`id`, `name`, `description`) VALUES (4, 'FastFood', NULL);
INSERT INTO `category` (`id`, `name`, `description`) VALUES (5, 'Water', NULL);
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (1, 'Wanda Vargas', 2.79, 39.85, 2, 'n5gszg2PgB', 'MSIgekr4Ht');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (2, 'Donald Morales', 4.65, 35.09, 3, 'ldi8JkZCeE', 'KI9B7DbBOV');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (3, 'Kenneth Nichols', 5.17, 93.17, 5, 'M8X3URdWjE', 'hk1AT39UZX');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (4, 'Martha Williams', 4.89, 92.77, 4, '0CfPMj24gv', '30BBCmRAPs');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (5, 'Beverly Miller', 9.51, 33.26, 4, 'ILeSQSzPN5', '1C2z7gElfU');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (6, 'Jose Silva', 4.96, 34.61, 3, 'Hbj9PgWIzp', 'VKClZQPRDw');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (7, 'Jessica Henry', 4.62, 59.33, 2, 'w4b24S2UIw', 'vZHA6FPnN0');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (8, 'Sarah Olson', 9.51, 35.31, 2, 'kSOsg4XtZV', 'Xgrkgy6u68');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (9, 'Joshua Fernandez', 7.65, 77.89, 5, 'BBqaFiHUqA', 'AJyj1RjL7w');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (10, 'Edith Price', 2.49, 51.90, 1, 'g2BshOYU3c', 'B7AGvz875M');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (11, 'Lillian Mendez', 2.02, 79.36, 3, 'GHvEMIqTet', 'uBoplizo5i');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (12, 'Roger Daniels', 7.86, 66.42, 3, 'UWdoWIsRul', 'Oh0kD0PhAe');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (13, 'Ryan Cole', 2.49, 98.84, 3, 'TPAg5nca83', 'PABuwg5Wny');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (14, 'Francis Murphy', 1.87, 37.78, 2, 'ByUoNZirZa', 'n4ibJLEHZu');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (15, 'Irene Carter', 9.71, 58.14, 4, 'QqzdU47g3S', '00Ylc4Dlt0');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (16, 'Sean Taylor', 8.31, 14.68, 2, 'MFZvVWfRFF', 'legMhY7IEt');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (17, 'Stephanie Sanders', 3.26, 90.15, 2, 'dak1VeUixm', 'jy0wDnsrtW');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (18, 'Nicholas James', 6.42, 96.46, 5, 'OEKb3khyJ6', 'qG9CsNcDDe');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (19, 'Shirley Hunter', 5.81, 63.40, 3, 'aLz6CsP3o2', '3gAmNnrYPG');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (20, 'Deborah Marshall', 6.05, 30.09, 4, 'RaFJ9oMLxT', 'LP0b7E27ws');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (21, 'Ronald Burns', 5.20, 43.70, 1, 'X0vpuTjqIQ', 'aR6dgfF5a8');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (22, 'Barbara Griffin', 6.13, 27.48, 1, 'BkJRFANqL7', 'Nyxer55hR3');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (23, 'Shirley Barnes', 2.78, 55.30, 1, '8TaGiUepIQ', '6TuJrSGpXR');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (24, 'Harold Kennedy', 8.29, 23.04, 1, 'QlUNCiVYnR', 'H0dDpGthGU');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (25, 'Eleanor Hall', 6.47, 20.41, 4, 'NicRs6A1TS', 'AFL5DHxB4I');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (26, 'Katherine Guzman', 6.20, 76.29, 4, 'xkkjRw5Mt0', 'FuyIAJfHc7');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (27, 'Jacob Campbell', 2.94, 67.80, 3, 'txLAz1qrqS', 'e4ATztuxuZ');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (28, 'Jamie Wood', 5.26, 47.21, 4, 'sCi2WOSZcL', 'zDcxFdrHrO');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (29, 'Gary Adams', 1.31, 20.92, 5, 'inEzQCDbBa', 'eBSEDlv1TH');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (30, 'Doris Ferguson', 4.33, 85.22, 3, '7yBPK7HyGw', 'kMXqPuOuHB');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (31, 'Ernest Graham', 7.50, 91.42, 1, '0L634IU2aU', 'LvjLRyFlJU');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (32, 'Leslie Morales', 6.52, 77.43, 4, 'UM1SiWZabK', 'dsRncyEYd9');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (33, 'Nicholas Nichols', 7.01, 12.86, 4, 'lImSbsf0Kb', 'qRLhQWFmnR');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (34, 'Mildred Richardson', 9.10, 53.12, 2, 'QRALb1uft1', 'C4kVnrZwvq');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (35, 'Ashley Ferguson', 6.41, 2.05, 2, 'UHkgx2FFp8', 'lE2RBH9CnX');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (36, 'Christine Palmer', 2.34, 22.63, 3, 'IP2E4eM2pB', 'psbU3N2tZv');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (37, 'Marcus Washington', 5.52, 8.39, 1, 'tV7JXYQTfS', '5hpcS7Pi1t');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (38, 'Marie Gordon', 7.53, 63.62, 3, 'pRt0ayfpwV', 'UbTMpqFug9');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (39, 'Juan Snyder', 3.12, 24.21, 2, 'V4fupa6QBI', 'PFSudvJwRu');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (40, 'Dale Foster', 2.92, 79.48, 4, 'VAWKeORk32', 'EfLZH7UnjZ');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (41, 'Jose Porter', 5.38, 64.99, 2, 'ifv4sZ7XfP', '2bwLygSx6i');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (42, 'Jason Bailey', 4.39, 62.58, 5, 'XdHhbiZjV4', 'u51MNxYd2q');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (43, 'Anna Richardson', 3.44, 13.76, 3, '7G4LGEKExq', 'hnFnga4TLD');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (44, 'Lillian Guzman', 3.09, 14.35, 3, 'kFiJRMA8wM', 'K5kwp8T3V0');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (45, 'Timothy Gonzales', 6.39, 21.14, 3, 'bYVLRqq89R', 'b8CT6KWi8V');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (46, 'Larry Aguilar', 4.46, 17.07, 5, 'tyrjKPQzmo', 'w2pB3XyyKd');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (47, 'Curtis Cox', 7.41, 78.16, 3, 'vroOoa2jic', 'wPPZmclI7T');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (48, 'Gloria Crawford', 4.56, 67.67, 2, '7iGMrX0jtk', '3WqUSv1tPn');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (49, 'Dennis Taylor', 7.96, 81.28, 5, 'BHROmWFZhQ', 'YbGDlhk9Fg');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (50, 'Jacob Smith', 8.55, 39.40, 2, 'gbtwErsQPR', '97JsYCNGjf');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (51, 'Terry Castillo', 2.44, 83.80, 3, 'Rt2P0wAZna', 'rJRFnbeSk9');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (52, 'Ethel Ortiz', 8.80, 11.38, 2, 'eTC8WKdUO0', 'Zr6HeRBWDr');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (53, 'Martin Dunn', 8.96, 78.42, 5, 'bHDMKqaQ6Z', 'OCXs0xPtc3');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (54, 'Bonnie Gonzalez', 4.47, 87.96, 2, 'FMFnUirn3p', 'lOdzPoEliI');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (55, 'Julia Salazar', 7.80, 46.93, 5, '8pWrEhZq12', 'QU89YMKM3B');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (56, 'Phyllis Rodriguez', 3.11, 94.93, 1, 'OqLWeS2lao', 'DMwIdNlYg5');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (57, 'Sheila Gonzales', 6.57, 46.35, 3, '6nx45Wmzqb', 'pBUzKvAIVG');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (58, 'Wendy Hernandez', 1.24, 80.86, 1, '3zBDlavvzY', 'trvtrYRERP');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (59, 'Ashley Perry', 1.79, 73.81, 1, 'XCCTTh3fHV', 'qaZtZF2kKj');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (60, 'Gladys Parker', 3.93, 4.35, 4, 'a7URqHlMQE', 'umJxyjO1Jb');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (61, 'Jack Hernandez', 7.97, 17.46, 2, '0QbwlQShqX', 'myTi4QLy3d');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (62, 'Joel Weaver', 2.55, 3.78, 2, 'LQoCXHMwyw', 'hQuPeMaiiD');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (63, 'Ray Torres', 5.30, 13.35, 4, 'mKLgvEucDa', 'Bk6en3d6RA');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (64, 'Cheryl Simmons', 4.68, 13.22, 5, 'TCkMxf4Elj', 'UTXk8Fownl');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (65, 'Shannon Gonzalez', 7.35, 90.83, 4, 'fEzIrUxtcA', '6nuI2cMtHt');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (66, 'Manuel Allen', 2.64, 61.57, 3, '3SchzWvLbK', 'Z7dAucpFuf');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (67, 'Nicholas Lopez', 7.52, 57.95, 3, '34FW2S51MY', 'kZjG79nx9e');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (68, 'Anne Ryan', 1.08, 91.60, 3, 'QUYMpF0SA0', 'GDl8C9C7IC');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (69, 'Johnny Fernandez', 8.30, 40.58, 5, 'Vvf0wURUKa', 'ATXodXnh62');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (70, 'Joyce Perez', 9.07, 91.96, 4, 'IsmFfovaSB', 'in95ZhThyl');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (71, 'Michael Garcia', 1.51, 19.52, 4, 'OHxlFEfldk', '5ampDNXIv2');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (72, 'Stephen Holmes', 4.36, 90.11, 4, 'pBoZ640xPk', '5L2ZjndLef');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (73, 'Stephen Schmidt', 9.87, 39.54, 5, 'Rvzvb0WaUQ', '6Fp8uF5F3L');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (74, 'Judith Kennedy', 7.45, 30.06, 2, 'Ik38CDYfTO', '0g0zjBsdBV');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (75, 'Betty Murphy', 2.61, 7.29, 2, 'RqENrQal75', 'p6qQM0GMrD');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (76, 'Andrew Holmes', 7.68, 33.76, 3, 'RBXCAPrIYP', 'xhnxbIKJ9H');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (77, 'Monica Ward', 4.62, 27.14, 1, 'my67G24pDs', 'eNrw14QiZk');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (78, 'Nicholas Perry', 9.63, 31.97, 2, 'tHwPfEqAiw', '4cn0p9IYcr');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (79, 'Michelle Wright', 1.70, 24.77, 3, '2jiKwxJi63', 'UzgrvLtKHN');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (80, 'Robin Wright', 6.85, 16.86, 4, 'f8OntqDTkn', 'eakqGZXwro');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (81, 'Wendy Chavez', 9.87, 93.45, 2, 'NfbujTNLxO', '2472n6HhHt');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (82, 'Jamie Palmer', 2.64, 15.26, 2, 'xVP34YUu3i', 'J22E5wLm6F');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (83, 'Evelyn Perry', 5.91, 58.48, 1, 'aRUUyJfH5e', 'EFYETXclWK');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (84, 'Norman Roberts', 9.36, 98.68, 1, 'P5oMpCGtLS', 'M2DpP8hsHH');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (85, 'Marcus Nelson', 5.52, 39.07, 2, 'dUKDvvmdO2', 'G7bcZmjnSR');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (86, 'Danny Romero', 4.03, 97.69, 2, 'gxZYPtN00S', 'zEQcbP4GDQ');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (87, 'Mike Brooks', 7.21, 85.09, 3, 'z0PeNxfxRs', 'jVFC4smiuk');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (88, 'Mario Kennedy', 2.88, 73.41, 3, 'IjmbQvUB4A', 'hXvPZJUo38');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (89, 'Jonathan Washington', 6.85, 98.12, 3, 'ubFh5RffQZ', 'LZV8FxcqqS');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (90, 'Judy Johnson', 8.35, 69.30, 4, '38yeVOIQVt', 'Z9Jb6xVn3o');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (91, 'Philip Stewart', 7.45, 20.31, 4, 'aCxBoUoFy6', 'iFZvUreQCC');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (92, 'Francisco Turner', 3.85, 83.79, 3, 'pqs59ainr3', 'dSygfGc62n');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (93, 'Laura Mason', 4.01, 24.26, 3, 'OlNffM04QE', '8eXoicAhZu');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (94, 'Sandra Ford', 9.52, 74.35, 3, 'zs2hBfndDe', 'mFrZ7viwHy');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (95, 'Kathryn Gonzalez', 6.37, 73.64, 2, 'QSsV4nYeLu', 'gx5pTC2Gfj');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (96, 'George Torres', 5.40, 17.22, 2, 'NMBU6Blem8', 'wgZaKYGpvn');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (97, 'Steven Mcdonald', 3.94, 57.75, 2, 'xQJClJs0Di', 'fNNvWiclNw');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (98, 'Mario Price', 6.24, 45.34, 4, 'BJ6RzQoNde', '1tlMLzAaZ3');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (99, 'Jessica Spencer', 3.06, 32.88, 3, '9sm539KgGn', 'zeL75WWCbB');
INSERT INTO `product` (`id`, `name`, `cost`, `price`, `category_id`, `image`, `description`) VALUES (100, 'Jerry Morales', 1.04, 94.10, 2, 'XhY5nuWXWG', 'BrYGHJVpyb');
COMMIT;

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `received_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale
-- ----------------------------
BEGIN;
INSERT INTO `sale` (`id`, `date`, `customer_id`, `received_amount`) VALUES (1, '2023-12-16 00:00:00', 1, 200.00);
COMMIT;

-- ----------------------------
-- Table structure for sale_detail
-- ----------------------------
DROP TABLE IF EXISTS `sale_detail`;
CREATE TABLE `sale_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_detail
-- ----------------------------
BEGIN;
INSERT INTO `sale_detail` (`id`, `sale_id`, `product_id`, `qty`, `cost`, `price`) VALUES (1, 1, 1, 1, 2.79, 39.85);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
