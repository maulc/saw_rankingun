-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Des 2021 pada 15.30
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_saw`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bobot`
--

CREATE TABLE `tb_bobot` (
  `id_bobot` int(2) NOT NULL,
  `kriteria` varchar(50) NOT NULL,
  `nilai_bobot` varchar(4) NOT NULL,
  `keterangan` enum('benefit','cost') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_bobot`
--

INSERT INTO `tb_bobot` (`id_bobot`, `kriteria`, `nilai_bobot`, `keterangan`) VALUES
(11, 'Nilai Matematika', '5', 'benefit'),
(12, 'Nilai Bahasa Indonesia', '5', 'benefit'),
(13, 'Nilai IPA', '5', 'benefit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_hasil_penilaian`
--

CREATE TABLE `tb_hasil_penilaian` (
  `id_penilaian` int(2) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kehadiran` varchar(10) NOT NULL,
  `tugas` varchar(10) NOT NULL,
  `quiz_project` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_hasil_penilaian`
--

INSERT INTO `tb_hasil_penilaian` (`id_penilaian`, `nama`, `kehadiran`, `tugas`, `quiz_project`) VALUES
(34, 'kinasih widi', '4', '2.00', '3.00'),
(35, 'fitri aurellia s', '4', '3.00', '2.00'),
(36, 'refandah p', '5', '4.00', '2.00'),
(37, 'maula cahya amalia', '4', '3.00', '5.00'),
(38, 'ridhotul maulidia', '3', '4.00', '5.00'),
(40, 'bela dwi p', '3', '4.00', '5.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_rating`
--

CREATE TABLE `tb_rating` (
  `id_rating` int(2) NOT NULL,
  `id_penilaian` int(2) NOT NULL,
  `kehadiran` varchar(4) NOT NULL,
  `tugas` varchar(4) NOT NULL,
  `quiz_project` varchar(4) NOT NULL,
  `total_rating` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_rating`
--

INSERT INTO `tb_rating` (`id_rating`, `id_penilaian`, `kehadiran`, `tugas`, `quiz_project`, `total_rating`) VALUES
(28, 34, '0.8', '0.4', '0.6', '1.8'),
(29, 35, '0.8', '0.6', '0.4', '1.8'),
(30, 36, '1', '0.8', '0.4', '2.2'),
(31, 37, '0.8', '0.6', '1', '2.4'),
(32, 38, '0.6', '0.8', '1', '2.4'),
(34, 40, '0.6', '0.8', '1', '2.4');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(8) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `email`, `password`) VALUES
(4, 'FARID', 'farid@gmail.com', '$2y$10$KCguq/82ZLu8NEKf6Dk3HODKBD45RCdHfkwaMbNCsMZMPkM6RS21a'),
(5, 'SIE', 'sie@gmail.com', '$2y$10$e6XsFGnF0GlhFQgh9REnBOuswu9uTLRnsD4oSjrLVwA.XhekLJraO');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_bobot`
--
ALTER TABLE `tb_bobot`
  ADD PRIMARY KEY (`id_bobot`);

--
-- Indeks untuk tabel `tb_hasil_penilaian`
--
ALTER TABLE `tb_hasil_penilaian`
  ADD PRIMARY KEY (`id_penilaian`);

--
-- Indeks untuk tabel `tb_rating`
--
ALTER TABLE `tb_rating`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `id_penilaian` (`id_penilaian`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_bobot`
--
ALTER TABLE `tb_bobot`
  MODIFY `id_bobot` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tb_hasil_penilaian`
--
ALTER TABLE `tb_hasil_penilaian`
  MODIFY `id_penilaian` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `tb_rating`
--
ALTER TABLE `tb_rating`
  MODIFY `id_rating` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_rating`
--
ALTER TABLE `tb_rating`
  ADD CONSTRAINT `r_ratingKecocokan` FOREIGN KEY (`id_penilaian`) REFERENCES `tb_hasil_penilaian` (`id_penilaian`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
