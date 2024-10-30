-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 25, 2024 at 09:06 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fincrest`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `pan_card_number` varchar(15) DEFAULT NULL,
  `aadhar_number` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `phone`, `dob`, `city`, `address`, `reference`, `pan_card_number`, `aadhar_number`) VALUES
(41, 'John Doe', 'john.doe@example.com', '9876543210', '1990-01-15', 'New York', '123 Main St, New York, NY 10001', 'Alice Smith', 'ABCD1234E', '123456789001'),
(42, 'Jane Smith', 'jane.smith@example.com', '9876543211', '1988-05-20', 'Los Angeles', '456 Elm St, Los Angeles, CA 90001', 'Bob Johnson', 'EFGH5678I', '123456789002'),
(43, 'Michael Brown', 'michael.brown@example.com', '9876543212', '1992-07-30', 'Chicago', '789 Pine St, Chicago, IL 60601', 'Charlie Davis', 'IJKL9101M', '123456789003'),
(44, 'Emily Davis', 'emily.davis@example.com', '9876543213', '1985-11-25', 'Houston', '321 Oak St, Houston, TX 77001', 'David Wilson', 'MNOP1213N', '123456789004'),
(45, 'Daniel Wilson', 'daniel.wilson@example.com', '9876543214', '1995-03-10', 'Phoenix', '654 Cedar St, Phoenix, AZ 85001', 'Eve Johnson', 'QRST1415O', '123456789005'),
(46, 'Olivia Miller', 'olivia.miller@example.com', '9876543215', '1980-02-14', 'Philadelphia', '987 Birch St, Philadelphia, PA 19101', 'Frank Wright', 'UVWX1617P', '123456789006'),
(47, 'James Anderson', 'james.anderson@example.com', '9876543216', '1993-09-03', 'San Antonio', '135 Spruce St, San Antonio, TX 78201', 'Grace Lee', 'YZAB1819Q', '123456789007'),
(48, 'Ava Thomas', 'ava.thomas@example.com', '9876543217', '1991-06-07', 'San Diego', '246 Maple St, San Diego, CA 92101', 'Hank Green', 'CDEF2021R', '123456789008'),
(49, 'Lucas Jackson', 'lucas.jackson@example.com', '9876543218', '1989-08-15', 'Dallas', '357 Walnut St, Dallas, TX 75201', 'Ivy Blue', 'GHIJ2223S', '123456789009'),
(50, 'Mia White', 'mia.white@example.com', '9876543219', '1994-10-30', 'San Jose', '468 Chestnut St, San Jose, CA 95101', 'Jack Red', 'KLMN2425T', '123456789010'),
(51, 'Ethan Harris', 'ethan.harris@example.com', '9876543220', '1987-12-11', 'Austin', '579 Fir St, Austin, TX 78701', 'Kathy Gray', 'OPQR2627U', '123456789011'),
(52, 'Isabella Martin', 'isabella.martin@example.com', '9876543221', '1996-04-12', 'Jacksonville', '680 Pine St, Jacksonville, FL 32201', 'Liam Yellow', 'STUV2829V', '123456789012'),
(53, 'Alexander Thompson', 'alexander.thompson@example.com', '9876543222', '1992-02-20', 'San Francisco', '791 Oak St, San Francisco, CA 94101', 'Mia White', 'WXYZ3031W', '123456789013'),
(54, 'Sophia Garcia', 'sophia.garcia@example.com', '9876543223', '1990-09-27', 'Columbus', '902 Maple St, Columbus, OH 43201', 'Noah Green', 'ABCD3233X', '123456789014'),
(55, 'William Martinez', 'william.martinez@example.com', '9876543224', '1984-06-14', 'Fort Worth', '213 Birch St, Fort Worth, TX 76101', 'Olivia Red', 'EFGH3434Y', '123456789015'),
(56, 'Charlotte Rodriguez', 'charlotte.rodriguez@example.com', '9876543225', '1993-07-21', 'Charlotte', '324 Cedar St, Charlotte, NC 28201', 'Peter Blue', 'IJKL3636Z', '123456789016'),
(57, 'Noah Lee', 'noah.lee@example.com', '9876543226', '1986-03-15', 'Indianapolis', '435 Fir St, Indianapolis, IN 46201', 'Quinn Brown', 'MNOP3838A', '123456789017'),
(58, 'Amelia Perez', 'amelia.perez@example.com', '9876543227', '1995-10-30', 'Seattle', '546 Spruce St, Seattle, WA 98101', 'Raymond Black', 'QRST4040B', '123456789018'),
(59, 'Oliver Johnson', 'oliver.johnson@example.com', '9876543228', '1983-08-11', 'Denver', '657 Maple St, Denver, CO 80201', 'Samantha Purple', 'UVWX4242C', '123456789019'),
(60, 'Avery Kim', 'avery.kim@example.com', '9876543229', '1991-05-22', 'Boston', '768 Oak St, Boston, MA 02101', 'Thomas Orange', 'YZAB4444D', '123456789020'),
(61, 'Emma Wilson', 'emma.wilson@example.com', '9876543230', '1990-02-01', 'Miami', '101 Sunset Blvd, Miami, FL 33101', 'Nathan Grey', 'ABCD4545E', '123456789021'),
(62, 'Liam Brown', 'liam.brown@example.com', '9876543231', '1988-12-12', 'Orlando', '202 Ocean Dr, Orlando, FL 32801', 'Oliver Green', 'EFGH4646F', '123456789022'),
(63, 'Mason Clark', 'mason.clark@example.com', '9876543232', '1994-05-25', 'Dallas', '303 River Rd, Dallas, TX 75202', 'Emily White', 'IJKL4747G', '123456789023'),
(64, 'Harper Lewis', 'harper.lewis@example.com', '9876543233', '1993-03-13', 'Atlanta', '404 Peach St, Atlanta, GA 30301', 'John Doe', 'MNOP4848H', '123456789024'),
(65, 'Ella Walker', 'ella.walker@example.com', '9876543234', '1992-09-15', 'Houston', '505 Bay St, Houston, TX 77002', 'Jane Smith', 'QRST4949I', '123456789025'),
(66, 'Jack Allen', 'jack.allen@example.com', '9876543235', '1985-11-20', 'Nashville', '606 Broadway Ave, Nashville, TN 37201', 'David Johnson', 'UVWX5050J', '123456789026'),
(67, 'Avery Carter', 'avery.carter@example.com', '9876543236', '1991-04-14', 'Portland', '707 Rose St, Portland, OR 97201', 'Mia White', 'YZAB5151K', '123456789027'),
(68, 'Grace Hill', 'grace.hill@example.com', '9876543237', '1989-06-29', 'Seattle', '808 Pine St, Seattle, WA 98101', 'Jack Red', 'CDEF5252L', '123456789028'),
(69, 'Henry Scott', 'henry.scott@example.com', '9876543238', '1987-08-02', 'San Diego', '909 Beach Ave, San Diego, CA 92102', 'Emily Davis', 'GHIJ5353M', '123456789029'),
(70, 'Isabella Adams', 'isabella.adams@example.com', '9876543239', '1990-07-19', 'Phoenix', '111 Desert Rd, Phoenix, AZ 85002', 'David Wilson', 'KLMN5454N', '123456789030'),
(71, 'Sebastian Torres', 'sebastian.torres@example.com', '9876543240', '1993-11-01', 'San Francisco', '222 Bay St, San Francisco, CA 94102', 'Bob Johnson', 'OPQR5555O', '123456789031'),
(72, 'Chloe Ramirez', 'chloe.ramirez@example.com', '9876543241', '1984-04-23', 'Denver', '333 Mountain Rd, Denver, CO 80202', 'Eve Johnson', 'STUV5656P', '123456789032'),
(73, 'Lucas Foster', 'lucas.foster@example.com', '9876543242', '1992-01-10', 'Philadelphia', '444 Liberty St, Philadelphia, PA 19102', 'Hank Green', 'WXYZ5757Q', '123456789033'),
(74, 'Ella King', 'ella.king@example.com', '9876543243', '1995-05-09', 'Boston', '555 Charles St, Boston, MA 02102', 'Liam Yellow', 'ABCD5858R', '123456789034'),
(75, 'Aria Young', 'aria.young@example.com', '9876543244', '1986-02-15', 'Austin', '666 Capitol Blvd, Austin, TX 78702', 'Grace Lee', 'EFGH5959S', '123456789035'),
(76, 'Ryan Perez', 'ryan.perez@example.com', '9876543245', '1987-07-21', 'Columbus', '777 Buckeye Rd, Columbus, OH 43202', 'Olivia Red', 'IJKL6060T', '123456789036'),
(77, 'Zoe Sanders', 'zoe.sanders@example.com', '9876543246', '1991-03-30', 'Fort Worth', '888 Stockyard Rd, Fort Worth, TX 76102', 'Raymond Black', 'MNOP6161U', '123456789037'),
(78, 'Nathan Ramirez', 'nathan.ramirez@example.com', '9876543247', '1989-12-25', 'Indianapolis', '999 Monument Cir, Indianapolis, IN 46202', 'Samantha Purple', 'QRST6262V', '123456789038'),
(79, 'Lily Gonzales', 'lily.gonzales@example.com', '9876543248', '1990-11-16', 'Charlotte', '1010 Queen St, Charlotte, NC 28202', 'Peter Blue', 'UVWX6363W', '123456789039'),
(80, 'Ethan Morris', 'ethan.morris@example.com', '9876543249', '1994-10-03', 'Memphis', '1111 Beale St, Memphis, TN 38102', 'Nathan Grey', 'YZAB6464X', '123456789040'),
(81, 'Madison Bell', 'madison.bell@example.com', '9876543250', '1992-09-10', 'Las Vegas', '1212 Strip Rd, Las Vegas, NV 89102', 'Jack Allen', 'CDEF6565Y', '123456789041'),
(82, 'Dylan Evans', 'dylan.evans@example.com', '9876543251', '1988-01-28', 'Louisville', '1313 Derby Rd, Louisville, KY 40202', 'Nathan Ramirez', 'GHIJ6666Z', '123456789042'),
(83, 'Sofia Cook', 'sofia.cook@example.com', '9876543252', '1989-04-11', 'Baltimore', '1414 Harbor St, Baltimore, MD 21202', 'Mason Clark', 'KLMN6767A', '123456789043'),
(84, 'Aaron Barnes', 'aaron.barnes@example.com', '9876543253', '1991-06-15', 'San Antonio', '1515 Riverwalk Dr, San Antonio, TX 78202', 'Lily Gonzales', 'OPQR6868B', '123456789044'),
(85, 'Riley Rivera', 'riley.rivera@example.com', '9876543254', '1985-02-27', 'Raleigh', '1616 Hillsborough St, Raleigh, NC 27602', 'Grace Hill', 'STUV6969C', '123456789045'),
(86, 'Landon Lopez', 'landon.lopez@example.com', '9876543255', '1983-08-22', 'Tucson', '1717 Cactus Rd, Tucson, AZ 85702', 'Ava Thomas', 'WXYZ7070D', '123456789046'),
(87, 'Nora Powell', 'nora.powell@example.com', '9876543256', '1990-03-17', 'Albuquerque', '1818 Route 66, Albuquerque, NM 87102', 'Ryan Perez', 'ABCD7171E', '123456789047'),
(88, 'Connor Russell', 'connor.russell@example.com', '9876543257', '1995-12-14', 'Sacramento', '1919 Capital St, Sacramento, CA 95802', 'Mia White', 'EFGH7272F', '123456789048'),
(89, 'Paisley Simmons', 'paisley.simmons@example.com', '9876543258', '1992-07-06', 'Kansas City', '2020 Plaza Rd, Kansas City, MO 64102', 'Emily Davis', 'IJKL7373G', '123456789049'),
(90, 'Easton Kelly', 'easton.kelly@example.com', '9876543259', '1987-10-05', 'Fresno', '2121 Yosemite Blvd, Fresno, CA 93702', 'David Johnson', 'MNOP7474H', '123456789050'),
(91, 'Scarlett Brooks', 'scarlett.brooks@example.com', '9876543260', '1990-06-18', 'Cleveland', '2222 Lake Rd, Cleveland, OH 44102', 'Liam Brown', 'QRST7575I', '123456789051'),
(92, 'Hudson Butler', 'hudson.butler@example.com', '9876543261', '1989-01-09', 'Virginia Beach', '2323 Oceanfront Ave, Virginia Beach, VA 23402', 'Noah Green', 'UVWX7676J', '123456789052'),
(93, 'Ellie Mitchell', 'ellie.mitchell@example.com', '9876543262', '1993-02-24', 'New Orleans', '2424 Bourbon St, New Orleans, LA 70102', 'Mason Clark', 'YZAB7777K', '123456789053'),
(94, 'Lincoln Ward', 'lincoln.ward@example.com', '9876543263', '1991-11-30', 'Milwaukee', '2525 Water St, Milwaukee, WI 53202', 'Chloe Ramirez', 'CDEF7878L', '123456789054'),
(95, 'Aurora Reed', 'aurora.reed@example.com', '9876543264', '1988-03-04', 'Tampa', '2626 Riverwalk Blvd, Tampa, FL 33602', 'Lucas Foster', 'GHIJ7979M', '123456789055'),
(96, 'Christian Jenkins', 'christian.jenkins@example.com', '9876543265', '1989-12-01', 'St. Louis', '2727 Gateway Blvd, St. Louis, MO 63102', 'Nora Powell', 'KLMN8080N', '123456789056'),
(97, 'Violet Bennett', 'violet.bennett@example.com', '9876543266', '1991-08-20', 'Buffalo', '2828 Niagara St, Buffalo, NY 14202', 'Aaron Barnes', 'OPQR8181O', '123456789057'),
(98, 'Asher Stewart', 'asher.stewart@example.com', '9876543267', '1994-09-28', 'El Paso', '2929 Sunland Park Dr, El Paso, TX 79902', 'Ellie Mitchell', 'STUV8282P', '123456789058'),
(99, 'Leah Foster', 'leah.foster@example.com', '9876543268', '1992-10-16', 'Omaha', '3030 Cornhusker Rd, Omaha, NE 68102', 'Zoe Sanders', 'WXYZ8383Q', '123456789059'),
(100, 'Adrian Stone', 'adrian.stone@example.com', '9876543269', '1987-12-12', 'Bakersfield', '3131 Oilfield Dr, Bakersfield, CA 93302', 'Nathan Ramirez', 'ABCD8484R', '123456789060'),
(101, 'Hazel Ross', 'hazel.ross@example.com', '9876543270', '1990-03-21', 'Wichita', '3232 Air Capital Blvd, Wichita, KS 67202', 'Harper Lewis', 'EFGH8585S', '123456789061'),
(102, 'Josiah Bell', 'josiah.bell@example.com', '9876543271', '1985-09-19', 'Arlington', '3333 Ranger Blvd, Arlington, TX 76002', 'Lucas Foster', 'IJKL8686T', '123456789062'),
(103, 'Sophie Cruz', 'sophie.cruz@example.com', '9876543272', '1993-06-13', 'Aurora', '3434 Rocky Rd, Aurora, CO 80002', 'Riley Rivera', 'MNOP8787U', '123456789063'),
(104, 'Leo Rivera', 'leo.rivera@example.com', '9876543273', '1989-07-07', 'Anaheim', '3535 Disney Ave, Anaheim, CA 92802', 'Chloe Ramirez', 'QRST8888V', '123456789064'),
(105, 'Elliana Garcia', 'elliana.garcia@example.com', '9876543274', '1990-01-11', 'Honolulu', '3636 Surf Rd, Honolulu, HI 96802', 'Grace Hill', 'UVWX8989W', '123456789065'),
(106, 'Jonathan Bennett', 'jonathan.bennett@example.com', '9876543275', '1991-12-03', 'Anchorage', '3737 Polar Rd, Anchorage, AK 99502', 'Nathan Grey', 'YZAB9090X', '123456789066'),
(107, 'Piper Hill', 'piper.hill@example.com', '9876543276', '1994-11-11', 'Cincinnati', '3838 Riverfront Dr, Cincinnati, OH 45202', 'Mason Clark', 'CDEF9191Y', '123456789067'),
(108, 'Robert Martinez', 'robert.martinez@example.com', '9876543277', '1988-05-01', 'Boise', '3939 Capitol Blvd, Boise, ID 83702', 'Jack Allen', 'GHIJ9292Z', '123456789068'),
(109, 'Ruby Anderson', 'ruby.anderson@example.com', '9876543278', '1995-10-25', 'Richmond', '4040 Monument Ave, Richmond, VA 23202', 'Ava Thomas', 'KLMN9393A', '123456789069'),
(110, 'Parker Thompson', 'parker.thompson@example.com', '9876543279', '1986-08-08', 'Charleston', '4141 King St, Charleston, SC 29402', 'Grace Hill', 'OPQR9494B', '123456789070');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `document_name` varchar(100) NOT NULL,
  `document_type` varchar(50) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_data`
