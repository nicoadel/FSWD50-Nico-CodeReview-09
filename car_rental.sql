-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2018 at 04:55 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_charges`
--

CREATE TABLE `additional_charges` (
  `charges_id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `days_of_rental` int(11) DEFAULT NULL,
  `fk_car_condition_id` int(11) DEFAULT NULL,
  `fk_payment_id` int(11) DEFAULT NULL,
  `fk_place_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `additional_charges`
--

INSERT INTO `additional_charges` (`charges_id`, `amount`, `days_of_rental`, `fk_car_condition_id`, `fk_payment_id`, `fk_place_id`) VALUES
(1, 23423, 500, 1, 3, 2),
(2, 43, 2, 3, 2, 3),
(3, 3434, 99, 2, 1, 1),
(4, 15, 1, 4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `fk_insur_id` int(11) NOT NULL,
  `fk_car_id` int(11) NOT NULL,
  `fk_invoice_id` int(11) NOT NULL,
  `fk_charges_id` int(11) NOT NULL,
  `fk_employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `fk_insur_id`, `fk_car_id`, `fk_invoice_id`, `fk_charges_id`, `fk_employee_id`) VALUES
(1, 1, 3, 1, 1, 1),
(2, 4, 2, 4, 2, 2),
(3, 2, 3, 2, 3, 3),
(4, 4, 4, 4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `car_amount` int(11) DEFAULT NULL,
  `car_how_many_rented` int(11) DEFAULT NULL,
  `car_how_many_left` int(11) DEFAULT NULL,
  `car_fk_car_info_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `car_amount`, `car_how_many_rented`, `car_how_many_left`, `car_fk_car_info_id`) VALUES
(1, 220, 900, 43, 4),
(2, 180, 700, 23, 1),
(3, 240, 13, 137, 3),
(4, 160, 40, 120, 1);

-- --------------------------------------------------------

--
-- Table structure for table `car_condition`
--

CREATE TABLE `car_condition` (
  `car_condition_id` int(11) NOT NULL,
  `fuel_tank_diff` int(11) DEFAULT NULL,
  `odometer_diff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_condition`
--

INSERT INTO `car_condition` (`car_condition_id`, `fuel_tank_diff`, `odometer_diff`) VALUES
(1, 545, 423),
(2, 180, 212),
(3, 3442, 423),
(4, 23, 423);

-- --------------------------------------------------------

--
-- Table structure for table `car_information`
--

CREATE TABLE `car_information` (
  `car_info_id` int(11) NOT NULL,
  `fk_manu_id` int(11) DEFAULT NULL,
  `fk_model_id` int(11) DEFAULT NULL,
  `fk_condition_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_information`
--

INSERT INTO `car_information` (`car_info_id`, `fk_manu_id`, `fk_model_id`, `fk_condition_id`) VALUES
(1, 3, 2, 1),
(2, 2, 3, 4),
(3, 1, 4, 3),
(4, 4, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `condition`
--

CREATE TABLE `condition` (
  `condition_id` int(11) NOT NULL,
  `fuel_stand` int(11) DEFAULT NULL,
  `odometer` int(11) DEFAULT NULL,
  `built_in` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `condition`
--

INSERT INTO `condition` (`condition_id`, `fuel_stand`, `odometer`, `built_in`) VALUES
(1, 220, 23234, '2000-12-20'),
(2, 2520, 324234, '2010-11-20'),
(3, 2240, 2323, '2012-12-20'),
(4, 180, 70000, '2002-12-23');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `customer_name` varchar(55) DEFAULT NULL,
  `customer_address` varchar(55) DEFAULT NULL,
  `customer_age` int(11) DEFAULT NULL,
  `customer_email` varchar(55) DEFAULT NULL,
  `customer_tel_num` int(11) DEFAULT NULL,
  `fk_booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `customer_name`, `customer_address`, `customer_age`, `customer_email`, `customer_tel_num`, `fk_booking_id`) VALUES
(1, 'Nico', 'Vienna', 18, 'nico@gmail.com', 2147483647, 2),
(2, 'Marco', 'Favoriten', 20, 'marco@gmail.com', 345345345, 3),
(3, 'Anja', 'Berlin', 22, 'anja@gmail.com', 2147483647, 4),
(4, 'Karin', 'wWrsaw', 24, 'karin@gmail.com', 345345345, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(55) DEFAULT NULL,
  `employee_address` varchar(55) DEFAULT NULL,
  `employee_date_of_begin` date DEFAULT NULL,
  `employee_position` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_name`, `employee_address`, `employee_date_of_begin`, `employee_position`) VALUES
(1, 'hans', 'vienna', '2010-12-04', 'chief'),
(2, 'peter', 'barcelona', '2010-12-04', 'support'),
(3, 'fritz', 'mallorca', '2010-12-04', 'data_scientist'),
(4, 'herbert', 'vancouver', '2010-12-04', 'intern');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `insur_id` int(11) NOT NULL,
  `insurance_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`insur_id`, `insurance_amount`) VALUES
