-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2023 at 06:55 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pubs`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `au_id` int(8) NOT NULL,
  `au_lname` varchar(40) NOT NULL,
  `au_fname` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`au_id`, `au_lname`, `au_fname`) VALUES
(1, 'Bennet', 'Abraham'),
(2, 'Green', 'Marjorie'),
(3, 'Carson', 'Cheryl'),
(4, 'Ringer', 'Albert'),
(5, 'Ringer', 'Anne'),
(6, 'DeFrance', 'Michel'),
(7, 'McBadden', 'Heather'),
(8, 'Stringer', 'Dirk'),
(9, 'Straight', 'Dean'),
(10, 'Karsen', 'Livia');

-- --------------------------------------------------------

--
-- Table structure for table `titleauthor`
--

CREATE TABLE `titleauthor` (
  `au_id` int(8) NOT NULL,
  `title_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `titleauthor`
--

INSERT INTO `titleauthor` (`au_id`, `title_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(3, 10),
(3, 11),
(4, 3),
(4, 13),
(5, 4),
(5, 12),
(6, 5),
(7, 6),
(7, 10),
(7, 11),
(7, 13),
(8, 3),
(8, 7),
(9, 8),
(9, 13),
(10, 3),
(10, 9);

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `title_id` int(8) NOT NULL,
  `title` varchar(80) NOT NULL,
  `pub_year` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`title_id`, `title`, `pub_year`) VALUES
(1, 'Secrets of Silicon Valley', '1994'),
(2, 'Emotional Security: A New Algorithm', '1991'),
(3, 'Prolonged Data Deprivation: Four Case Studies', '1991'),
(4, 'Cooking with Computers: Surreptitious Balance Sheets', '1992'),
(5, 'Silicon Valley Gastronomic Treats', '1993'),
(6, 'Fifty Years in Buckingham Palace Kitchens', '1991'),
(7, 'But Is It User Friendly?', '1993'),
(8, 'You Can Combat Computer Stress!', '1991'),
(9, 'Is Anger the Enemy?', '1991'),
(10, 'Life Without Fear', '1992'),
(11, 'The Gourmet Microwave', '1995'),
(12, 'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean', '1991'),
(13, 'Straight Talk About Computers', '1994');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`au_id`);

--
-- Indexes for table `titleauthor`
--
ALTER TABLE `titleauthor`
  ADD PRIMARY KEY (`au_id`,`title_id`),
  ADD KEY `au_id` (`au_id`),
  ADD KEY `title_id` (`title_id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`title_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `au_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `title_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `titleauthor`
--
ALTER TABLE `titleauthor`
  ADD CONSTRAINT `titleauthor_ibfk_1` FOREIGN KEY (`au_id`) REFERENCES `authors` (`au_id`),
  ADD CONSTRAINT `titleauthor_ibfk_2` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
