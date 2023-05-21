-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2023 at 01:06 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'makanan', '2023-05-21 05:56:35', '2023-05-21 05:56:35'),
(2, 'minuman', '2023-05-21 05:56:35', '2023-05-21 05:56:35');

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `birth_day` date NOT NULL,
  `level` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order_option` varchar(255) NOT NULL,
  `number_table` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `name`, `order_option`, `number_table`, `note`, `created_at`, `updated_at`) VALUES
(1, '01-21052023', 'account test 1', 'take away', 0, 'makan 4 piring ga pakai piring', '2023-05-21 06:02:57', '2023-05-21 06:02:57'),
(2, '02-21052023', 'account test 2', 'take away', 0, 'keluarga besar atta halilintar', '2023-05-21 06:03:27', '2023-05-21 06:05:31'),
(3, '03-21052023', 'account test 3', 'take away', 0, 'alex bizzer gratis ongkir', '2023-05-21 06:03:48', '2023-05-21 06:03:48'),
(4, '04-21052023', 'account test 4', 'dine in', 5, 'krusty krab unfair', '2023-05-21 06:04:25', '2023-05-21 06:05:39'),
(5, '05-21052023', 'account test 5', 'take away', 0, 'ini beda cerita', '2023-05-21 06:05:01', '2023-05-21 06:05:01');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, '2023-05-21 06:02:57', '2023-05-21 06:02:57'),
(1, 2, 1, 20, '2023-05-21 06:02:57', '2023-05-21 06:02:57'),
(2, 2, 1, 20, '2023-05-21 06:03:27', '2023-05-21 06:03:27'),
(2, 3, 1, 30, '2023-05-21 06:03:27', '2023-05-21 06:03:27'),
(3, 2, 1, 20, '2023-05-21 06:03:48', '2023-05-21 06:03:48'),
(3, 3, 1, 30, '2023-05-21 06:03:48', '2023-05-21 06:03:48'),
(4, 8, 10, 800, '2023-05-21 06:04:25', '2023-05-21 06:04:25'),
(4, 9, 20, 1800, '2023-05-21 06:04:25', '2023-05-21 06:04:25'),
(5, 4, 8, 320, '2023-05-21 06:05:01', '2023-05-21 06:05:01'),
(5, 6, 2, 120, '2023-05-21 06:05:01', '2023-05-21 06:05:01');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `code`, `category_id`, `quantity`, `unit`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Product 1', 'image1.jpg', 'CODE001', 1, 100, 'unit1', 10, '2023-05-19 18:10:13', '2023-05-21 05:57:03'),
(2, 'Product 2', 'image2.jpg', 'CODE002', 2, 200, 'unit2', 20, '2023-05-19 18:10:13', '2023-05-21 05:57:06'),
(3, 'Product 3', 'image3.jpg', 'CODE003', 1, 300, 'unit3', 30, '2023-05-19 18:10:13', '2023-05-21 05:57:13'),
(4, 'Product 4', 'image4.jpg', 'CODE004', 2, 400, 'unit4', 40, '2023-05-19 18:10:13', '2023-05-21 05:57:16'),
(5, 'Product 5', 'image5.jpg', 'CODE005', 1, 500, 'unit5', 50, '2023-05-19 18:10:13', '2023-05-21 05:57:19'),
(6, 'Product 6', 'image6.jpg', 'CODE006', 2, 600, 'unit6', 60, '2023-05-19 18:10:13', '2023-05-21 05:57:21'),
(7, 'Product 7', 'image7.jpg', 'CODE007', 1, 700, 'unit7', 70, '2023-05-19 18:10:13', '2023-05-21 05:57:24'),
(8, 'Product 8', 'image8.jpg', 'CODE008', 1, 800, 'unit8', 80, '2023-05-19 18:10:13', '2023-05-21 05:57:28'),
(9, 'Product 9', 'image9.jpg', 'CODE009', 2, 900, 'unit9', 90, '2023-05-19 18:10:13', '2023-05-21 05:57:31'),
(10, 'Product 10', 'image10.jpg', 'CODE010', 2, 1000, 'unit10', 100, '2023-05-19 18:10:13', '2023-05-21 05:57:34');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `service`) VALUES
(1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `payment` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `service` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `order_id`, `status`, `payment`, `amount`, `service`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'paid', 'cash', 30, 10, 1, '2023-05-21 06:02:57', '2023-05-21 06:02:57'),
(2, 2, 'paid', 'cash', 50, 10, 1, '2023-05-21 06:03:27', '2023-05-21 06:03:27'),
(3, 3, 'paid', 'cash', 50, 10, 1, '2023-05-21 06:03:48', '2023-05-21 06:03:48'),
(4, 4, 'paid', 'cash', 2600, 10, 1, '2023-05-21 06:04:26', '2023-05-21 06:04:26'),
(5, 5, 'paid', 'cash', 440, 10, 1, '2023-05-21 06:05:01', '2023-05-21 06:05:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `id_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `point` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_code`, `name`, `password`, `role`, `point`, `created_at`, `updated_at`) VALUES
(1, 'SA-01', 'Satria', 'admin', 'admin', 0, '2023-05-21 04:46:50', '2023-05-21 04:46:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `products_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
