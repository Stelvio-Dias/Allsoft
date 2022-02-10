-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Fev-2022 às 19:26
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `missing_people`
--
CREATE DATABASE IF NOT EXISTS `missing_people` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `missing_people`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `assunto_mensagem`
--

CREATE TABLE `assunto_mensagem` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assunto` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mensagem` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE `comentario` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comentario` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desaparecido_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comuna`
--

CREATE TABLE `comuna` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comuna` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `comuna`
--

INSERT INTO `comuna` (`id`, `comuna`, `created_at`, `updated_at`) VALUES
(1, 'Desconhecido', '2022-02-09 23:05:29', '2022-02-10 21:20:37'),
(2, 'Benfica', '2022-02-09 23:05:37', '2022-02-09 23:05:37'),
(3, 'Futungo de Belas', '2022-02-09 23:05:50', '2022-02-09 23:05:50'),
(4, 'Lar do Patriota', '2022-02-09 23:06:00', '2022-02-09 23:06:00'),
(5, 'Talatona', '2022-02-09 23:06:07', '2022-02-09 23:06:07'),
(6, 'Camama', '2022-02-09 23:06:19', '2022-02-09 23:06:19'),
(7, 'Cidade Universitária', '2022-02-09 23:06:28', '2022-02-09 23:06:28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `desaparecido`
--

CREATE TABLE `desaparecido` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `imagem` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aprovado` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `vizualizacoes_qtd` bigint(20) NOT NULL DEFAULT 0,
  `comuna_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `responsavel_telemovel1_id` bigint(20) UNSIGNED DEFAULT NULL,
  `responsavel_telemovel2_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `altura` int(11) DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `desaparecido`
--

