CREATE DATABASE  IF NOT EXISTS `ARShop_database`;
USE `ARShop_database`;

-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2023 at 10:54 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `Address_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Receiver_Name` varchar(100) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Province` varchar(100) NOT NULL,
  `District` varchar(100) NOT NULL,
  `Subdistrict` varchar(100) NOT NULL,
  `Detail` text NOT NULL,
  `Is_Default` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `Cart_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `Category_ID` int(11) NOT NULL,
  `Vendor_ID` int(11) NOT NULL,
  `Category_Name` varchar(255) NOT NULL,
  `Is_Official` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `Chat_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Vendor_ID` int(11) NOT NULL,
  `Chat_Detail` text NOT NULL,
  `Chat_Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
  `Coupon_ID` int(11) NOT NULL,
  `Vendor_ID` int(11) NOT NULL,
  `Discount_Value` int(11) NOT NULL,
  `Max_Discount` int(11) NOT NULL,
  `Expire_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupondetail`
--

DROP TABLE IF EXISTS `coupondetail`;

CREATE TABLE `coupondetail` (
  `CouponDetail_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Coupon_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `Customer_Email` varchar(100) NOT NULL,
  `Customer_Password` varchar(100) NOT NULL,
  `Customer_Name` varchar(100) NOT NULL,
  `Customer_Tel` varchar(12) NOT NULL,
  `Customer_Gender` varchar(100) NOT NULL,
  `Customer_Birthdate` date NOT NULL,
  `Is_Admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Customer_Email`, `Customer_Password`, `Customer_Name`, `Customer_Tel`, `Customer_Gender`, `Customer_Birthdate`, `Is_Admin`) VALUES
