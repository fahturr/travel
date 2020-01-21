-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2020 at 02:21 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel2`
--

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id_perusahaan` int(11) NOT NULL,
  `nama_perusahaan` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`id_perusahaan`, `nama_perusahaan`, `username`, `password`) VALUES
(1, 'PT Sinar Mas', 'sinarmas', 'sinarmas'),
(2, 'PT Sinar Abu Abu', 'sinarabu', 'sinarabu'),
(3, 'PT Lintas Nusantara', 'nusantara', 'nusantara'),
(4, 'PT Bumi Lestari Indah', 'indah', 'indah'),
(5, 'PT Sinar Mulya', 'mulya', 'mulya'),
(6, 'PT Sejahtera', 'sejahtera', 'sejahtera'),
(7, 'PT Kordang', 'kordang', 'kordang'),
(8, 'PT Indah Lestari', 'lestari', 'lestari'),
(9, 'PT Makmur', 'makmur', 'makmur'),
(10, 'PT Surya', 'surya', 'surya'),
(11, 'PT Andalan', 'andalan', 'andalan'),
(12, 'PT Pelangi', 'pelangi', 'pelangi'),
(13, 'PT Surya Pelangi', 'supe', 'supe'),
(14, 'PT Family', 'family', 'family'),
(15, 'PT Della', 'della', 'della'),
(16, 'PT Ceria', 'ceria', 'ceria'),
(17, 'PT Eyota', 'eyota', 'eyota'),
(18, 'PT Namira', 'namira', 'namira'),
(19, 'PT Karya Maju', 'kama', 'kama'),
(20, 'PT Dua Putra', 'dupu', 'dupu'),
(21, 'PT Empat Saudara', 'emsa', 'emsa'),
(22, 'PT Keluarga', 'keluarga', 'keluarga'),
(23, 'PT Mutiara', 'mutiara', 'mutiara'),
(24, 'PT Permata', 'permata', 'permata'),
(25, 'PT Jasa Bunda', 'jabu', 'jabu'),
(26, 'PT Qiya', 'qiya', 'qiya'),
(27, 'PT TPOC', 'tpoc', 'tpoc'),
(28, 'PT Sinar', 'sinar', 'sinar'),
(29, 'PT Anak Kandung', 'anka', 'anka'),
(30, 'PT Sanak', 'sanak', 'sanak');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int(11) NOT NULL,
  `tujuan` varchar(64) NOT NULL,
  `tanggal` varchar(64) NOT NULL,
  `waktu` varchar(64) NOT NULL,
  `harga` int(11) NOT NULL,
  `id_perusahaan` int(11) NOT NULL,
  `kursi_satu` int(11) NOT NULL,
  `kursi_dua` int(11) NOT NULL,
  `kursi_tiga` int(11) NOT NULL,
  `kursi_empat` int(11) NOT NULL,
  `kursi_lima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `tujuan`, `tanggal`, `waktu`, `harga`, `id_perusahaan`, `kursi_satu`, `kursi_dua`, `kursi_tiga`, `kursi_empat`, `kursi_lima`) VALUES
(1, 'Tembilahan', '5 January 2020', '12:30', 250000, 1, 0, 0, 0, 0, 0),
(2, 'Pasir Pengaraian', '5 January 2020', '17:00', 300000, 18, 0, 0, 0, 0, 0),
(3, 'Rengat', '5 January 2020', '16:00', 250000, 2, 0, 0, 0, 0, 0),
(4, 'Bengkalis', '6 Januari 2020', '08:00', 150000, 3, 0, 0, 0, 0, 0),
(5, 'Dumai', '6 Januari 2020', '09:00', 185000, 30, 0, 0, 0, 0, 0),
(6, 'Duri', '6 Januari 2020', '20:00', 100000, 4, 0, 0, 0, 0, 0),
(7, 'Kerinci', '7 Januari 2020', '16:00', 90000, 5, 0, 0, 0, 0, 0),
(8, 'Bagansiapiapi', '6 Januari 2020', '09:00', 165000, 6, 0, 0, 0, 0, 0),
(9, 'Tembilahan', '7 Januari 2020', '08:00', 190000, 24, 0, 0, 0, 0, 0),
(10, 'Rengat', '8 Januari 2020', '10:00', 170000, 23, 0, 0, 0, 0, 0),
(11, 'Kerinci', '8 Januari 2020', '09:00', 100000, 11, 0, 0, 0, 0, 0),
(12, 'Dumai', '6 January 2020', '19:00', 180000, 9, 0, 0, 0, 0, 0),
(13, 'Dumai', '6 January 2020', '09:00', 175000, 29, 0, 0, 0, 0, 0),
(14, 'Duri', '6 January 2020', '18:00', 160000, 21, 0, 0, 0, 0, 0),
(15, 'Duri', '7 January 2020', '12:30', 160000, 17, 0, 0, 0, 0, 0),
(16, 'Siak', '7 January 2020', '16:00', 180000, 20, 0, 0, 0, 0, 0),
(17, 'Selat Panjang', '7 January 2020', '08:00', 120000, 15, 0, 0, 0, 0, 0),
(18, 'Bengkalis', '8 January 2020', '10:00', 140000, 5, 0, 0, 0, 0, 0),
(19, 'Bengkalis', '9 January 2020', '07:00', 140000, 19, 0, 0, 0, 0, 0),
(20, 'Sungai Pakning', '8 January 2020', '06:00', 150000, 22, 0, 0, 0, 0, 0),
(21, 'Sungai Pakning', '9 January 2020', '12:30', 150000, 24, 0, 0, 0, 0, 0),
(22, 'Tapung', '6 January 2020', '08:00', 180000, 15, 0, 0, 0, 0, 0),
(23, 'Lipat Kain', '7 January 2020', '15:00', 145000, 2, 0, 0, 0, 0, 0),
(24, 'Air Molek', '9 January 2020', '20:00', 120000, 13, 0, 0, 0, 0, 0),
(25, 'Tembilahan', '7 January 2020', '10:00', 130000, 2, 0, 0, 0, 0, 0),
(26, 'Ujung Tanjung', '8 January 2020', '13:00', 140000, 21, 0, 0, 0, 0, 0),
(27, 'Rengat', '9 Januari', '17:00', 190000, 14, 0, 0, 0, 0, 0),
(28, 'Tembilahan', '9 Januari 2020', '16:00', 170000, 28, 0, 0, 0, 0, 0),
(29, 'Bengkalis', '10 Januari 2020', '09:00', 180000, 8, 0, 0, 0, 0, 0),
(30, 'Pasir Pengaraian', '10 Januari 2020', '10:00', 130000, 25, 0, 0, 0, 0, 0),
(31, 'Kampar', '10 Januari 2020', '10:30', 80000, 18, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_user` varchar(64) NOT NULL,
  `status` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(64) NOT NULL,
  `nama_user` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email`, `username`, `password`) VALUES
('30e5d08e-681b-4714-a55d-b885de36787d', 'Rahmita Ramadhanty', 'rahmita17ti@mahasiswa.pcr.ac.id', 'rahmita', 'rahmita'),
('5e7c5c42-8ea9-4984-bba2-3d95e5e24872', 'fahri', 'fahri@gmail.com', 'fahri', '1233'),
('7325a76e-76aa-41d5-93db-31cdc2f1a25d', 'FahturRahman Fauzi', 'fahturrahman18ti@mahasiswa.pcr.ac.id', 'fahturr', 'fahturr'),
('8289e28a-0ccf-4d09-bacc-6f856fae34a2', 'Riwalsyam', 'riwalsyam.r18ti@mahasiswa.pcr.ac.id', 'riwal', 'riwal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id_perusahaan`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `fk_id_perusahaan` (`id_perusahaan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_id_ticket` (`id_ticket`),
  ADD KEY `fk_id_user` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `id_perusahaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_id_perusahaan` FOREIGN KEY (`id_perusahaan`) REFERENCES `perusahaan` (`id_perusahaan`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_id_ticket` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`),
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