INSERT INTO `desaparecido` (`id`, `nome`, `data_nascimento`, `imagem`, `aprovado`, `status`, `vizualizacoes_qtd`, `comuna_id`, `user_id`, `responsavel_telemovel1_id`, `responsavel_telemovel2_id`, `email`, `altura`, `peso`, `created_at`, `updated_at`) VALUES
(1, 'Dale Eliana', '2011-05-14', '7f2cd094b9fa96b2a141e8e104e38e4b.jpg', 1, 0, 1078, 4, 3, 1, 2, 'DaleEliana4381@yoopmail.com', 167, 228, '2022-02-09 21:30:24', '2022-02-09 21:30:25'),
(2, 'Ana Michonne', '1997-05-05', '3773c77ddd3c4ec7cad13b7cf0c16154.jpg', 1, 0, 3441, 5, 2, 3, 4, 'AnaMichonne4905@hotmail.com', 149, 134, '2022-02-09 21:30:27', '2022-02-09 21:30:27'),
(3, 'Elisa Junior', '1980-05-19', '69ac92465d8304bccec21343a5cdc550.jpg', 1, 0, 397, 5, 3, 5, 6, 'ElisaJunior1219@hotmail.com', 182, 198, '2022-02-09 21:30:28', '2022-02-09 21:30:28'),
(4, 'Beta Ivan', '2012-05-16', '9373c588d788c57f931c9dd3f34b844e.jpg', 1, 0, 3549, 3, 2, 7, 8, 'BetaIvan1727@hotmail.com', 153, 228, '2022-02-09 21:30:29', '2022-02-09 21:30:29'),
(5, 'Nadia Junior', '1993-05-11', '514bf301d7fecc730ddc4d0b2d2abc74.jpg', 1, 0, 1079, 2, 2, 9, 10, 'NadiaJunior1305@gmail.com', 181, 239, '2022-02-09 21:30:30', '2022-02-09 21:30:30'),
(6, 'Vania Raíssa', '1976-05-31', 'b975dcf2815c9fd16196af6c240fbf3d.jpg', 1, 0, 4100, 5, 3, 11, 12, 'VaniaRaíssa2112@gmail.com', 148, 138, '2022-02-09 21:30:31', '2022-02-09 21:30:31'),
(7, 'Simon Miranda', '1971-05-19', '47ea1322f6a10d806b534aa586fbc6e2.jpg', 1, 0, 1481, 4, 1, 13, 14, 'SimonMiranda2728@gmail.com', 190, 57, '2022-02-09 21:30:35', '2022-02-09 21:30:35'),
(8, 'Rollins Eugine', '1970-05-01', '6554b3d8bbf8cdd3cfa41e7a709d2997.jpg', 1, 0, 3382, 4, 1, 15, 16, 'RollinsEugine1542@outlooh.com', 195, 146, '2022-02-09 21:30:36', '2022-02-09 21:30:36'),
(9, 'Baszler Milton', '2000-05-07', '2ea7aea678b3182c4b63eb26a578cac7.jpg', 1, 0, 3924, 5, 3, 17, 18, 'BaszlerMilton2956@yoopmail.com', 198, 269, '2022-02-09 21:30:36', '2022-02-09 21:30:37'),
(10, 'Anabel Messi', '1977-01-30', '8fb291a5126f8233839ce93733484220.jpg', 1, 0, 1210, 3, 3, 19, 20, 'AnabelMessi4587@hotmail.com', 174, 71, '2022-02-09 21:30:37', '2022-02-09 21:30:37'),
(11, 'Luis Keith', '1971-05-16', 'a279a8ac26d183e077e5572663d90125.jpg', 1, 0, 2039, 6, 2, 21, 22, 'LuisKeith309@yoopmail.com', 189, 132, '2022-02-09 21:30:38', '2022-02-09 21:30:38'),
(12, 'Paula Eugine', '1977-05-27', 'c6f33d04092e7a4374556dbbecce36dc.jpg', 1, 0, 1969, 5, 2, 23, 24, 'PaulaEugine3032@yoopmail.com', 195, 281, '2022-02-09 21:30:38', '2022-02-09 21:30:39'),
(13, 'Frederico Raíssa', '1984-03-08', '4f897cadebdf2360075e327a8a85cc1c.jpg', 1, 0, 1568, 2, 1, 25, 26, 'FredericoRaíssa1409@hotmail.com', 172, 92, '2022-02-09 21:30:39', '2022-02-10 16:31:06'),
(14, 'Laiza Milton', '1991-05-28', '45f6026eb8cabc3896817ab534b615cc.jpg', 1, 0, 4957, 5, 2, 27, 28, 'LaizaMilton4836@outlooh.com', 172, 107, '2022-02-09 21:30:40', '2022-02-09 21:30:40'),
(15, 'Sasha Osvaldo', '1988-05-23', '8a6abf86b16a11c78e920c707bf5c74f.jpg', 1, 0, 2300, 1, 1, 29, 30, 'SashaOsvaldo3269@outlooh.com', 169, 32, '2022-02-09 21:30:41', '2022-02-10 01:05:18'),
(16, 'Margarida Rodrigo', '2005-05-04', '7e9ffa4d7edad98ca61554b553dcf3a0.jpg', 1, 0, 2011, 3, 3, 31, 32, 'MargaridaRodrigo1710@hotmail.com', 161, 211, '2022-02-09 21:30:42', '2022-02-09 21:30:42'),
(17, 'Vania Shayna', '2018-05-24', '5031caaf1f0061521cff5155dfb1f848.jpg', 1, 0, 3847, 6, 2, 33, 34, 'VaniaShayna969@gmail.com', 146, 244, '2022-02-09 21:30:43', '2022-02-09 21:30:43'),
(18, 'Larice Rick', '1979-01-15', '635dd92ea85811c843547befaf62e69e.jpg', 1, 0, 4787, 1, 1, 35, 36, 'LariceRick818@yoopmail.com', 149, 188, '2022-02-09 21:30:43', '2022-02-09 21:30:43'),
(19, 'Magno Artur', '2017-03-29', 'a0d47f4872a055fbaa4caaf1a9d26536.jpg', 1, 0, 13, 3, 3, 37, 38, 'MagnoArtur2085@hotmail.com', 153, 99, '2022-02-09 21:30:44', '2022-02-09 21:30:44'),
(20, 'Carol Rodrigo', '1978-05-29', 'f15dd4f36c1768d96288d21ad5eec46a.jpg', 1, 0, 1099, 2, 1, 39, 40, 'CarolRodrigo1754@hotmail.com', 175, 159, '2022-02-09 21:30:44', '2022-02-09 21:30:45'),
(21, 'Sténio Nadia', '1984-05-03', '86c63585f47e92fe9a9826f9aea3be3c.jpg', 1, 0, 2315, 1, 3, 41, 42, 'SténioNadia3509@yoopmail.com', 192, 198, '2022-02-09 21:30:45', '2022-02-09 21:30:45'),
(22, 'Adriana Raíssa', '2007-05-12', '8a8510d3b234d4aca8f914b8c98fd3d0.jpg', 1, 0, 4151, 6, 2, 43, 44, 'AdrianaRaíssa1143@outlooh.com', 147, 73, '2022-02-09 21:30:46', '2022-02-09 21:30:46'),
(23, 'Amanda Edgar', '1984-05-08', '12fc9583fb56a07f170b1e36b4bf781f.jpg', 1, 0, 2783, 1, 1, 45, 46, 'AmandaEdgar3953@gmail.com', 140, 112, '2022-02-09 21:30:46', '2022-02-09 21:30:46'),
(24, 'Armando Luis', '1999-05-08', '74af17597929c86ea2fe192e54c2dc4e.jpg', 1, 0, 3329, 2, 1, 47, 48, 'ArmandoLuis3558@hotmail.com', 152, 126, '2022-02-09 21:30:47', '2022-02-09 21:30:47'),
(25, 'Andreia Rollins', '1989-05-15', '190c61dea912dc2beb9b6ccb9fff7497.jpg', 1, 0, 4375, 1, 2, 49, 50, 'AndreiaRollins2173@gmail.com', 200, 259, '2022-02-09 21:30:48', '2022-02-09 21:30:48'),
(26, 'Shayna Magno', '1980-05-23', '0345230e57e7b8674058cc921d48a7d3.jpg', 1, 0, 1792, 1, 3, 51, 52, 'ShaynaMagno1416@yoopmail.com', 156, 187, '2022-02-09 21:30:49', '2022-02-09 21:30:49'),
(27, 'Debora Joana', '2006-05-30', 'f0d266c14f422afce0c686eb78eb044a.jpg', 1, 0, 3016, 3, 3, 53, 54, 'DeboraJoana483@yoopmail.com', 168, 119, '2022-02-09 21:30:50', '2022-02-09 21:30:50'),
(28, 'Adriano Goldberg', '2013-05-09', 'ebea898c8e5d6a8240eaac29fc8f3719.jpg', 1, 0, 1424, 4, 2, 55, 56, 'AdrianoGoldberg1680@outlooh.com', 177, 299, '2022-02-09 21:30:50', '2022-02-09 21:30:51'),
(29, 'Wyatt Artur', '2012-05-12', '7b2e6f27a154abca2b521329b1af6c49.jpg', 1, 0, 3740, 4, 3, 57, 58, 'WyattArtur4777@hotmail.com', 156, 108, '2022-02-09 21:30:51', '2022-02-09 21:30:51'),
(30, 'Eugine Frederico', '1983-05-15', '4c5ffa9e63af1e18b52aeb87bd1345d8.jpg', 1, 0, 3018, 2, 2, 59, 60, 'EugineFrederico723@hotmail.com', 200, 206, '2022-02-09 21:30:52', '2022-02-09 21:30:52'),
(31, 'Helga Wyatt', '1991-05-19', 'c51a15823f1a10ef054f7e8e151e8bf2.jpg', 1, 0, 4052, 2, 1, 61, 62, 'HelgaWyatt2586@hotmail.com', 180, 167, '2022-02-09 21:30:53', '2022-02-09 21:30:53'),
(32, 'Cristiano Seth', '2003-05-23', '7c49510aab5998cf973a8cf9f2e432f7.jpg', 1, 0, 4560, 6, 2, 63, 64, 'CristianoSeth3190@yoopmail.com', 169, 139, '2022-02-09 21:30:53', '2022-02-09 21:30:54'),
(33, 'Keith Clementine', '2011-05-01', '32aafe7e450ab551c5ab2ed8d4386362.jpg', 1, 0, 4837, 6, 1, 65, 66, 'KeithClementine3621@outlooh.com', 186, 123, '2022-02-09 21:30:54', '2022-02-09 21:30:55'),
(34, 'Eleanor Elisa', '2019-05-09', '627e72cbc19dee4e51229fa772125edf.jpg', 1, 0, 4022, 6, 1, 67, 68, 'EleanorElisa1225@outlooh.com', 148, 192, '2022-02-09 21:30:55', '2022-02-09 21:30:55'),
(35, 'Cassia Magna', '2005-05-22', 'ccef3fca2d6442c8785969b96adc6e89.jpg', 1, 0, 4909, 6, 3, 69, 70, 'CassiaMagna748@outlooh.com', 170, 257, '2022-02-09 21:30:56', '2022-02-09 21:30:56'),
(36, 'Andreia Debora', '1983-05-14', '3ce99ddf62af86856121ba76c9e2ec79.jpg', 1, 0, 1236, 6, 2, 71, 72, 'AndreiaDebora2969@outlooh.com', 154, 161, '2022-02-09 21:30:56', '2022-02-09 21:30:56'),
(37, 'Magna João', '1998-05-12', 'c5ef616b08edc4924cd930dd780b568a.jpg', 1, 0, 672, 4, 1, 73, 74, 'MagnaJoão4839@gmail.com', 172, 144, '2022-02-09 21:30:57', '2022-02-09 21:30:57'),
(38, 'Lily Ana', '2014-05-16', '88db9cfda14f49ea71408fff7031f74f.jpg', 1, 0, 2819, 4, 3, 75, 76, 'LilyAna1994@gmail.com', 157, 162, '2022-02-09 21:30:58', '2022-02-09 21:30:58'),
(39, 'Luis Vania', '2003-01-01', '9b4c85a767727167a69e7bdbec56b3e9.jpg', 1, 0, 1459, 3, 3, 77, 78, 'LuisVania1768@yoopmail.com', 163, 53, '2022-02-09 21:30:58', '2022-02-09 21:30:59'),
(40, 'Paula Ândrea', '1993-05-24', 'b2a0176ce55c7833bd07758e18983bf6.jpg', 1, 0, 4884, 1, 1, 79, 80, 'PaulaÂndrea1563@outlooh.com', 153, 66, '2022-02-09 21:31:00', '2022-02-09 21:31:00'),
(41, 'Elsa Carla', '1977-05-31', 'c203a7e47aecfec3a7f018df3c64e41c.jpg', 1, 0, 1297, 2, 3, 81, 82, 'ElsaCarla1175@hotmail.com', 156, 296, '2022-02-09 21:31:01', '2022-02-09 21:31:01'),
(42, 'Elsa Baszler', '1994-05-29', '4ff16433cc112513abb55c5f670b46db.jpg', 1, 0, 3187, 5, 2, 83, 84, 'ElsaBaszler1156@outlooh.com', 164, 62, '2022-02-09 21:31:01', '2022-02-09 21:31:02'),
(43, 'Andreia Shayna', '2019-05-13', 'b41a703fd7dbe18f82e6f35f092109ec.jpg', 1, 0, 1628, 5, 3, 85, 86, 'AndreiaShayna2686@outlooh.com', 197, 179, '2022-02-09 21:31:02', '2022-02-09 21:31:02'),
(44, 'Bray Connie', '1976-05-22', 'f1d573af75c88a1193dc35555384f155.jpg', 1, 0, 3224, 4, 3, 87, 88, 'BrayConnie3470@gmail.com', 157, 154, '2022-02-09 21:31:03', '2022-02-09 21:31:03'),
(45, 'Ezequiel Elsa', '1978-05-10', 'ce745ed916c6029222c647c07be09e8f.jpg', 1, 0, 3232, 3, 3, 89, 90, 'EzequielElsa204@outlooh.com', 157, 37, '2022-02-09 21:31:04', '2022-02-09 21:31:04'),
(46, 'Fernanda Braun', '1970-05-02', 'ba73784596cb850fcd844cfbd18cdd73.jpg', 1, 0, 1775, 5, 3, 91, 92, 'FernandaBraun3179@gmail.com', 154, 56, '2022-02-09 21:31:04', '2022-02-09 21:31:05'),
(47, 'Dunilson Goldberg', '2015-05-14', 'f14afef8b75f48d7ff1c62cc32d73633.jpg', 1, 0, 1024, 4, 3, 93, 94, 'DunilsonGoldberg389@outlooh.com', 167, 237, '2022-02-09 21:31:05', '2022-02-09 21:31:05'),
(48, 'Amanda Eugine', '1991-05-23', 'c8c6a1626bf82b5c46c23630ed5b7609.jpg', 1, 0, 3340, 2, 3, 95, 96, 'AmandaEugine795@hotmail.com', 173, 27, '2022-02-09 21:31:06', '2022-02-09 21:31:06'),
(49, 'Eliana Margarida', '2004-01-14', 'fbbf896bf6c457d964716dd2fded2b34.jpg', 1, 0, 3417, 6, 1, 97, 98, 'ElianaMargarida4556@gmail.com', 159, 255, '2022-02-09 21:31:07', '2022-02-09 21:31:07'),
(50, 'Keith Braulio', '1985-05-13', '19ed3c37e8d2d198c493184743c00ce7.jpg', 1, 0, 176, 4, 3, 99, 100, 'KeithBraulio2744@outlooh.com', 185, 229, '2022-02-09 21:31:07', '2022-02-09 21:31:08'),
(51, 'Keith Bruna', '2002-05-09', '269b8bd2970ef85c3af9f8280d35be99.jpg', 1, 0, 821, 6, 1, 101, 102, 'KeithBruna4115@hotmail.com', 193, 114, '2022-02-09 21:31:09', '2022-02-09 21:31:09'),
(52, 'Abrão Anabel', '2013-05-16', '30ea02feb04254ca93e1525f7500e37a.jpg', 1, 0, 1574, 3, 2, 103, 104, 'AbrãoAnabel4674@yoopmail.com', 193, 251, '2022-02-09 21:31:09', '2022-02-09 21:31:10'),
(53, 'Mitch Dias', '2009-05-15', 'b1eb89a16c18d5690744061b68b55748.jpg', 1, 0, 2792, 6, 3, 105, 106, 'MitchDias1106@outlooh.com', 152, 48, '2022-02-09 21:31:11', '2022-02-09 21:31:11'),
(54, 'Joana Nadia', '1982-05-19', '4f74fd209d245dfd76a399cb9af4db80.jpg', 1, 0, 515, 1, 2, 107, 108, 'JoanaNadia317@gmail.com', 185, 20, '2022-02-09 21:31:11', '2022-02-09 21:31:12'),
(55, 'Nadia James', '1976-05-14', '83698c7fea7adcd2d989de8bb9afc320.jpg', 1, 0, 426, 6, 2, 109, 110, 'NadiaJames2048@outlooh.com', 186, 151, '2022-02-09 21:31:12', '2022-02-09 21:31:13'),
(56, 'Amanda Ivana', '1984-05-27', 'a5b4c0e69d6a5d58f4a1e43fe2d7373e.jpg', 1, 0, 4201, 1, 3, 111, 112, 'AmandaIvana1886@outlooh.com', 149, 266, '2022-02-09 21:31:13', '2022-02-09 21:31:14'),
(57, 'Simon Shane', '1997-03-07', '70d141421090715769ca49e095dee00e.jpg', 1, 0, 27, 6, 1, 113, 114, 'SimonShane3731@hotmail.com', 182, 41, '2022-02-09 21:31:14', '2022-02-09 21:31:15'),
(58, 'Armando Lily', '1985-01-05', '613854054f40c7b99f1a6fbe3e8b3350.jpg', 1, 0, 4135, 6, 2, 115, 116, 'ArmandoLily2743@outlooh.com', 189, 183, '2022-02-09 21:31:15', '2022-02-09 21:31:15'),
(59, 'Erivandro Miranda', '2013-05-06', '34e66c5f49acd687a59ccb5d194ccb88.jpg', 1, 0, 2983, 4, 1, 117, 118, 'ErivandroMiranda1589@yoopmail.com', 199, 293, '2022-02-09 21:31:16', '2022-02-09 21:31:16'),
(60, 'Ana Raíssa', '1977-05-30', '308b8814dbd2b3b43b47c31f16944a82.jpg', 1, 0, 290, 2, 1, 119, 120, 'AnaRaíssa4422@outlooh.com', 168, 281, '2022-02-09 21:31:17', '2022-02-09 21:31:17'),
(61, 'Nadia Wyatt', '1977-01-08', '7abb0bea0c5ebe723a2723aa0bcf02ca.jpg', 1, 0, 795, 3, 1, 121, 122, 'NadiaWyatt4534@hotmail.com', 176, 193, '2022-02-09 21:31:18', '2022-02-09 21:31:18'),
(62, 'Leonel Nair', '2015-05-18', 'c815f6e17396f66b6a68526ea9fbe727.jpg', 1, 0, 4947, 4, 2, 123, 124, 'LeonelNair4441@outlooh.com', 157, 122, '2022-02-09 21:31:19', '2022-02-09 21:31:19'),
(63, 'Beta Artur', '2005-05-17', '3b57970da8552c1d0e80a7c7db49433f.jpg', 1, 0, 2451, 4, 3, 125, 126, 'BetaArtur512@outlooh.com', 150, 52, '2022-02-09 21:31:20', '2022-02-09 21:31:20'),
(64, 'Joe Junior', '2016-05-30', 'caed16dbdd2e7a4db070d504926489a0.jpg', 1, 0, 3127, 3, 3, 127, 128, 'JoeJunior4579@yoopmail.com', 175, 184, '2022-02-09 21:31:21', '2022-02-09 21:31:21'),
(65, 'Magna Simon', '1978-05-05', '9e15e94b90628e23a7416490756f29f8.jpg', 1, 0, 4194, 5, 2, 129, 130, 'MagnaSimon2767@outlooh.com', 192, 209, '2022-02-09 21:31:22', '2022-02-09 21:31:23'),
(66, 'Lily Abrahan', '2019-05-11', '493e3c0a37b76cb59c88ffce75e651b0.jpg', 1, 0, 1824, 4, 1, 131, 132, 'LilyAbrahan2749@yoopmail.com', 146, 160, '2022-02-09 21:31:23', '2022-02-09 21:31:23'),
(67, 'Shane Artur', '1994-01-04', 'f950bde25497e860f6295d19085c74ee.jpg', 1, 0, 1319, 6, 2, 133, 134, 'ShaneArtur4958@gmail.com', 168, 213, '2022-02-09 21:31:24', '2022-02-09 21:31:24'),
(68, 'Michonne Ivan', '1989-05-16', '4809f3e7527a15324275861c607185be.jpg', 1, 0, 4267, 2, 2, 135, 136, 'MichonneIvan2503@hotmail.com', 174, 108, '2022-02-09 21:31:26', '2022-02-09 21:31:26'),
(69, 'Abrahan Helga', '1985-05-06', 'c96776728118a3ee17d991dce83a495f.jpg', 1, 0, 3963, 5, 3, 137, 138, 'AbrahanHelga1353@outlooh.com', 159, 230, '2022-02-09 21:31:26', '2022-02-09 21:31:26'),
(70, 'Fernando Alexa', '1998-05-26', '7bb4d47517c982848abad3045a66684c.jpg', 1, 0, 4802, 5, 2, 139, 140, 'FernandoAlexa3827@outlooh.com', 198, 128, '2022-02-09 21:31:27', '2022-02-09 21:31:27'),
(71, 'Amanda Yumik', '1998-03-24', '6a9fd3e2322ad2daf101b4f2abd6ffc4.jpg', 1, 0, 1569, 5, 3, 141, 142, 'AmandaYumik4223@yoopmail.com', 179, 223, '2022-02-09 21:31:28', '2022-02-09 21:31:28'),
(72, 'Frederico Artur', '1976-05-02', '390d3522714c0c4def152d3acb2be8dc.jpg', 1, 0, 3559, 5, 1, 143, 144, 'FredericoArtur4321@hotmail.com', 194, 169, '2022-02-09 21:31:28', '2022-02-09 21:31:29'),
(73, 'Lee Grimes', '1972-05-26', '32e4fe653cb3f057136a13326201cad9.jpg', 1, 0, 4285, 6, 1, 145, 146, 'LeeGrimes2694@yoopmail.com', 174, 272, '2022-02-09 21:31:29', '2022-02-09 21:31:29'),
(74, 'Grimes Cristiano', '2001-05-04', '5adc87288ba6486e393470f7690b1213.jpg', 1, 0, 2354, 3, 2, 147, 148, 'GrimesCristiano4313@yoopmail.com', 193, 104, '2022-02-09 21:31:30', '2022-02-09 21:31:30'),
(75, 'Adriana Carla', '1993-05-22', '01492412b58edd17bbb63efc82289dbf.jpg', 1, 0, 3040, 2, 2, 149, 150, 'AdrianaCarla4350@gmail.com', 196, 215, '2022-02-09 21:31:31', '2022-02-09 21:31:31'),
(76, 'Bray Eleanor', '1980-05-17', 'd86fb66c1156c75e464a3f01407eb028.jpg', 1, 0, 1995, 4, 1, 151, 152, 'BrayEleanor4028@yoopmail.com', 174, 218, '2022-02-09 21:31:32', '2022-02-09 21:31:32'),
(77, 'Wyatt Bray', '1974-05-30', 'aa3917a06ebd02255e580b25897d6540.jpg', 1, 0, 2332, 4, 2, 153, 154, 'WyattBray2340@outlooh.com', 195, 229, '2022-02-09 21:31:32', '2022-02-09 21:31:32'),
(78, 'Keith Shayna', '2002-05-09', 'c95dba8a0c7b8601cb984731a5d34960.jpg', 1, 0, 3965, 5, 2, 155, 156, 'KeithShayna2013@outlooh.com', 181, 77, '2022-02-09 21:31:33', '2022-02-09 21:31:33'),
(79, 'Cassia Laiza', '1985-05-13', '0ec37651f6a85c7bc37dacbe6b3efee2.jpg', 1, 0, 53, 1, 3, 157, 158, 'CassiaLaiza1626@outlooh.com', 186, 93, '2022-02-09 21:31:35', '2022-02-09 21:31:35'),
(80, 'Fernando Judith', '1996-05-19', '5e295c83f32e3ffeb61f2cc7ed4f2536.jpg', 1, 0, 21, 6, 3, 159, 160, 'FernandoJudith3309@yoopmail.com', 186, 101, '2022-02-09 21:31:36', '2022-02-09 21:31:36'),
(81, 'Goldberg Ândrea', '2008-05-22', 'e36a4360b17bb2d22685cd174861d5ab.jpg', 1, 0, 727, 6, 2, 161, 162, 'GoldbergÂndrea1475@gmail.com', 144, 190, '2022-02-09 21:31:36', '2022-02-09 21:31:37'),
(82, 'Arnaldo Dale', '1999-05-04', '58bb33b03d1dccdb7df8343b171a5f9c.jpg', 1, 0, 3469, 1, 1, 163, 164, 'ArnaldoDale4725@yoopmail.com', 167, 56, '2022-02-09 21:31:37', '2022-02-09 21:31:37'),
(83, 'Kay João', '2005-05-14', '902afe2adb37f414b2201db123789f00.jpg', 1, 0, 4498, 6, 2, 165, 166, 'KayJoão2907@outlooh.com', 186, 54, '2022-02-09 21:31:38', '2022-02-09 21:31:38'),
(84, 'Neymar Amanda', '2011-05-24', '0cd8fdda01f0e9975fdb10cbe8b5f003.jpg', 1, 0, 74, 4, 3, 167, 168, 'NeymarAmanda4984@yoopmail.com', 189, 62, '2022-02-09 21:31:38', '2022-02-09 21:31:39'),
(85, 'Lee Helga', '2020-05-07', '12799e1ed540add2e539667c3d3fb003.jpg', 1, 0, 2645, 1, 2, 169, 170, 'LeeHelga4917@yoopmail.com', 200, 234, '2022-02-09 21:31:39', '2022-02-09 21:31:40'),
(86, 'Fernando Connie', '1979-01-09', '6dc3c4ffc3e67373a2ae708947106c76.jpg', 1, 0, 2256, 4, 1, 171, 172, 'FernandoConnie4416@hotmail.com', 174, 79, '2022-02-09 21:31:40', '2022-02-09 21:31:41'),
(87, 'Baszler Ivan', '1974-05-11', 'a42746ea2fd6b9a9a43516ef6c5baa19.jpg', 1, 0, 4378, 6, 3, 173, 174, 'BaszlerIvan4078@outlooh.com', 183, 115, '2022-02-09 21:31:41', '2022-02-09 21:31:41'),
(88, 'Luana Clementine', '2010-05-10', 'f0b9219d4d238847d1e7ee1d71b8a2cd.jpg', 1, 0, 2986, 3, 3, 175, 176, 'LuanaClementine3924@hotmail.com', 150, 68, '2022-02-09 21:31:42', '2022-02-09 21:31:42'),
(89, 'Amanda Viollet', '2006-01-30', '3719d362db8b31ea7fe3952e1fe3f1bc.jpg', 1, 0, 4930, 5, 1, 177, 178, 'AmandaViollet1656@outlooh.com', 152, 149, '2022-02-09 21:31:44', '2022-02-09 21:31:44'),
(90, 'Beta Larice', '2007-05-17', '23cf2e0c6a2b68f3c83df1d7e80f11ea.jpg', 1, 0, 2316, 4, 3, 179, 180, 'BetaLarice1934@hotmail.com', 145, 107, '2022-02-09 21:31:44', '2022-02-09 21:31:44'),
(91, 'Adriana Mitch', '2006-05-31', '10a5188e1544e4d9b4694c4c38c99de0.jpg', 1, 0, 709, 6, 2, 181, 182, 'AdrianaMitch309@outlooh.com', 142, 260, '2022-02-09 21:31:45', '2022-02-09 21:31:45'),
(92, 'Armando Kay', '1978-05-17', 'b49241f01e98c4df42fe1da7bf49dd91.jpg', 1, 0, 2777, 4, 3, 183, 184, 'ArmandoKay4883@hotmail.com', 147, 119, '2022-02-09 21:31:46', '2022-02-09 21:31:46'),
(93, 'Braun Dunilson', '1975-05-29', '5de5365508f00b6f75240c6c9dfd1bdc.jpg', 1, 0, 2962, 5, 2, 185, 186, 'BraunDunilson3627@outlooh.com', 161, 281, '2022-02-09 21:31:47', '2022-02-09 21:31:47'),
(94, 'Messi Magna', '2007-05-29', '347591710c7dd13c0f8b5d273ad73f1c.jpg', 1, 0, 4816, 3, 1, 187, 188, 'MessiMagna725@outlooh.com', 188, 139, '2022-02-09 21:31:47', '2022-02-09 21:31:48'),
(95, 'Bray Carla', '2011-01-18', '4bed6b85a9315fd74691886033aed2af.jpg', 1, 0, 2120, 5, 2, 189, 190, 'BrayCarla4524@hotmail.com', 148, 69, '2022-02-09 21:31:50', '2022-02-09 21:31:51'),
(96, 'Lee Clementine', '1995-05-15', '0dda407011cadf022a3652ca86ff8e01.jpg', 1, 0, 2760, 2, 3, 191, 192, 'LeeClementine2104@hotmail.com', 183, 296, '2022-02-09 21:31:51', '2022-02-09 21:31:51'),
(97, 'Lee Dias', '1988-03-18', '63413b743c822ff47505e57ecf34dacd.jpg', 1, 0, 3879, 1, 2, 193, 194, 'LeeDias360@gmail.com', 185, 199, '2022-02-09 21:31:52', '2022-02-09 21:31:52'),
(98, 'Baszler Adriana', '1993-05-26', '0de0b915d179b5c30a1e41c08fb461cb.jpg', 1, 0, 947, 5, 2, 195, 196, 'BaszlerAdriana863@gmail.com', 197, 299, '2022-02-09 21:31:52', '2022-02-09 21:31:53'),
(100, 'Alexa Margarida', '2010-05-31', '7ebfc335da8a10d6ab3633cfd261b3c9.jpg', 1, 0, 4384, 6, 1, 199, 200, 'AlexaMargarida3235@yoopmail.com', 153, 289, '2022-02-09 21:31:56', '2022-02-09 21:31:56');

