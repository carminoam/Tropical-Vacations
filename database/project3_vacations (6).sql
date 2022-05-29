-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2022 at 08:35 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project3_vacations`
--
CREATE DATABASE IF NOT EXISTS `project3_vacations` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project3_vacations`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `username`, `password`, `role`) VALUES
(4, 'Noam', 'Carmi', 'nono', 'dd6ff49baeb6802c954201a4216f690810451a9991247ebe7fd62556bc68218071c7e27de059fecde889215a9a5c17f30d8c87f03c339818fbaa61ca18cd756b', 'user'),
(6, 'matan', 'hadad', 'matan', 'dd6ff49baeb6802c954201a4216f690810451a9991247ebe7fd62556bc68218071c7e27de059fecde889215a9a5c17f30d8c87f03c339818fbaa61ca18cd756b', 'user'),
(204735807, 'admin', 'admin', 'admin', 'dd6ff49baeb6802c954201a4216f690810451a9991247ebe7fd62556bc68218071c7e27de059fecde889215a9a5c17f30d8c87f03c339818fbaa61ca18cd756b', 'admin'),
(204735811, 'Sima', 'Biton', 'Sima', 'dd6ff49baeb6802c954201a4216f690810451a9991247ebe7fd62556bc68218071c7e27de059fecde889215a9a5c17f30d8c87f03c339818fbaa61ca18cd756b', 'user'),
(204735812, 'Tamir', 'Cohen', 'Tamir', 'dd6ff49baeb6802c954201a4216f690810451a9991247ebe7fd62556bc68218071c7e27de059fecde889215a9a5c17f30d8c87f03c339818fbaa61ca18cd756b', 'user'),
(204735813, 'Linoy', 'Levinshtein', 'Linoy', 'dd6ff49baeb6802c954201a4216f690810451a9991247ebe7fd62556bc68218071c7e27de059fecde889215a9a5c17f30d8c87f03c339818fbaa61ca18cd756b', 'user'),
(204735814, 'Moshe', 'Levi', 'Moshe', 'dd6ff49baeb6802c954201a4216f690810451a9991247ebe7fd62556bc68218071c7e27de059fecde889215a9a5c17f30d8c87f03c339818fbaa61ca18cd756b', 'user'),
(204735815, 'Yaron', 'London', 'Yaron', 'dd6ff49baeb6802c954201a4216f690810451a9991247ebe7fd62556bc68218071c7e27de059fecde889215a9a5c17f30d8c87f03c339818fbaa61ca18cd756b', 'user'),
(204735816, 'Amir', 'Yehuda', 'Amir', 'dd6ff49baeb6802c954201a4216f690810451a9991247ebe7fd62556bc68218071c7e27de059fecde889215a9a5c17f30d8c87f03c339818fbaa61ca18cd756b', 'user'),
(204735817, 'Miri', 'Nahum', 'Miri', 'dd6ff49baeb6802c954201a4216f690810451a9991247ebe7fd62556bc68218071c7e27de059fecde889215a9a5c17f30d8c87f03c339818fbaa61ca18cd756b', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `vacations`
--

CREATE TABLE `vacations` (
  `id` int(11) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `destination` varchar(50) NOT NULL,
  `imageName` varchar(100) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vacations`
--

INSERT INTO `vacations` (`id`, `description`, `destination`, `imageName`, `startTime`, `endTime`, `price`) VALUES
(96, 'London', 'london', '2ac47e88-5127-45ed-91c2-ffe21c60c1b6.jpg', '2022-04-21 00:29:00', '2022-04-18 00:29:00', 20),
(97, 'Cancun', 'Cancun', '95b77bc7-58aa-452a-aa5e-b320b1b5cd3e.jpg', '2022-04-14 06:31:00', '2022-04-14 06:31:00', 60),
(100, 'gg', 'Paris', 'b14ec249-fc21-4f52-981e-3f516d79d2ae.jpg', '2022-04-13 13:10:00', '2022-04-17 13:10:00', 44),
(101, 'Welcome to beit arif Welcome to beit arif Welcome to beit arif Welcome to beit arif Welcome to beit arif Welcome to beit arif Welcome to beit arif Welcome to beit arif Welcome to beit arif Welcome to beit arif Welcome to beit arif ', 'Beit Ariffff', 'cce8d400-ba22-4cc8-aa56-0b0ecf002e6b.jpg', '2022-04-10 06:03:00', '2022-04-14 06:03:00', 99),
(102, 'While December to March sees high prices in this area of Mexico, the rest of the year offers much better rates and plenty of ways to save money. Hurricane season lasts from July till October in Cozumel – but until September, this usually just means occasional rains. July and August offer very low prices on flights and accommodation in exchange for some cloudy skies here and there.\r\n\r\nFor better weather and equally great prices, visit between late March and June. Temperatures can fluctuate but you\'ll get plenty of sunny days and some great deals plus much smaller crowds.\r\n\r\nCozumel beaches are free all year long, so you can spend entire days enjoying the sun and spend almost nothing. If you prefer the comfort of a pool, you can get a day pass at one of the luxury local resorts - which will allow you full use of their pool and sun chairs without the cost of sleeping there.\r\n\r\nThe Arrecifes de Cozumel National Park is the world\'s second-largest coral reef system, perfect for some diving at very affordable prices.\r\n\r\nFor a quick bite or snacks on the go, nothing beats a local mercado - little markets that appear unannounced in plazas, where you can get not only great souvenirs and local art but also traditional fare, such as tamales and quesadillas, for very little money.', 'Cozumel, Mexico', '87929ca5-57e2-4513-8e49-f9dfa369673f.jpg', '2022-05-27 14:51:00', '2022-06-23 14:52:00', 299),
(103, 'High season in the Dominican Republic isn\'t always cheap, but the months of April, May, and June offer the best of two worlds: mostly sunny days, warm but comfortable weather, and lots of special discounts on accommodations and flights – with prices reduced as much as 50 percent from the high-season rates.\r\n\r\nJune is the start of the rainy and hurricane season, but storms are rare during this month, so it\'s a great month to explore for less.\r\n\r\nAlthough Santo Domingo and Punta Cana have pricey accommodations, things get cheaper when you head to smaller towns and off-the-beaten-track destinations, such as Samana and Bahia de las Aguilas. In many places, all-inclusive resorts can actually save you money, as eating out will get expensive - there\'s a 16 percent government tax added to meals, plus many restaurants add a 10 percent service charge to the bill.', 'Dominican Republic', 'ea0dca95-eee9-4aab-9a05-8425fc6565b8.jpg', '2022-07-07 14:53:00', '2022-07-28 14:53:00', 149),
(104, 'June to November is off-peak season in this small archipelagic province in the Philippines. It\'s also monsoon season, but don\'t let that scare you – even during rainy season, it doesn\'t rain every day, and rains often just come in the form of heavy but short afternoon downpours. Rains do lower temperatures a little, making it more comfortable to walk around and explore.\r\n\r\nFor the best possible weather, arrive early in the season, as the heavier storms are usually after September. Airlines and hotels offer heavy discounts during this time, with off-peak prices saving you as much as 80 percent compared to regular costs.\r\n\r\nBoth Puerto Princesa and El Nido offer plenty of budget accommodations right on the coastline. This usually means beach bungalows with no luxury amenities, but if you\'ll spend most of your time at the beach or enjoying water activities, it might be enough - plus you\'ll still get stunning views once you get back to your room.\r\n\r\nAll beaches are free to access in Palawan, and visitors can also try other free or very inexpensive attractions, including visiting the Palawan Wildlife Rescue and Conservation Center, exploring the Tabon Caves (no tour needed), and taking a dip in the natural pool at the Estrella Falls.', 'Palawan, Philipines', 'b666c733-6371-4f5c-9ed3-8f211e4c04fb.jpg', '2022-05-19 14:54:00', '2022-06-22 14:54:00', 175),
(105, 'A favorite tropical destination for worldwide visitors, Bali can be a bargain if you pick your travel times right. As a general rule, destinations in the southern part of the island are more expensive. This includes Kuta, Ubud, and Seminyak, where everything costs double than in destinations in the central hills or up north. Even here, though, visiting in the off-season (March to May) will still save you a considerable amount of money.\r\n\r\nMarch and April can be a little rainy, but May offers sun and low humidity. The rainy season, which lasts from October to April, offers great deals in airfares and accommodations, and you\'ll still see plenty of sunshine on most days.\r\n\r\nAll beaches in Bali are public and free, but the island also offers beautiful rice paddies, breathtaking mountains for hiking, and lots of temples and palaces, none of which charge an entry fee.', 'Bali, Indonesia', 'da57576b-70df-4b04-b6e2-05316e73e39a.jpg', '2022-06-01 11:55:00', '2022-06-30 11:55:00', 129),
(106, 'Laos has been a backpacking haven for many years – a good indication that this tropical Southeast Asian country is a very affordable destination. Bowls of noodles, sticky rice, and other quick meals can be had from street food stalls for a couple of dollars or less, and outside of the capital, four-star hotels will cost you a third of what you would pay in Europe.\r\n\r\nDecember and January see the most visitors, as the weather is dry and cool, with comfortable temperatures in the mid 20s Celsius. Arrive at any other time, and you\'ll see smaller crowds and even lower prices.\r\n\r\nLuang Prabang, Laos\' former capital and a UNESCO World Heritage city, is one of the most visited destinations in the country. A mix of French colonial architecture and traditional wooden houses, Luang Prabang offers a great mix of temples, including 16th-century Wat Xieng Thong temple, with its intricate wooden carvings and mosaic patterns, and nature, all free to visit.\r\n\r\nMount Phu Si, just behind the city, is great for hiking and to catch the sunset. Vientiane, the capital city, is a popular foodie destination and home to a number of national monuments, a sculpture garden of giant Buddha statues, and the famous Great Stupa temple – also all free.', 'Luang Prabang, Laos', '63fc48d4-0a46-46c7-b5d3-0c4f8c07f00f.jpg', '2022-07-20 14:56:00', '2022-08-18 14:56:00', 229),
(107, 'Although most visitors who come to Cambodia head to the ancient temples in Angkor Wat, the country also offers plenty of outdoor adventures for those looking for some tropical adventure. Lush green mountains, thick forests, and sugary-white sands all abound in Cambodia.\r\n\r\nCambodia\'s rugged and undeveloped beaches are a treat for visitors, as the crowds are smaller than in neighboring Thailand, and the resorts are cheaper. Koh Rong, the most developed island in the country, is a paradise of coral reefs and sandy coves, where you can just sit back to enjoy a mesmerizing sunset or head out for a speedboat tour over the azure waters.\r\n\r\nDespite its many offerings, Koh Rong costs a fraction of what a tropical beach vacation in Thailand or Malaysia would cost. For what you would pay to see a movie back home, here you can hop on a boat for a full-day tour, have lunch at a local restaurant for three days in a row, or rent all the needed equipment for snorkeling.', 'Koh Rong, Cambodia', 'e64cfa12-badd-4c8d-b15c-84749810532c.jpg', '2022-05-25 14:57:00', '2022-06-21 14:57:00', 399),
(108, 'Costa Rica is not necessarily always a cheap tropical getaway, but arriving at the right time of year will definitely save a lot of money. From May to mid-December, Costa Rica experiences what\'s known as the \"green season\" – lots of rain, thick cloud forests on green mountainsides, and budget-friendly surf breaks at a time when the big crowds mostly stay away. Don\'t let the rain scare you, though – it\'s still warm, and you\'ll get plenty of sunny days to enjoy the beach.\r\n\r\nThe Volcano Arenal, one of the most stunning destinations for hiking in Costa Rica, is perfect for some budget fun – just pay the park\'s entrance fee but skip the guided hikes; it\'s easy enough to follow the signs on your own. Most of the national parks in the country charge an entry fee, but the cost is low, and you can spend an entire day exploring, hiking volcano trails, canoeing, trying hot springs, or even horseback riding.\r\n\r\nWhen it comes to accommodations, staying out of the main tourist towns – including San Jose and Arenal – will land you the best deals.', 'Costa Rica', '080e7b02-c9bc-464c-b07c-a4d05b1c7099.jpg', '2022-07-21 14:58:00', '2022-08-16 14:58:00', 199),
(109, 'Thailand has some of the cheapest tropical islands to visit, where you can have a luxurious trip no matter what your budget. Depending on where you\'re heading in Thailand, low season can fall in December or in August, so it\'s important to do some research in advance to find the cheapest months.\r\n\r\nKoh Samui, one of Thailand\'s most beloved beach destinations, goes through low season between October and mid-December. October and November can be rainy in the afternoons, but December is sunnier and drier. These are great months to score deals in hotels and flights.\r\n\r\nThe nearby island of Koh Tao is a popular day trip destination for snorkeling and scuba diving – but November and December aren\'t good months for it because of rough seas. Instead, arrive in the shoulder season (March to May) to do this at great prices, with a good chance to see whale sharks near the coast.', 'Koh Samui, Thailand', 'd9d5e88a-d994-4bbb-b2c1-2e88c3375a75.jpg', '2022-05-18 11:59:00', '2022-06-07 11:59:00', 215),
(110, 'If you\'re looking for affordable tropical honeymoon destinations, the charming little town of Hoi An is a great choice for many reasons: it\'s still enough off the beaten track that you won\'t see big crowds, it offers privacy and romance on a budget, and it\'s just minutes away from the turquoise waters and soft white beaches of Da Nang.\r\n\r\nThe UNESCO World Heritage city of Hoi An is a perfect fairy tale – an old trading port town with buildings dating back to the 15th century, all to be explored on foot. Just a short drive away is Da Nang, where you\'ll find plenty of luxury resorts but also beach hotels that offer plenty of amenities but are very budget friendly.\r\n\r\nHoi An and Da Nang low season falls between the months of September and March. This is the area\'s typhoon season, which usually just means short but heavy afternoon rains. Arrive during these months for incredible deals on airfare and accommodation, including vacation packages that can be 50 percent or more off the regular price.', 'Hoi An, Vietnam', '816c452d-e0e9-492e-8574-91e237bb4dff.jpg', '2022-05-30 15:00:00', '2022-06-30 15:00:00', 79),
(111, 'There\'s much to see and do in tropical Malaysia: rainforest treks, cave exploring, and never-ending shopping in urban jungles. But vibrant Malaysia is also home to stunning diving sites, golden beaches, and crystal-clear waters.\r\n\r\nLangkawi, an archipelago of 99 islands in the heart of the Andaman Sea, is a great island to visit if you\'re on a budget. It offers plenty of things to do, long stretches of beach, and very affordable accommodations year-round.\r\n\r\nFor even better savings, you can visit in rainy September or October, when prices are slashed by 50 percent everywhere. On the upside, this is the island\'s most lush, greenest time – perfect for visiting the seven pools of Telaga Tujuh, walking on the Sky Bridge (660 meters above sea level over the thick rainforest), and hiking through the mangrove forests of Kilim Geoforest Park – all free activiti', 'Langkawi, Malaysia', '334e84d1-22c1-4466-b2bb-9d6da9e2f101.jpg', '2022-07-28 15:00:00', '2022-08-26 15:01:00', 289),
(112, 'Aruba might sound like a destination for the rich and famous only, but this island in the southern Caribbean Sea can be great for budget beach vacations, too.\r\n\r\nThe key to keeping a trip to Aruba cheap is timing: September and October are usually very cheap months in Aruba because the island\'s trade winds die down, and the temperatures go up, often staying in the mid-30s Celsius, even at night. If you don\'t mind the sweltering heat and plan on spending most of your time in the water anyway, you can find great discounts during these months. Hotels often offer 50 percent or higher discounts on rooms, and dive boats will arrange discount packages as well.', 'Aruba', '080e6d78-ce09-4cb2-950b-d8b1eb4c68b2.jpg', '2022-05-17 18:12:00', '2022-05-31 18:12:00', 169);

-- --------------------------------------------------------

--
-- Table structure for table `vacationsfollowers`
--

CREATE TABLE `vacationsfollowers` (
  `userId` int(11) NOT NULL,
  `vacationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vacationsfollowers`
--

INSERT INTO `vacationsfollowers` (`userId`, `vacationId`) VALUES
(4, 100),
(4, 102),
(4, 109),
(4, 110),
(6, 96),
(204735811, 96),
(204735811, 97),
(204735811, 101),
(204735811, 102),
(204735811, 105),
(204735811, 108),
(204735811, 109),
(204735811, 111),
(204735812, 96),
(204735812, 97),
(204735812, 100),
(204735812, 101),
(204735812, 103),
(204735812, 104),
(204735812, 106),
(204735812, 108),
(204735812, 109),
(204735812, 111),
(204735813, 96),
(204735813, 97),
(204735813, 102),
(204735813, 103),
(204735813, 104),
(204735813, 105),
(204735813, 106),
(204735813, 107),
(204735813, 108),
(204735813, 110),
(204735813, 111),
(204735814, 96),
(204735814, 97),
(204735814, 100),
(204735814, 101),
(204735814, 103),
(204735814, 104),
(204735814, 106),
(204735814, 107),
(204735814, 108),
(204735814, 109),
(204735815, 96),
(204735815, 97),
(204735815, 100),
(204735815, 101),
(204735815, 102),
(204735815, 104),
(204735815, 108),
(204735815, 110),
(204735815, 111),
(204735816, 97),
(204735816, 100),
(204735816, 101),
(204735816, 103),
(204735816, 104),
(204735816, 105),
(204735816, 106),
(204735816, 107),
(204735816, 109),
(204735816, 111),
(204735817, 96),
(204735817, 102),
(204735817, 103),
(204735817, 105),
(204735817, 107),
(204735817, 108),
(204735817, 110),
(204735817, 111);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacations`
--
ALTER TABLE `vacations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacationsfollowers`
--
ALTER TABLE `vacationsfollowers`
  ADD PRIMARY KEY (`userId`,`vacationId`),
  ADD KEY `vacationId` (`vacationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204735818;

--
-- AUTO_INCREMENT for table `vacations`
--
ALTER TABLE `vacations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vacationsfollowers`
--
ALTER TABLE `vacationsfollowers`
  ADD CONSTRAINT `vacationsfollowers_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vacationsfollowers_ibfk_2` FOREIGN KEY (`vacationId`) REFERENCES `vacations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
