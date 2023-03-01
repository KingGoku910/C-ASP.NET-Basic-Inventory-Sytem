-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 01, 2023 at 09:32 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store_crud_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductAddOrEdit` (`_productId` INT, `_product` VARCHAR(45), `_price` DECIMAL(18,2), `_count` INT, `_description` VARCHAR(250))   BEGIN
	if _productId = 0 then 
		INSERT INTO product(product,price,count,description)
		values (_product,_price,_count,_description);
	else
		UPDATE product
        SET
		 product=_product,
         price=_price,
         count=_count,
         description=_description
         where productId=_productId;
	END if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductDeleteByID` (`_productId` INT)   BEGIN
	delete from product
    where productId=_productId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductViewAll` ()   BEGIN
	SELECT * 
    FROM product;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductViewByID` (`_productID` INT)   BEGIN
	select *
    from product
    where productId=_productID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(11) NOT NULL,
  `product` varchar(45) DEFAULT NULL,
  `price` decimal(18,2) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `product`, `price`, `count`, `description`) VALUES
(2, 'Pen', '50.00', 200, 'Ink filled writing Utencil');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