--

CREATE TABLE `financial_data` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `action_type` enum('add','withdraw','purchase') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `total_invested` decimal(10,2) DEFAULT NULL,
  `current_amount` decimal(10,2) DEFAULT NULL,
  `task_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','client') NOT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `role`, `client_id`) VALUES
(11, 'admin1', '$2b$10$abcd1234hashedpassword1', 'admin', NULL),
(12, 'client1', '$2b$10$abcd1234hashedpassword2', 'client', 41),
(13, 'client2', '$2b$10$abcd1234hashedpassword3', 'client', 42),
(14, 'admin2', '$2b$10$abcd1234hashedpassword4', 'admin', NULL),
(15, 'client3', '$2b$10$abcd1234hashedpassword5', 'client', 43),
(16, 'client4', '$2b$10$abcd1234hashedpassword6', 'client', 44),
(17, 'client5', '$2b$10$abcd1234hashedpassword7', 'client', 45),
(18, 'admin3', '$2b$10$abcd1234hashedpassword8', 'admin', NULL),
(19, 'client6', '$2b$10$abcd1234hashedpassword9', 'client', 46),
(20, 'client7', '$2b$10$abcd1234hashedpassword10', 'client', 47);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `pan_card_number` (`pan_card_number`),
  ADD UNIQUE KEY `aadhar_number` (`aadhar_number`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `financial_data`
--
ALTER TABLE `financial_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `client_id` (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `financial_data`
--
ALTER TABLE `financial_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `financial_data`
--
ALTER TABLE `financial_data`
  ADD CONSTRAINT `financial_data_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
