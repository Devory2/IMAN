-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Nov 2021 pada 08.27
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_iman`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_Barang` int(11) NOT NULL,
  `id_MBarang` int(11) NOT NULL,
  `harga_jual` float NOT NULL,
  `tgl_barang_masuk` datetime NOT NULL,
  `stok_barang` int(10) NOT NULL,
  `expired` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_distributor`
--

CREATE TABLE `tbl_distributor` (
  `id_Distributor` int(11) NOT NULL,
  `id_MBarang` int(11) NOT NULL,
  `id_MDistributor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_keuangan`
--

CREATE TABLE `tbl_keuangan` (
  `id_keuangan` int(11) NOT NULL,
  `pemasukkan` float NOT NULL,
  `pengeluaran` float NOT NULL,
  `laba` float NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mbarang`
--

CREATE TABLE `tbl_mbarang` (
  `id_MBarang` int(11) NOT NULL,
  `id_distributor` int(11) NOT NULL,
  `Nama_Barang` varchar(255) NOT NULL,
  `harga_beli` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mdistributor`
--

CREATE TABLE `tbl_mdistributor` (
  `id_MDistributor` int(11) NOT NULL,
  `nama_Distributor` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telp` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_muser`
--

CREATE TABLE `tbl_muser` (
  `id_Muser` int(11) NOT NULL,
  `level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(15) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_barang` int(14) NOT NULL,
  `jml_barang` int(15) NOT NULL,
  `total` float NOT NULL,
  `kembali` float NOT NULL,
  `bayar` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `id_muser` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id_Barang`),
  ADD KEY `id_MBarang` (`id_MBarang`);

--
-- Indeks untuk tabel `tbl_distributor`
--
ALTER TABLE `tbl_distributor`
  ADD PRIMARY KEY (`id_Distributor`),
  ADD KEY `id_MBarang` (`id_MBarang`),
  ADD KEY `id_MDistributor` (`id_MDistributor`);

--
-- Indeks untuk tabel `tbl_keuangan`
--
ALTER TABLE `tbl_keuangan`
  ADD PRIMARY KEY (`id_keuangan`);

--
-- Indeks untuk tabel `tbl_mbarang`
--
ALTER TABLE `tbl_mbarang`
  ADD PRIMARY KEY (`id_MBarang`),
  ADD KEY `id_distributor` (`id_distributor`);

--
-- Indeks untuk tabel `tbl_mdistributor`
--
ALTER TABLE `tbl_mdistributor`
  ADD PRIMARY KEY (`id_MDistributor`);

--
-- Indeks untuk tabel `tbl_muser`
--
ALTER TABLE `tbl_muser`
  ADD PRIMARY KEY (`id_Muser`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`,`id_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_muser` (`id_muser`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id_Barang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_distributor`
--
ALTER TABLE `tbl_distributor`
  MODIFY `id_Distributor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_keuangan`
--
ALTER TABLE `tbl_keuangan`
  MODIFY `id_keuangan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_mbarang`
--
ALTER TABLE `tbl_mbarang`
  MODIFY `id_MBarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_mdistributor`
--
ALTER TABLE `tbl_mdistributor`
  MODIFY `id_MDistributor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_muser`
--
ALTER TABLE `tbl_muser`
  MODIFY `id_Muser` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD CONSTRAINT `tbl_barang_ibfk_1` FOREIGN KEY (`id_MBarang`) REFERENCES `tbl_mbarang` (`id_MBarang`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_distributor`
--
ALTER TABLE `tbl_distributor`
  ADD CONSTRAINT `tbl_distributor_ibfk_1` FOREIGN KEY (`id_MDistributor`) REFERENCES `tbl_mdistributor` (`id_MDistributor`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_mbarang`
--
ALTER TABLE `tbl_mbarang`
  ADD CONSTRAINT `tbl_mbarang_ibfk_1` FOREIGN KEY (`id_distributor`) REFERENCES `tbl_distributor` (`id_Distributor`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `tbl_transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaksi_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tbl_barang` (`id_Barang`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`id_muser`) REFERENCES `tbl_muser` (`id_Muser`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