(1, 'test@gmail.com', '123456789', 'firsttest lasttest', '012345678', 'Male', '2023-02-10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;

CREATE TABLE `favorite` (
  `Favorite_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;

CREATE TABLE `model` (
  `Model_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Model_Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `Detail_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Variation_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Vendor_ID` int(11) NOT NULL,
  `Cart_ID` int(11) NOT NULL,
  `Quanity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Product_Name` varchar(255) NOT NULL,
  `Product_Price` int(11) NOT NULL,
  `Product_Quanity` int(11) NOT NULL,
  `Product_Detail` text NOT NULL,
  `Vendor_ID` int(11) NOT NULL,
  `RequestTime` int(11) NOT NULL,
  `Sold` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;

CREATE TABLE `productcategory` (
  `Product_Category_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Category_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;

CREATE TABLE `productorder` (
  `Order_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Address_ID` int(11) NOT NULL,
  `Order_Date` date NOT NULL,
  `Order_Status` text NOT NULL,
  `Tracking_Number` text NOT NULL,
  `Vendor_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `productpicture`
--

DROP TABLE IF EXISTS `productpicture`;

CREATE TABLE `productpicture` (
  `Picture_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Picture_Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `productscore`
--

DROP TABLE IF EXISTS `productscore`;

CREATE TABLE `productscore` (
  `Product_Score_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Watched_Time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `variation`
--

DROP TABLE IF EXISTS `variation`;

CREATE TABLE `variation` (
  `Variation_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Variation_Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor` (
  `Vendor_ID` int(11) NOT NULL,
  `Vendor_Email` varchar(100) NOT NULL,
  `Vendor_Password` varchar(100) NOT NULL,
  `Vendor_Name` varchar(100) NOT NULL,
  `Vendor_Tel` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`Address_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Cart_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_ID`),
  ADD KEY `Vendor_ID` (`Vendor_ID`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`Chat_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`,`Vendor_ID`),
  ADD KEY `fk_chat_vendor_id` (`Vendor_ID`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`Coupon_ID`),
  ADD KEY `Vendor_ID` (`Vendor_ID`);

--
-- Indexes for table `coupondetail`
--
ALTER TABLE `coupondetail`
  ADD PRIMARY KEY (`CouponDetail_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`,`Coupon_ID`),
  ADD KEY `fk_coupondetail_coupon_id` (`Coupon_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`),
  ADD UNIQUE KEY `Customer_Email` (`Customer_Email`),
  ADD UNIQUE KEY `Customer_Tel` (`Customer_Tel`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`Favorite_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`,`Product_ID`),
  ADD KEY `fk_favorite_product_id` (`Product_ID`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`Model_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`Detail_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`,`Product_ID`,`Variation_ID`,`Order_ID`,`Vendor_ID`),
  ADD KEY `Cart_ID` (`Cart_ID`),
  ADD KEY `fk_orderdetail_order_id` (`Order_ID`),
  ADD KEY `fk_orderdetail_product_id` (`Product_ID`),
  ADD KEY `fk_orderdetail_vendor_id` (`Vendor_ID`),
  ADD KEY `fk_orderdetail_variation_id` (`Variation_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Vendor_ID` (`Vendor_ID`);

--
-- Indexes for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`Product_Category_ID`),
  ADD KEY `Product_ID` (`Product_ID`,`Category_ID`),
  ADD KEY `fk_productcategory_category_id` (`Category_ID`);

--
-- Indexes for table `productorder`
--
ALTER TABLE `productorder`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`,`Address_ID`,`Vendor_ID`),
  ADD KEY `fk_order_address_id` (`Address_ID`),
  ADD KEY `fk_order_vendor_id` (`Vendor_ID`);

--
-- Indexes for table `productpicture`
--
ALTER TABLE `productpicture`
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `productscore`
--
ALTER TABLE `productscore`
  ADD PRIMARY KEY (`Product_Score_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`,`Product_ID`),
  ADD KEY `fk_productscore_product_id` (`Product_ID`);

--
-- Indexes for table `variation`
--
ALTER TABLE `variation`
  ADD PRIMARY KEY (`Variation_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`Vendor_ID`),
  ADD UNIQUE KEY `Vendor_Email` (`Vendor_Email`,`Vendor_Name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `Address_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Cart_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Category_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `Chat_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `Coupon_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupondetail`
--
ALTER TABLE `coupondetail`
  MODIFY `CouponDetail_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `Favorite_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `Model_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `Detail_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `Product_Category_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productorder`
--
ALTER TABLE `productorder`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productscore`
--
ALTER TABLE `productscore`
  MODIFY `Product_Score_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `Vendor_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_address_customer_id` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_customer_id` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_category_vendor_id` FOREIGN KEY (`Vendor_ID`) REFERENCES `vendor` (`Vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `fk_chat_customer_id` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chat_vendor_id` FOREIGN KEY (`Vendor_ID`) REFERENCES `vendor` (`Vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `fk_coupon_vendor_id` FOREIGN KEY (`Vendor_ID`) REFERENCES `vendor` (`Vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `coupondetail`
--
ALTER TABLE `coupondetail`
  ADD CONSTRAINT `fk_coupondetail_coupon_id` FOREIGN KEY (`Coupon_ID`) REFERENCES `coupon` (`Coupon_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_coupondetail_customer_id` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `fk_favorite_customer_id` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_favorite_product_id` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `fk_model_product_id` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `fk_orderdetail_cart_id` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`Cart_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orderdetail_customer_id` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orderdetail_order_id` FOREIGN KEY (`Order_ID`) REFERENCES `productorder` (`Order_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orderdetail_product_id` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orderdetail_variation_id` FOREIGN KEY (`Variation_ID`) REFERENCES `variation` (`Variation_ID`),
  ADD CONSTRAINT `fk_orderdetail_vendor_id` FOREIGN KEY (`Vendor_ID`) REFERENCES `vendor` (`Vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_vendor_id` FOREIGN KEY (`Vendor_ID`) REFERENCES `vendor` (`Vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD CONSTRAINT `fk_productcategory_category_id` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productcategory_product_id` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `productorder`
--
ALTER TABLE `productorder`
  ADD CONSTRAINT `fk_order_address_id` FOREIGN KEY (`Address_ID`) REFERENCES `address` (`Address_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_customer_id` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_vendor_id` FOREIGN KEY (`Vendor_ID`) REFERENCES `vendor` (`Vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `productpicture`
--
ALTER TABLE `productpicture`
  ADD CONSTRAINT `fk_picture_product_id` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `productscore`
--
ALTER TABLE `productscore`
  ADD CONSTRAINT `fk_productscore_customer_id` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productscore_product_id` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `variation`
--
ALTER TABLE `variation`
  ADD CONSTRAINT `fk_variation_product_id` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
