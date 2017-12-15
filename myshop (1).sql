-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2017 at 05:35 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(10) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_pass` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_name`, `admin_pass`) VALUES
(1, 'admin', 'admin21');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `pro_id` int(10) NOT NULL,
  `ip_add` int(10) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_title` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Ladies shoes'),
(3, 'Mens T-shirt'),
(4, 'Mens shoes'),
(6, 'Ladies dress');

-- --------------------------------------------------------

--
-- Table structure for table `customer_info`
--

CREATE TABLE IF NOT EXISTS `customer_info` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_pass` varchar(100) NOT NULL,
  `customer_country` varchar(100) NOT NULL,
  `customer_city` varchar(100) NOT NULL,
  `customer_contact` int(11) NOT NULL,
  `customer_address` varchar(100) NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE IF NOT EXISTS `customer_order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `total_products` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_status` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`order_id`, `customer_id`, `due_amount`, `invoice_no`, `total_products`, `order_date`, `order_status`) VALUES
(8, 4, 3000, 80, 1, '2017-04-19 14:00:24', 'pending'),
(10, 4, 1350, 217, 1, '2017-06-13 13:14:48', 'pending'),
(11, 5, 1700, 921, 1, '2017-06-18 12:52:11', 'pending'),
(13, 1, 3000, 723, 1, '2017-06-24 09:58:05', 'complete'),
(14, 1, 3000, 846, 1, '2017-06-18 14:15:48', 'pending'),
(15, 1, 1300, 582, 1, '2017-06-24 09:53:42', 'pending'),
(16, 1, 0, 217, 0, '2017-06-24 09:56:49', 'pending'),
(17, 1, 1000, 337, 1, '2017-06-24 09:57:01', 'pending'),
(18, 1, 0, 24, 2, '2017-06-24 10:03:36', 'pending'),
(19, 1, 0, 19, 0, '2017-06-25 04:40:17', 'pending'),
(20, 1, 1000, 666, 1, '2017-06-25 04:40:40', 'pending'),
(21, 1, 0, 133, 0, '2017-06-25 04:56:42', 'pending'),
(22, 1, 1500, 123, 1, '2017-06-25 04:56:53', 'pending'),
(23, 2, 1200, 174, 1, '2017-10-20 05:03:07', 'complete'),
(24, 2, 0, 587, 0, '2017-06-25 15:06:04', 'pending'),
(25, 2, 2400, 785, 1, '2017-08-20 10:50:00', 'pending'),
(26, 2, 0, 580, 2, '2017-09-10 05:00:43', 'pending'),
(27, 2, 0, 192, 3, '2017-09-10 05:17:46', 'pending'),
(28, 2, 850, 993, 1, '2017-09-17 05:06:21', 'pending'),
(29, 1, 3000, 102, 1, '2017-10-20 04:48:21', 'pending'),
(30, 1, 1000, 34, 1, '2017-10-20 04:50:55', 'pending'),
(31, 2, 3000, 792, 1, '2017-10-20 04:54:26', 'pending'),
(32, 2, 1950, 283, 2, '2017-10-25 10:23:33', 'pending'),
(33, 2, 0, 644, 3, '2017-10-31 05:21:43', 'pending'),
(34, 2, 1950, 974, 2, '2017-11-18 16:31:42', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `ordered_products`
--

CREATE TABLE IF NOT EXISTS `ordered_products` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `qty` int(11) NOT NULL,
  `order_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int(11) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `ref_no` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_title` varchar(255) NOT NULL,
  `product_image` text NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_keywords` varchar(20) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `cat_id`, `date`, `product_title`, `product_image`, `product_price`, `product_desc`, `product_keywords`, `status`) VALUES
(10, 3, '2017-02-19 12:01:36', 'Half Tshirt', 'mnzwqosebAM0PTfD_xsiNCg.jpg', 450, 'Barca club Tshirt', ' tshirt, mens dress', 'on'),
(14, 4, '2017-06-22 15:50:24', 'Boot', 'FT0008.jpg', 3000, '&lt;p&gt;Large size boot.&lt;/p&gt;', 'mens shoes, boot', 'on'),
(16, 4, '2017-06-25 17:48:51', 'Conversee', 'converse-shoes-black-chuck-taylor-all-star-classic-womens-mens-canvas-sneakers-high.jpg', 1500, '&lt;p&gt;Converse large size.&lt;/p&gt;', 'converse, mens shoes', 'on'),
(17, 4, '2017-02-19 12:28:12', 'Converse', 'converse-shoes-white-chuck-taylor-all-star-classic-womens-mens-canvas-lo-sneakers-2039-1.jpg', 650, 'white converse.', 'convers, mens shoes', 'on'),
(21, 6, '2017-03-26 07:33:23', 'Black and Red Lace dress', 'The-Vanca-Women-Black-and-Red-Lace-Dress_1710184ac5b09edf8a9bec6660d083e0_images_1080_1440_mini.jpg', 950, 'Women black and Red Lace dress.', 'red lace dress', 'on'),
(23, 6, '2017-06-18 14:40:05', 'Printed plus seize', 'M60236A-printed-plus-sieze-ladies-dress-names.jpg', 1200, 'Printed seize plus ladies dress.', 'ladies dress,printed', 'on'),
(24, 3, '2017-06-18 14:41:52', 'cotton men t-shirt', 'Cotton-Men-T-Shirt-steampunk-beard-man-Printing-Cool-Pipe-Skull-T-Shirts-Men-s-Top.jpg', 1000, 'Cotton men printed t-shirt', 'shirt,printed t-shir', 'on'),
(25, 6, '2017-06-26 13:54:12', 'kurtha', '6.jpg', 3500, '&lt;p&gt;Kurtha&lt;/p&gt;', 'ladies dress,kurtha', 'on'),
(26, 4, '2017-06-20 16:33:36', 'Vanss', 'vans-slip-on-pro-skate-shoes-black-white-gum (1).jpg', 1500, '&lt;p&gt;Vans&lt;/p&gt;', 'shoes,vans', ''),
(27, 6, '2017-06-20 17:00:34', 'ladies dress', '3.jpg', 850, 'printed ladies dress.', 'ladies dress,printed', 'on');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `customer_info`
--
ALTER TABLE `customer_info`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `pro_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `customer_info`
--
ALTER TABLE `customer_info`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `ordered_products`
--
ALTER TABLE `ordered_products`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
