-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2016 at 11:44 PM
-- Server version: 5.6.15-log
-- PHP Version: 5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fundamentals`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `C_Id` varchar(10) NOT NULL,
  `C_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`C_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`C_Id`, `C_Name`) VALUES
('C0001', 'Electronics'),
('C0002', 'Furniture');

-- --------------------------------------------------------

--
-- Table structure for table `category_subcategory`
--

CREATE TABLE IF NOT EXISTS `category_subcategory` (
  `cat_Id` varchar(10) NOT NULL,
  `sub_Id` varchar(10) NOT NULL,
  PRIMARY KEY (`cat_Id`,`sub_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_subcategory`
--

INSERT INTO `category_subcategory` (`cat_Id`, `sub_Id`) VALUES
('C0001', 'SC0001');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dateofbirth` date NOT NULL,
  `gender` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `designationId` varchar(100) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`, `name`, `dateofbirth`, `gender`, `designation`, `designationId`) VALUES
('aniketchitale7@gmail.com', '6628528decd1bdb9c6eb1d24f2414ca9', 'Aniket Chitale', '2016-04-12', 'Male', 'User', 'Authorized'),
('ankur@gmail.com', 'e104c000ba2bf871deada58d00203f70', 'Ankur Shrivastava', '0000-00-00', 'Male', 'User', ''),
('ankita@gmail.com', '69dd76453e98c9db98083a3a019b05fa', 'Ankita Ankita', '0000-00-00', 'Female', 'User', ''),
('abc@gmail.com', 'a141c47927929bc2d1fb6d336a256df4', 'Abc Abc', '2016-03-10', 'Male', 'User', ''),
('aj@gmail.com', '232d9526f27b67ecac487604a430f7a0', 'Ajinkya Kulkarni', '0000-00-00', 'Male', 'User', ''),
('piyush@gmail.com', '6d31ebfd9579f5bbfbba63b659618e26', 'piyus as', '0000-00-00', 'Male', 'User', ''),
('asevil17@gmail.com', '86fd6a031b9bf0c9568abb91e8a3dba0', 'Aniket Chitale', '0000-00-00', 'Male', 'User', ''),
('anshul@gmail.com', '5e9920f2005695936eeee4fd20195427', 'Anshul Gupta', '0000-00-00', 'Male', 'User', ''),
('aasda@gmail.com', 'd9f6e636e369552839e7bb8057aeb8da', 'Adad asdasdasd', '0000-00-00', 'Male', 'User', ''),
('ak@gmail.com', 'bc9be5bb0291dbc10dc1689c30cf0fe1', 'ak aa', '0000-00-00', 'Male', 'User', ''),
('aaa@gmail.com', 'd9f6e636e369552839e7bb8057aeb8da', 'Ann asdsa', '0000-00-00', 'Male', 'User', ''),
('arina@gmail.com', '1404ee74dc01b81ecbd3f87587aaf64d', 'Arina Grande', '2016-03-22', 'Female', 'User', ''),
('gracern@gmail.com', '726c0bcffcce2008a046c84a729c95b8', 'Gracw Rein', '2016-03-15', 'Female', 'Admin', 'Authorized'),
('aashayborgaonkar@gmail.com', '8ca8422eb2a15e611577383a5d9d99c2', 'Aashay Borgaonkar', '1992-03-23', 'Male', 'User', ''),
('raman@gmail.com', 'd68751a49d24cb26decf5030d7dd3fe7', 'raman aravamudhan', '2016-01-31', 'Male', 'Manager', 'Authorized'),
('pinky@gmail.com', '1e9cddda325b4b2b7d99317ffc02a8df', 'Aniket Chitale', '2016-04-21', 'Female', 'User', ''),
('balaji@gmail.com', '87d893a3d4cb57bf45924b1cdd306c60', 'Balaji Thiru', '2016-04-14', 'Male', 'Admin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `P_Id` varchar(10) NOT NULL,
  `P_CategoryId` varchar(50) NOT NULL,
  `P_SubCategoryId` varchar(50) NOT NULL,
  `P_Supplier` varchar(50) NOT NULL,
  `P_Quantity` varchar(10) NOT NULL,
  `P_Price` varchar(10) NOT NULL,
  `P_Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`P_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`P_Id`, `P_CategoryId`, `P_SubCategoryId`, `P_Supplier`, `P_Quantity`, `P_Price`, `P_Description`) VALUES
('P0001', 'C0001', 'SC0001', 'S0001', '5', '1000', 'Black 17 inch Laptop'),
('P0002', 'C0001', 'SC0002', 'S0002', '10', '500', 'Desktops');

-- --------------------------------------------------------

--
-- Table structure for table `product1`
--

CREATE TABLE IF NOT EXISTS `product1` (
  `productId` varchar(100) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productCategory` varchar(100) NOT NULL,
  `productSubcategory` varchar(100) NOT NULL,
  `productVendor` varchar(100) NOT NULL,
  `productQuantity` varchar(100) NOT NULL,
  `productPrice` varchar(100) NOT NULL,
  `productDescription` varchar(1000) NOT NULL,
  `ManagerName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product1`
