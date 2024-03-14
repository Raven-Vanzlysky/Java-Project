-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jan 2024 pada 05.08
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_log`
--

CREATE TABLE `tbl_log` (
  `Id_Log` int(11) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `aktifitas` varchar(50) NOT NULL,
  `Id_User` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_log`
--

INSERT INTO `tbl_log` (`Id_Log`, `waktu`, `aktifitas`, `Id_User`) VALUES
(2, '2023-12-28 01:02:34', 'Login', 1),
(3, '2024-01-01 01:17:46', 'Login', 1),
(4, '2024-01-03 00:52:19', 'Login', 1),
(5, '2024-01-03 02:04:02', 'Login', 2),
(6, '2024-01-03 02:04:51', 'Login', 3),
(7, '2024-01-03 02:06:09', 'Login', 2),
(8, '2024-01-03 02:06:28', 'Login', 1),
(9, '2024-01-03 02:06:54', 'Login', 3),
(10, '2024-01-03 02:07:40', 'Login', 2),
(11, '2024-01-03 02:08:01', 'Login', 3),
(12, '2024-01-03 02:08:17', 'Login', 1),
(13, '2024-01-03 02:08:56', 'Login', 1),
(14, '2024-01-03 03:05:38', 'Login', 1),
(15, '2024-01-03 03:12:05', 'Login', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_obat`
--

CREATE TABLE `tbl_obat` (
  `Id_Obat` int(11) NOT NULL,
  `Kode_Obat` varchar(50) NOT NULL,
  `Nama_Obat` varchar(50) NOT NULL,
  `Expired_Date` date NOT NULL,
  `Jumlah` bigint(20) NOT NULL,
  `Harga` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_obat`
--

INSERT INTO `tbl_obat` (`Id_Obat`, `Kode_Obat`, `Nama_Obat`, `Expired_Date`, `Jumlah`, `Harga`) VALUES
(1, '008', 'Bodrex', '2022-11-30', 90, 1000),
(2, '093', 'Komix', '2019-08-17', 40, 1000000),
(3, '666', 'Afrosidiac', '2019-08-17', 5, 20000),
(4, '003', 'EX', '2034-11-09', 50, 14900000),
(5, '0086', 'Paracetamol', '2034-03-04', 990, 5500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_resep`
--

CREATE TABLE `tbl_resep` (
  `Id_Resep` int(11) NOT NULL,
  `No_Resep` varchar(50) NOT NULL,
  `Tgl_Resep` date NOT NULL,
  `Nama_Dokter` varchar(50) NOT NULL,
  `Nama_Pasien` varchar(50) NOT NULL,
  `Obat_Resep` varchar(100) NOT NULL,
  `Jumlah_ObatResep` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_resep`
--

INSERT INTO `tbl_resep` (`Id_Resep`, `No_Resep`, `Tgl_Resep`, `Nama_Dokter`, `Nama_Pasien`, `Obat_Resep`, `Jumlah_ObatResep`) VALUES
(1, '008', '2024-11-23', 'Syauqi', 'Madun', 'Bodrex', '1'),
(2, '666', '1945-08-17', 'Yamashita', 'Tangu', 'Pembangkit', '3'),
(3, '777', '3030-08-17', 'Khaleed', 'JinX', 'Habatusauda', '7'),
(4, '244', '2024-09-08', 'Hilo', 'Gilng', 'EX', '3000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `Id_Transaksi` int(11) NOT NULL,
  `No_Transaksi` varchar(50) NOT NULL,
  `Tgl_Transaksi` date NOT NULL,
  `Nama_Kasir` varchar(500) NOT NULL,
  `Id_User` int(11) NOT NULL,
  `Id_Obat` int(11) NOT NULL,
  `Id_Resep` int(11) NOT NULL,
  `Jumlah_Beli` bigint(20) NOT NULL,
  `Total_Bayar` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`Id_Transaksi`, `No_Transaksi`, `Tgl_Transaksi`, `Nama_Kasir`, `Id_User`, `Id_Obat`, `Id_Resep`, `Jumlah_Beli`, `Total_Bayar`) VALUES
(1, 'G30SPKI', '2021-02-05', 'Aiden', 1, 2, 3, 5, 5000000),
(2, '170845', '2022-05-17', 'Thor', 2, 4, 1, 6, 89400000),
(3, '301145', '2023-08-17', 'Bung', 200, 5, 4, 6, 33000),
(4, '3112232359', '2024-01-01', 'Val', 2, 3, 2, 1, 20000),
(5, '040606', '2024-06-04', 'Rvn', 1, 1, 1, 5, 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `Id_User` int(11) NOT NULL,
  `Tipe_User` varchar(100) NOT NULL,
  `Nama_User` varchar(50) NOT NULL,
  `Alamat` varchar(150) NOT NULL,
  `Telepon` int(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`Id_User`, `Tipe_User`, `Nama_User`, `Alamat`, `Telepon`, `Username`, `Password`) VALUES
(1, 'Admin', 'Ioreum', 'Andromeda', 1928, 'Chiron', 'Veyron'),
(2, 'Kasir', 'Dell La Cruz', 'Underworld', 666, 'Lobak', '8888'),
(3, 'Apoteker', 'Sins', 'Ohio', 169, 'Jhon', 'Thor'),
(200, 'Apoteker', 'Zoki', 'Mars', 989784, 'zoki', '2be5c0ade39118b5a479957d27c4b382');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`Id_Log`),
  ADD KEY `Id_User` (`Id_User`);

--
-- Indeks untuk tabel `tbl_obat`
--
ALTER TABLE `tbl_obat`
  ADD PRIMARY KEY (`Id_Obat`);

--
-- Indeks untuk tabel `tbl_resep`
--
ALTER TABLE `tbl_resep`
  ADD PRIMARY KEY (`Id_Resep`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`Id_Transaksi`),
  ADD KEY `Id_User` (`Id_User`),
  ADD KEY `Id_Obat` (`Id_Obat`,`Id_Resep`),
  ADD KEY `Id_Resep` (`Id_Resep`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`Id_User`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `Id_Log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tbl_obat`
--
ALTER TABLE `tbl_obat`
  MODIFY `Id_Obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_resep`
--
ALTER TABLE `tbl_resep`
  MODIFY `Id_Resep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `Id_Transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `Id_User` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6547;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD CONSTRAINT `tbl_log_ibfk_1` FOREIGN KEY (`Id_User`) REFERENCES `tbl_user` (`Id_User`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `tbl_transaksi_ibfk_1` FOREIGN KEY (`Id_Obat`) REFERENCES `tbl_obat` (`Id_Obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaksi_ibfk_2` FOREIGN KEY (`Id_Resep`) REFERENCES `tbl_resep` (`Id_Resep`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaksi_ibfk_3` FOREIGN KEY (`Id_User`) REFERENCES `tbl_user` (`Id_User`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Event
--
CREATE DEFINER=`root`@`localhost` EVENT `hapus_data_lama` ON SCHEDULE EVERY 3 DAY STARTS '2024-01-03 10:31:51' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM tbl_log WHERE waktu < DATE_SUB(NOW(), INTERVAL 10 DAY)$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