-- --------------------------------------------------------

--
-- Estrutura da tabela `descricao`
--

CREATE TABLE `descricao` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `desaparecido_id` bigint(20) UNSIGNED NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `descricao`
--

INSERT INTO `descricao` (`id`, `desaparecido_id`, `descricao`, `created_at`, `updated_at`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:30:24', '2022-02-09 21:30:24'),
(2, 2, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:30:27', '2022-02-09 21:30:27'),
(3, 3, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:30:28', '2022-02-09 21:30:28'),
(4, 4, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:30:29', '2022-02-09 21:30:29'),
(5, 5, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:30:30', '2022-02-09 21:30:30'),
(6, 6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:30:31', '2022-02-09 21:30:31'),
(7, 7, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:30:35', '2022-02-09 21:30:35'),
(8, 8, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:30:36', '2022-02-09 21:30:36'),
(9, 9, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:30:37', '2022-02-09 21:30:37'),
(10, 10, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:30:37', '2022-02-09 21:30:37'),
(11, 11, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:30:38', '2022-02-09 21:30:38'),
(12, 12, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:30:39', '2022-02-09 21:30:39'),
(13, 13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:30:40', '2022-02-09 21:30:40'),
(14, 14, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:30:40', '2022-02-09 21:30:40'),
(15, 15, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:30:41', '2022-02-09 21:30:41'),
(16, 16, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:30:42', '2022-02-09 21:30:42'),
(17, 17, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:30:43', '2022-02-09 21:30:43'),
(18, 18, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:30:43', '2022-02-09 21:30:43'),
(19, 19, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:30:44', '2022-02-09 21:30:44'),
(20, 20, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:30:44', '2022-02-09 21:30:44'),
(21, 21, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:30:45', '2022-02-09 21:30:45'),
(22, 22, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:30:46', '2022-02-09 21:30:46'),
(23, 23, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:30:46', '2022-02-09 21:30:46'),
(24, 24, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:30:47', '2022-02-09 21:30:47'),
(25, 25, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:30:48', '2022-02-09 21:30:48'),
(26, 26, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:30:49', '2022-02-09 21:30:49'),
(27, 27, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:30:50', '2022-02-09 21:30:50'),
(28, 28, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:30:51', '2022-02-09 21:30:51'),
(29, 29, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:30:51', '2022-02-09 21:30:51'),
(30, 30, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:30:52', '2022-02-09 21:30:52'),
(31, 31, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:30:53', '2022-02-09 21:30:53'),
(32, 32, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:30:54', '2022-02-09 21:30:54'),
(33, 33, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:30:54', '2022-02-09 21:30:54'),
(34, 34, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:30:55', '2022-02-09 21:30:55'),
(35, 35, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:30:56', '2022-02-09 21:30:56'),
(36, 36, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:30:56', '2022-02-09 21:30:56'),
(37, 37, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:30:57', '2022-02-09 21:30:57'),
(38, 38, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:30:58', '2022-02-09 21:30:58'),
(39, 39, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:30:59', '2022-02-09 21:30:59'),
(40, 40, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:00', '2022-02-09 21:31:00'),
(41, 41, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:01', '2022-02-09 21:31:01'),
(42, 42, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:31:01', '2022-02-09 21:31:01');
INSERT INTO `descricao` (`id`, `desaparecido_id`, `descricao`, `created_at`, `updated_at`) VALUES
(43, 43, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:31:02', '2022-02-09 21:31:02'),
(44, 44, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:03', '2022-02-09 21:31:03'),
(45, 45, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:31:04', '2022-02-09 21:31:04'),
(46, 46, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:05', '2022-02-09 21:31:05'),
(47, 47, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:05', '2022-02-09 21:31:05'),
(48, 48, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:31:06', '2022-02-09 21:31:06'),
(49, 49, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:31:07', '2022-02-09 21:31:07'),
(50, 50, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:31:08', '2022-02-09 21:31:08'),
(51, 51, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:09', '2022-02-09 21:31:09'),
(52, 52, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:10', '2022-02-09 21:31:10'),
(53, 53, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:31:11', '2022-02-09 21:31:11'),
(54, 54, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:31:12', '2022-02-09 21:31:12'),
(55, 55, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:12', '2022-02-09 21:31:12'),
(56, 56, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:31:14', '2022-02-09 21:31:14'),
(57, 57, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:14', '2022-02-09 21:31:14'),
(58, 58, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:31:15', '2022-02-09 21:31:15'),
(59, 59, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:16', '2022-02-09 21:31:16'),
(60, 60, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:31:17', '2022-02-09 21:31:17'),
(61, 61, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:18', '2022-02-09 21:31:18'),
(62, 62, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:19', '2022-02-09 21:31:19'),
(63, 63, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:20', '2022-02-09 21:31:20'),
(64, 64, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:21', '2022-02-09 21:31:21'),
(65, 65, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:23', '2022-02-09 21:31:23'),
(66, 66, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:23', '2022-02-09 21:31:23'),
(67, 67, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:24', '2022-02-09 21:31:24'),
(68, 68, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:26', '2022-02-09 21:31:26'),
(69, 69, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:31:26', '2022-02-09 21:31:26'),
(70, 70, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:27', '2022-02-09 21:31:27'),
(71, 71, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:28', '2022-02-09 21:31:28'),
(72, 72, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:29', '2022-02-09 21:31:29'),
(73, 73, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:31:29', '2022-02-09 21:31:29'),
(74, 74, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:31:30', '2022-02-09 21:31:30'),
(75, 75, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:31', '2022-02-09 21:31:31'),
(76, 76, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:32', '2022-02-09 21:31:32'),
(77, 77, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:31:32', '2022-02-09 21:31:32'),
(78, 78, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:31:33', '2022-02-09 21:31:33'),
(79, 79, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:35', '2022-02-09 21:31:35'),
(80, 80, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:31:36', '2022-02-09 21:31:36'),
(81, 81, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:31:37', '2022-02-09 21:31:37'),
(82, 82, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:31:37', '2022-02-09 21:31:37'),
(83, 83, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:31:38', '2022-02-09 21:31:38'),
(84, 84, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:39', '2022-02-09 21:31:39');
INSERT INTO `descricao` (`id`, `desaparecido_id`, `descricao`, `created_at`, `updated_at`) VALUES
(85, 85, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:39', '2022-02-09 21:31:39'),
(86, 86, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:40', '2022-02-09 21:31:40'),
(87, 87, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:31:41', '2022-02-09 21:31:41'),
(88, 88, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-02-09 21:31:42', '2022-02-09 21:31:42'),
(89, 89, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:31:44', '2022-02-09 21:31:44'),
(90, 90, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:31:44', '2022-02-09 21:31:44'),
(91, 91, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:31:45', '2022-02-09 21:31:45'),
(92, 92, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:31:46', '2022-02-09 21:31:46'),
(93, 93, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:47', '2022-02-09 21:31:47'),
(94, 94, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:31:48', '2022-02-09 21:31:48'),
(95, 95, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-02-09 21:31:51', '2022-02-09 21:31:51'),
(96, 96, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:31:51', '2022-02-09 21:31:51'),
(97, 97, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-02-09 21:31:52', '2022-02-09 21:31:52'),
(98, 98, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-02-09 21:31:53', '2022-02-09 21:31:53'),
(100, 100, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-02-09 21:31:56', '2022-02-09 21:31:56');

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

CREATE TABLE `mensagem` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_mensagem_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_06_004843_create_comuna', 1),
(6, '2022_02_06_005200_create_newsletter', 1),
(7, '2022_02_06_005437_create_assunto_mensagem', 1),
(8, '2022_02_06_005558_create_mensagem', 1),
(9, '2022_02_06_011220_create_responsavel_telemovel', 1),
(10, '2022_02_06_011327_create_desaparecido', 1),
(11, '2022_02_06_012524_create_descricao', 1),
(12, '2022_02_06_012710_create_comentario', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsletter`
--

CREATE TABLE `newsletter` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `responsavel_telemovel`
--

CREATE TABLE `responsavel_telemovel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `telemovel` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `responsavel_telemovel`
--

INSERT INTO `responsavel_telemovel` (`id`, `telemovel`, `created_at`, `updated_at`) VALUES
(1, 920692408, '2022-02-09 21:30:24', '2022-02-09 21:30:24'),
(2, 946083378, '2022-02-09 21:30:24', '2022-02-09 21:30:24'),
(3, 969626248, '2022-02-09 21:30:27', '2022-02-09 21:30:27'),
(4, 965838454, '2022-02-09 21:30:27', '2022-02-09 21:30:27'),
(5, 944494192, '2022-02-09 21:30:28', '2022-02-09 21:30:28'),
(6, 927588396, '2022-02-09 21:30:28', '2022-02-09 21:30:28'),
(7, 985901301, '2022-02-09 21:30:29', '2022-02-09 21:30:29'),
(8, 960896927, '2022-02-09 21:30:29', '2022-02-09 21:30:29'),
(9, 952661252, '2022-02-09 21:30:30', '2022-02-09 21:30:30'),
(10, 934777107, '2022-02-09 21:30:30', '2022-02-09 21:30:30'),
(11, 911078939, '2022-02-09 21:30:31', '2022-02-09 21:30:31'),
(12, 900281600, '2022-02-09 21:30:31', '2022-02-09 21:30:31'),
(13, 962208837, '2022-02-09 21:30:35', '2022-02-09 21:30:35'),
(14, 989925546, '2022-02-09 21:30:35', '2022-02-09 21:30:35'),
(15, 940664230, '2022-02-09 21:30:36', '2022-02-09 21:30:36'),
(16, 921386673, '2022-02-09 21:30:36', '2022-02-09 21:30:36'),
(17, 946500218, '2022-02-09 21:30:37', '2022-02-09 21:30:37'),
(18, 999193479, '2022-02-09 21:30:37', '2022-02-09 21:30:37'),
(19, 964356730, '2022-02-09 21:30:37', '2022-02-09 21:30:37'),
(20, 981955975, '2022-02-09 21:30:37', '2022-02-09 21:30:37'),
(21, 965576988, '2022-02-09 21:30:38', '2022-02-09 21:30:38'),
(22, 984054693, '2022-02-09 21:30:38', '2022-02-09 21:30:38'),
(23, 944690584, '2022-02-09 21:30:39', '2022-02-09 21:30:39'),
(24, 980132942, '2022-02-09 21:30:39', '2022-02-09 21:30:39'),
(25, 925389430, '2022-02-09 21:30:40', '2022-02-09 21:30:40'),
(26, 994252665, '2022-02-09 21:30:40', '2022-02-09 21:30:40'),
(27, 996168132, '2022-02-09 21:30:40', '2022-02-09 21:30:40'),
(28, 969573358, '2022-02-09 21:30:40', '2022-02-09 21:30:40'),
(29, 984447853, '2022-02-09 21:30:41', '2022-02-09 21:30:41'),
(30, 992367368, '2022-02-09 21:30:41', '2022-02-09 21:30:41'),
(31, 924791310, '2022-02-09 21:30:42', '2022-02-09 21:30:42'),
(32, 940092578, '2022-02-09 21:30:42', '2022-02-09 21:30:42'),
(33, 931519332, '2022-02-09 21:30:43', '2022-02-09 21:30:43'),
(34, 976601920, '2022-02-09 21:30:43', '2022-02-09 21:30:43'),
(35, 970471694, '2022-02-09 21:30:43', '2022-02-09 21:30:43'),
(36, 959869619, '2022-02-09 21:30:43', '2022-02-09 21:30:43'),
(37, 950089592, '2022-02-09 21:30:44', '2022-02-09 21:30:44'),
(38, 909255515, '2022-02-09 21:30:44', '2022-02-09 21:30:44'),
(39, 995433250, '2022-02-09 21:30:44', '2022-02-09 21:30:44'),
(40, 926769692, '2022-02-09 21:30:44', '2022-02-09 21:30:44'),
(41, 905351990, '2022-02-09 21:30:45', '2022-02-09 21:30:45'),
(42, 970452401, '2022-02-09 21:30:45', '2022-02-09 21:30:45'),
(43, 991359809, '2022-02-09 21:30:46', '2022-02-09 21:30:46'),
(44, 908697225, '2022-02-09 21:30:46', '2022-02-09 21:30:46'),
(45, 920308586, '2022-02-09 21:30:46', '2022-02-09 21:30:46'),
(46, 999878357, '2022-02-09 21:30:46', '2022-02-09 21:30:46'),
(47, 963636865, '2022-02-09 21:30:47', '2022-02-09 21:30:47'),
(48, 997236155, '2022-02-09 21:30:47', '2022-02-09 21:30:47'),
(49, 971801102, '2022-02-09 21:30:48', '2022-02-09 21:30:48'),
(50, 939693544, '2022-02-09 21:30:48', '2022-02-09 21:30:48'),
(51, 923234330, '2022-02-09 21:30:49', '2022-02-09 21:30:49'),
(52, 929527930, '2022-02-09 21:30:49', '2022-02-09 21:30:49'),
(53, 956966572, '2022-02-09 21:30:50', '2022-02-09 21:30:50'),
(54, 960187854, '2022-02-09 21:30:50', '2022-02-09 21:30:50'),
(55, 941556196, '2022-02-09 21:30:50', '2022-02-09 21:30:50'),
(56, 933842251, '2022-02-09 21:30:51', '2022-02-09 21:30:51'),
(57, 940049090, '2022-02-09 21:30:51', '2022-02-09 21:30:51'),
(58, 903551062, '2022-02-09 21:30:51', '2022-02-09 21:30:51'),
(59, 917996848, '2022-02-09 21:30:52', '2022-02-09 21:30:52'),
(60, 948356230, '2022-02-09 21:30:52', '2022-02-09 21:30:52'),
(61, 913692990, '2022-02-09 21:30:53', '2022-02-09 21:30:53'),
(62, 987560663, '2022-02-09 21:30:53', '2022-02-09 21:30:53'),
(63, 970881505, '2022-02-09 21:30:54', '2022-02-09 21:30:54'),
(64, 928093496, '2022-02-09 21:30:54', '2022-02-09 21:30:54'),
(65, 956511167, '2022-02-09 21:30:54', '2022-02-09 21:30:54'),
(66, 985508419, '2022-02-09 21:30:54', '2022-02-09 21:30:54'),
(67, 961440226, '2022-02-09 21:30:55', '2022-02-09 21:30:55'),
(68, 988164239, '2022-02-09 21:30:55', '2022-02-09 21:30:55'),
(69, 906536128, '2022-02-09 21:30:56', '2022-02-09 21:30:56'),
(70, 956621617, '2022-02-09 21:30:56', '2022-02-09 21:30:56'),
(71, 942843459, '2022-02-09 21:30:56', '2022-02-09 21:30:56'),
(72, 911477600, '2022-02-09 21:30:56', '2022-02-09 21:30:56'),
(73, 962508300, '2022-02-09 21:30:57', '2022-02-09 21:30:57'),
(74, 930523069, '2022-02-09 21:30:57', '2022-02-09 21:30:57'),
(75, 939098167, '2022-02-09 21:30:58', '2022-02-09 21:30:58'),
(76, 934375455, '2022-02-09 21:30:58', '2022-02-09 21:30:58'),
(77, 949948361, '2022-02-09 21:30:59', '2022-02-09 21:30:59'),
(78, 993537122, '2022-02-09 21:30:59', '2022-02-09 21:30:59'),
(79, 920527497, '2022-02-09 21:31:00', '2022-02-09 21:31:00'),
(80, 923587949, '2022-02-09 21:31:00', '2022-02-09 21:31:00'),
(81, 962522306, '2022-02-09 21:31:01', '2022-02-09 21:31:01'),
(82, 914378958, '2022-02-09 21:31:01', '2022-02-09 21:31:01'),
(83, 907441030, '2022-02-09 21:31:01', '2022-02-09 21:31:01'),
(84, 919780114, '2022-02-09 21:31:01', '2022-02-09 21:31:01'),
(85, 923132623, '2022-02-09 21:31:02', '2022-02-09 21:31:02'),
(86, 924601893, '2022-02-09 21:31:02', '2022-02-09 21:31:02'),
(87, 957463914, '2022-02-09 21:31:03', '2022-02-09 21:31:03'),
(88, 912595363, '2022-02-09 21:31:03', '2022-02-09 21:31:03'),
(89, 982781740, '2022-02-09 21:31:04', '2022-02-09 21:31:04'),
(90, 953014690, '2022-02-09 21:31:04', '2022-02-09 21:31:04'),
(91, 953981625, '2022-02-09 21:31:05', '2022-02-09 21:31:05'),
(92, 990401980, '2022-02-09 21:31:05', '2022-02-09 21:31:05'),
(93, 984768054, '2022-02-09 21:31:05', '2022-02-09 21:31:05'),
(94, 985175400, '2022-02-09 21:31:05', '2022-02-09 21:31:05'),
(95, 936645568, '2022-02-09 21:31:06', '2022-02-09 21:31:06'),
(96, 905803035, '2022-02-09 21:31:06', '2022-02-09 21:31:06'),
(97, 914264768, '2022-02-09 21:31:07', '2022-02-09 21:31:07'),
(98, 981177008, '2022-02-09 21:31:07', '2022-02-09 21:31:07'),
(99, 902741572, '2022-02-09 21:31:08', '2022-02-09 21:31:08'),
(100, 926413835, '2022-02-09 21:31:08', '2022-02-09 21:31:08'),
(101, 969417800, '2022-02-09 21:31:09', '2022-02-09 21:31:09'),
(102, 970678203, '2022-02-09 21:31:09', '2022-02-09 21:31:09'),
(103, 948021557, '2022-02-09 21:31:09', '2022-02-09 21:31:09'),
(104, 963784950, '2022-02-09 21:31:10', '2022-02-09 21:31:10'),
(105, 969575210, '2022-02-09 21:31:11', '2022-02-09 21:31:11'),
(106, 970351360, '2022-02-09 21:31:11', '2022-02-09 21:31:11'),
(107, 927261203, '2022-02-09 21:31:11', '2022-02-09 21:31:11'),
(108, 997051889, '2022-02-09 21:31:11', '2022-02-09 21:31:11'),
(109, 945652974, '2022-02-09 21:31:12', '2022-02-09 21:31:12'),
(110, 949188028, '2022-02-09 21:31:12', '2022-02-09 21:31:12'),
(111, 991915021, '2022-02-09 21:31:13', '2022-02-09 21:31:13'),
(112, 900094766, '2022-02-09 21:31:13', '2022-02-09 21:31:13'),
(113, 961230296, '2022-02-09 21:31:14', '2022-02-09 21:31:14'),
(114, 919751915, '2022-02-09 21:31:14', '2022-02-09 21:31:14'),
(115, 961216074, '2022-02-09 21:31:15', '2022-02-09 21:31:15'),
(116, 998971025, '2022-02-09 21:31:15', '2022-02-09 21:31:15'),
(117, 905738854, '2022-02-09 21:31:16', '2022-02-09 21:31:16'),
(118, 935453690, '2022-02-09 21:31:16', '2022-02-09 21:31:16'),
(119, 908872760, '2022-02-09 21:31:17', '2022-02-09 21:31:17'),
(120, 970988133, '2022-02-09 21:31:17', '2022-02-09 21:31:17'),
(121, 928361579, '2022-02-09 21:31:18', '2022-02-09 21:31:18'),
(122, 947615159, '2022-02-09 21:31:18', '2022-02-09 21:31:18'),
(123, 964880988, '2022-02-09 21:31:19', '2022-02-09 21:31:19'),
(124, 947493682, '2022-02-09 21:31:19', '2022-02-09 21:31:19'),
(125, 937069747, '2022-02-09 21:31:20', '2022-02-09 21:31:20'),
(126, 996921935, '2022-02-09 21:31:20', '2022-02-09 21:31:20'),
(127, 926326314, '2022-02-09 21:31:21', '2022-02-09 21:31:21'),
(128, 962671352, '2022-02-09 21:31:21', '2022-02-09 21:31:21'),
(129, 909921272, '2022-02-09 21:31:23', '2022-02-09 21:31:23'),
(130, 904262835, '2022-02-09 21:31:23', '2022-02-09 21:31:23'),
(131, 984305053, '2022-02-09 21:31:23', '2022-02-09 21:31:23'),
(132, 933806226, '2022-02-09 21:31:23', '2022-02-09 21:31:23'),
(133, 936756788, '2022-02-09 21:31:24', '2022-02-09 21:31:24'),
(134, 980801222, '2022-02-09 21:31:24', '2022-02-09 21:31:24'),
(135, 962053058, '2022-02-09 21:31:26', '2022-02-09 21:31:26'),
(136, 918221597, '2022-02-09 21:31:26', '2022-02-09 21:31:26'),
(137, 932264208, '2022-02-09 21:31:26', '2022-02-09 21:31:26'),
(138, 995917125, '2022-02-09 21:31:26', '2022-02-09 21:31:26'),
(139, 901519964, '2022-02-09 21:31:27', '2022-02-09 21:31:27'),
(140, 923806516, '2022-02-09 21:31:27', '2022-02-09 21:31:27'),
(141, 978256178, '2022-02-09 21:31:28', '2022-02-09 21:31:28'),
(142, 947504867, '2022-02-09 21:31:28', '2022-02-09 21:31:28'),
(143, 916937480, '2022-02-09 21:31:29', '2022-02-09 21:31:29'),
(144, 935236386, '2022-02-09 21:31:29', '2022-02-09 21:31:29'),
(145, 966460388, '2022-02-09 21:31:29', '2022-02-09 21:31:29'),
(146, 985807719, '2022-02-09 21:31:29', '2022-02-09 21:31:29'),
(147, 945720245, '2022-02-09 21:31:30', '2022-02-09 21:31:30'),
(148, 965615697, '2022-02-09 21:31:30', '2022-02-09 21:31:30'),
(149, 978511749, '2022-02-09 21:31:31', '2022-02-09 21:31:31'),
(150, 909266171, '2022-02-09 21:31:31', '2022-02-09 21:31:31'),
(151, 931754771, '2022-02-09 21:31:32', '2022-02-09 21:31:32'),
(152, 932242611, '2022-02-09 21:31:32', '2022-02-09 21:31:32'),
(153, 982726496, '2022-02-09 21:31:32', '2022-02-09 21:31:32'),
(154, 984163844, '2022-02-09 21:31:32', '2022-02-09 21:31:32'),
(155, 931431126, '2022-02-09 21:31:33', '2022-02-09 21:31:33'),
(156, 948872770, '2022-02-09 21:31:33', '2022-02-09 21:31:33'),
(157, 931601988, '2022-02-09 21:31:35', '2022-02-09 21:31:35'),
(158, 942628620, '2022-02-09 21:31:35', '2022-02-09 21:31:35'),
(159, 959264850, '2022-02-09 21:31:36', '2022-02-09 21:31:36'),
(160, 928288408, '2022-02-09 21:31:36', '2022-02-09 21:31:36'),
(161, 974441647, '2022-02-09 21:31:36', '2022-02-09 21:31:36'),
(162, 951603975, '2022-02-09 21:31:36', '2022-02-09 21:31:36'),
(163, 949486070, '2022-02-09 21:31:37', '2022-02-09 21:31:37'),
(164, 944991263, '2022-02-09 21:31:37', '2022-02-09 21:31:37'),
(165, 936053211, '2022-02-09 21:31:38', '2022-02-09 21:31:38'),
(166, 923061797, '2022-02-09 21:31:38', '2022-02-09 21:31:38'),
(167, 952439145, '2022-02-09 21:31:38', '2022-02-09 21:31:38'),
(168, 974695712, '2022-02-09 21:31:39', '2022-02-09 21:31:39'),
(169, 986416060, '2022-02-09 21:31:39', '2022-02-09 21:31:39'),
(170, 908201658, '2022-02-09 21:31:39', '2022-02-09 21:31:39'),
(171, 941537211, '2022-02-09 21:31:40', '2022-02-09 21:31:40'),
(172, 971627958, '2022-02-09 21:31:40', '2022-02-09 21:31:40'),
(173, 960934478, '2022-02-09 21:31:41', '2022-02-09 21:31:41'),
(174, 915641934, '2022-02-09 21:31:41', '2022-02-09 21:31:41'),
(175, 965674297, '2022-02-09 21:31:42', '2022-02-09 21:31:42'),
(176, 964647709, '2022-02-09 21:31:42', '2022-02-09 21:31:42'),
(177, 935712154, '2022-02-09 21:31:44', '2022-02-09 21:31:44'),
(178, 962521807, '2022-02-09 21:31:44', '2022-02-09 21:31:44'),
(179, 914200538, '2022-02-09 21:31:44', '2022-02-09 21:31:44'),
(180, 966620169, '2022-02-09 21:31:44', '2022-02-09 21:31:44'),
(181, 951145836, '2022-02-09 21:31:45', '2022-02-09 21:31:45'),
(182, 906583925, '2022-02-09 21:31:45', '2022-02-09 21:31:45'),
(183, 983975790, '2022-02-09 21:31:46', '2022-02-09 21:31:46'),
(184, 952843619, '2022-02-09 21:31:46', '2022-02-09 21:31:46'),
(185, 913969621, '2022-02-09 21:31:47', '2022-02-09 21:31:47'),
(186, 960815995, '2022-02-09 21:31:47', '2022-02-09 21:31:47'),
(187, 940690306, '2022-02-09 21:31:48', '2022-02-09 21:31:48'),
(188, 922262072, '2022-02-09 21:31:48', '2022-02-09 21:31:48'),
(189, 988478282, '2022-02-09 21:31:50', '2022-02-09 21:31:50'),
(190, 917250323, '2022-02-09 21:31:50', '2022-02-09 21:31:50'),
(191, 997925638, '2022-02-09 21:31:51', '2022-02-09 21:31:51'),
(192, 982828656, '2022-02-09 21:31:51', '2022-02-09 21:31:51'),
(193, 942004465, '2022-02-09 21:31:52', '2022-02-09 21:31:52'),
(194, 959372848, '2022-02-09 21:31:52', '2022-02-09 21:31:52'),
(195, 974783302, '2022-02-09 21:31:52', '2022-02-09 21:31:52'),
(196, 985899045, '2022-02-09 21:31:52', '2022-02-09 21:31:52'),
(199, 931559817, '2022-02-09 21:31:56', '2022-02-09 21:31:56'),
(200, 922990738, '2022-02-09 21:31:56', '2022-02-09 21:31:56');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telemovel` int(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `nome`, `email`, `telemovel`, `data_nascimento`, `password`, `admin`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', 947991792, '2003-07-27', '$2y$10$mnC0O1QHsNFJHyOi/j9QvuOxT0NfC2FEQSJjrxbH/9DYWfCbwM6OS', 1, '2022-02-09 23:02:36', '2022-02-09 23:02:36'),
(2, 'Larice Mateus', 'laricemateus@gmail.com', 945776912, '2002-07-05', '$2y$10$JPR0O7F7tRh3TsvONVIeH.pw5eljaZuuWwJiyjSm0zoh262PHir6i', 0, '2022-02-09 23:03:21', '2022-02-09 23:03:21'),
(3, 'Loyde Astride', 'loyde@gmail.com', 912568312, '2003-02-19', '$2y$10$XHniXfB/0NaStFn4omwSuuI4R2oGqe5sLeKxkXva1bYwLVVma9z7q', 0, '2022-02-09 23:03:55', '2022-02-09 23:03:55'),
(4, 'Adriana Dembele', 'adrianadembele19@gmail.com', 938098834, '2004-02-09', '$2y$10$3UMAzzcdot43QmeJIFjk2.u2LKLUbRVqn0W3KvnW4OxTI1tIex2BG', 0, '2022-02-09 23:04:39', '2022-02-09 23:04:39');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `assunto_mensagem`
--
ALTER TABLE `assunto_mensagem`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comentario_desaparecido_id_foreign` (`desaparecido_id`),
  ADD KEY `comentario_user_id_foreign` (`user_id`);

--
-- Índices para tabela `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `comuna_comuna_unique` (`comuna`);

--
-- Índices para tabela `desaparecido`
--
ALTER TABLE `desaparecido`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `desaparecido_email_unique` (`email`),
  ADD KEY `desaparecido_comuna_id_foreign` (`comuna_id`),
  ADD KEY `desaparecido_user_id_foreign` (`user_id`),
  ADD KEY `desaparecido_responsavel_telemovel1_id_foreign` (`responsavel_telemovel1_id`),
  ADD KEY `desaparecido_responsavel_telemovel2_id_foreign` (`responsavel_telemovel2_id`);

--
-- Índices para tabela `descricao`
--
ALTER TABLE `descricao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `descricao_desaparecido_id_foreign` (`desaparecido_id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `mensagem`
--
ALTER TABLE `mensagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mensagem_usuario_mensagem_id_foreign` (`usuario_mensagem_id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletter_email_unique` (`email`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `responsavel_telemovel`
--
ALTER TABLE `responsavel_telemovel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `responsavel_telemovel_telemovel_unique` (`telemovel`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_telemovel_unique` (`telemovel`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `assunto_mensagem`
--
ALTER TABLE `assunto_mensagem`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `comuna`
--
ALTER TABLE `comuna`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `desaparecido`
--
ALTER TABLE `desaparecido`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de tabela `descricao`
--
ALTER TABLE `descricao`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mensagem`
--
ALTER TABLE `mensagem`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `responsavel_telemovel`
--
ALTER TABLE `responsavel_telemovel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_desaparecido_id_foreign` FOREIGN KEY (`desaparecido_id`) REFERENCES `desaparecido` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comentario_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `desaparecido`
--
ALTER TABLE `desaparecido`
  ADD CONSTRAINT `desaparecido_comuna_id_foreign` FOREIGN KEY (`comuna_id`) REFERENCES `comuna` (`id`),
  ADD CONSTRAINT `desaparecido_responsavel_telemovel1_id_foreign` FOREIGN KEY (`responsavel_telemovel1_id`) REFERENCES `responsavel_telemovel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `desaparecido_responsavel_telemovel2_id_foreign` FOREIGN KEY (`responsavel_telemovel2_id`) REFERENCES `responsavel_telemovel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `desaparecido_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `descricao`
--
ALTER TABLE `descricao`
  ADD CONSTRAINT `descricao_desaparecido_id_foreign` FOREIGN KEY (`desaparecido_id`) REFERENCES `desaparecido` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `mensagem`
--
ALTER TABLE `mensagem`
  ADD CONSTRAINT `mensagem_usuario_mensagem_id_foreign` FOREIGN KEY (`usuario_mensagem_id`) REFERENCES `assunto_mensagem` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