--

INSERT INTO `product1` (`productId`, `productName`, `productCategory`, `productSubcategory`, `productVendor`, `productQuantity`, `productPrice`, `productDescription`, `ManagerName`) VALUES
('p0001', 'dell laptops', 'electronics', 'computers', 'dell', '0', '500', 'black dell laptop', 'gracern@gmail.com'),
('p0002', 'dell laptops', 'electronics', 'computers', 'dell', '0', '500', 'black dell laptop', 'gracern@gmail.com'),
('p0003', 'Apple laptops', 'electronics', 'computers', 'Apple', '0', '1000', 'white Apple laptop', 'gracern@gmail.com'),
('p0004', 'chair', 'electronics', 'furniture', 'steller', '0', '50', 'cusion chairs', 'gracern@gmail.com'),
('p0005', 'dell chargers', 'electronics', 'computers', 'dell', '0', '50', 'black dell xperia chargers', 'gracern@gmail.com'),
('p0006', 'Microsoft word', 'electronics', 'softwares', 'Microsoft', '100', '50', 'Microsoft word licences', 'gracern@gmail.com'),
('p0007', 'Hp Desktop', 'Electronics', 'Computers', 'HP', '10', '300', 'old Desktop', 'gracern@gmail.com'),
('p0008', 'grabage Trash', 'Furniture', 'Trashcan', 'toter', '10', '10', 'Old', 'gracern@gmail.com'),
('P0009', 'Mouse', 'Electronics', 'accessories', 'dell', '10', '10', 'black mouse', 'gracern@gmail.com'),
('P010', 'telephone', 'eletronics', 'cellphones', 'samsung', '10', '200', 'black phone', 'gracern@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `returnitems`
--

CREATE TABLE IF NOT EXISTS `returnitems` (
  `return_Id` varchar(50) NOT NULL,
  `p_name` varchar(20) NOT NULL,
  `return_quantity` varchar(20) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `returnitems`
--

INSERT INTO `returnitems` (`return_Id`, `p_name`, `return_quantity`, `timestamp`, `username`) VALUES
('p00052016-04-23 21:37:41', 'dell chargers', '10', '2016-04-24 02:33:51', 'arina@gmail.com'),
('p00042016-04-23 15:57:07', 'chair', '50', '2016-04-24 02:30:03', 'arina@gmail.com'),
('p00042016-04-23 15:57:07', 'chair', '30', '2016-04-24 12:19:15', 'arina@gmail.com'),
('p00042016-04-23 15:57:07', 'chair', '30', '2016-04-24 12:21:27', 'arina@gmail.com'),
('p00042016-04-23 15:57:07', 'chair', '30', '2016-04-24 12:27:43', 'arina@gmail.com'),
('p00042016-04-23 15:57:07', 'chair', '100', '2016-04-24 12:31:22', 'arina@gmail.com'),
('p00042016-04-23 15:57:07', 'chair', '100', '2016-04-24 12:31:40', 'arina@gmail.com'),
('p00042016-04-23 15:57:07', 'chair', '100', '2016-04-24 12:33:46', 'arina@gmail.com'),
('p00012016-04-25 16:38:18', 'dell laptops', '1', '2016-04-25 16:40:18', 'aashayborgaonkar@gma'),
('p00012016-04-23 15:52:03', 'dell laptops', '2', '2016-04-26 21:48:07', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '2', '2016-04-26 21:48:29', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '2', '2016-04-26 21:48:59', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '2', '2016-04-26 21:50:37', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '2', '2016-04-26 21:51:45', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-26 22:02:23', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-26 22:03:55', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-26 22:14:08', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-26 22:15:50', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-26 23:30:22', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-26 23:32:02', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-26 23:32:40', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-26 23:33:03', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-26 23:39:11', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:05:23', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:06:11', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:07:21', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:14:11', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:15:18', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:16:14', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:20:43', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:23:45', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:25:53', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:26:55', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:29:26', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:30:28', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:34:05', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:36:38', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:38:14', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:39:11', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:41:53', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:42:37', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 00:44:16', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 01:08:03', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 18:12:53', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 18:43:55', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 18:44:41', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 18:56:11', 'arina@gmail.com'),
('p0002', 'dell laptops', '10', '2016-04-27 18:56:32', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:10:20', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:22:44', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:22:53', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:23:45', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:23:58', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:24:06', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:27:05', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:27:32', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:27:35', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:27:52', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:29:18', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:34:19', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:48:59', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:50:02', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:51:16', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:53:35', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 19:57:26', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 20:06:18', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 20:28:56', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 20:30:30', 'arina@gmail.com'),
('p0005', 'dell chargers', '4', '2016-04-27 21:42:11', 'pinky@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '10', '2016-04-27 23:20:54', 'arina@gmail.com'),
('p00012016-04-23 15:52:03', 'dell laptops', '5', '2016-04-27 23:37:27', 'arina@gmail.com'),
('p00052016-04-28 22:55:21', 'dell chargers', '1', '2016-04-28 22:55:55', 'arina@gmail.com'),
('p00032016-04-29 14:08:45', 'Apple laptops', '1', '2016-04-29 14:09:00', 'arina@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `last_activity` varchar(200) NOT NULL,
  `session_id` varchar(200) NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`last_activity`, `session_id`) VALUES
('38', '4e365994-4666-4e0d-87d7-d5cf5f8955a1'),
('39', '5e809857-6282-4251-8eb8-28da8dec0fe9'),
('40', '95a6cc13-ba60-423f-ad79-f78ef5ad3007'),
('40', '42365425-2bcf-4d03-b8a0-77958471c032'),
('41', '81fa03fa-2239-4d64-88fc-474317e93154'),
('49', 'af5e279e-f9ef-4642-9865-82ca48246120'),
('52', 'dd1995af-d469-4b85-8cb5-1451227ae440'),
('53', 'b91169dc-3f35-4171-96ee-4b414c62db95'),
('55', 'b4a461df-b752-47eb-8bca-6e5b3cc68086'),
('06', '066513e7-8439-4812-aa13-640596af6db1'),
('08', 'b90595db-47c2-42e6-8078-8bf26824953b'),
('10', '5fe9ffb3-3ece-42fc-840f-0b57998725c7'),
('10', '0a86ef79-3b96-4204-9ce2-196769846d21'),
('11', 'b9479e70-40de-412a-a833-9f4d922620c8');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE IF NOT EXISTS `subcategory` (
  `Sc_Id` varchar(10) NOT NULL,
  `Sc_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Sc_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`Sc_Id`, `Sc_Name`) VALUES
('SC0001', 'Laptops');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory_supplier`
--

CREATE TABLE IF NOT EXISTS `subcategory_supplier` (
  `sc_Id` varchar(10) NOT NULL,
  `supplier_Id` varchar(10) NOT NULL,
  PRIMARY KEY (`sc_Id`,`supplier_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory_supplier`
--

INSERT INTO `subcategory_supplier` (`sc_Id`, `supplier_Id`) VALUES
('SC0001', 'S0001');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `S_Id` varchar(10) NOT NULL,
  `S_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`S_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`S_Id`, `S_Name`) VALUES
('S0001', 'Dell');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `username` varchar(100) NOT NULL,
  `P_Id` varchar(20) NOT NULL,
  `P_Name` varchar(100) NOT NULL,
  `P_Price` varchar(10) NOT NULL,
  `P_Quantity` varchar(10) NOT NULL,
  `P_Total` varchar(10) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`username`, `P_Id`, `P_Name`, `P_Price`, `P_Quantity`, `P_Total`, `timestamp`) VALUES
('arina@gmail.com', 'p0001', 'dell laptops', '500', '10', '5000', '2016-04-23 15:52:03'),
('arina@gmail.com', 'p0002', 'dell laptops', '500', '10', '5000', '2016-04-23 15:52:03'),
('arina@gmail.com', 'p0004', 'chair', '50', '100', '5000', '2016-04-23 15:57:07'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:37:38'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:37:41'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:38:53'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:39:35'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:39:45'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:39:48'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:39:54'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:40:08'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:40:12'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:42:30'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:43:46'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:44:22'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:44:27'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:44:36'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:45:25'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:47:02'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:48:12'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:55:33'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:56:09'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:56:10'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:56:14'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:56:21'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:56:59'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 21:57:17'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:01:52'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:02:17'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:02:29'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:02:45'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:11:04'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:11:57'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:12:10'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:13:33'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:13:51'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:17:14'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:17:36'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:17:55'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:20:08'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:20:18'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:21:01'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:22:37'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:27:09'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:35:02'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '10', '500', '2016-04-23 22:41:42'),
('arina@gmail.com', 'p0004', 'chair', '50', '84', '4200', '2016-04-23 23:03:09'),
('arina@gmail.com', 'p0004', 'chair', '50', '10', '500', '2016-04-23 23:06:13'),
('aashayborgaonkar@gmail.com', 'p0001', 'dell laptops', '500', '10', '5000', '2016-04-25 16:38:18'),
('aashayborgaonkar@gmail.com', 'p0004', 'chair', '50', '6', '300', '2016-04-25 16:38:18'),
('pinky@gmail.com', 'p0005', 'dell chargers', '50', '4', '200', '2016-04-27 21:41:50'),
('arina@gmail.com', 'p0003', 'Apple laptops', '1000', '10', '10000', '2016-04-27 23:37:03'),
('arina@gmail.com', 'p0003', 'Apple laptops', '1000', '9', '9000', '2016-04-28 01:50:30'),
('arina@gmail.com', 'p0005', 'dell chargers', '50', '1', '50', '2016-04-28 22:55:21'),
('arina@gmail.com', 'p0003', 'Apple laptops', '1000', '1', '1000', '2016-04-29 14:08:45');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
