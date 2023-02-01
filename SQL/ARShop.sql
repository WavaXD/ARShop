CREATE DATABASE  IF NOT EXISTS `ARShop_database`;
USE `ARShop_database`;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;

CREATE TABLE `Customer` (
	`Customer_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Customer_Email` VARCHAR(100) DEFAULT NULL,
	`Customer_Password` VARCHAR(50) DEFAULT NULL,
    `Customer_Name` VARCHAR(100) DEFAULT NULL,
	`Customer_Tel` VARCHAR(15) DEFAULT NULL,
	`Customer_Gender` VARCHAR(20) DEFAULT NULL,
	`Customer_Birthdate` DATE DEFAULT NULL,
	`Is_Admin` BOOLEAN DEFAULT NULL,
	PRIMARY KEY (`Customer_ID`),

    UNIQUE KEY `CUSTOMER_EMAIL_UNIQUE` (`Customer_Email`),
    UNIQUE KEY `CUSTOMER_TEL_UNIQUE` (`Customer_Tel`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;

CREATE TABLE `Address` (
	`Address_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Customer_ID` INT(11),
	`Receiver_Name` VARCHAR(200) DEFAULT NULL,
	`Phone` VARCHAR(15) DEFAULT NULL,
	`Province` VARCHAR(100) DEFAULT NULL,
	`District` VARCHAR(100) DEFAULT NULL,
	`Subdistrict` VARCHAR(100) DEFAULT NULL,
	`Detail` TEXT DEFAULT NULL,
	`Is_Default` BOOLEAN DEFAULT NULL,
	PRIMARY KEY (`Address_ID`),
  
    KEY `FK_CUSTOMER_idx` (`Customer_ID`),
    
    CONSTRAINT `FK_CUSTOMER` 
    FOREIGN KEY (`Customer_ID`) 
    REFERENCES `Customer` (`Customer_ID`) 

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;

CREATE TABLE `Cart` (
	`Cart_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Customer_ID` INT(11),
	PRIMARY KEY (`Cart_ID`),

    KEY `FK_CUSTOMER_idx` (`Customer_ID`),
    
    CONSTRAINT `FK_CUSTOMER` 
    FOREIGN KEY (`Customer_ID`) 
    REFERENCES `Customer` (`Customer_ID`) 
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;

CREATE TABLE `Vendor` (
	`Vendor_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Vendor_Email` VARCHAR(100),
	`Vendor_Password` VARCHAR(50),
	`Vendor_Name` VARCHAR(100),
	`Vendor_Tel` VARCHAR(15),
	PRIMARY KEY (`Vendor_ID`),

    UNIQUE KEY `VENDOR_EMAIL_UNIQUE` (`Vendor_Email`),
    UNIQUE KEY `VENDOR_TEL_UNIQUE` (`Vendor_Tel`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;

CREATE TABLE `Order` (
	`Order_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Customer_ID` INT(11),
	`Address_ID` INT(11),
	`Order_Date` DATE,
	`Order_Status` VARCHAR(255),
	`Tracking_Number` VARCHAR(100),
	`Vendor_ID` INT(11),
	PRIMARY KEY (`Order_ID`),

    KEY `FK_CUSTOMER_idx` (`Customer_ID`),
    
    CONSTRAINT `FK_CUSTOMER` 
    FOREIGN KEY (`Customer_ID`) 
    REFERENCES `Customer` (`Customer_ID`),

    KEY `FK_Address_idx` (`Address_ID`),
    
    CONSTRAINT `FK_ADDRESS` 
    FOREIGN KEY (`Address_ID`) 
    REFERENCES `Address` (`Address_ID`),

    KEY `FK_Vendor_idx` (`Vendor_ID`),
    
    CONSTRAINT `FK_VENDOR` 
    FOREIGN KEY (`Vendor_ID`) 
    REFERENCES `Vendor` (`Vendor_ID`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;

CREATE TABLE `Product` (
	`Product_ID` INT(11) NOT NULL AUTO_INCREMENT, -- Add RequestTime for statistic analy
	`Product_Name` VARCHAR(255),
	`Product_Price` INT(10),
	`Product_Quanity` INT(20),
	`Product_Detail` TEXT(20),
	`Vendor_ID` INT(11),
	PRIMARY KEY (`Product_ID`),

    KEY `FK_VENDOR_idx` (`Vendor_ID`),
    
    CONSTRAINT `FK_VENDOR` 
    FOREIGN KEY (`Vendor_ID`) 
    REFERENCES `Vendor` (`Vendor_ID`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `Favorite`
--

DROP TABLE IF EXISTS `Favorite`;

CREATE TABLE `Favorite` (
	`Favorite_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Customer_ID` INT(11),
	`Product_ID` INT(11),
	PRIMARY KEY (`Favorite_ID`),

    KEY `FK_CUSTOMER_idx` (`Customer_ID`),
    
    CONSTRAINT `FK_CUSTOMER` 
    FOREIGN KEY (`Customer_ID`) 
    REFERENCES `Customer` (`Customer_ID`),

    KEY `FK_PRODICT_idx` (`Product_ID`),
    
    CONSTRAINT `FK_PRODUCT` 
    FOREIGN KEY (`Product_ID`) 
    REFERENCES `Product` (`Product_ID`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `Variation`
--

DROP TABLE IF EXISTS `Variation`; -- Add each price for each variation --

CREATE TABLE `Variation` (
	`Variation_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Product_ID` INT(11),
	`Variation_Name` VARCHAR(100),
	PRIMARY KEY (`Variation_ID`),

    KEY `FK_PRODICT_idx` (`Product_ID`),
    
    CONSTRAINT `FK_PRODUCT` 
    FOREIGN KEY (`Product_ID`) 
    REFERENCES `Product` (`Product_ID`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `Order_Detail`
--

DROP TABLE IF EXISTS `Order_Detail`; 

CREATE TABLE `Order_Detail` (
	`Detail_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Customer_ID` INT(11),
	`Product_ID` INT(11),
	`Variation_ID` INT(11),
	`Order_ID` INT(11),
	`Vendor_ID` INT(11),
	`Cart_ID` INT(11),
	`Quantity` INT(20),
	PRIMARY KEY (`Detail_ID`),

    KEY `FK_CUSTOMER_idx` (`Customer_ID`),
    
    CONSTRAINT `FK_CUSTOMER` 
    FOREIGN KEY (`Customer_ID`) 
    REFERENCES `Customer` (`Customer_ID`),

    KEY `FK_PRODICT_idx` (`Product_ID`),
    
    CONSTRAINT `FK_PRODUCT` 
    FOREIGN KEY (`Product_ID`) 
    REFERENCES `Product` (`Product_ID`),

    KEY `FK_VARIATION_idx` (`Variation_ID`),
    
    CONSTRAINT `FK_VARIATION` 
    FOREIGN KEY (`Variation_ID`) 
    REFERENCES `Variation` (`Variation_ID`),

    KEY `FK_ORDER_idx` (`Order_ID`),
    
    CONSTRAINT `FK_ORDER` 
    FOREIGN KEY (`Order_ID`) 
    REFERENCES `Order` (`Order_ID`),

    KEY `FK_VENDOR_idx` (`Vendor_ID`),
    
    CONSTRAINT `FK_VENDOR` 
    FOREIGN KEY (`Vendor_ID`) 
    REFERENCES `Vendor` (`Vendor_ID`),

    KEY `FK_Cart_idx` (`Cart_ID`),
    
    CONSTRAINT `FK_CART` 
    FOREIGN KEY (`Cart_ID`) 
    REFERENCES `Cart` (`Cart_ID`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `ProductPicture`
--

DROP TABLE IF EXISTS `ProductPicture`; 

CREATE TABLE `ProductPicture` (
	`Picture_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Product_ID` INT(11),
	`Picture_Name` TEXT,
	PRIMARY KEY (`Picture_ID`),

    KEY `FK_PRODICT_idx` (`Product_ID`),
    
    CONSTRAINT `FK_PRODUCT` 
    FOREIGN KEY (`Product_ID`) 
    REFERENCES `Product` (`Product_ID`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `Model`
--

DROP TABLE IF EXISTS `Model`; 

CREATE TABLE `Model` (
	`Model_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Product_ID` INT(11),
	`Model_Name` TEXT,
	PRIMARY KEY (`Model_ID`),

    KEY `FK_PRODICT_idx` (`Product_ID`),
    
    CONSTRAINT `FK_PRODUCT` 
    FOREIGN KEY (`Product_ID`) 
    REFERENCES `Product` (`Product_ID`)
    
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`; 

CREATE TABLE `Category` (
	`Category_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Vendor_ID` INT(11),
	`Category_Name` VARCHAR(200),
	`Is_Official` BOOLEAN,
	PRIMARY KEY (`Category_ID`),

    KEY `FK_VENDOR_idx` (`Vendor_ID`),
    
    CONSTRAINT `FK_VENDOR` 
    FOREIGN KEY (`Vendor_ID`) 
    REFERENCES `Vendor` (`Vendor_ID`),

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `ProductCategory`
--

DROP TABLE IF EXISTS `ProductCategory`; 

CREATE TABLE `ProductCategory` (
	`Product_Category_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Product_ID` INT(11),
	`Category_ID` INT(11),
	PRIMARY KEY (`Product_Category_ID`),

    KEY `FK_PRODICT_idx` (`Product_ID`),
    
    CONSTRAINT `FK_PRODUCT` 
    FOREIGN KEY (`Product_ID`) 
    REFERENCES `Product` (`Product_ID`),

    KEY `FK_CATEGORY_idx` (`Category_ID`),
    
    CONSTRAINT `FK_CATEGORY` 
    FOREIGN KEY (`Category_ID`) 
    REFERENCES `Category` (`Category_ID`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `Chat`
--

DROP TABLE IF EXISTS `Chat`; 

CREATE TABLE `Chat` (
	`Chat_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Customer_ID` INT(11),
	`Vendor_ID` INT(11),
	`Chat_Detail` TEXT,
	`Chat_Time` TIMESTAMP,
	PRIMARY KEY (`Chat_ID`),

    KEY `FK_CUSTOMER_idx` (`Customer_ID`),
    
    CONSTRAINT `FK_CUSTOMER` 
    FOREIGN KEY (`Customer_ID`) 
    REFERENCES `Customer` (`Customer_ID`),

    KEY `FK_VENDOR_idx` (`Vendor_ID`),
    
    CONSTRAINT `FK_VENDOR` 
    FOREIGN KEY (`Vendor_ID`) 
    REFERENCES `Vendor` (`Vendor_ID`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `Coupon`
--

DROP TABLE IF EXISTS `Coupon`; 

CREATE TABLE `Coupon` (
	`Coupon_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Vendor_ID` INT(11),
	`Discount_Value` INT(20),
	`Max_Discount` INT(20),
	`Expire_Date` DATE(),
	PRIMARY KEY (`Coupon_ID`),

    KEY `FK_VENDOR_idx` (`Vendor_ID`),
    
    CONSTRAINT `FK_VENDOR` 
    FOREIGN KEY (`Vendor_ID`) 
    REFERENCES `Vendor` (`Vendor_ID`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `CouponDetail`
--

DROP TABLE IF EXISTS `CouponDetail`; 

CREATE TABLE `CouponDetail` (
	`CouponDetail_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`Customer_ID` INT(11),
	`Coupon_ID` INT(11),
	PRIMARY KEY (`CouponDetail_ID`),

    KEY `FK_CUSTOMER_idx` (`Customer_ID`),
    
    CONSTRAINT `FK_CUSTOMER` 
    FOREIGN KEY (`Customer_ID`) 
    REFERENCES `Customer` (`Customer_ID`),

    KEY `FK_COUPON_idx` (`Coupon_ID`),
    
    CONSTRAINT `FK_COUPON` 
    FOREIGN KEY (`Coupon_ID`) 
    REFERENCES `Coupon` (`Coupon_ID`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `ContentBased`
--

DROP TABLE IF EXISTS `ContentBased`; 

CREATE TABLE `ContentBased` (
	`ContentBased_ID` INT(11) NOT NULL AUTO_INCREMENT, -- renamed from product_score
	`Customer_ID` INT(11),
	`Product_ID` INT(11),
	`Watched_Time` INT(20),
	PRIMARY KEY (`ContentBased_ID`),

    KEY `FK_CUSTOMER_idx` (`Customer_ID`),
    
    CONSTRAINT `FK_CUSTOMER` 
    FOREIGN KEY (`Customer_ID`) 
    REFERENCES `Customer` (`Customer_ID`),

    KEY `FK_PRODICT_idx` (`Product_ID`),
    
    CONSTRAINT `FK_PRODUCT` 
    FOREIGN KEY (`Product_ID`) 
    REFERENCES `Product` (`Product_ID`)
    
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;