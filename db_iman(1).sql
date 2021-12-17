-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Waktu pembuatan: 16 Des 2021 pada 06.36
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_iman1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_Barang` mediumint(7) NOT NULL,
  `id_MBarang` mediumint(7) NOT NULL,
  `harga_jual` float NOT NULL,
  `tgl_barang_masuk` date NOT NULL,
  `stok_barang` smallint(5) NOT NULL,
  `expired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_barang`
--

INSERT INTO `tbl_barang` (`id_Barang`, `id_MBarang`, `harga_jual`, `tgl_barang_masuk`, `stok_barang`, `expired`) VALUES
(1, 1, 20000, '2021-11-11', 25, '2023-06-02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_keuangan`
--

CREATE TABLE `tbl_keuangan` (
  `id_keuangan` mediumint(7) NOT NULL,
  `pemasukkan` float NOT NULL,
  `pengeluaran` float NOT NULL,
  `laba` float NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_keuangan`
--

INSERT INTO `tbl_keuangan` (`id_keuangan`, `pemasukkan`, `pengeluaran`, `laba`, `tanggal`) VALUES
(1, 20000, 0, 5000, '2021-12-16 05:29:40'),
(2, 40000, 0, 10000, '2021-12-16 05:45:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mbarang`
--

CREATE TABLE `tbl_mbarang` (
  `id_MBarang` mediumint(7) NOT NULL,
  `id_MDistributor` smallint(4) NOT NULL,
  `nama_barang` varchar(65) NOT NULL,
  `harga_beli` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_mbarang`
--

INSERT INTO `tbl_mbarang` (`id_MBarang`, `id_MDistributor`, `nama_barang`, `harga_beli`) VALUES
(1, 1, 'Minyak Sunco 1L', 12000),
(2, 2, 'Telur 1KG', 15500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mdistributor`
--

CREATE TABLE `tbl_mdistributor` (
  `id_MDistributor` smallint(4) NOT NULL,
  `nama_Distributor` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_mdistributor`
--

INSERT INTO `tbl_mdistributor` (`id_MDistributor`, `nama_Distributor`, `alamat`, `no_telp`) VALUES
(1, 'UD. Juki Berjaya', 'Jln Juki no.8', '08154731945'),
(2, 'UD. Leo Farm Tbk.', 'Jln Sekardangan no 43/A, Sidoarjo', '087754434901');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_muser`
--

CREATE TABLE `tbl_muser` (
  `id_Muser` tinyint(1) NOT NULL,
  `level` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_muser`
--

INSERT INTO `tbl_muser` (`id_Muser`, `level`) VALUES
(1, 'owner'),
(2, 'admin'),
(3, 'kasir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` mediumint(7) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `id_user` tinyint(3) NOT NULL,
  `id_barang` mediumint(7) NOT NULL,
  `jml_barang` tinyint(3) NOT NULL,
  `total` float NOT NULL,
  `kembali` float NOT NULL,
  `bayar` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `tgl_transaksi`, `id_user`, `id_barang`, `jml_barang`, `total`, `kembali`, `bayar`) VALUES
(1, '2021-12-16 05:28:46', 2, 1, 1, 20000, 30000, 50000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` tinyint(3) NOT NULL,
  `id_muser` tinyint(1) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `id_muser`, `nama`, `username`, `password`) VALUES
(1, 1, 'Marzuki Akmal', 'Juki1202', 'nisadihatiku'),
(2, 3, 'Ell Fenca', 'Ell', 'akucintapadamu');

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
-- Indeks untuk tabel `tbl_keuangan`
--
ALTER TABLE `tbl_keuangan`
  ADD PRIMARY KEY (`id_keuangan`);

--
-- Indeks untuk tabel `tbl_mbarang`
--
ALTER TABLE `tbl_mbarang`
  ADD PRIMARY KEY (`id_MBarang`),
  ADD KEY `id_MDistributor` (`id_MDistributor`);

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
  MODIFY `id_Barang` mediumint(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_keuangan`
--
ALTER TABLE `tbl_keuangan`
  MODIFY `id_keuangan` mediumint(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_mbarang`
--
ALTER TABLE `tbl_mbarang`
  MODIFY `id_MBarang` mediumint(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_mdistributor`
--
ALTER TABLE `tbl_mdistributor`
  MODIFY `id_MDistributor` smallint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_muser`
--
ALTER TABLE `tbl_muser`
  MODIFY `id_Muser` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` mediumint(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD CONSTRAINT `tbl_barang_ibfk_1` FOREIGN KEY (`id_MBarang`) REFERENCES `tbl_mbarang` (`id_MBarang`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_mbarang`
--
ALTER TABLE `tbl_mbarang`
  ADD CONSTRAINT `tbl_mbarang_ibfk_1` FOREIGN KEY (`id_MDistributor`) REFERENCES `tbl_mdistributor` (`id_MDistributor`) ON UPDATE CASCADE;

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
