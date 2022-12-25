--
-- Table structure for table `proizvodi`
--

CREATE TABLE `proizvodi` (
  `id` int(8) NOT NULL,
  `ime` varchar(255) NOT NULL,
  `sifra` varchar(255) NOT NULL,
  `slika` text NOT NULL,
  `cena` double(10,2) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

--
-- Dumping data for table `proizvodi`
--

INSERT INTO `proizvodi` (`id`, `ime`, `sifra`, `slika`, `cena`) VALUES
(1, 'PETKULT pašteta s mesnim komadićima', 'PK135985', 'product-images/1.jpg', 149.00),
(2, 'BELCANDO Adult s ćuretinom i tikvicama,', 'KR3079', 'product-images/2.jpg', 440.00),
(3, 'REMI Govedina i džigerica, hrana za mačke', 'PC203186', 'product-images/3.jpg', 180.00),
(4, 'BRIT ANIMALS Chinchilla,hrana za činčile', 'VP103100012', 'product-images/4.jpg', 1160.00),
(5, 'PADOVAN GrandMix Coniglietti hrana za kuniće', 'HDP0189', 'product-images/5.jpg', 490.00),
(6, 'VERSELE LAGA Chip Nature hrana za veverice', 'VL461425', 'product-images/6.jpg', 990.00),
(7, 'VERSELE LAGA Crispy Snack, hrana za glodare', 'VL461730', 'product-images/7.jpg', 460.00),
(8, 'NUTRIPET Hrana za hrčke', 'MJNU264837', 'product-images/8.jpg', 135.00),
(9, 'VERSELE LAGA Classic hrana za tigrice', 'VL421152', 'product-images/9.jpg', 265.00),
(10, 'DAJANA Betta hrana za ribice 25g/100ml', 'DP014A', 'product-images/10.jpg', 290.00),
(11, 'PRODAC Tartafood gammarus hrana za kornjače', 'PDTAR4', 'product-images/11.jpg', 79.00),
(12, 'REMI Piletina i pirinač, hrana za pse', 'PC13283', 'product-images/12.jpg', 750.00);


--
-- Indexes for table `proizvodi`
--
ALTER TABLE `proizvodi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `atrikal_sifra` (`sifra`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `proizvodi`
--
ALTER TABLE `proizvodi`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

CREATE TABLE `korisnici` (
  `email` varchar(50) PRIMARY KEY,
  `ime` varchar(20) NOT NULL,
  `lozinka` varchar(25) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;