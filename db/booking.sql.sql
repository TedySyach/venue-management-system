-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 15, 2024 at 12:04 PM
-- Server version: 10.6.14-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `id_album` int(11) NOT NULL,
  `id_sycAlbum` int(11) DEFAULT NULL,
  `nama_album` char(50) NOT NULL,
  `slug_album` char(50) NOT NULL,
  `foto` text NOT NULL,
  `created_by` char(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(20) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id_album`, `id_sycAlbum`, `nama_album`, `slug_album`, `foto`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, NULL, 'Percobaan', 'percobaan', 'percobaan20180411012221.jpg', 'amperakoding', '2018-04-11 06:14:08', 'amperakoding', '2021-05-17 19:57:25'),
(2, NULL, 'Percobaan ke2', 'percobaan-ke2', 'percobaan-ke220180414141810.jpg', 'amperakoding', '2018-04-11 06:20:52', 'amperakoding', '2021-05-17 19:57:25'),
(3, NULL, 'Coba Lagi', 'coba-lagi', 'coba-lagi20180414141800.jpg', 'amperakoding', '2018-04-11 06:23:01', 'amperakoding', '2021-05-17 19:57:25'),
(4, NULL, 'Lagi coba', 'lagi-coba', 'lagi-coba20180414141618.jpg', 'amperakoding', '2018-04-11 06:23:11', 'amperakoding', '2021-05-17 19:57:25'),
(5, NULL, 'Scenery', 'scenery', 'scenery20180414141646.jpg', 'amperakoding', '2018-04-14 19:16:46', 'amperakoding', '2021-05-17 19:57:28'),
(6, NULL, 'Lake House', 'lake-house', 'lake-house20180414141705.jpg', 'amperakoding', '2018-04-14 19:17:05', 'amperakoding', '2021-05-17 19:57:28'),
(7, NULL, 'House', 'house', 'house20180414141719.jpg', 'amperakoding', '2018-04-14 19:17:19', 'amperakoding', '2021-05-17 19:57:28');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id_bank` int(11) NOT NULL,
  `nama_bank` varchar(100) NOT NULL,
  `atas_nama` varchar(100) NOT NULL,
  `norek` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id_bank`, `nama_bank`, `atas_nama`, `norek`, `logo`) VALUES
(1, 'BNI', 'Microtron', '12345678', 'bni.png'),
(2, 'BRI', 'Microtron', '87873412323', 'bri.png'),
(3, 'Mandiri', 'Microtron', '778734098', 'mandiri.png'),
(4, 'BCA', 'Microtron', '998980342487', 'bca.png');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id_company` int(11) NOT NULL,
  `id_sycCom` int(11) DEFAULT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_desc` text NOT NULL,
  `company_address` text NOT NULL,
  `company_maps` text NOT NULL,
  `company_phone` char(30) NOT NULL,
  `company_phone2` char(30) NOT NULL,
  `company_fax` char(30) NOT NULL,
  `company_email` char(30) NOT NULL,
  `foto` text NOT NULL,
  `foto_type` char(10) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL,
  `created_by` char(50) NOT NULL,
  `modified_by` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id_company`, `id_sycCom`, `company_name`, `company_desc`, `company_address`, `company_maps`, `company_phone`, `company_phone2`, `company_fax`, `company_email`, `foto`, `foto_type`, `created`, `modified`, `created_by`, `modified_by`) VALUES
