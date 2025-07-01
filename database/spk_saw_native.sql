-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jun 2025 pada 03.58
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk_saw_native`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alternatif`
--

CREATE TABLE `alternatif` (
  `id_alternatif` int(11) NOT NULL,
  `alternatif` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `alternatif`
--

INSERT INTO `alternatif` (`id_alternatif`, `alternatif`) VALUES
(16, 'Pondok Laras'),
(17, 'Mang Engking'),
(18, 'Saung Talaga'),
(19, 'Mang Kabayan'),
(30, 'Warung SS Special'),
(31, 'Daebak Fan Caffe'),
(32, 'Soto Bu Tjondro '),
(33, 'Warung Pasta Depok '),
(34, 'Ayam Bakar Christina'),
(35, 'Caffe Hello Bingsu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil`
--

CREATE TABLE `hasil` (
  `id_hasil` int(11) NOT NULL,
  `kode_hasil` varchar(255) DEFAULT NULL,
  `id_alternatif` int(11) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `kode_hasil`, `id_alternatif`, `nilai`) VALUES
(1, NULL, 16, 0.55),
(2, NULL, 17, 0.525),
(3, NULL, 18, 0.55),
(4, NULL, 19, 0.55),
(5, NULL, 30, 0),
(6, NULL, 31, 0),
(7, NULL, 32, 0),
(8, NULL, 33, 0),
(9, NULL, 34, 0),
(10, NULL, 35, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `kode_kriteria` varchar(10) NOT NULL,
  `kriteria` varchar(50) NOT NULL,
  `type` enum('Benefit','Cost') NOT NULL,
  `bobot` float NOT NULL,
  `ada_pilihan` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `kode_kriteria`, `kriteria`, `type`, `bobot`, `ada_pilihan`) VALUES
(1, 'Q1', 'Lokasi', 'Benefit', 0.15, 1),
(2, 'Q2', 'Harga', 'Cost', 0.2, 1),
(3, 'Q3', 'Transportasi', 'Benefit', 0.1, 1),
(4, 'Q4', 'Jarak', 'Cost', 0.1, 1),
(9, 'Q5', 'Fasilitas', 'Benefit', 0.1, 1),
(10, 'Q6', 'Parkir', 'Benefit', 0.1, 1),
(11, 'Q7', 'Variasi Menu', 'Benefit', 0.15, 1),
(12, 'Q8', 'Waktu Operasional', 'Benefit', 0.1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian`
--

CREATE TABLE `penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `id_alternatif` int(10) NOT NULL,
  `id_kriteria` int(10) NOT NULL,
  `id_sub_kriteria` int(11) DEFAULT NULL,
  `nilai` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `penilaian`
--

INSERT INTO `penilaian` (`id_penilaian`, `id_alternatif`, `id_kriteria`, `id_sub_kriteria`, `nilai`) VALUES
(33, 16, 1, 3, NULL),
(34, 16, 2, 7, NULL),
(35, 16, 3, 10, NULL),
(36, 16, 4, 14, NULL),
(37, 17, 1, 4, NULL),
(38, 17, 2, 7, NULL),
(39, 17, 3, 9, NULL),
(40, 17, 4, 13, NULL),
(45, 19, 1, 2, NULL),
(46, 19, 2, 5, NULL),
(47, 19, 3, 10, NULL),
(48, 19, 4, 11, NULL),
(60, 18, 1, 3, NULL),
(61, 18, 2, 6, NULL),
(62, 18, 3, NULL, 4),
(63, 18, 4, 12, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_kriteria`
--

CREATE TABLE `sub_kriteria` (
  `id_sub_kriteria` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `sub_kriteria` varchar(50) NOT NULL,
  `nilai` double(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `sub_kriteria`
--

INSERT INTO `sub_kriteria` (`id_sub_kriteria`, `id_kriteria`, `sub_kriteria`, `nilai`) VALUES
(2, 1, 'P3', 1),
(3, 1, 'P2', 1),
(4, 1, 'P1', 1),
(5, 2, 'P3', 1),
(6, 2, 'P2', 1),
(7, 2, 'P1', 1),
(9, 3, 'B', 3),
(10, 3, 'C', 4),
(11, 4, 'P1', 1),
(12, 4, 'P2', 1),
(13, 4, 'P3', 1),
(14, 4, 'P4', 1),
(15, 1, 'P4', 1),
(16, 1, 'P5', 1),
(17, 1, 'P6', 1),
(18, 1, 'P7', 1),
(19, 1, 'P8', 1),
(20, 2, 'P4', 1),
(21, 2, 'P5', 1),
(22, 2, 'P6', 1),
(23, 2, 'P7', 1),
(24, 2, 'P9', 1),
(25, 4, 'P5', 1),
(26, 4, 'P6', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(5) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(70) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `role` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `email`, `role`) VALUES
(15, 'andinoya', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Andi Santoso', 'asdas@asd', '1'),
(16, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin', 'admin@gmail.com', '1');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indeks untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `fk_hasil` (`id_alternatif`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indeks untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_penilaian`),
  ADD KEY `fk_penilaian_alternatif` (`id_alternatif`),
  ADD KEY `fk_penilaian_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  ADD PRIMARY KEY (`id_sub_kriteria`),
  ADD KEY `fk_sub_kriteria_id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id_alternatif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  MODIFY `id_sub_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `fk_hasil` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `fk_penilaian_alternatif` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`),
  ADD CONSTRAINT `fk_penilaian_kriteria` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  ADD CONSTRAINT `fk_sub_kriteria_id_kriteria` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
