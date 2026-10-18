CREATE DATABASE IF NOT EXISTS petspa;
USE petspa;

CREATE TABLE tblService (
  id          INT           NOT NULL PRIMARY KEY,
  name        VARCHAR(255)  NOT NULL,
  unit        VARCHAR(255)  NOT NULL,
  price       DECIMAL(18,2) NOT NULL,
  description VARCHAR(255)  NULL,
  status      VARCHAR(255)  NOT NULL DEFAULT 'Đang hoạt động',
  CONSTRAINT chk_service_price  CHECK (price > 0),                                       -- BR03
  CONSTRAINT chk_service_status CHECK (status IN ('Đang hoạt động', 'Ngừng hoạt động'))  -- BR07
);

CREATE TABLE tblUser (
  id          INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username    VARCHAR(255) NOT NULL UNIQUE,
  password    VARCHAR(255) NOT NULL,          
  fullName    VARCHAR(255) NOT NULL,
  birthday    DATE         NOT NULL,
  address     VARCHAR(255) NOT NULL,
  phone       VARCHAR(10)  NOT NULL UNIQUE,
  email       VARCHAR(255) NOT NULL UNIQUE,
  `position`  VARCHAR(255) NOT NULL,
  description VARCHAR(255) NULL
);

CREATE TABLE tblManager (
  userID INT NOT NULL PRIMARY KEY,
  FOREIGN KEY (userID) REFERENCES tblUser (id)
);

CREATE TABLE tblClient (
  id      INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name    VARCHAR(255) NOT NULL,
  phone   VARCHAR(10)  NOT NULL UNIQUE,
  address VARCHAR(255) NOT NULL,
  note    VARCHAR(255) NULL
);

CREATE TABLE tblServiceOrder (
  id        INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `date`    TIMESTAMP    NOT NULL,
  note      VARCHAR(255) NULL,
  managerID INT          NOT NULL,
  clientID  INT          NOT NULL,
  FOREIGN KEY (managerID) REFERENCES tblManager (userID),
  FOREIGN KEY (clientID)  REFERENCES tblClient (id)
);

CREATE TABLE tblDetailServiceOrder (
  id             INT           NOT NULL AUTO_INCREMENT PRIMARY KEY,
  quantity       INT           NOT NULL,
  status         VARCHAR(255)  NOT NULL,
  price          DECIMAL(18,2) NOT NULL,     
  note           VARCHAR(255)  NULL,
  serviceOrderID INT           NOT NULL,
  serviceID      INT           NOT NULL,
  CONSTRAINT chk_detail_qty   CHECK (quantity > 0),
  CONSTRAINT chk_detail_price CHECK (price > 0),
  FOREIGN KEY (serviceOrderID) REFERENCES tblServiceOrder (id),
  FOREIGN KEY (serviceID)      REFERENCES tblService (id)
);

CREATE TABLE tblBill (
  id             INT           NOT NULL AUTO_INCREMENT PRIMARY KEY,
  paymentDay     TIMESTAMP     NOT NULL,
  paymentAmount  DECIMAL(18,2) NOT NULL,
  paymentType    VARCHAR(255)  NOT NULL,
  note           VARCHAR(255)  NULL,
  managerID      INT           NOT NULL,
  serviceOrderID INT           NOT NULL,
  CONSTRAINT chk_bill_amount CHECK (paymentAmount > 0),
  FOREIGN KEY (managerID)      REFERENCES tblManager (userID),
  FOREIGN KEY (serviceOrderID) REFERENCES tblServiceOrder (id)
);
