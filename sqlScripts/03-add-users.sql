DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`
(
    `username` varchar(50) NOT NULL,
    `password` char(68)    NOT NULL,
    `enabled`  tinyint(1)  NOT NULL,
    PRIMARY KEY (`username`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Inserting data for table `users`
--

INSERT INTO `users`
VALUES ('john', '{bcrypt}$2a$12$OuuJDGB5DKiwhVhMsEqq2ud03IHlFz5PLS93AWqYAzfFRaFThDy0i ', 1),
       ('mary', '{bcrypt}$2a$12$Pi8QMLduYFcZhTDq8TfwrOi.WMEPYEjwbCsJhfit7zQJF/tMyo7fe ', 1),
       ('susan', '{bcrypt}$2a$12$kYcBchbzHUxRIUc3tX5PeOgAEymwkDPbZdrVq4yTMhWen8jh4NPyq ', 1);


--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities`
(
    `username`  varchar(50) NOT NULL,
    `authority` varchar(50) NOT NULL,
    UNIQUE KEY `authorities_idx_1` (`username`, `authority`),
    CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Inserting data for table `authorities`
--

INSERT INTO `authorities`
VALUES ('john', 'ROLE_OWNER'),
       ('mary', 'ROLE_TESTER'),
       ('susan', 'ROLE_MANAGER'),
       ('susan', 'ROLE_OWNER');