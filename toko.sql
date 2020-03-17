-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2020 at 04:37 PM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` tinyint(1) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `status` enum('paid','unpaid','canceled','expired') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `date`, `due_date`, `status`) VALUES
(1, '2015-01-04 05:06:50', '2015-01-05 05:06:50', 'unpaid'),
(2, '2015-01-04 05:10:20', '2015-01-05 05:10:20', 'unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `qty` int(3) NOT NULL,
  `price` int(9) NOT NULL,
  `options` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `invoice_id`, `product_id`, `product_name`, `qty`, `price`, `options`) VALUES
(1, 1, 1, 'Baju', 1, 79000, ''),
(2, 1, 3, 'Topi', 1, 80000, ''),
(3, 2, 5, 'Dasi', 1, 77500, '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` int(9) NOT NULL,
  `stock` int(3) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `image`) VALUES
(1, 'Gunung Meletus', 'Suhu di sekitar gunung naik, Mata air menjadi kering, Sering mengeluarkan suara gemuruh, kadang disertai getaran (gempa), Tumbuhan di sekitar gunung lay el luis es weca, Binatang di sekitar gunung bermigrasi, kelihatan gelisah', 79000, 5, 'gunung_meletus.jpg'),
(2, 'Tornado', 'Terlihat gumpalan awan gelap, besar dan tinggi, Petir dan guruh terlihat dari kejauhan, Terdengar suara gemuruh dari kejauhan', 35000, 10, 'tornado1.jpg'),
(3, 'Tsunami', 'Topi Casual', 80000, 12, 'tsunami1.jpg'),
(4, 'Longsor', 'Tiang pintu dan jendela tidak tegak, Turunnya level air sungai secara tiba-tiba meskipun hujan masih turun atau baru saja berhenti, Naiknya level air secara cepat yang disertai dengan meningkatnya volume tanah di sungai, Ada retakan atau tonjolan baru yang tidak biasa di permukaan tanah, Adanya gemuruh yang kuat sebelum terjadinya longsor', 240000, 1, 'longsor1.jpg'),
(5, 'Badai Salju', 'Udara pada sehari sebelumnya terasa panas dan gerah, Udara terasa panas dan gerah tersebut diakibatkan adanya radiasi matahari yang cukup kuat disertai dengan kelembaban yang cukup tinggi, Mulai pukul 10.00 pagi terlihat tumbuh awan Cumulus yaitu awan putih yang berlapis-lapis, di antara awan tersebut ada satu jenis awan yang mempunyai batas tepinya sangat jelas berwarna abu-abu menjulang tinggi seperti bunga kol, Tahap berikutnya awan tersebut akan cepat berubah warna menjadi abu-abu atau hitam yang dikenal dengan awan Cumulonimbus (Cb), Pepohonan di sekitar tempat kita berdiri ada dahan dan rantingnya yang mulai bergoyang cepat, serta terasa ada sentuhan udara dingin di sekitar kita berdiri', 77500, 1, 'salju1.jpg'),
(6, 'Gempa Tektonik', 'Terdapat lempeng- lempeng tektonik Bumi di suatu tempat, Terdadinya gerakan yang mendadak atau tidak mendadak dari lempeng tersebut, Terasa getaran di permukaan Bumi', 0, 0, 'gempa1.jpg'),
(7, 'Badai Petir', 'Umumnya terjadi selepas tengah hari, Sejak pagi hingga siang hari cuaca mungkin sangat cerah,panas dan menggerahkan, Menjelang atau selepas tengah hari cuaca berubah secara kontinu, Awan putih memenuhi angkasa semakin lama semakin menebal disertai tiupan angin, Seiring menghitamnya awan, kecepatan angin makin lama makin kencang disertai kilatan petir.', 0, 0, 'petir1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `toko_sessions`
--

CREATE TABLE `toko_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toko_sessions`
--

INSERT INTO `toko_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('e3f87e28954f79c0451221ab71fa43eb', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', 1584456720, 'a:3:{s:9:"user_data";s:0:"";s:8:"username";s:5:"admin";s:5:"group";s:1:"1";}'),
('ead204a7949b9d22b32b356aa3d24bab', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', 1584448217, 'a:2:{s:8:"username";s:5:"admin";s:5:"group";s:1:"1";}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(60) NOT NULL,
  `group` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `group`) VALUES
(1, 'admin', 'admin', 1),
(2, 'bob', '123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `toko_sessions`
--
ALTER TABLE `toko_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
