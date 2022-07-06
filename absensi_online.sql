-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 07, 2022 at 12:59 AM
-- Server version: 5.7.38
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeinem_absensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `db_absensi`
--

CREATE TABLE `db_absensi` (
  `id_absen` bigint(20) NOT NULL,
  `kode_absen` varchar(100) NOT NULL,
  `nama_pegawai` varchar(125) NOT NULL,
  `kode_pegawai` varchar(125) NOT NULL,
  `tgl_absen` varchar(125) NOT NULL,
  `jam_masuk` varchar(13) NOT NULL,
  `jam_pulang` varchar(13) NOT NULL,
  `status_pegawai` int(1) NOT NULL,
  `keterangan_absen` varchar(100) NOT NULL,
  `alasan_duluan` varchar(212) NOT NULL,
  `maps_absen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db_absensi`
--

INSERT INTO `db_absensi` (`id_absen`, `kode_absen`, `nama_pegawai`, `kode_pegawai`, `tgl_absen`, `jam_masuk`, `jam_pulang`, `status_pegawai`, `keterangan_absen`, `alasan_duluan`, `maps_absen`) VALUES
(3, 'absen_20220785580', 'Admin', '293571010111', 'Minggu, 3 Juli 2022', '22:55:30', '22:55:32', 2, 'Bekerja Di Kantor', '', '-7.2574719, 112.7520883'),
(4, 'absen_20220725392', 'Novita Yuliani Amd. Kom', '300116595298486', 'Minggu, 3 Juli 2022', '22:56:02', '22:56:05', 2, 'Bekerja Di Kantor', '', '-7.2574719, 112.7520883'),
(5, 'absen_20220741860', 'Nur Hikmah', '430825270611679', 'Minggu, 3 Juli 2022', '23:11:20', '23:11:43', 2, 'Bekerja Di Kantor', '', '-3.2739355, 114.5746452'),
(6, 'absen_20220750105', 'Admin', '293571010111', 'Senin, 4 Juli 2022', '07:23:54', '12:05:40', 1, 'Bekerja Di Kantor', 'mager', '-3.2520794, 114.603218'),
(7, 'absen_20220758755', 'Novita Yuliani Amd. Kom', '300116595298486', 'Senin, 4 Juli 2022', '10:47:05', '', 2, 'Bekerja Di Rumah / WFH', '', '-2.9858435, 114.7583227'),
(8, 'absen_20220773617', 'Novita Yuliani Amd. Kom', '300116595298486', 'Selasa, 5 Juli 2022', '10:32:33', '10:32:45', 2, 'Bekerja Di Rumah / WFH', 'sakit', '-3.234525, 114.6223427'),
(9, 'absen_20220792728', 'Admin', '293571010111', 'Selasa, 5 Juli 2022', '10:34:39', '11:41:52', 2, 'Sakit', 'sakit', '-3.2345172, 114.6223436'),
(10, 'absen_20220781622', 'Aan Wahyudi', '098187274916306', 'Selasa, 5 Juli 2022', '11:58:59', '12:00:37', 2, 'Bekerja Di Kantor', 'sakit', '-3.2345261, 114.6223531'),
(11, 'absen_20220794290', 'Wuri Handayani,ST', '397017226458940', 'Rabu, 6 Juli 2022', '07:58:52', '', 1, 'Bekerja Di Kantor', '', '-3.3186067, 114.5943784'),
(12, 'absen_20220770249', 'Aunurrafieq,SE', '534190729326716', 'Rabu, 6 Juli 2022', '08:49:17', '11:57:58', 1, 'Bekerja Di Rumah / WFH', 'sakit', '-3.2329887, 114.6198466'),
(13, 'absen_20220757930', 'Admin', '293571010111', 'Rabu, 6 Juli 2022', '08:50:00', '13:27:44', 1, 'Bekerja Di Kantor', 'sakit', '-3.2329887, 114.6198466'),
(14, 'absen_20220752274', 'Novita Yuliani', '300116595298486', 'Rabu, 6 Juli 2022', '13:14:28', '13:18:46', 2, 'Bekerja Di Kantor', 'sakit', '-3.2294605, 114.6228157'),
(15, 'absen_20220730157', 'yuliani', '300582572463199', 'Rabu, 6 Juli 2022', '21:25:00', '21:25:04', 2, 'Bekerja Di Kantor', '', '-3.3186067, 114.5943784');

-- --------------------------------------------------------

--
-- Table structure for table `db_rememberme`
--

CREATE TABLE `db_rememberme` (
  `id_session` int(11) NOT NULL,
  `kode_pegawai` varchar(125) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_agent` varchar(35) NOT NULL,
  `agent_string` varchar(255) NOT NULL,
  `platform` varchar(128) NOT NULL,
  `user_ip` varchar(35) NOT NULL,
  `cookie_hash` varchar(255) NOT NULL,
  `expired` int(128) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `db_rememberme`
--

INSERT INTO `db_rememberme` (`id_session`, `kode_pegawai`, `username`, `user_agent`, `agent_string`, `platform`, `user_ip`, `cookie_hash`, `expired`, `date_created`) VALUES
(10, '', 'admin', 'Chrome 91.0.4472.88', 'Mozilla/5.0 (Linux; U; Android 8.1.0; in-id; CPH1803 Build/OPM1.171019.026) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.88 Mobile Safari/537.36 HeyTapBrowser/15.8.6.1', 'Android', '114.79.44.152', '2100b2c4bad6a7f1aaa8db7a9966a09fb591efee8214b8f415b09c8d656ddf72', 31570560, 1656890626),
(19, '', 'novita', 'Chrome 103.0.0.0', 'Mozilla/5.0 (Linux; Android 12; SM-A515F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 'Android', '125.164.96.178', '2d223a612141628aba1e2807db5ed57a102e25a561b16d1d71b8ef1ac5efa197', 31570560, 1657002541),
(21, '', 'admin', 'Chrome 91.0.4472.88', 'Mozilla/5.0 (Linux; U; Android 8.1.0; in-id; CPH1803 Build/OPM1.171019.026) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.88 Mobile Safari/537.36 HeyTapBrowser/15.8.6.1', 'Android', '114.79.44.177', '824ecdb9b1d7cb88879a1633103478ef9d70ab62958485d708e145331236eeba', 31570560, 1657004058),
(22, '', 'admin', 'Chrome 102.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'Windows 10', '114.79.44.129', '05083cb3dd7c874502a683875f766bf94f4892e37c69c6274aea142266a1ba63', 31570560, 1657021218),
(25, '', 'admin', 'Chrome 102.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'Windows 10', '114.79.44.130', '95423d91b7a33ebab2afa1b208ad9b1335db2b1549ddaaad38085c887b7a9a27', 31570560, 1657065564),
(29, '', 'admin', 'Chrome 103.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'Windows 10', '114.79.44.130', '3f757c110a59897a7fdba4fbb3da6b1254981a7dcfccf95fded1b1d3c5a965fc', 31570560, 1657080866),
(31, '', 'admin', 'Chrome 91.0.4472.88', 'Mozilla/5.0 (Linux; U; Android 8.1.0; in-id; CPH1803 Build/OPM1.171019.026) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.88 Mobile Safari/537.36 HeyTapBrowser/15.8.6.1', 'Android', '114.79.44.130', 'f3ee8bc6a01c6bf44a760f2334c23da2c4ada1d485c59d2a05d5413b8b4bccec', 31570560, 1657085250),
(33, '', 'admin', 'Chrome 91.0.4472.88', 'Mozilla/5.0 (Linux; U; Android 8.1.0; in-id; CPH1803 Build/OPM1.171019.026) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.88 Mobile Safari/537.36 HeyTapBrowser/15.8.6.1', 'Android', '114.79.44.146', 'b9ca5878ce8fcb46ae443fe204877b2228e2a460bb1dfe70d620b361a8b0bd02', 31570560, 1657101103),
(36, '', 'yuli', 'Chrome 103.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'Windows 10', '114.79.44.218', '1aa00c18a0aa67f976504c240b99df6ac0bde41b142632b4a5e48d06706ca28f', 31570560, 1657113892),
(38, '', 'admin', 'Chrome 103.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'Windows 10', '114.5.103.118', '065ef9fa14986601a495bc176dbce76fa7263a10747f1abff8ffb673e17e23e4', 31570560, 1657130253);

-- --------------------------------------------------------

--
-- Table structure for table `db_setting`
--

CREATE TABLE `db_setting` (
  `status_setting` int(1) NOT NULL DEFAULT '0',
  `nama_instansi` varchar(255) NOT NULL,
  `jumbotron_lead_set` varchar(125) NOT NULL,
  `nama_app_absensi` varchar(20) NOT NULL DEFAULT 'Absensi Online',
  `logo_instansi` varchar(255) NOT NULL,
  `timezone` varchar(35) NOT NULL,
  `absen_mulai` varchar(13) NOT NULL,
  `absen_mulai_to` varchar(13) NOT NULL,
  `absen_pulang` varchar(13) NOT NULL,
  `maps_use` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db_setting`
--

INSERT INTO `db_setting` (`status_setting`, `nama_instansi`, `jumbotron_lead_set`, `nama_app_absensi`, `logo_instansi`, `timezone`, `absen_mulai`, `absen_mulai_to`, `absen_pulang`, `maps_use`) VALUES
(1, 'Balai Pelatihan dan Pemberdayaan Masyarakat Desa Daerah Tertinggal dan Transmigrasi Banjarmasin', 'Selamat Datang Di BPPMDDTT Banjarmasin', 'Absensi Pegawai PNS', '2d146d6432be10d61103f3d827734c0a.png', 'Asia/Makassar', '06:00:00', '09:00:00', '16:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_pegawai` int(11) NOT NULL,
  `nama_lengkap` varchar(125) NOT NULL,
  `username` varchar(125) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(1) NOT NULL,
  `umur` int(11) NOT NULL,
  `image` varchar(125) NOT NULL,
  `qr_code_image` varchar(125) NOT NULL,
  `kode_pegawai` varchar(125) NOT NULL,
  `instansi` varchar(125) NOT NULL,
  `jabatan` varchar(125) NOT NULL,
  `npwp` varchar(255) NOT NULL,
  `tgl_lahir` varchar(25) NOT NULL,
  `tempat_lahir` varchar(25) NOT NULL,
  `jenis_kelamin` varchar(25) NOT NULL,
  `bagian_shift` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `qr_code_use` int(2) NOT NULL,
  `last_login` int(11) NOT NULL,
  `is_online` int(11) DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_pegawai`, `nama_lengkap`, `username`, `password`, `role_id`, `umur`, `image`, `qr_code_image`, `kode_pegawai`, `instansi`, `jabatan`, `npwp`, `tgl_lahir`, `tempat_lahir`, `jenis_kelamin`, `bagian_shift`, `is_active`, `qr_code_use`, `last_login`, `is_online`, `date_created`) VALUES
(12, 'Admin', 'admin', '$2y$10$sZVyS3G6aVjMRoLq0JhuZuiAat.QjOOtbcyohRih3IxtQaEvJG4Eq', 1, 18, 'default.png', 'no-qrcode.png', '293571010111', 'Balai Pelatihan dan Pemberdayaan Masyarakat Desa Daerah Tertinggal dan Transmigrasi Banjarmasin', 'Test', 'Tidak Ada', '2020-09-08', 'Test', 'Laki - Laki', 1, 1, 0, 1657123886, NULL, 1584698797),
(42, 'Novita Yuliani', 'novita', '$2y$10$aQBrCmKPkch6STy/d73fNeQoGS8KjdkRxoUQYRAnpfDwtokCMh7ZC', 3, 21, '31563aa6bf9ee0b1b1888fd76fa23c85.png', 'no-qrcode.png', '300116595298486', 'Balai Pelatihan dan Pemberdayaan Masyarakat Desa Daerah Tertinggal dan Transmigrasi Banjarmasin', 'pegawai', '4356753728904774', '2001-07-07', 'Bangkit baru', 'Perempuan', 1, 1, 0, 1657101091, NULL, 1656860033),
(44, 'Aan Wahyudi', 'aan', '$2y$10$TcXsmrLOylBnmtMQF.4vkuFS4kfCLX60Sf2EtraEurm9IttSh4y1C', 3, 25, 'default.png', 'no-qrcode.png', '098187274916306', 'Balai Pelatihan dan Pemberdayaan Masyarakat Desa Daerah Tertinggal dan Transmigrasi Banjarmasin', 'pegawai', '02763691773', '1989-05-31', 'Anjir', 'Laki - Laki', 1, 0, 0, 1656993644, NULL, 1656993377),
(45, 'Budi Rustanto, SE', 'budi', '$2y$10$TenqtNNqNZy5sLRmGwIkl.57yUtkWZ7HTUZLSDHtyMboclyeDsBxi', 3, 40, 'default.png', 'no-qrcode.png', '221057148465873', 'Balai Pelatihan dan Pemberdayaan Masyarakat Desa Daerah Tertinggal dan Transmigrasi Banjarmasin', 'kepala balai', '19700919199031002', '1959-06-02', 'Banjarmasin', 'Laki - Laki', 1, 1, 0, 0, NULL, 1657023714),
(46, 'Wuri Handayani,ST', 'wuri', '$2y$10$JL587zZZm4FPQELDRJoEUOJGjxnepRZAZ0gLVcuPwJq7lFZicdyCa', 3, 40, 'b36f9107eaa20b5fdfe1e2c5cac20944.png', 'no-qrcode.png', '397017226458940', 'Balai Pelatihan dan Pemberdayaan Masyarakat Desa Daerah Tertinggal dan Transmigrasi Banjarmasin', 'Kepala Sub Bagian Tata Usaha', '198304212007122001', '1977-06-06', 'Banjarmasin', 'Perempuan', 1, 1, 0, 1657065544, NULL, 1657024022),
(47, 'Aunurrafieq,SE', 'aunur', '$2y$10$0mB4mQ07Er2fKXTUpoCTLeyUUIIJxLZgO7tSdkM25a4pd.xqU4HOi', 3, 40, 'default.png', 'no-qrcode.png', '534190729326716', 'Balai Pelatihan dan Pemberdayaan Masyarakat Desa Daerah Tertinggal dan Transmigrasi Banjarmasin', 'Analisis Kerjasama', '197005171990031001', '1978-06-14', 'Banjarmasin', 'Laki - Laki', 1, 1, 0, 1657079941, NULL, 1657065780),
(48, 'Ary fachruriza,ST, M.Pd', 'ary', '$2y$10$5AD0AXI6TMCAX.C0PFk0L.UUr4Dp88qqMsLMogOHXwajugNdT5pJe', 3, 40, 'default.png', 'no-qrcode.png', '679547816915432', 'Balai Pelatihan dan Pemberdayaan Masyarakat Desa Daerah Tertinggal dan Transmigrasi Banjarmasin', 'Analisis Kepegawaian Ahli Utama', '197710282011011002', '1972-06-07', 'Banjarmasin', 'Laki - Laki', 1, 1, 0, 0, NULL, 1657066041),
(49, 'yuliani', 'yuli', '$2y$10$VC0bn35h/n9KydxDenhf5O/hMgK7hF1aNo590s9kpcCuxYonrzeTW', 3, 25, 'default.png', 'no-qrcode.png', '300582572463199', 'Balai Pelatihan dan Pemberdayaan Masyarakat Desa Daerah Tertinggal dan Transmigrasi Banjarmasin', 'pegawai', '6789098765637', '1984-06-04', 'Banjarmasin', 'Perempuan', 1, 1, 0, 0, NULL, 1657113258);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_absensi`
--
ALTER TABLE `db_absensi`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indexes for table `db_rememberme`
--
ALTER TABLE `db_rememberme`
  ADD PRIMARY KEY (`id_session`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_absensi`
--
ALTER TABLE `db_absensi`
  MODIFY `id_absen` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `db_rememberme`
--
ALTER TABLE `db_rememberme`
  MODIFY `id_session` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