(1, NULL, 'FUTSAL DAFTARIN', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel nibh ac nisl porttitor tempus sit amet et diam. Etiam sed leo eu elit varius venenatis sed ac arcu. Praesent malesuada gravida diam et tincidunt. Mauris quis metus eget magna efficitur scelerisque. Sed mollis porttitor erat ullamcorper sodales. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse congue, dolor ultricies mollis molestie, libero diam auctor mauris, ultrices euismod leo justo vel enim. Etiam non rutrum arcu. Maecenas at dictum dui, sit amet gravida mauris. Vivamus sagittis neque in purus dapibus, ut pellentesque purus pulvinar. Nunc pretium porta ipsum, at iaculis felis elementum in. Duis cursus ex vitae nunc hendrerit blandit.\r\n\r\nMorbi vel est sed dui tristique elementum sed sed purus. Ut interdum nisi et felis vulputate, quis tempus diam blandit. Mauris tincidunt tellus faucibus, posuere turpis a, consectetur lacus. Nullam quis ipsum neque. Praesent sapien tellus, molestie et diam vel, cursus tristique neque. Nullam sit amet ornare odio. Ut vehicula risus id lacus blandit rutrum. Duis non molestie purus. Etiam turpis ligula, tincidunt sit amet dolor at, rutrum viverra orci. Etiam egestas urna id velit bibendum mollis.\r\n\r\nSed eu sem cursus, congue massa at, bibendum leo. Praesent cursus in nulla a egestas. Fusce aliquam leo eu enim feugiat ullamcorper. Nullam pulvinar dolor eu lacinia bibendum. Integer id ipsum cursus, luctus enim nec, fringilla dolor. Sed sit amet ipsum sit amet quam suscipit gravida vitae ut elit. Donec pellentesque non tortor vitae euismod. Praesent suscipit tempor ex ac viverra. Nunc ut sapien eu velit tempor hendrerit. Vestibulum posuere nisl massa, ornare commodo lorem sagittis ultrices. Sed eget rutrum neque, sed ullamcorper dui. Sed ultricies purus vitae lectus cursus, vestibulum faucibus quam posuere. Donec cursus vitae ipsum nec ullamcorper. Donec maximus orci finibus ante hendrerit, vitae maximus quam facilisis. Cras commodo fringilla porttitor.\r\n\r\nNam pharetra a tortor quis venenatis. Nunc lectus nibh, auctor id ante vel, interdum maximus felis. Cras libero est, mattis a sollicitudin sit amet, ultricies sed tellus. Ut augue lacus, luctus convallis enim quis, ultricies aliquet sem. Sed venenatis eros sit amet velit varius, ac rhoncus nibh sodales. Etiam sit amet efficitur est, vel pretium arcu. Morbi diam nulla, dictum quis ornare ultrices, pharetra quis mi. Nam sollicitudin pharetra congue. Praesent sed mauris at ante tincidunt blandit. Aliquam cursus ante efficitur, iaculis turpis eget, ornare quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla quis lobortis leo. Cras ut risus orci. Sed mattis purus ac libero suscipit, nec venenatis tortor semper. Aliquam sodales massa eget dignissim pharetra.\r\n\r\nNam sed enim vitae erat vulputate feugiat in tempus metus. In maximus erat risus. Donec et viverra nibh. Maecenas hendrerit, sapien id suscipit fermentum, tellus nisl sollicitudin erat, non laoreet dui ex sit amet odio. Nullam sit amet arcu sed felis tempor dapibus. Aliquam erat volutpat. Aenean malesuada a eros sed aliquet. Phasellus condimentum lobortis sapien, sit amet viverra sem iaculis venenatis. Morbi interdum nulla ut nulla fringilla commodo. In eu magna ornare libero pellentesque congue. Vestibulum ultrices congue feugiat.', 'Jl. Maju Mundur Kec. Camat Kel. Lurahan, Kab. Bupaten, Dunia Lain', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d16327777.649419477!2d108.84621849858628!3d-2.415291213289622!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2c4c07d7496404b7%3A0xe37b4de71badf485!2sIndonesia!5e0!3m2!1sen!2sid!4v1506312173230\" width=\"100%\" height=\"200\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '081241412', '0711412402', '12414', 'daftarin@gmail.com', 'futsal-daftarin20231213135542', '.png', '2017-11-09 06:45:34', NULL, 'amperakoding', 'superadmin');

-- --------------------------------------------------------

--
-- Table structure for table `diskon`
--

CREATE TABLE `diskon` (
  `id` int(11) NOT NULL,
  `id_sycDiskon` int(11) DEFAULT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `diskon`
--

INSERT INTO `diskon` (`id`, `id_sycDiskon`, `harga`) VALUES
(1, NULL, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id_event` int(11) NOT NULL,
  `id_sycEvent` int(11) DEFAULT NULL,
  `nama_event` varchar(100) NOT NULL,
  `slug_event` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `kategori` int(11) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `foto_type` char(10) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` char(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `modified_by` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id_event`, `id_sycEvent`, `nama_event`, `slug_event`, `deskripsi`, `kategori`, `foto`, `foto_type`, `created_at`, `created_by`, `modified_at`, `modified_by`) VALUES
(2, NULL, 'What is Lorem Ipsum?', 'what-is-lorem-ipsum', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img src=\"http://localhost/olshop2/assets/images/upload/Screenshot_from_2018-03-22_20-37-321.png\" width=\"500\" height=\"200\"></p>\r\n<p>Why do we use it?<br>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p>Why do we use it?<br>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 1, 'what-is-lorem-ipsum20180723083417', '.jpg', '2018-04-02 20:21:59', 'administrator', '2023-12-12 07:45:10', 'administrator'),
(3, NULL, 'Why do we use it?', 'why-do-we-use-it', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>', 2, 'why-do-we-use-it20180723083427', '.jpg', '2018-04-02 21:13:48', 'administrator', '2023-12-12 07:45:06', 'administrator'),
(4, NULL, 'Where does it come from?', 'where-does-it-come-from', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 1, 'where-does-it-come-from20180723083441', '.jpg', '2018-04-02 21:14:39', 'administrator', '2023-12-12 07:45:03', 'administrator'),
(5, NULL, 'Where does it come froms?', 'where-does-it-come-froms', '<p>What is Lorem Ipsum?<br>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p>Why do we use it?<br>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n<p>Where does it come from?<br>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 'where-does-it-come-froms20180723083339', '.jpg', '2018-04-03 10:03:54', 'administrator', '2023-12-12 07:45:00', 'administrator'),
(6, NULL, 'Aliquam ullamcorper', 'aliquam-ullamcorper', '<p>Aliquam ullamcorper magna consectetur augue laoreet luctus. Duis id nisi eleifend, vestibulum justo eget, scelerisque purus. Pellentesque non risus nec eros ultricies euismod. Donec ullamcorper auctor diam ut fermentum. Maecenas mollis neque magna. Pellentesque blandit arcu mi, vel consequat orci dapibus vel. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus rutrum, risus vitae venenatis efficitur, arcu metus blandit erat, quis pharetra neque leo non quam. Vestibulum imperdiet eleifend rhoncus. Nunc condimentum tellus vel ullamcorper iaculis. Vivamus vitae lorem sem.</p>\r\n<p>Donec lorem diam, rhoncus at tempus eget, dignissim quis nulla. Donec consequat malesuada lacinia. Mauris eget ipsum eget mauris tristique lobortis vel vel turpis. Pellentesque accumsan metus nisi, non molestie diam hendrerit eu. Sed eget lacinia elit. Nulla lobortis diam sed nunc malesuada cursus. Mauris ac maximus tellus.</p>', 2, 'aliquam-ullamcorper20180723083358', '.png', '2018-04-03 11:08:48', 'administrator', '2023-12-12 07:44:58', 'administrator'),
(7, NULL, 'In fermentum scelerisqu', 'in-fermentum-scelerisqu', '<p>In fermentum scelerisque neque. Integer fermentum semper lacinia. Donec porttitor accumsan sem, eget fringilla nisl blandit a. Nam pulvinar faucibus velit, eget vestibulum erat aliquet ac. Maecenas imperdiet felis vitae orci laoreet fermentum. Fusce dui neque, volutpat ac fermentum quis, maximus id diam. Nullam eros urna, tempus tempor vehicula sit amet, sollicitudin quis massa. Mauris metus ex, eleifend nec aliquam a, ullamcorper et leo. Sed convallis, est vitae tincidunt ultrices, orci diam hendrerit magna, ut molestie dui nisl non quam.</p>\r\n<p>Pellentesque in egestas tellus, eget cursus odio. Morbi mollis diam turpis, id luctus leo consequat eu. Integer felis neque, iaculis eget vulputate et, congue pharetra elit. Morbi lacinia lacus vel elit suscipit euismod. Ut tellus leo, sodales ac suscipit in, semper eget sem. Curabitur ultrices, sem id dapibus semper, lectus erat vehicula magna, eu accumsan tellus leo at orci. Fusce rutrum tincidunt tristique. Suspendisse ac cursus libero. Donec aliquet accumsan ex in dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed vel dignissim velit. Vestibulum mattis malesuada euismod. Praesent in vehicula dui, sit amet fringilla leo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec imperdiet hendrerit neque, at ultricies neque eleifend in.</p>\r\n<p>Sed rutrum egestas diam, vitae sodales odio vulputate id. Phasellus felis risus, varius eget dolor ac, fringilla dapibus risus. Pellentesque ante nulla, egestas ac fermentum suscipit, aliquam ac eros. Mauris elementum justo nec leo imperdiet hendrerit. Praesent ut augue sit amet massa sollicitudin maximus quis eget augue. Etiam malesuada dictum sem, ut ullamcorper diam mattis ut. Morbi non imperdiet ante, ac fermentum justo. Nulla congue magna vel lectus elementum laoreet. Suspendisse ante ipsum, eleifend vel condimentum eu, varius non dolor.</p>', 1, 'in-fermentum-scelerisqu20180413030957', '.jpeg', '2018-04-03 11:11:51', 'administrator', '2023-12-12 07:44:55', 'administrator');

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `id_foto` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `nama_foto` char(100) NOT NULL,
  `slug_foto` char(100) NOT NULL,
  `foto` text NOT NULL,
  `created_by` char(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(20) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`id_foto`, `album_id`, `nama_foto`, `slug_foto`, `foto`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 1, 'Testing Saja Cuis', 'testing-saja-cuis', 'testing-saja-cuis20180411025319.jpg', 'amperakoding', '2018-04-11 07:41:29', 'amperakoding', '2021-05-17 19:57:13'),
(2, 4, 'Foto Lagi Coba', 'foto-lagi-coba', 'foto-lagi-coba20180411024503.jpg', 'amperakoding', '2018-04-11 07:45:03', 'amperakoding', '2021-05-17 19:58:17'),
(3, 3, 'Foto Coba Lagi Saja', 'foto-coba-lagi-saja', 'foto-coba-lagi-saja20180411024712.jpg', 'amperakoding', '2018-04-11 07:47:12', 'amperakoding', '2021-05-17 19:58:17'),
(4, 1, 'Teasdasd', 'teasdasd', 'teasdasd20180414101405.png', 'amperakoding', '2018-04-14 15:13:17', 'amperakoding', '2021-05-17 19:57:13'),
(5, 3, 'Agains', 'agains', 'agains20180414101428.jpg', 'amperakoding', '2018-04-14 15:14:29', 'amperakoding', '2021-05-17 19:58:17'),
(6, 4, 'Waasd', 'waasd', 'waasd20180414101515.jpg', 'amperakoding', '2018-04-14 15:15:15', 'amperakoding', '2021-05-17 19:58:17'),
(7, 1, 'ASczxc', 'asczxc', 'asczxc20180414101545.jpg', 'amperakoding', '2018-04-14 15:15:45', 'amperakoding', '2021-05-17 19:58:17'),
(8, 1, 'ASXzc', 'asxzc', 'asxzc20180414101604.jpg', 'amperakoding', '2018-04-14 15:16:05', 'amperakoding', '2021-05-17 19:58:17'),
(9, 2, 'ASczxcacasc', 'asczxcacasc', 'asczxcacasc20180414101613.png', 'amperakoding', '2018-04-14 15:16:13', 'amperakoding', '2021-05-17 19:58:17');

-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

CREATE TABLE `jam` (
  `id` int(11) NOT NULL,
  `jam` varchar(50) NOT NULL,
  `is_available` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jam`
--

INSERT INTO `jam` (`id`, `jam`, `is_available`) VALUES
(1, '06:00:00', 1),
(2, '07:00:00', 1),
(3, '08:00:00', 1),
(4, '09:00:00', 1),
(5, '10:00:00', 1),
(6, '11:00:00', 1),
(7, '12:00:00', 1),
(8, '13:00:00', 1),
(9, '14:00:00', 1),
(10, '15:00:00', 1),
(11, '16:00:00', 1),
(12, '17:00:00', 1),
(13, '18:00:00', 1),
(14, '19:00:00', 1),
(15, '20:00:00', 1),
(16, '21:00:00', 1),
(17, '22:00:00', 1),
(18, '23:00:00', 1),
(19, '24:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(20) NOT NULL,
  `slug_kat` varchar(20) NOT NULL,
  `created_by` char(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `slug_kat`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 'Turnamen', 'turnamen', 'amperakoding', '2018-07-23 08:38:39', 'amperakoding', '2021-05-17 19:58:57'),
(2, 'Kerja Sama', 'kerja-sama', 'amperakoding', '2018-07-23 08:38:39', 'amperakoding', '2021-05-17 19:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `kontak`
--

CREATE TABLE `kontak` (
  `id_kontak` int(11) NOT NULL,
  `nama_kontak` char(50) NOT NULL,
  `nohp` char(50) NOT NULL,
  `created_by` char(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kontak`
--

INSERT INTO `kontak` (`id_kontak`, `nama_kontak`, `nohp`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 'Azmi', '6281228289766', 'amperakoding', '2018-07-23 11:16:57', 'superadmin', '2023-12-11 16:35:08'),
(2, 'Budi', '6282184082336', 'amperakoding', '2018-07-23 11:16:57', 'superadmin', '2023-12-11 16:35:03'),
(3, 'Joko', '62819481471', 'amperakoding', '2018-07-23 11:20:44', 'superadmin', '2023-12-11 16:34:58'),
(4, 'Sinta', '628785676755', 'superadmin', '2023-12-11 16:34:25', 'superadmin', '2023-12-11 16:34:35');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id_kota` int(11) NOT NULL,
  `provinsi_id` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `provinsi_id`, `nama_kota`) VALUES
(1, 21, 'Aceh Barat'),
(2, 21, 'Aceh Barat Daya'),
(3, 21, 'Aceh Besar'),
(4, 21, 'Aceh Jaya'),
(5, 21, 'Aceh Selatan'),
(6, 21, 'Aceh Singkil'),
(7, 21, 'Aceh Tamiang'),
(8, 21, 'Aceh Tengah'),
(9, 21, 'Aceh Tenggara'),
(10, 21, 'Aceh Timur'),
(11, 21, 'Aceh Utara'),
(12, 32, 'Agam'),
(13, 23, 'Alor'),
(14, 19, 'Ambon'),
(15, 34, 'Asahan'),
(16, 24, 'Asmat'),
(17, 1, 'Badung'),
(18, 13, 'Balangan'),
(19, 15, 'Balikpapan'),
(20, 21, 'Banda Aceh'),
(21, 18, 'Bandar Lampung'),
(22, 9, 'Bandung'),
(23, 9, 'Bandung'),
(24, 9, 'Bandung Barat'),
(25, 29, 'Banggai'),
(26, 29, 'Banggai Kepulauan'),
(27, 2, 'Bangka'),
(28, 2, 'Bangka Barat'),
(29, 2, 'Bangka Selatan'),
(30, 2, 'Bangka Tengah'),
(31, 11, 'Bangkalan'),
(32, 1, 'Bangli'),
(33, 13, 'Banjar'),
(34, 9, 'Banjar'),
(35, 13, 'Banjarbaru'),
(36, 13, 'Banjarmasin'),
(37, 10, 'Banjarnegara'),
(38, 28, 'Bantaeng'),
(39, 5, 'Bantul'),
(40, 33, 'Banyuasin'),
(41, 10, 'Banyumas'),
(42, 11, 'Banyuwangi'),
(43, 13, 'Barito Kuala'),
(44, 14, 'Barito Selatan'),
(45, 14, 'Barito Timur'),
(46, 14, 'Barito Utara'),
(47, 28, 'Barru'),
(48, 17, 'Batam'),
(49, 10, 'Batang'),
(50, 8, 'Batang Hari'),
(51, 11, 'Batu'),
(52, 34, 'Batu Bara'),
(53, 30, 'Bau-Bau'),
(54, 9, 'Bekasi'),
(55, 9, 'Bekasi'),
(56, 2, 'Belitung'),
(57, 2, 'Belitung Timur'),
(58, 23, 'Belu'),
(59, 21, 'Bener Meriah'),
(60, 26, 'Bengkalis'),
(61, 12, 'Bengkayang'),
(62, 4, 'Bengkulu'),
(63, 4, 'Bengkulu Selatan'),
(64, 4, 'Bengkulu Tengah'),
(65, 4, 'Bengkulu Utara'),
(66, 15, 'Berau'),
(67, 24, 'Biak Numfor'),
(68, 22, 'Bima'),
(69, 22, 'Bima'),
(70, 34, 'Binjai'),
(71, 17, 'Bintan'),
(72, 21, 'Bireuen'),
(73, 31, 'Bitung'),
(74, 11, 'Blitar'),
(75, 11, 'Blitar'),
(76, 10, 'Blora'),
(77, 7, 'Boalemo'),
(78, 9, 'Bogor'),
(79, 9, 'Bogor'),
(80, 11, 'Bojonegoro'),
(81, 31, 'Bolaang Mongondow (Bolmong)'),
(82, 31, 'Bolaang Mongondow Selatan'),
(83, 31, 'Bolaang Mongondow Timur'),
(84, 31, 'Bolaang Mongondow Utara'),
(85, 30, 'Bombana'),
(86, 11, 'Bondowoso'),
(87, 28, 'Bone'),
(88, 7, 'Bone Bolango'),
(89, 15, 'Bontang'),
(90, 24, 'Boven Digoel'),
(91, 10, 'Boyolali'),
(92, 10, 'Brebes'),
(93, 32, 'Bukittinggi'),
(94, 1, 'Buleleng'),
(95, 28, 'Bulukumba'),
(96, 16, 'Bulungan (Bulongan)'),
(97, 8, 'Bungo'),
(98, 29, 'Buol'),
(99, 19, 'Buru'),
(100, 19, 'Buru Selatan'),
(101, 30, 'Buton'),
(102, 30, 'Buton Utara'),
(103, 9, 'Ciamis'),
(104, 9, 'Cianjur'),
(105, 10, 'Cilacap'),
(106, 3, 'Cilegon'),
(107, 9, 'Cimahi'),
(108, 9, 'Cirebon'),
(109, 9, 'Cirebon'),
(110, 34, 'Dairi'),
(111, 24, 'Deiyai (Deliyai)'),
(112, 34, 'Deli Serdang'),
(113, 10, 'Demak'),
(114, 1, 'Denpasar'),
(115, 9, 'Depok'),
(116, 32, 'Dharmasraya'),
(117, 24, 'Dogiyai'),
(118, 22, 'Dompu'),
(119, 29, 'Donggala'),
(120, 26, 'Dumai'),
(121, 33, 'Empat Lawang'),
(122, 23, 'Ende'),
(123, 28, 'Enrekang'),
(124, 25, 'Fakfak'),
(125, 23, 'Flores Timur'),
(126, 9, 'Garut'),
(127, 21, 'Gayo Lues'),
(128, 1, 'Gianyar'),
(129, 7, 'Gorontalo'),
(130, 7, 'Gorontalo'),
(131, 7, 'Gorontalo Utara'),
(132, 28, 'Gowa'),
(133, 11, 'Gresik'),
(134, 10, 'Grobogan'),
(135, 5, 'Gunung Kidul'),
(136, 14, 'Gunung Mas'),
(137, 34, 'Gunungsitoli'),
(138, 20, 'Halmahera Barat'),
(139, 20, 'Halmahera Selatan'),
(140, 20, 'Halmahera Tengah'),
(141, 20, 'Halmahera Timur'),
(142, 20, 'Halmahera Utara'),
(143, 13, 'Hulu Sungai Selatan'),
(144, 13, 'Hulu Sungai Tengah'),
(145, 13, 'Hulu Sungai Utara'),
(146, 34, 'Humbang Hasundutan'),
(147, 26, 'Indragiri Hilir'),
(148, 26, 'Indragiri Hulu'),
(149, 9, 'Indramayu'),
(150, 24, 'Intan Jaya'),
(151, 6, 'Jakarta Barat'),
(152, 6, 'Jakarta Pusat'),
(153, 6, 'Jakarta Selatan'),
(154, 6, 'Jakarta Timur'),
(155, 6, 'Jakarta Utara'),
(156, 8, 'Jambi'),
(157, 24, 'Jayapura'),
(158, 24, 'Jayapura'),
(159, 24, 'Jayawijaya'),
(160, 11, 'Jember'),
(161, 1, 'Jembrana'),
(162, 28, 'Jeneponto'),
(163, 10, 'Jepara'),
(164, 11, 'Jombang'),
(165, 25, 'Kaimana'),
(166, 26, 'Kampar'),
(167, 14, 'Kapuas'),
(168, 12, 'Kapuas Hulu'),
(169, 10, 'Karanganyar'),
(170, 1, 'Karangasem'),
(171, 9, 'Karawang'),
(172, 17, 'Karimun'),
(173, 34, 'Karo'),
(174, 14, 'Katingan'),
(175, 4, 'Kaur'),
(176, 12, 'Kayong Utara'),
(177, 10, 'Kebumen'),
(178, 11, 'Kediri'),
(179, 11, 'Kediri'),
(180, 24, 'Keerom'),
(181, 10, 'Kendal'),
(182, 30, 'Kendari'),
(183, 4, 'Kepahiang'),
(184, 17, 'Kepulauan Anambas'),
(185, 19, 'Kepulauan Aru'),
(186, 32, 'Kepulauan Mentawai'),
(187, 26, 'Kepulauan Meranti'),
(188, 31, 'Kepulauan Sangihe'),
(189, 6, 'Kepulauan Seribu'),
(190, 31, 'Kepulauan Siau Tagulandang Biaro (Sitaro)'),
(191, 20, 'Kepulauan Sula'),
(192, 31, 'Kepulauan Talaud'),
(193, 24, 'Kepulauan Yapen (Yapen Waropen)'),
(194, 8, 'Kerinci'),
(195, 12, 'Ketapang'),
(196, 10, 'Klaten'),
(197, 1, 'Klungkung'),
(198, 30, 'Kolaka'),
(199, 30, 'Kolaka Utara'),
(200, 30, 'Konawe'),
(201, 30, 'Konawe Selatan'),
(202, 30, 'Konawe Utara'),
(203, 13, 'Kotabaru'),
(204, 31, 'Kotamobagu'),
(205, 14, 'Kotawaringin Barat'),
(206, 14, 'Kotawaringin Timur'),
(207, 26, 'Kuantan Singingi'),
(208, 12, 'Kubu Raya'),
(209, 10, 'Kudus'),
(210, 5, 'Kulon Progo'),
(211, 9, 'Kuningan'),
(212, 23, 'Kupang'),
(213, 23, 'Kupang'),
(214, 15, 'Kutai Barat'),
(215, 15, 'Kutai Kartanegara'),
(216, 15, 'Kutai Timur'),
(217, 34, 'Labuhan Batu'),
(218, 34, 'Labuhan Batu Selatan'),
(219, 34, 'Labuhan Batu Utara'),
(220, 33, 'Lahat'),
(221, 14, 'Lamandau'),
(222, 11, 'Lamongan'),
(223, 18, 'Lampung Barat'),
(224, 18, 'Lampung Selatan'),
(225, 18, 'Lampung Tengah'),
(226, 18, 'Lampung Timur'),
(227, 18, 'Lampung Utara'),
(228, 12, 'Landak'),
(229, 34, 'Langkat'),
(230, 21, 'Langsa'),
(231, 24, 'Lanny Jaya'),
(232, 3, 'Lebak'),
(233, 4, 'Lebong'),
(234, 23, 'Lembata'),
(235, 21, 'Lhokseumawe'),
(236, 32, 'Lima Puluh Koto/Kota'),
(237, 17, 'Lingga'),
(238, 22, 'Lombok Barat'),
(239, 22, 'Lombok Tengah'),
(240, 22, 'Lombok Timur'),
(241, 22, 'Lombok Utara'),
(242, 33, 'Lubuk Linggau'),
(243, 11, 'Lumajang'),
(244, 28, 'Luwu'),
(245, 28, 'Luwu Timur'),
(246, 28, 'Luwu Utara'),
(247, 11, 'Madiun'),
(248, 11, 'Madiun'),
(249, 10, 'Magelang'),
(250, 10, 'Magelang'),
(251, 11, 'Magetan'),
(252, 9, 'Majalengka'),
(253, 27, 'Majene'),
(254, 28, 'Makassar'),
(255, 11, 'Malang'),
(256, 11, 'Malang'),
(257, 16, 'Malinau'),
(258, 19, 'Maluku Barat Daya'),
(259, 19, 'Maluku Tengah'),
(260, 19, 'Maluku Tenggara'),
(261, 19, 'Maluku Tenggara Barat'),
(262, 27, 'Mamasa'),
(263, 24, 'Mamberamo Raya'),
(264, 24, 'Mamberamo Tengah'),
(265, 27, 'Mamuju'),
(266, 27, 'Mamuju Utara'),
(267, 31, 'Manado'),
(268, 34, 'Mandailing Natal'),
(269, 23, 'Manggarai'),
(270, 23, 'Manggarai Barat'),
(271, 23, 'Manggarai Timur'),
(272, 25, 'Manokwari'),
(273, 25, 'Manokwari Selatan'),
(274, 24, 'Mappi'),
(275, 28, 'Maros'),
(276, 22, 'Mataram'),
(277, 25, 'Maybrat'),
(278, 34, 'Medan'),
(279, 12, 'Melawi'),
(280, 8, 'Merangin'),
(281, 24, 'Merauke'),
(282, 18, 'Mesuji'),
(283, 18, 'Metro'),
(284, 24, 'Mimika'),
(285, 31, 'Minahasa'),
(286, 31, 'Minahasa Selatan'),
(287, 31, 'Minahasa Tenggara'),
(288, 31, 'Minahasa Utara'),
(289, 11, 'Mojokerto'),
(290, 11, 'Mojokerto'),
(291, 29, 'Morowali'),
(292, 33, 'Muara Enim'),
(293, 8, 'Muaro Jambi'),
(294, 4, 'Muko Muko'),
(295, 30, 'Muna'),
(296, 14, 'Murung Raya'),
(297, 33, 'Musi Banyuasin'),
(298, 33, 'Musi Rawas'),
(299, 24, 'Nabire'),
(300, 21, 'Nagan Raya'),
(301, 23, 'Nagekeo'),
(302, 17, 'Natuna'),
(303, 24, 'Nduga'),
(304, 23, 'Ngada'),
(305, 11, 'Nganjuk'),
(306, 11, 'Ngawi'),
(307, 34, 'Nias'),
(308, 34, 'Nias Barat'),
(309, 34, 'Nias Selatan'),
(310, 34, 'Nias Utara'),
(311, 16, 'Nunukan'),
(312, 33, 'Ogan Ilir'),
(313, 33, 'Ogan Komering Ilir'),
(314, 33, 'Ogan Komering Ulu'),
(315, 33, 'Ogan Komering Ulu Selatan'),
(316, 33, 'Ogan Komering Ulu Timur'),
(317, 11, 'Pacitan'),
(318, 32, 'Padang'),
(319, 34, 'Padang Lawas'),
(320, 34, 'Padang Lawas Utara'),
(321, 32, 'Padang Panjang'),
(322, 32, 'Padang Pariaman'),
(323, 34, 'Padang Sidempuan'),
(324, 33, 'Pagar Alam'),
(325, 34, 'Pakpak Bharat'),
(326, 14, 'Palangka Raya'),
(327, 33, 'Palembang'),
(328, 28, 'Palopo'),
(329, 29, 'Palu'),
(330, 11, 'Pamekasan'),
(331, 3, 'Pandeglang'),
(332, 9, 'Pangandaran'),
(333, 28, 'Pangkajene Kepulauan'),
(334, 2, 'Pangkal Pinang'),
(335, 24, 'Paniai'),
(336, 28, 'Parepare'),
(337, 32, 'Pariaman'),
(338, 29, 'Parigi Moutong'),
(339, 32, 'Pasaman'),
(340, 32, 'Pasaman Barat'),
(341, 15, 'Paser'),
(342, 11, 'Pasuruan'),
(343, 11, 'Pasuruan'),
(344, 10, 'Pati'),
(345, 32, 'Payakumbuh'),
(346, 25, 'Pegunungan Arfak'),
(347, 24, 'Pegunungan Bintang'),
(348, 10, 'Pekalongan'),
(349, 10, 'Pekalongan'),
(350, 26, 'Pekanbaru'),
(351, 26, 'Pelalawan'),
(352, 10, 'Pemalang'),
(353, 34, 'Pematang Siantar'),
(354, 15, 'Penajam Paser Utara'),
(355, 18, 'Pesawaran'),
(356, 18, 'Pesisir Barat'),
(357, 32, 'Pesisir Selatan'),
(358, 21, 'Pidie'),
(359, 21, 'Pidie Jaya'),
(360, 28, 'Pinrang'),
(361, 7, 'Pohuwato'),
(362, 27, 'Polewali Mandar'),
(363, 11, 'Ponorogo'),
(364, 12, 'Pontianak'),
(365, 12, 'Pontianak'),
(366, 29, 'Poso'),
(367, 33, 'Prabumulih'),
(368, 18, 'Pringsewu'),
(369, 11, 'Probolinggo'),
(370, 11, 'Probolinggo'),
(371, 14, 'Pulang Pisau'),
(372, 20, 'Pulau Morotai'),
(373, 24, 'Puncak'),
(374, 24, 'Puncak Jaya'),
(375, 10, 'Purbalingga'),
(376, 9, 'Purwakarta'),
(377, 10, 'Purworejo'),
(378, 25, 'Raja Ampat'),
(379, 4, 'Rejang Lebong'),
(380, 10, 'Rembang'),
(381, 26, 'Rokan Hilir'),
(382, 26, 'Rokan Hulu'),
(383, 23, 'Rote Ndao'),
(384, 21, 'Sabang'),
(385, 23, 'Sabu Raijua'),
(386, 10, 'Salatiga'),
(387, 15, 'Samarinda'),
(388, 12, 'Sambas'),
(389, 34, 'Samosir'),
(390, 11, 'Sampang'),
(391, 12, 'Sanggau'),
(392, 24, 'Sarmi'),
(393, 8, 'Sarolangun'),
(394, 32, 'Sawah Lunto'),
(395, 12, 'Sekadau'),
(396, 28, 'Selayar (Kepulauan Selayar)'),
(397, 4, 'Seluma'),
(398, 10, 'Semarang'),
(399, 10, 'Semarang'),
(400, 19, 'Seram Bagian Barat'),
(401, 19, 'Seram Bagian Timur'),
(402, 3, 'Serang'),
(403, 3, 'Serang'),
(404, 34, 'Serdang Bedagai'),
(405, 14, 'Seruyan'),
(406, 26, 'Siak'),
(407, 34, 'Sibolga'),
(408, 28, 'Sidenreng Rappang/Rapang'),
(409, 11, 'Sidoarjo'),
(410, 29, 'Sigi'),
(411, 32, 'Sijunjung (Sawah Lunto Sijunjung)'),
(412, 23, 'Sikka'),
(413, 34, 'Simalungun'),
(414, 21, 'Simeulue'),
(415, 12, 'Singkawang'),
(416, 28, 'Sinjai'),
(417, 12, 'Sintang'),
(418, 11, 'Situbondo'),
(419, 5, 'Sleman'),
(420, 32, 'Solok'),
(421, 32, 'Solok'),
(422, 32, 'Solok Selatan'),
(423, 28, 'Soppeng'),
(424, 25, 'Sorong'),
(425, 25, 'Sorong'),
(426, 25, 'Sorong Selatan'),
(427, 10, 'Sragen'),
(428, 9, 'Subang'),
(429, 21, 'Subulussalam'),
(430, 9, 'Sukabumi'),
(431, 9, 'Sukabumi'),
(432, 14, 'Sukamara'),
(433, 10, 'Sukoharjo'),
(434, 23, 'Sumba Barat'),
(435, 23, 'Sumba Barat Daya'),
(436, 23, 'Sumba Tengah'),
(437, 23, 'Sumba Timur'),
(438, 22, 'Sumbawa'),
(439, 22, 'Sumbawa Barat'),
(440, 9, 'Sumedang'),
(441, 11, 'Sumenep'),
(442, 8, 'Sungaipenuh'),
(443, 24, 'Supiori'),
(444, 11, 'Surabaya'),
(445, 10, 'Surakarta (Solo)'),
(446, 13, 'Tabalong'),
(447, 1, 'Tabanan'),
(448, 28, 'Takalar'),
(449, 25, 'Tambrauw'),
(450, 16, 'Tana Tidung'),
(451, 28, 'Tana Toraja'),
(452, 13, 'Tanah Bumbu'),
(453, 32, 'Tanah Datar'),
(454, 13, 'Tanah Laut'),
(455, 3, 'Tangerang'),
(456, 3, 'Tangerang'),
(457, 3, 'Tangerang Selatan'),
(458, 18, 'Tanggamus'),
(459, 34, 'Tanjung Balai'),
(460, 8, 'Tanjung Jabung Barat'),
(461, 8, 'Tanjung Jabung Timur'),
(462, 17, 'Tanjung Pinang'),
(463, 34, 'Tapanuli Selatan'),
(464, 34, 'Tapanuli Tengah'),
(465, 34, 'Tapanuli Utara'),
(466, 13, 'Tapin'),
(467, 16, 'Tarakan'),
(468, 9, 'Tasikmalaya'),
(469, 9, 'Tasikmalaya'),
(470, 34, 'Tebing Tinggi'),
(471, 8, 'Tebo'),
(472, 10, 'Tegal'),
(473, 10, 'Tegal'),
(474, 25, 'Teluk Bintuni'),
(475, 25, 'Teluk Wondama'),
(476, 10, 'Temanggung'),
(477, 20, 'Ternate'),
(478, 20, 'Tidore Kepulauan'),
(479, 23, 'Timor Tengah Selatan'),
(480, 23, 'Timor Tengah Utara'),
(481, 34, 'Toba Samosir'),
(482, 29, 'Tojo Una-Una'),
(483, 29, 'Toli-Toli'),
(484, 24, 'Tolikara'),
(485, 31, 'Tomohon'),
(486, 28, 'Toraja Utara'),
(487, 11, 'Trenggalek'),
(488, 19, 'Tual'),
(489, 11, 'Tuban'),
(490, 18, 'Tulang Bawang'),
(491, 18, 'Tulang Bawang Barat'),
(492, 11, 'Tulungagung'),
(493, 28, 'Wajo'),
(494, 30, 'Wakatobi'),
(495, 24, 'Waropen'),
(496, 18, 'Way Kanan'),
(497, 10, 'Wonogiri'),
(498, 10, 'Wonosobo'),
(499, 24, 'Yahukimo'),
(500, 24, 'Yalimo'),
(501, 5, 'Yogyakarta');

-- --------------------------------------------------------

--
-- Table structure for table `lapangan`
--

CREATE TABLE `lapangan` (
  `id_lapangan` int(11) NOT NULL,
  `id_sycPlat` int(11) DEFAULT NULL,
  `nama_lapangan` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `foto` text NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lapangan`
--

INSERT INTO `lapangan` (`id_lapangan`, `id_sycPlat`, `nama_lapangan`, `harga`, `foto`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 1, 'Lapangan A1', 100, 'lapangan-a20180610164236.jpg', 'amperakoding', '2018-06-10 15:37:43', 'superadmin', '2024-01-10 12:33:27'),
(7, NULL, 'Lapangan B', 10000, 'lapangan-b20240110151612.jpg', 'superadmin', '2024-01-10 08:16:12', '', NULL),
(8, NULL, 'Lapangan C', 150000, 'lapangan-c20240110151635.jpg', 'superadmin', '2024-01-10 08:16:35', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `login` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `time` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id_page` int(11) NOT NULL,
  `judul_page` varchar(50) NOT NULL,
  `judul_seo` varchar(50) NOT NULL,
  `isi_page` text NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id_page`, `judul_page`, `judul_seo`, `isi_page`, `gambar`) VALUES
(1, 'Home', 'home', '', ''),
(2, 'Download', 'download', 'download', ''),
(3, 'Kontak', 'kontak', '<p style=\"text-align: center;\">&nbsp;<img src=\"http://localhost/tol/assets/images/upload/whatsapp.png\" /><br /><strong>SMS/ Call/ Whatsapp</strong></p>\r\n<p style=\"text-align: center;\">0853-6873-3631</p>\r\n<p style=\"text-align: center;\">0822-8155-1666</p>', ''),
(4, 'Profil', 'profil', '<p style=\"text-align: justify;\">Kami merupakan toko yang menyediakan berbagai macam parfum, obat-obatan herbal, baju koko, dan aksesoris muslim lainnya. Toko kami beralamat di Jl. Dr. M. Isa No.1109, Kuto Batu, Ilir Tim. II, Kota Palembang, Sumatera Selatan 30114.</p>\r\n<p style=\"text-align: justify;\">Berikut adalah foto toko kami:</p>', ''),
(5, 'Order', 'order', '<p>Anda dapat menghubungi&nbsp;kami melalui tombol order via whatsapp di masing-masing produk atau melalui customer service/ kontak yang telah disediakan di sisi kanan website ini</p>', '');

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id_provinsi` int(11) NOT NULL,
  `nama_provinsi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id_provinsi`, `nama_provinsi`) VALUES
(1, 'Bali'),
(2, 'Bangka Belitung'),
(3, 'Banten'),
(4, 'Bengkulu'),
(5, 'DI Yogyakarta'),
(6, 'DKI Jakarta'),
(7, 'Gorontalo'),
(8, 'Jambi'),
(9, 'Jawa Barat'),
(10, 'Jawa Tengah'),
(11, 'Jawa Timur'),
(12, 'Kalimantan Barat'),
(13, 'Kalimantan Selatan'),
(14, 'Kalimantan Tengah'),
(15, 'Kalimantan Timur'),
(16, 'Kalimantan Utara'),
(17, 'Kepulauan Riau'),
(18, 'Lampung'),
(19, 'Maluku'),
(20, 'Maluku Utara'),
(21, 'Nanggroe Aceh Darussalam (NAD)'),
(22, 'Nusa Tenggara Barat (NTB)'),
(23, 'Nusa Tenggara Timur (NTT)'),
(24, 'Papua'),
(25, 'Papua Barat'),
(26, 'Riau'),
(27, 'Sulawesi Barat'),
(28, 'Sulawesi Selatan'),
(29, 'Sulawesi Tengah'),
(30, 'Sulawesi Tenggara'),
(31, 'Sulawesi Utara'),
(32, 'Sumatera Barat'),
(33, 'Sumatera Selatan'),
(34, 'Sumatera Utara');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id_slider` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `nama_slider` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `foto` text NOT NULL,
  `foto_type` char(10) NOT NULL,
  `foto_size` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` char(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `modified_by` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id_slider`, `no_urut`, `nama_slider`, `link`, `foto`, `foto_type`, `foto_size`, `created_at`, `created_by`, `modified_at`, `modified_by`) VALUES
(2, 2, 'Slider 2', '#', '220231213155102', '.png', 833, '2017-11-25 08:05:03', 'amperakoding', '2023-12-13 08:51:02', 'superadmin'),
(4, 2, 'dfs', '#', '220231213155959', '.jpg', 0, '2023-12-13 08:59:04', '', '2023-12-13 08:59:59', 'superadmin'),
(5, 3, '', '', '320231213160015', '.png', 0, '2023-12-13 08:59:37', '', '2023-12-13 09:00:15', 'superadmin');

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

CREATE TABLE `subscriber` (
  `id_subscriber` int(11) NOT NULL,
  `email` char(20) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `synchronization_plat`
--

CREATE TABLE `synchronization_plat` (
  `id_syc` int(11) NOT NULL,
  `id_merchat_upos` int(11) DEFAULT NULL,
  `id_organize_daftarin` int(11) DEFAULT NULL,
  `apiKeyMasterWeb` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `synchronization_plat`
--

INSERT INTO `synchronization_plat` (`id_syc`, `id_merchat_upos`, `id_organize_daftarin`, `apiKeyMasterWeb`) VALUES
(1, 1, 1, 'fdsfsdf34343'),
(2, 3, 2, 'fdr433434');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_trans` int(11) NOT NULL,
  `id_sycPlat` int(11) DEFAULT NULL,
  `tipe_trx` int(11) NOT NULL DEFAULT 1,
  `id_invoice` char(15) NOT NULL,
  `ip_addres` char(225) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `deadline` datetime NOT NULL,
  `catatan` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `created_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_trans`, `id_sycPlat`, `tipe_trx`, `id_invoice`, `ip_addres`, `user_id`, `subtotal`, `diskon`, `grand_total`, `deadline`, `catatan`, `status`, `created_date`, `created_time`) VALUES
(1, 1, 1, 'J-210517-0001', NULL, 3, 100000, 0, 100000, '2021-05-17 21:03:57', '', 2, '2021-05-17', '08:03:19'),
(2, 1, 1, 'J-210517-0002', NULL, 4, 260000, 50000, 210000, '2021-05-17 21:10:50', 'takada', 2, '2021-05-17', '08:09:54'),
(3, 1, 1, 'J-210516-0003', NULL, 3, 300000, 0, 300000, '2021-05-16 21:20:17', '', 2, '2021-05-16', '08:20:09'),
(4, 1, 1, 'J-210408-0001', NULL, 3, 330000, 0, 330000, '2021-04-08 21:21:53', '', 2, '2021-04-08', '08:21:35'),
(5, 1, 1, 'J-210408-0002', NULL, 3, 150000, 0, 150000, '2021-04-08 21:22:35', '', 2, '2021-04-08', '08:22:29'),
(6, 1, 1, 'J-210408-0003', NULL, 3, 300000, 0, 300000, '2021-04-08 21:23:15', '', 2, '2021-04-08', '08:23:09'),
(7, 1, 1, 'J-210410-0004', NULL, 3, 300000, 0, 300000, '2021-04-10 21:24:07', '', 2, '2021-04-10', '08:23:52'),
(8, 1, 1, 'J-210517-0003', NULL, 3, 150000, 0, 150000, '2021-05-17 21:23:05', '', 1, '2021-05-17', '08:23:01'),
(9, 1, 1, 'J-231211-0001', NULL, 3, 300000, 0, 300000, '2023-12-11 12:00:22', '', 2, '2023-12-11', '10:59:09'),
(10, 1, 1, 'J-231211-0002', NULL, 3, 100000, 0, 100000, '2023-12-11 12:04:51', '', 1, '2023-12-11', '11:03:29'),
(11, 1, 1, 'J-231211-0003', NULL, 3, 200000, 0, 200000, '2023-12-11 12:17:09', '', 2, '2023-12-11', '11:16:04'),
(12, 1, 1, 'J-231211-0004', NULL, 3, 100000, 0, 100000, '2023-12-11 15:07:00', '', 1, '2023-12-11', '11:18:54'),
(13, 1, 1, 'J-231211-0005', NULL, 3, 100000, 0, 100000, '2023-12-11 15:51:14', '', 1, '2023-12-11', '02:51:03'),
(14, 1, 1, 'J-231211-0006', NULL, 3, 300000, 0, 300000, '2023-12-11 16:07:36', 'adadsas', 1, '2023-12-11', '03:07:22'),
(15, 1, 1, 'J-231211-0007', NULL, 3, 80000, 0, 80000, '2023-12-11 16:19:58', '', 3, '2023-12-11', '03:19:46'),
(16, 1, 1, 'J-231211-0008', NULL, 3, 400000, 0, 400000, '2023-12-11 16:54:48', '', 1, '2023-12-11', '03:54:26'),
(17, 1, 1, 'J-231211-0009', NULL, 3, 500000, 0, 500000, '2023-12-11 17:11:49', '', 1, '2023-12-11', '04:03:06'),
(18, 1, 1, 'J-231211-0010', NULL, 5, 300000, 0, 300000, '2023-12-11 18:45:38', '', 1, '2023-12-11', '04:15:47'),
(23, 1, 1, 'J-231212-0012', NULL, 5, 200000, 0, 200000, '2023-12-12 10:20:58', '', 1, '2023-12-12', '07:56:13'),
(27, 1, 1, 'J-231212-0013', '::1', 10, 200000, 0, 200000, '2023-12-12 13:28:35', '', 1, '2023-12-12', '11:25:43'),
(28, 1, 1, 'J-231212-0014', '36.74.44.52', 5, 300, 0, 300, '2023-12-12 15:04:06', '', 2, '2023-12-12', '02:03:45'),
(29, 1, 1, 'J-231212-0015', '140.213.18.122', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-12', '02:20:02'),
(30, 1, 1, 'J-231212-0016', '2001:448a:3070:29e3:4dce:8b80:1bbc:29d8', 11, 150, 0, 150, '2023-12-12 15:29:08', '', 2, '2023-12-12', '02:20:31'),
(31, 1, 1, 'J-231212-0017', '2001:448a:3070:29e3:4dce:8b80:1bbc:29d8', 11, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-12', '02:31:33'),
(32, 1, 1, 'J-231212-0018', '2001:448a:3070:29e3:4dce:8b80:1bbc:29d8', 5, 300, 0, 300, '2023-12-12 15:58:12', '', 3, '2023-12-12', '02:57:45'),
(33, 1, 1, 'J-231212-0019', '36.74.44.52', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-12', '02:59:49'),
(34, 1, 1, 'J-231212-0020', '2001:448a:3070:29e3:4dce:8b80:1bbc:29d8', 12, 300, 0, 300, '2023-12-12 19:57:07', '', 2, '2023-12-12', '03:20:44'),
(35, 1, 1, 'J-231212-0021', '36.74.44.52', 5, 300, 0, 300, '2023-12-12 16:42:13', '', 2, '2023-12-12', '03:41:34'),
(36, 1, 1, 'J-231212-0022', '2001:448a:3070:29e3:4dce:8b80:1bbc:29d8', 5, 0, 0, 0, '0000-00-00 00:00:00', '', 3, '2023-12-12', '03:44:03'),
(37, 1, 1, 'J-231212-0023', '202.80.213.210', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-12', '05:26:56'),
(38, 1, 1, 'J-231212-0024', '140.213.104.42', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-12', '05:28:03'),
(39, 1, 1, 'J-231212-0025', '125.163.79.43', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-12', '05:37:07'),
(40, 1, 1, 'J-231212-0026', '2001:448a:3070:29e3:4dce:8b80:1bbc:29d8', 12, 500300, 0, 500300, '2023-12-12 20:05:47', '', 3, '2023-12-12', '07:00:34'),
(41, 1, 1, 'J-231213-0027', '154.28.229.157', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-13', '01:28:09'),
(42, 1, 1, 'J-231213-0028', '114.5.219.4', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-13', '08:08:05'),
(43, 1, 1, 'J-231213-0029', '2001:448a:3065:2cd7:d545:f681:6a32:5b28', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-13', '09:40:40'),
(44, 1, 1, 'J-231213-0030', '112.215.235.3', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-13', '02:06:13'),
(45, 1, 1, 'J-231213-0031', '140.213.11.194', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-13', '02:24:58'),
(46, 1, 1, 'J-231213-0032', '118.99.73.130', 14, 200000, 0, 200000, '2023-12-13 17:19:46', '', 2, '2023-12-13', '04:15:40'),
(47, 1, 1, 'J-231213-0033', '118.99.73.130', 14, 300, 0, 300, '2023-12-13 17:20:45', '', 2, '2023-12-13', '04:20:33'),
(48, 1, 1, 'J-231213-0034', '118.99.73.130', 14, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-13', '04:21:36'),
(49, 1, 1, 'J-231213-0035', '2404:c0:5c60::3cca:4fc3', 8, 300, 0, 300, '2023-12-13 18:30:20', '', 2, '2023-12-13', '05:29:54'),
(50, 1, 1, 'J-231213-0036', '2404:c0:5c60::3cca:4fc3', 12, 300, 0, 300, '2023-12-13 18:47:09', '', 1, '2023-12-13', '05:46:28'),
(51, 1, 1, 'J-231213-0037', '2404:c0:5c60::3cca:4fc3', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-13', '05:48:02'),
(52, 2, 1, 'J-240104-0001', '::1', 15, 100000, 0, 100000, '2024-01-04 19:10:21', '', 1, '2024-01-04', '02:05:40'),
(53, 1, 1, 'J-240105-0002', '::1', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2024-01-05', '04:10:57'),
(54, NULL, 1, 'J-240110-0003', '36.72.197.153', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2024-01-10', '10:19:23'),
(55, NULL, 1, 'J-240110-0004', '2001:448a:302e:167f:9c0e:8598:b590:6a44', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2024-01-10', '10:22:12'),
(56, 1, 2, 'J-240110-0005', '36.74.44.46', 1, 100, 0, 100, '2024-01-13 10:17:08', '', 2, '2024-01-10', '07:10:24'),
(57, NULL, 1, 'J-240110-0006', '36.74.44.46', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2024-01-10', '07:11:20'),
(58, 1, 1, 'J-240110-0007', '36.74.44.46', 5, 100, 0, 100, '2024-01-10 20:34:20', '', 2, '2024-01-10', '07:32:10'),
(59, 1, 1, 'J-240112-0008', '36.74.44.245', 5, 100, 0, 100, '2024-01-12 11:08:29', '', 2, '2024-01-12', '10:08:06'),
(60, NULL, 1, 'J-240112-0009', '36.74.44.245', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2024-01-12', '01:11:21'),
(61, 1, 1, 'J-240112-0010', '36.74.44.245', 5, 100, 0, 100, '2024-01-12 14:12:11', '', 2, '2024-01-12', '01:11:56'),
(62, NULL, 1, 'J-240112-0011', '114.5.16.137', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2024-01-12', '01:20:14'),
(63, 1, 1, 'J-240112-0012', '36.74.44.245', 5, 100, 0, 100, '2024-01-12 15:13:16', '', 2, '2024-01-12', '02:13:02'),
(64, NULL, 1, 'J-240113-0013', '23.95.251.158', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2024-01-13', '08:04:00'),
(65, 1, 2, 'J-240113-0014', '2001:448a:3070:16b3:cd59:54b2:3f9e:467e', 1, 100, 0, 100, '2024-01-13 10:22:04', '', 3, '2024-01-13', '09:21:56'),
(66, 1, 2, 'J-240113-0015', '2001:448a:3070:16b3:cd59:54b2:3f9e:467e', 1, 100, 0, 100, '2024-01-13 10:22:36', '', 2, '2024-01-13', '09:22:25'),
(67, 1, 1, 'J-240113-0016', '2001:448a:3070:16b3:cd59:54b2:3f9e:467e', 5, 100, 0, 100, '2024-01-13 10:24:40', 'terimkasih', 2, '2024-01-13', '09:24:15'),
(68, 1, 2, 'J-240113-0017', '36.74.44.245', 5, 100, 0, 100, '2024-01-13 14:18:39', '', 2, '2024-01-13', '01:18:22'),
(69, 1, 2, 'J-240113-0018', '36.74.44.245', 8, 100, 0, 100, '2024-01-13 14:19:10', '', 2, '2024-01-13', '01:19:04'),
(70, 1, 1, 'J-240113-0019', '2001:448a:3070:16b3:cd59:54b2:3f9e:467e', 5, 100, 0, 100, '2024-01-13 14:21:39', '', 2, '2024-01-13', '01:21:27'),
(71, 1, 1, 'J-240113-0020', '36.74.44.245', 5, 100, 0, 100, '2024-01-14 13:40:57', '', 1, '2024-01-13', '12:40:57'),
(72, 1, 2, 'J-240113-0021', '36.74.44.245', 10, 100, 0, 100, '2024-01-13 14:25:11', '', 2, '2024-01-13', '01:25:06'),
(73, NULL, 1, 'J-240114-0022', '140.213.102.168', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2024-01-14', '01:28:36'),
(74, NULL, 1, 'J-240114-0023', '140.213.101.245', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2024-01-14', '03:08:05'),
(75, 1, 2, 'J-240114-0024', '140.213.101.245', 8, 100, 0, 100, '2024-01-14 05:27:07', '', 1, '2024-01-14', '04:27:01'),
(76, NULL, 1, 'J-240114-0025', '140.213.101.245', 8, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2024-01-14', '04:27:25'),
(77, NULL, 1, 'J-240114-0026', '140.213.103.23', 10, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2024-01-14', '12:41:24'),
(78, 1, 1, 'J-240114-0027', '140.213.100.248', 5, 100, 0, 100, '2024-01-14 13:42:19', '', 1, '2024-01-14', '12:42:19'),
(79, 1, 1, 'J-240114-0028', '140.213.103.74', 5, 100, 0, 100, '2024-01-14 13:51:18', '', 1, '2024-01-14', '12:51:18'),
(80, 1, 2, 'J-240114-0029', '140.213.103.74', 3, 100, 0, 100, '2024-01-14 14:07:48', '', 1, '2024-01-14', '01:07:48'),
(81, NULL, 1, 'J-240114-0030', '140.213.103.74', 3, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2024-01-14', '01:08:01'),
(82, 1, 2, 'J-240114-0031', '140.213.103.74', 5, 100, 0, 100, '2024-01-14 14:12:26', '', 2, '2024-01-14', '01:12:26'),
(84, 1, 2, 'J-240114-0032', '140.213.103.74', 5, 100, 0, 100, '2024-01-14 14:15:53', '', 1, '2024-01-14', '01:15:53'),
(85, 1, 2, 'J-240114-0033', '140.213.103.74', 12, 100, 0, 100, '2024-01-14 14:20:59', '', 1, '2024-01-14', '13:20:59'),
(86, 1, 2, 'J-240114-0034', '140.213.103.74', 12, 100, 0, 100, '2024-01-14 14:37:45', '', 1, '2024-01-14', '13:37:45'),
(87, 1, 1, 'J-240114-0035', '140.213.103.74', 5, 100, 0, 100, '2024-01-14 14:58:48', '', 1, '2024-01-14', '13:58:48'),
(88, NULL, 1, 'J-240115-0036', '140.213.37.134', 0, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2024-01-15', '12:53:29'),
(89, 1, 1, 'J-240115-0037', '140.213.37.134', 5, 100, 0, 100, '2024-01-15 13:54:19', '', 2, '2024-01-15', '12:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id_transdet` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `lapangan_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jam_mulai` time DEFAULT NULL,
  `durasi` int(11) NOT NULL,
  `jam_selesai` time DEFAULT NULL,
  `harga_jual` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id_transdet`, `trans_id`, `lapangan_id`, `tanggal`, `jam_mulai`, `durasi`, `jam_selesai`, `harga_jual`, `total`, `created_at`) VALUES
(1, 1, 1, '2021-05-18', '07:00:00', 1, '08:00:00', 100000, 100000, '2021-05-17 20:03:19'),
(2, 2, 1, '2021-05-18', '08:00:00', 1, '09:00:00', 100000, 100000, '2021-05-17 20:09:54'),
(5, 4, 1, '2021-04-09', '22:00:00', 1, '23:00:00', 100000, 100000, '2021-04-08 20:21:35'),
(15, 10, 1, '2023-12-11', '06:00:00', 1, '07:00:00', 100000, 100000, '2023-12-11 11:04:27'),
(16, 11, 1, '2023-12-11', '07:00:00', 2, '09:00:00', 100000, 200000, '2023-12-11 11:16:04'),
(21, 12, 1, '2023-12-12', '07:00:00', 1, '08:00:00', 100000, 100000, '2023-12-11 13:02:53'),
(22, 13, 1, '2023-12-11', '12:00:00', 1, '13:00:00', 100000, 100000, '2023-12-11 14:51:03'),
(26, 17, 1, '2023-12-12', '09:00:00', 2, '11:00:00', 100000, 200000, '2023-12-11 16:03:06'),
(30, 18, 1, '2023-12-11', '20:00:00', 3, '23:00:00', 100000, 300000, '2023-12-11 17:45:19'),
(35, 23, 1, '2023-12-12', '06:00:00', 2, '08:00:00', 100000, 200000, '2023-12-12 07:56:13'),
(41, 27, 1, '2023-12-12', '08:00:00', 2, '10:00:00', 100000, 200000, '2023-12-12 11:25:44'),
(46, 29, 1, '0000-00-00', NULL, 0, NULL, 100000, 100000, '2023-12-12 07:20:47'),
(57, 39, 1, '0000-00-00', NULL, 0, NULL, 100000, 100000, '2023-12-12 10:37:07'),
(60, 40, 1, '2023-12-17', '06:00:00', 2, '08:00:00', 100000, 200000, '2023-12-12 12:01:32'),
(62, 33, 1, '0000-00-00', NULL, 0, NULL, 100000, 100000, '2023-12-12 18:27:15'),
(65, 41, 1, '0000-00-00', NULL, 0, NULL, 100000, 100000, '2023-12-12 18:28:09'),
(67, 42, 1, '0000-00-00', NULL, 0, NULL, 100000, 100000, '2023-12-13 01:08:05'),
(75, 46, 1, '2023-12-13', '17:00:00', 2, '19:00:00', 100000, 200000, '2023-12-13 09:15:40'),
(83, 52, 1, '2024-01-16', '07:00:00', 1, '08:00:00', 100000, 100000, '2024-01-04 18:07:50'),
(89, 56, 1, '2024-01-13', '06:00:00', 1, '07:00:00', 100, 100, '2024-01-10 12:10:24'),
(90, 57, 1, '0000-00-00', NULL, 0, NULL, 100000, 100000, '2024-01-10 12:11:20'),
(94, 58, 1, '2024-01-10', '09:00:00', 1, '10:00:00', 100, 100, '2024-01-10 12:33:54'),
(96, 59, 1, '2024-01-12', '06:00:00', 1, '07:00:00', 100, 100, '2024-01-12 03:08:18'),
(97, 60, 1, '0000-00-00', NULL, 0, NULL, 100, 100, '2024-01-12 06:11:21'),
(98, 61, 1, '2024-01-12', '07:00:00', 1, '08:00:00', 100, 100, '2024-01-12 06:11:56'),
(100, 62, 1, '0000-00-00', NULL, 0, NULL, 100, 100, '2024-01-12 06:20:22'),
(101, 63, 1, '2024-01-12', '08:00:00', 1, '09:00:00', 100, 100, '2024-01-12 07:13:02'),
(105, 65, 1, '2024-01-13', '07:00:00', 1, '08:00:00', 100, 100, '2024-01-13 02:21:56'),
(106, 66, 1, '2024-01-13', '08:00:00', 1, '09:00:00', 100, 100, '2024-01-13 02:22:25'),
(107, 67, 1, '2024-01-13', '09:00:00', 1, '10:00:00', 100, 100, '2024-01-13 02:24:15'),
(108, 68, 1, '2024-01-13', '07:00:00', 1, '08:00:00', 100, 100, '2024-01-13 06:18:22'),
(109, 69, 1, '2024-01-13', '10:00:00', 1, '11:00:00', 100, 100, '2024-01-13 06:19:04'),
(110, 70, 1, '2024-01-13', '11:00:00', 1, '12:00:00', 100, 100, '2024-01-13 06:21:27'),
(111, 71, 1, '2024-01-14', '06:00:00', 1, '07:00:00', 100, 100, '2024-01-13 06:24:22'),
(112, 72, 1, '2024-01-13', '12:00:00', 1, '13:00:00', 100, 100, '2024-01-13 06:25:06'),
(113, 73, 1, '0000-00-00', NULL, 0, NULL, 100, 100, '2024-01-13 18:28:36'),
(115, 75, 1, '2024-01-14', '06:00:00', 1, '07:00:00', 100, 100, '2024-01-13 21:27:01'),
(116, 76, 1, '0000-00-00', NULL, 0, NULL, 100, 100, '2024-01-13 21:27:25'),
(117, 77, 1, '0000-00-00', NULL, 0, NULL, 100, 100, '2024-01-14 05:41:24'),
(118, 78, 1, '2024-01-14', '06:00:00', 1, '07:00:00', 100, 100, '2024-01-14 05:41:46'),
(119, 79, 1, '2024-01-14', '06:00:00', 1, '07:00:00', 100, 100, '2024-01-14 05:48:30'),
(120, 80, 1, '2024-01-14', '06:00:00', 1, '07:00:00', 100, 100, '2024-01-14 06:07:41'),
(121, 81, 1, '0000-00-00', NULL, 0, NULL, 100, 100, '2024-01-14 06:08:01'),
(122, 82, 1, '2024-01-14', '06:00:00', 1, '07:00:00', 100, 100, '2024-01-14 06:12:20'),
(124, 84, 1, '2024-01-14', '06:00:00', 1, '07:00:00', 100, 100, '2024-01-14 06:15:47'),
(125, 85, 1, '2024-01-14', '06:00:00', 1, '07:00:00', 100, 100, '2024-01-14 06:20:52'),
(126, 86, 1, '2024-01-14', '06:00:00', 1, '07:00:00', 100, 100, '2024-01-14 06:21:30'),
(127, 87, 1, '2024-01-14', '06:00:00', 1, '07:00:00', 100, 100, '2024-01-14 06:38:02'),
(130, 89, 1, '2024-01-15', '06:00:00', 1, '07:00:00', 100, 100, '2024-01-15 05:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `id_sycPlatUsr` int(11) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `provinsi` int(11) DEFAULT NULL,
  `kota` int(11) DEFAULT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usertype` int(11) NOT NULL,
  `active` tinyint(3) UNSIGNED DEFAULT NULL,
  `photo` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `photo_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `activation_code` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `forgotten_password_time` int(10) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `last_login` int(11) DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_sycPlatUsr`, `name`, `username`, `password`, `email`, `phone`, `provinsi`, `kota`, `address`, `usertype`, `active`, `photo`, `photo_type`, `ip_address`, `salt`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `last_login`, `created_on`, `modified`) VALUES
(0, NULL, 'guest', 'guest', '$2y$08$Bmor3AWJsNHPdnmb6F371.cJUrmIJGVGV714dFTndhJWt5pygQzqC', 'guest@code.com', '97856', 9, 468, 'jl melt', 4, 1, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2023-12-12 07:44:52'),
(1, 1, 'SuperAdmin', 'superadmin', '$2y$08$TWMdtdacqPE5yEz9n1LwFuhEVmiDTTsupl12M45tCQihzF1tu2N/6', 'superadmin@gmail.com', '081228289766', 6, 151, 'asdasdasdsa', 1, 1, 'mazmi20180205001726', '.jpg', '::1', NULL, 'c6ad242e6fd3de875568c7de5ba23af4a24137ef', 'tHafW45duPzrU3oWR0AVuO48b26088a3cd65edc4', 1621246176, 'xtm06fcopGcIa84eq.72Je', 1705289991, 2147483647, '2024-01-15 03:39:51'),
(2, NULL, 'Admin', 'administrator', '$2y$08$rnCngWyQhFLdVJijctNDKuwJZ8o9VfcSsZ9IM9XN71ugxIpQFeCWe', 'administrator@gmail.com', '08124124', NULL, NULL, 'kaldjlas', 2, 1, 'admin20180424102408', '.jpeg', '::1', NULL, NULL, NULL, NULL, NULL, 1704444544, 1524551716, '2024-01-05 15:49:04'),
(3, NULL, 'Batistuta', 'batistuta', '$2y$08$.5EYrM8S8Up0LcpFiEmjauyPVdWOmylLZ.MqM0zBKyDVKniwdVbYi', 'batistuta@gmail.com', '0812412414', 33, 327, 'Jl. Skdlajsdlasjkdl', 4, 1, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, 'bP1vzcrMcsHTQLaetXr6We', 1702266998, 1528634033, '2023-12-11 10:56:38'),
(4, NULL, 'User Premium', 'userpremium', '$2y$08$Wv3MA.DnwTNzBeF62o9neuSXeVdIA/bjlxOzSxtD6DtgStEBn//s.', 'userpremium@gmail.com', '0812412412', 3, 106, 'kaljdklasjdkl', 3, 1, NULL, NULL, '::1', NULL, NULL, NULL, NULL, NULL, 1621252638, 1531807819, '2021-05-17 18:57:18'),
(5, NULL, 'Olih Solihudin', 'solihudin', '$2y$08$Bmor3AWJsNHPdnmb6F371.cJUrmIJGVGV714dFTndhJWt5pygQzqC', 'olihsolih213@gmail.com', '089678575', 9, 468, 'jl melati', 4, 1, NULL, NULL, '::1', NULL, NULL, '0wvkRAHq5L1rBHxqbneMh.fbdeec39e2448404be', 1702377039, NULL, 1705298035, 1702286101, '2024-01-15 05:53:55'),
(7, NULL, 'Coba register pas cekout', 'coc', '$2y$08$N9PsLAS02Y8Nuhdn74YCJOvhhQDwtBfv4lkZzcxyo3Y4KtuVkEJ8.', 'olihsolihudin34@gmail.com', '0976785767', 9, 469, 'gdfgfdg', 4, 1, NULL, NULL, '::1', NULL, NULL, NULL, NULL, NULL, 1702347596, 1702347596, '2023-12-12 09:19:56'),
(8, NULL, 'Rian Kurnia', 'rian344', '$2y$08$ymFDayucKcs5OME6tr5tVugJenUUBz1cTTzyuMz74eUgJ6Z8RC.Fi', 'riankur56@yahoo.com', '079685676', 7, 88, 'gtfdfgfd', 4, 1, NULL, NULL, '::1', NULL, NULL, NULL, NULL, NULL, 1702358268, 1702358268, '2023-12-12 12:17:48'),
(9, NULL, 'ferere', 'edfdfd', '$2y$08$Va85tf9UiEXLzwKnHpw4P.J1oZ79orNIZC64aJdvGEJ40cvWQ3z0G', 'sdsdsds@gmail.com', '3455423', 9, 126, 'sdadsadsa', 4, 1, NULL, NULL, '::1', NULL, NULL, NULL, NULL, NULL, 1702358488, 1702358487, '2023-12-12 12:21:28'),
(10, NULL, 'Siti', 'siti78', '$2y$08$/43SZnVLg32HPAR2JYTEc.D45vctYpHHW6Q.tbQli22bLlba7v0Pa', 'siti78@yahoo.com', '089768565', 9, 469, 'fhdfgfdg', 4, 1, NULL, NULL, '::1', NULL, NULL, 'uFohyPdWQLhfQQK9w4jGYeeb747f7a80ab43da51', 1702377023, NULL, 1702358891, 1702358891, '2023-12-12 10:30:23'),
(11, NULL, 'Sutisna', 'sutisna45', '$2y$08$dk1Ea6cUpvfZDHf/hRQwteEyKFuBsazsAQjcUIHvU6biWZbK2gezO', 'sutisna45@gmail.com', '0869758564', 10, 196, 'jl melati', 4, 1, NULL, NULL, '2001:448a:3070:29e3:4dce:8b80:1bbc:29d8', NULL, NULL, NULL, NULL, NULL, 1702366131, 1702366131, '2023-12-12 07:28:51'),
(12, NULL, 'Farhan', 'farhan213', '$2y$08$uaF3ZARlh0gvZJDx22rWl.s21t3crCsifGNhWnm788/7n2GZvfY62', 'farhan213@gmail.com', '078667457', 9, 469, 'jl melati', 3, 1, NULL, NULL, '2001:448a:3070:29e3:4dce:8b80:1bbc:29d8', NULL, NULL, NULL, NULL, NULL, 1702382187, 1702382186, '2023-12-12 12:04:21'),
(13, NULL, 'Muhamad Rafli', 'Flyy9', '$2y$08$MYRULabm56zt3CL6QcqcIeNOCmqToeKUh.jezIP9LkA9128gDdXuO', 'muhamadrafli6207@gmail.com', '0895610411991', 9, 22, 'Kp. Bojongnangka', 4, 1, NULL, NULL, '223.255.230.45', NULL, NULL, NULL, NULL, 'i6M4lbGqcma0Ju9ssxFj0u', 1704870235, 1702454990, '2024-01-10 07:03:55'),
(14, NULL, 'gigink nugraha', 'giginkaditya', '$2y$08$ByoGbfSHdqMCEhQVhcqPnuvpgNgBxkbYV2hdF4vOk9r5ZwT3laUh6', 'giginkaditya@yahoo.co.id', '082215758687', 9, 22, 'Jalan tentara pelajar gg.budirasa 1', 4, 1, NULL, NULL, '118.99.73.130', NULL, NULL, NULL, NULL, NULL, 1702459113, 1702459113, '2023-12-13 09:18:33'),
(15, NULL, 'Riad', 'riad324', '$2y$08$SxEJXXq05KBm.ERk9QVmVuLF5fQbMXbAXOhx8WfHIuf/L/K5BPUoC', 'riadm@gmail.com', '0785654546', 9, 54, 'Jl Melati', 4, 1, NULL, NULL, '::1', NULL, NULL, NULL, NULL, NULL, 1704366603, 1704366603, '2024-01-04 18:10:03'),
(16, NULL, 'ronaldo', 'ronaldo24770', '$2y$08$luTDBEU9xtDV39FDB5WDj.tv3hiCQx26JPP6gY51PVogke9SSsfWa', 'ronaldo234@gmail.com', '08796788757', 0, 0, '-', 4, 1, NULL, NULL, '36.74.44.245', NULL, NULL, NULL, NULL, NULL, NULL, 1705130212, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_group`
--

CREATE TABLE `users_group` (
  `id_group` int(11) NOT NULL,
  `name_group` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users_group`
--

INSERT INTO `users_group` (`id_group`, `name_group`) VALUES
(1, 'SuperAdmin'),
(2, 'Administrator'),
(3, 'Member Premium'),
(4, 'Member Biasa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id_bank`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id_company`);

--
-- Indexes for table `diskon`
--
ALTER TABLE `diskon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id_event`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id_foto`),
  ADD KEY `foto_FK` (`album_id`);

--
-- Indexes for table `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`id_kontak`);

--
-- Indexes for table `lapangan`
--
ALTER TABLE `lapangan`
  ADD PRIMARY KEY (`id_lapangan`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id_page`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id_slider`);

--
-- Indexes for table `subscriber`
--
ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id_subscriber`);

--
-- Indexes for table `synchronization_plat`
--
ALTER TABLE `synchronization_plat`
  ADD PRIMARY KEY (`id_syc`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_trans`),
  ADD KEY `transaksi_FK` (`user_id`);

--
-- Indexes for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id_transdet`),
  ADD KEY `transaksi_detail_FK` (`lapangan_id`),
  ADD KEY `transaksi_detail_FK_1` (`trans_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_group`
--
ALTER TABLE `users_group`
  ADD PRIMARY KEY (`id_group`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id_bank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id_company` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jam`
--
ALTER TABLE `jam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kontak`
--
ALTER TABLE `kontak`
  MODIFY `id_kontak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lapangan`
--
ALTER TABLE `lapangan`
  MODIFY `id_lapangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id_page` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id_slider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subscriber`
--
ALTER TABLE `subscriber`
  MODIFY `id_subscriber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `synchronization_plat`
--
ALTER TABLE `synchronization_plat`
  MODIFY `id_syc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_trans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id_transdet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users_group`
--
ALTER TABLE `users_group`
  MODIFY `id_group` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_FK` FOREIGN KEY (`album_id`) REFERENCES `album` (`id_album`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `transaksi_detail_FK` FOREIGN KEY (`lapangan_id`) REFERENCES `lapangan` (`id_lapangan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_detail_FK_1` FOREIGN KEY (`trans_id`) REFERENCES `transaksi` (`id_trans`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