(1, 120),
(2, 400),
(3, 300),
(4, 430);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_amount` int(11) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `fk_payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_amount`, `invoice_date`, `fk_payment_id`) VALUES
(1, 2343, '1996-12-20', 1),
(2, 1000, '1997-10-10', 3),
(3, 4300, '2005-02-05', 4),
(4, 3600, '2002-05-03', 2);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `manu_id` int(11) NOT NULL,
  `manu_name` varchar(55) DEFAULT NULL,
  `manu_location` varchar(55) DEFAULT NULL,
  `manu_support` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`manu_id`, `manu_name`, `manu_location`, `manu_support`) VALUES
(1, 'bmw', 'munich', 'nina'),
(2, 'mercedes', 'berlin', 'tina'),
(3, 'renault', 'vienna', 'julia'),
(4, 'lamborghini', 'salzburg', 'eva');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(55) DEFAULT NULL,
  `model_seats` int(11) DEFAULT NULL,
  `model_weight` int(11) DEFAULT NULL,
  `model_storage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`model_id`, `model_name`, `model_seats`, `model_weight`, `model_storage`) VALUES
(1, 'x50', 4, 323, 4343),
(2, 'g class', 3, 400, 2323),
(3, 'clio', 5, 500, 5444),
(4, 'x30', 2, 239, 2333);

-- --------------------------------------------------------

--
-- Table structure for table `payment_info`
--

CREATE TABLE `payment_info` (
  `payment_id` int(11) NOT NULL,
  `type` varchar(55) DEFAULT NULL,
  `date_of_payment` varchar(55) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_info`
--

INSERT INTO `payment_info` (`payment_id`, `type`, `date_of_payment`, `amount`) VALUES
(1, 'visa', '2010-12-04', 3423),
(2, 'mastercard', '2008-10-04', 2344),
(3, 'bar', '2005-12-24', 5444),
(4, 'bar', '2013-11-04', 23433);

-- --------------------------------------------------------

--
-- Table structure for table `place_of_return_pickup`
--

CREATE TABLE `place_of_return_pickup` (
  `place_id` int(11) NOT NULL,
  `return_address` varchar(55) DEFAULT NULL,
  `return_zip` int(11) DEFAULT NULL,
  `return_country` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `place_of_return_pickup`
--

INSERT INTO `place_of_return_pickup` (`place_id`, `return_address`, `return_zip`, `return_country`) VALUES
(1, 'vienna', 3222, 'austria'),
(2, 'barcelona', 4343, 'spain'),
(3, 'munich', 2133, 'germany'),
(4, 'munich', 4333, 'germany');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`charges_id`),
  ADD KEY `fk_car_condition_id` (`fk_car_condition_id`),
  ADD KEY `fk_payment_id` (`fk_payment_id`),
  ADD KEY `fk_place_id` (`fk_place_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_charges_id` (`fk_charges_id`),
  ADD KEY `fk_insur_id` (`fk_insur_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_car_info_id` (`car_fk_car_info_id`);

--
-- Indexes for table `car_condition`
--
ALTER TABLE `car_condition`
  ADD PRIMARY KEY (`car_condition_id`);

--
-- Indexes for table `car_information`
--
ALTER TABLE `car_information`
  ADD PRIMARY KEY (`car_info_id`),
  ADD KEY `fk_condition_id` (`fk_condition_id`),
  ADD KEY `fk_manu_id` (`fk_manu_id`),
  ADD KEY `fk_model_id` (`fk_model_id`);

--
-- Indexes for table `condition`
--
ALTER TABLE `condition`
  ADD PRIMARY KEY (`condition_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD KEY `fk_booking_id` (`fk_booking_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insur_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_payment_id` (`fk_payment_id`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`manu_id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`model_id`);

--
-- Indexes for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `place_of_return_pickup`
--
ALTER TABLE `place_of_return_pickup`
  ADD PRIMARY KEY (`place_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD CONSTRAINT `additional_charges_ibfk_1` FOREIGN KEY (`fk_car_condition_id`) REFERENCES `car_condition` (`car_condition_id`),
  ADD CONSTRAINT `additional_charges_ibfk_2` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment_info` (`payment_id`),
  ADD CONSTRAINT `additional_charges_ibfk_3` FOREIGN KEY (`fk_place_id`) REFERENCES `place_of_return_pickup` (`place_id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`fk_charges_id`) REFERENCES `additional_charges` (`charges_id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`fk_insur_id`) REFERENCES `insurance` (`insur_id`),
  ADD CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `booking_ibfk_5` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`car_fk_car_info_id`) REFERENCES `car_information` (`car_info_id`);

--
-- Constraints for table `car_information`
--
ALTER TABLE `car_information`
  ADD CONSTRAINT `car_information_ibfk_1` FOREIGN KEY (`fk_condition_id`) REFERENCES `condition` (`condition_id`),
  ADD CONSTRAINT `car_information_ibfk_2` FOREIGN KEY (`fk_manu_id`) REFERENCES `manufacturer` (`manu_id`),
  ADD CONSTRAINT `car_information_ibfk_3` FOREIGN KEY (`fk_model_id`) REFERENCES `model` (`model_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_booking_id`) REFERENCES `booking` (`booking_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_payment_id`) REFERENCES `payment_info` (`payment_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
