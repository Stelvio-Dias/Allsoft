USE [master];
GO

DROP DATABASE [MISSING_PEOPLE];
GO

CREATE DATABASE [MISSING_PEOPLE];
GO

USE [MISSING_PEOPLE];
GO

CREATE TABLE [users] (
	[id] BIGINT NOT NULL,
	[nome] VARCHAR(50) NOT NULL,
	[email] VARCHAR(100) NOT NULL UNIQUE,
	[telemovel] INT NOT NULL UNIQUE,
	[data_nascimento] DATETIME2 NOT NULL,
	[password] VARCHAR(255) NOT NULL,
	[admin] TINYINT DEFAULT 0 NOT NULL,
	[active] TINYINT DEFAULT 0 NOT NULL,
	[created_at] DATETIME2 DEFAULT GETDATE(),
	[updated_at] DATETIME2 DEFAULT GETDATE(),
	CONSTRAINT PK_users_id PRIMARY KEY([id])
);
GO

CREATE TABLE [desaparecido] (
	[id] BIGINT NOT NULL,
	[nome] VARCHAR(50) NOT NULL,
	[data_nascimento] DATETIME2,
	[imagem] VARCHAR(255) DEFAULT 'default.jpg' NOT NULL,
	[aprovado] TINYINT DEFAULT 0 NOT NULL,
	[status] TINYINT DEFAULT 0 NOT NULL,
	[visualizacoes_qtd] BIGINT DEFAULT 0 NOT NULL,
	[comuna_id] BIGINT NOT NULL,
	[user_id] BIGINT NOT NULL,
	[responsavel_telemovel1_id] BIGINT UNIQUE,
	[responsavel_telemovel2_id] BIGINT UNIQUE,
	[email] VARCHAR(100),
	[altura] SMALLINT,
	[peso] FLOAT,
	[created_at] DATETIME2 DEFAULT GETDATE(),
	[updated_at] DATETIME2 DEFAULT GETDATE(),
	CONSTRAINT PK_desaparecido_id PRIMARY KEY ([id])
);
GO

CREATE PROCEDURE JoinDesaparecidoUser
AS
(
    SELECT D.nome, CONVERT(DATE, D.data_nascimento) AS DT, COUNT(*), U.nome FROM [desaparecido] D
    LEFT OUTER JOIN [users] U ON D.user_id = U.id
    WHERE U.admin = 1
    GROUP BY D.nome, D.data_nascimento, U.nome
);
GO
EXEC JoinDesaparecidoUser;
GO

CREATE TABLE [comentario] (
	[id] BIGINT NOT NULL,
	[comentario] TEXT NOT NULL,
	[desaparecido_id] BIGINT NOT NULL,
	[user_id] BIGINT NOT NULL,
	[created_at] DATETIME2 DEFAULT GETDATE(),
	[updated_at] DATETIME2 DEFAULT GETDATE(),
	CONSTRAINT PK_comentario_id PRIMARY KEY ([id])
);
GO

CREATE TABLE [descricao] (
	[id] BIGINT NOT NULL,
	[desaparecido_id] BIGINT NOT NULL,
	[descricao] TEXT NOT NULL,
	[created_at] DATETIME2 DEFAULT GETDATE(),
	[updated_at] DATETIME2 DEFAULT GETDATE(),
	CONSTRAINT PK_descricao_id PRIMARY KEY([id])
);
GO

CREATE TABLE [newsletter] (
	[id] BIGINT NOT NULL,
	[email] VARCHAR(100) NOT NULL UNIQUE,
	[created_at] DATETIME2 DEFAULT GETDATE(),
	[updated_at] DATETIME2 DEFAULT GETDATE(),
	CONSTRAINT PK_newsletter_id PRIMARY KEY ([id])
);
GO

CREATE TABLE [responsavel_telemovel] (
	[id] BIGINT NOT NULL,
	[telemovel] INT NOT NULL,
	[created_at] DATETIME2 DEFAULT GETDATE(),
	[updated_at] DATETIME2 DEFAULT GETDATE(),
	CONSTRAINT PK_responsavel_telemovel_id PRIMARY KEY ([id])
);
GO

CREATE TABLE [comuna] (
	[id] BIGINT NOT NULL,
	[comuna] VARCHAR(50) NOT NULL UNIQUE,
	[created_at] DATETIME2 DEFAULT GETDATE(),
	[updated_at] DATETIME2 DEFAULT GETDATE(),
	CONSTRAINT PK_comuna_id PRIMARY KEY([id])
);
GO

-- Chaves primárias
/* Desaparecido */
ALTER TABLE [desaparecido]
	ADD CONSTRAINT FK_responsavel_telemovel1_id FOREIGN KEY ([responsavel_telemovel1_id]) REFERENCES [responsavel_telemovel]([id]);
GO
ALTER TABLE [desaparecido]
	ADD CONSTRAINT FK_responsavel_telemovel2_id FOREIGN KEY ([responsavel_telemovel2_id]) REFERENCES [responsavel_telemovel]([id]);
GO
ALTER TABLE [desaparecido]
	ADD CONSTRAINT FK_comuna_id FOREIGN KEY ([comuna_id]) REFERENCES [comuna]([id]);
GO
ALTER TABLE [desaparecido]
	ADD CONSTRAINT FK_desaparecido_user_id FOREIGN KEY ([user_id]) REFERENCES [users]([id]);
GO
	
/* Comentario */
ALTER TABLE [comentario]
	ADD CONSTRAINT FK_desaparecido_id FOREIGN KEY ([desaparecido_id]) REFERENCES [desaparecido]([id]);
GO
ALTER TABLE [comentario]
	ADD CONSTRAINT FK_comentario_user_id FOREIGN KEY ([user_id]) REFERENCES [users]([id]);
GO

/* Descricao */
ALTER TABLE [descricao]
	ADD CONSTRAINT FK_descricao_id FOREIGN KEY ([desaparecido_id]) REFERENCES [desaparecido]([id]);
GO

/**********************************************
* Comentário
*
***********************************************/

ALTER TABLE [comentario] NOCHECK CONSTRAINT FK_desaparecido_id;
ALTER TABLE [comentario] NOCHECK CONSTRAINT FK_comentario_user_id;
INSERT INTO comentario (id, comentario, desaparecido_id, user_id, created_at, updated_at) VALUES
(1, 'Mostarda quente', 2, 1, '2022-04-01 23:21:49', '2022-04-01 23:21:49'),
(2, 'Maggots fallen is something awesome. lol', 35, 1, '2022-04-28 00:04:07', '2022-04-28 00:04:07'),
(3, 'Oh, que triste que ele desapareceu', 35, 1, '2022-04-28 00:04:28', '2022-04-28 00:04:28'),
(6, 'Nossa, que delicia!!!', 87, 1, '2022-05-09 02:05:38', '2022-05-09 02:05:38'),
(11, 'Olá', 46, 1, '2022-05-29 23:13:03', '2022-05-29 23:13:03');
ALTER TABLE [comentario] CHECK CONSTRAINT FK_desaparecido_id;
ALTER TABLE [comentario] CHECK CONSTRAINT FK_comentario_user_id;
GO

/**********************************************
* Comuna
*
***********************************************/
INSERT INTO comuna (id, comuna, created_at, updated_at) VALUES
(1, 'Desconhecido', '2022-03-14 05:46:34', '2022-03-14 05:46:34'),
(2, 'Benfica', '2022-03-14 05:46:45', '2022-03-14 05:46:45'),
(3, 'Camama', '2022-03-14 05:46:55', '2022-03-14 05:46:55'),
(4, 'Futungo de Belas', '2022-03-14 05:47:36', '2022-03-14 05:47:36'),
(5, 'Lar do Patriota', '2022-03-14 05:47:45', '2022-03-14 05:47:45'),
(6, 'Talatona', '2022-03-14 05:47:58', '2022-03-14 05:47:58'),
(7, 'Cidade Universitária', '2022-03-14 05:48:34', '2022-03-14 05:48:34');
GO

/**********************************************
* Desaparecido
*
***********************************************/
ALTER TABLE [desaparecido] NOCHECK CONSTRAINT FK_desaparecido_user_id;
ALTER TABLE [desaparecido] NOCHECK CONSTRAINT FK_comuna_id;
ALTER TABLE [desaparecido] NOCHECK CONSTRAINT FK_responsavel_telemovel1_id;
ALTER TABLE [desaparecido] NOCHECK CONSTRAINT FK_responsavel_telemovel2_id;
INSERT INTO desaparecido (id, nome, data_nascimento, imagem, aprovado, status, [visualizacoes_qtd], comuna_id, user_id, responsavel_telemovel1_id, responsavel_telemovel2_id, email, altura, peso, created_at, updated_at) VALUES
(1, 'Sténio Anabel', '2021-05-12', '265246b8ba5ba22292dd3f22789b3d6a.jpg', 1, 0, 1507, 7, 2, 1, 2, 'SténioAnabel4975@hotmail.com', 192, 282, '2022-05-16 21:36:35', '2022-05-16 21:36:35'),
(2, 'Luis Carla', '1990-05-27', 'c990972f74f719b46b7e0c17ac04004f.jpg', 1, 0, 3987, 7, 3, 3, 4, 'LuisCarla1094@hotmail.com', 158, 144, '2022-05-16 21:36:38', '2022-05-16 21:36:38'),
(3, 'Adriana Erivandro', '1978-05-07', 'af1c17a87f3605efe58bb6846c32c2b7.jpg', 1, 0, 2659, 7, 3, 5, 6, 'AdrianaErivandro1667@gmail.com', 185, 30, '2022-05-16 21:36:39', '2022-05-16 21:36:39'),
(4, 'Debora Abrahan', '1982-05-24', '5b518e31dd9278d3508eedc5c17a3fe9.jpg', 1, 0, 2306, 7, 2, 7, 8, 'DeboraAbrahan2901@outlooh.com', 160, 219, '2022-05-16 21:36:42', '2022-05-16 21:36:42'),
(5, 'Bruna Asuka', '1970-05-15', '8acfce85e8ab36f89190b28e1fc71214.jpg', 1, 0, 7, 1, 2, 9, 10, 'BrunaAsuka3753@hotmail.com', 200, 240, '2022-05-16 21:36:45', '2022-05-16 21:36:45'),
(6, 'Cassia Magna', '1980-05-08', '2d72ac8cdd7d9bd97e49bdc1a0b3e006.jpg', 1, 0, 339, 2, 3, 11, 12, 'CassiaMagna4529@yoopmail.com', 159, 195, '2022-05-16 21:36:48', '2022-05-16 21:36:49'),
(7, 'Bray Carlos', '1973-05-19', '5451b99823e6a7d7ae4143bca9c9c7e3.jpg', 1, 0, 2218, 5, 3, 13, 14, 'BrayCarlos1639@hotmail.com', 164, 94, '2022-05-16 21:36:52', '2022-05-16 21:36:52'),
(8, 'Dale Cristiano', '1977-05-20', 'd1292422f9c24fdf9a3a531cdb820974.jpg', 1, 0, 1512, 5, 3, 15, 16, 'DaleCristiano3706@outlooh.com', 159, 255, '2022-05-16 21:36:54', '2022-05-16 21:36:55'),
(9, 'Alpha James', '1971-05-17', '9354116ad2b714bc98098706d5a34356.jpg', 1, 0, 726, 1, 2, 17, 18, 'AlphaJames1258@outlooh.com', 167, 203, '2022-05-16 21:36:57', '2022-05-16 21:36:58'),
(10, 'Frederico Nair', '1995-05-11', 'd2ea8848000fa8b3bdc16f829709cf0d.jpg', 1, 0, 2815, 3, 2, 19, 20, 'FredericoNair3321@outlooh.com', 162, 166, '2022-05-16 21:37:01', '2022-05-16 21:37:01'),
(11, 'Raíssa Luis', '2002-05-18', '5e4099a5fc20fd616ae87ab4282030d4.jpg', 1, 0, 4158, 2, 2, 21, 22, 'RaíssaLuis2007@yoopmail.com', 189, 240, '2022-05-16 21:37:03', '2022-05-16 21:37:03'),
(12, 'James João', '1981-05-30', 'ab6dec0cbe370b960479fcee15351dab.jpg', 1, 0, 1658, 4, 1, 23, 24, 'JamesJoão3565@gmail.com', 146, 42, '2022-05-16 21:37:07', '2022-05-16 21:37:08'),
(13, 'Asuka Magno', '1999-05-10', '6eb22798c2d80a59712f2c29939e1453.jpg', 1, 0, 3802, 3, 3, 25, 26, 'AsukaMagno3664@outlooh.com', 150, 264, '2022-05-16 21:37:11', '2022-05-16 21:37:12'),
(14, 'Ivan Leonel', '2018-03-13', '08a54ef01c74fa08aa26d1d6ed6077e7.jpg', 1, 0, 4202, 5, 2, 27, 28, 'IvanLeonel4505@yoopmail.com', 155, 239, '2022-05-16 21:37:14', '2022-05-16 21:37:15'),
(15, 'Shane Ana', '1983-05-10', '564075494c03607a44282f48744df365.jpg', 1, 0, 3770, 2, 1, 29, 30, 'ShaneAna2741@gmail.com', 188, 242, '2022-05-16 21:37:16', '2022-05-16 21:37:17'),
(16, 'Nadia Abrahan', '1973-05-12', '7b5ec1fda85a9d2f09e1a1f20f3e3a83.jpg', 1, 0, 1457, 3, 2, 31, 32, 'NadiaAbrahan322@hotmail.com', 160, 61, '2022-05-16 21:37:21', '2022-05-16 21:37:21'),
(17, 'Braun Baszler', '1978-05-31', '8301f84c17bd587493db876786d3e196.jpg', 1, 0, 4187, 4, 2, 33, 34, 'BraunBaszler785@gmail.com', 152, 219, '2022-05-16 21:37:24', '2022-05-16 21:37:25'),
(18, 'Kay Magna', '2009-05-26', '6a1dae9ff0fd5b4adc991477bfd7a2ac.jpg', 1, 0, 1224, 2, 1, 35, 36, 'KayMagna2206@outlooh.com', 159, 277, '2022-05-16 21:37:27', '2022-05-16 21:37:27'),
(19, 'Braun Rodrigo', '1993-05-14', 'c9d440dc5c531d317441f44baa8ce492.jpg', 1, 0, 316, 5, 3, 37, 38, 'BraunRodrigo4492@yoopmail.com', 170, 108, '2022-05-16 21:37:29', '2022-05-16 21:37:29'),
(20, 'Eugine Adriana', '1993-05-01', '2799483889d4230d5e1bcca9c1dc893c.jpg', 1, 0, 884, 3, 1, 39, 40, 'EugineAdriana2257@yoopmail.com', 160, 294, '2022-05-16 21:37:32', '2022-05-16 21:37:32'),
(21, 'Leonel Grimes', '2014-05-02', 'b9aec4b81df805c84e28a8caea2e17df.jpg', 1, 0, 1985, 4, 1, 41, 42, 'LeonelGrimes3028@hotmail.com', 165, 200, '2022-05-16 21:37:34', '2022-05-16 21:37:34'),
(22, 'Magno Abrão', '2007-05-21', '65844e49e1357dee1b4271551ea4dbab.jpg', 1, 0, 3029, 2, 2, 43, 44, 'MagnoAbrão4089@outlooh.com', 187, 121, '2022-05-16 21:37:36', '2022-05-16 21:37:36'),
(23, 'Frederico Alexa', '1979-05-01', '0735d8fa00f659c0d89390f5659410f0.jpg', 1, 0, 1581, 2, 2, 45, 46, 'FredericoAlexa3796@gmail.com', 194, 212, '2022-05-16 21:37:38', '2022-05-16 21:37:39'),
(24, 'Neymar Ana', '2003-05-10', 'd576de3827866c78e9fd6635d4450129.jpg', 1, 0, 583, 3, 2, 47, 48, 'NeymarAna3701@gmail.com', 194, 236, '2022-05-16 21:37:42', '2022-05-16 21:37:42'),
(25, 'Magno Ezequiel', '1992-05-31', 'c2eedc2feb5ea001fc625b8e2f26ed43.jpg', 1, 0, 2715, 3, 1, 49, 50, 'MagnoEzequiel3522@yoopmail.com', 185, 284, '2022-05-16 21:37:45', '2022-05-16 21:37:45'),
(26, 'Elsa Keith', '2003-05-29', 'a7375fa25d3c35a59d2a66c7d7acc345.jpg', 1, 0, 4339, 4, 1, 51, 52, 'ElsaKeith2717@gmail.com', 140, 222, '2022-05-16 21:37:49', '2022-05-16 21:37:49'),
(27, 'Milton Cristiano', '1988-05-31', 'ed295088cc3aa0ee6e9ea7c3d56b6562.jpg', 1, 0, 28, 4, 3, 53, 54, 'MiltonCristiano3904@outlooh.com', 189, 111, '2022-05-16 21:37:52', '2022-05-16 21:37:52'),
(28, 'Eleanor Osvaldo', '2012-05-30', '6d5af66e9cdee10b96cf005944c47f49.jpg', 1, 0, 2855, 6, 2, 55, 56, 'EleanorOsvaldo2389@gmail.com', 192, 55, '2022-05-16 21:37:56', '2022-05-16 21:37:56'),
(29, 'Clementine Alexa', '1977-05-15', '890340b2a3fa414c6011a371dee2c397.jpg', 1, 0, 4460, 4, 2, 57, 58, 'ClementineAlexa3403@yoopmail.com', 184, 128, '2022-05-16 21:38:00', '2022-05-16 21:38:00'),
(30, 'Erivandro Debora', '1982-05-21', '43bbdd44092bd8df23222501705ef5a4.jpg', 1, 0, 3602, 4, 1, 59, 60, 'ErivandroDebora4438@yoopmail.com', 176, 60, '2022-05-16 21:38:05', '2022-05-16 21:38:05'),
(31, 'Cristiano Messi', '1988-01-10', '6c703216191857f56b2c0e708776743e.jpg', 1, 0, 4082, 6, 2, 61, 62, 'CristianoMessi1582@outlooh.com', 187, 217, '2022-05-16 21:38:13', '2022-05-16 21:38:13'),
(32, 'Baszler Beta', '2006-05-24', '3611ef7a8a3d4f1de6e6f483ba8a2600.jpg', 1, 0, 806, 5, 2, 63, 64, 'BaszlerBeta980@yoopmail.com', 195, 129, '2022-05-16 21:38:17', '2022-05-16 21:38:18'),
(33, 'Fernanda Baszler', '1972-05-14', '2395a770ccccaa02dc58a849cf28cc1d.jpg', 1, 0, 3661, 1, 1, 65, 66, 'FernandaBaszler2158@hotmail.com', 158, 134, '2022-05-16 21:38:23', '2022-05-16 21:38:24'),
(34, 'Goldberg Eleanor', '1978-05-22', '8fe09f8649bf53d24b81eb8277d3303e.jpg', 1, 0, 1022, 4, 3, 67, 68, 'GoldbergEleanor3726@hotmail.com', 142, 211, '2022-05-16 21:38:26', '2022-05-16 21:38:26'),
(35, 'Eleanor Leonel', '2004-05-10', 'c5f41e926603c6fb9200dd9e11d8ffec.jpg', 1, 0, 220, 2, 2, 69, 70, 'EleanorLeonel1595@hotmail.com', 169, 206, '2022-05-16 21:38:29', '2022-05-16 21:38:29'),
(36, 'Cassia Margarida', '2017-01-25', '3e581d4833274873c98ba4b8cb60332a.jpg', 1, 0, 3242, 6, 2, 71, 72, 'CassiaMargarida4437@outlooh.com', 188, 46, '2022-05-16 21:38:32', '2022-05-16 21:38:33'),
(37, 'Paula Daryl', '1988-05-10', 'f4e24a55bbc552e9d655f92cc5009c7d.jpg', 1, 0, 779, 5, 3, 73, 74, 'PaulaDaryl3414@yoopmail.com', 144, 147, '2022-05-16 21:38:36', '2022-05-16 21:38:36'),
(38, 'Joana Margarida', '2019-01-16', 'fbe2423e474df75da69ef724fc3c7ca2.jpg', 1, 0, 2552, 6, 2, 75, 76, 'JoanaMargarida3764@hotmail.com', 190, 144, '2022-05-16 21:38:38', '2022-05-16 21:38:39'),
(39, 'Ivan Clementine', '2020-05-29', '01e7d1d49d4e29438a7bdef0e5fc4a81.jpg', 1, 0, 92, 2, 2, 77, 78, 'IvanClementine1094@yoopmail.com', 178, 101, '2022-05-16 21:38:41', '2022-05-16 21:38:41'),
(40, 'Margarida Elisa', '2010-03-10', 'fb4dadecff761eb41c283f65f0b822b1.jpg', 1, 0, 2591, 1, 1, 79, 80, 'MargaridaElisa2217@hotmail.com', 183, 62, '2022-05-16 21:38:45', '2022-05-16 21:38:45'),
(41, 'Wyatt Nadia', '2009-05-21', 'fcfe31d7ce95dfd34cb6aa4f3265b9f9.jpg', 1, 0, 660, 5, 1, 81, 82, 'WyattNadia1459@hotmail.com', 165, 116, '2022-05-16 21:38:48', '2022-05-16 21:38:48'),
(42, 'Fernando Judith', '2006-01-05', '0584f5c67e53082928034d6771165aaf.jpg', 1, 0, 1922, 3, 2, 83, 84, 'FernandoJudith2453@hotmail.com', 170, 95, '2022-05-16 21:38:49', '2022-05-16 21:38:49'),
(43, 'Miranda Daryl', '1998-03-27', '343f5082c596af6ce8bf93a2faeecfa2.jpg', 1, 0, 918, 6, 2, 85, 86, 'MirandaDaryl809@gmail.com', 191, 259, '2022-05-16 21:38:51', '2022-05-16 21:38:51'),
(44, 'Aaron Rollins', '1973-03-18', '6dab2c7ef179d4c5b1d04dec88046ad5.jpg', 1, 0, 4465, 2, 2, 87, 88, 'AaronRollins4709@hotmail.com', 181, 242, '2022-05-16 21:38:56', '2022-05-16 21:38:57'),
(45, 'Seth Mitch', '1997-05-14', '7cf92207b76948097d2c12634bc2b16c.jpg', 1, 0, 3039, 1, 2, 89, 90, 'SethMitch3467@hotmail.com', 164, 79, '2022-05-16 21:39:01', '2022-05-16 21:39:01'),
(46, 'Ivana Eliana', '2013-05-20', '2ff3aa56828043fc4e7852cd6b31da91.jpg', 1, 0, 4338, 3, 3, 91, 92, 'IvanaEliana4610@gmail.com', 166, 58, '2022-05-16 21:39:02', '2022-05-29 23:12:49'),
(47, 'Harden Junior', '1975-05-21', '370f6b36237b63bea488c8ecb9a13fab.jpg', 1, 0, 948, 4, 1, 93, 94, 'HardenJunior4769@gmail.com', 173, 217, '2022-05-16 21:39:08', '2022-05-16 21:39:08'),
(48, 'Bruno Joana', '2021-05-25', 'e1f30084a2abee5be8809da1019afcf3.jpg', 1, 0, 2941, 2, 2, 95, 96, 'BrunoJoana3305@yoopmail.com', 197, 189, '2022-05-16 21:39:12', '2022-05-16 21:39:12'),
(49, 'Milton Helga', '2009-05-12', 'f6a31f570b3bede9c7da0010d280e8ea.jpg', 1, 0, 1146, 6, 2, 97, 98, 'MiltonHelga4516@hotmail.com', 150, 274, '2022-05-16 21:39:15', '2022-05-16 21:39:16'),
(50, 'Lee Elisa', '1981-05-02', 'bb96e7d286dfcb26cd9f9da1ca4beca4.jpg', 1, 0, 2751, 7, 3, 99, 100, 'LeeElisa1587@hotmail.com', 191, 268, '2022-05-16 21:39:18', '2022-05-21 05:16:53');
ALTER TABLE [desaparecido] CHECK CONSTRAINT FK_desaparecido_user_id;
ALTER TABLE [desaparecido] CHECK CONSTRAINT FK_comuna_id;
ALTER TABLE [desaparecido] CHECK CONSTRAINT FK_responsavel_telemovel1_id;
ALTER TABLE [desaparecido] CHECK CONSTRAINT FK_responsavel_telemovel2_id;
GO

/**********************************************
* DESCRIÇÃO
*
***********************************************/
INSERT INTO descricao (id, desaparecido_id, [descricao], created_at, updated_at) VALUES
(7, 8, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-03-21 04:29:25', '2022-03-21 04:29:25'),
(8, 9, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-03-21 04:29:30', '2022-03-21 04:29:30'),
(9, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-03-21 04:29:32', '2022-03-21 04:29:32'),
(10, 11, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-03-21 04:29:33', '2022-03-21 04:29:33'),
(11, 12, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-03-21 04:29:35', '2022-03-21 04:29:35'),
(12, 13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-03-21 04:29:37', '2022-03-21 04:29:37'),
(13, 14, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-03-21 04:29:45', '2022-03-21 04:29:45'),
(14, 15, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-03-21 04:29:47', '2022-03-21 04:29:47'),
(15, 16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-03-21 04:29:49', '2022-03-21 04:29:49'),
(16, 17, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-03-21 04:29:50', '2022-03-21 04:29:50'),
(17, 18, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-03-21 04:29:51', '2022-03-21 04:29:51'),
(18, 19, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-03-21 04:29:52', '2022-03-21 04:29:52'),
(19, 20, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-03-21 04:29:54', '2022-03-21 04:29:54'),
(20, 21, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-03-21 04:29:55', '2022-03-21 04:29:55'),
(21, 22, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-03-21 04:29:57', '2022-03-21 04:29:57'),
(22, 23, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-03-21 04:29:59', '2022-03-21 04:29:59'),
(23, 24, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-03-21 04:30:00', '2022-03-21 04:30:00'),
(24, 25, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-03-21 04:30:02', '2022-03-21 04:30:02'),
(25, 26, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-03-21 04:30:03', '2022-03-21 04:30:03'),
(26, 27, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-03-21 04:30:04', '2022-03-21 04:30:04'),
(27, 28, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-03-21 04:30:05', '2022-03-21 04:30:05'),
(28, 29, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-03-21 04:30:07', '2022-03-21 04:30:07'),
(29, 30, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-03-21 04:30:08', '2022-03-21 04:30:08'),
(30, 31, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-03-21 04:30:10', '2022-03-21 04:30:10'),
(31, 32, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-03-21 04:30:13', '2022-03-21 04:30:13'),
(32, 33, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-03-21 04:30:15', '2022-03-21 04:30:15'),
(33, 34, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-03-21 04:30:17', '2022-03-21 04:30:17'),
(34, 35, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-03-21 04:30:18', '2022-03-21 04:30:18'),
(35, 36, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-03-21 04:30:20', '2022-03-21 04:30:20'),
(36, 37, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-03-21 04:30:22', '2022-03-21 04:30:22'),
(37, 38, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-03-21 04:30:24', '2022-03-21 04:30:24'),
(38, 39, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-03-21 04:30:25', '2022-03-21 04:30:25'),
(39, 40, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?', '2022-03-21 04:30:27', '2022-03-21 04:30:27'),
(40, 41, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-03-21 04:30:28', '2022-03-21 04:30:28'),
(41, 42, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-03-21 04:30:29', '2022-03-21 04:30:29'),
(42, 43, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-03-21 04:30:30', '2022-03-21 04:30:30'),
(43, 44, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-03-21 04:30:32', '2022-03-21 04:30:32'),
(44, 45, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.', '2022-03-21 04:30:33', '2022-03-21 04:30:33'),
(45, 46, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-03-21 04:30:35', '2022-03-21 04:30:35'),
(46, 47, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.', '2022-03-21 04:30:37', '2022-03-21 04:30:37'),
(47, 48, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-03-21 04:30:38', '2022-03-21 04:30:38'),
(48, 49, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Natus nisi nobis corporis officiis sequi, aliquam eum consequuntur aspernatur suscipit, est nam laborum soluta delectus quasi cum illum neque placeat eligendi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet asperiores dignissimos quisquam doloremque officia ullam totam ex, saepe quibusdam hic harum perferendis ratione exercitationem numquam quam rerum adipisci? Minima, molestias?Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.', '2022-03-21 04:30:39', '2022-03-21 04:30:39');
INSERT INTO descricao (id, desaparecido_id, descricao, created_at, updated_at) VALUES
(312, 50, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores architecto pariatur suscipit mollitia dolorum, voluptate nemo dolorem excepturi repellendus expedita illo eos molestias cum aperiam est, non odio iure totam.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, nam vero. Sit repudiandae non cum in impedit excepturi eveniet repellat explicabo? Magni vitae nemo harum dolor dolorum libero voluptate deleniti.Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis id dignissimos, amet repudiandae sapiente fuga labore deleniti ea quasi placeat laborum delectus, quidem similique debitis? Eveniet iste repudiandae voluptas! Eveniet?', '2022-05-30 03:43:56', '2022-05-30 03:43:56');
GO

/**********************************************
* RESPONSAVEL TELEMOVEL
*
***********************************************/

INSERT INTO responsavel_telemovel (id, telemovel, created_at, updated_at) VALUES
(1, 908235888, '2022-05-16 21:36:35', '2022-05-16 21:36:35'),
(2, 982604795, '2022-05-16 21:36:35', '2022-05-16 21:36:35'),
(3, 923858313, '2022-05-16 21:36:38', '2022-05-16 21:36:38'),
(4, 908473083, '2022-05-16 21:36:38', '2022-05-16 21:36:38'),
(5, 961822865, '2022-05-16 21:36:39', '2022-05-16 21:36:39'),
(6, 907424914, '2022-05-16 21:36:39', '2022-05-16 21:36:39'),
(7, 942385199, '2022-05-16 21:36:42', '2022-05-16 21:36:42'),
(8, 962842653, '2022-05-16 21:36:42', '2022-05-16 21:36:42'),
(9, 942016206, '2022-05-16 21:36:45', '2022-05-16 21:36:45'),
(10, 912940577, '2022-05-16 21:36:45', '2022-05-16 21:36:45'),
(11, 954779090, '2022-05-16 21:36:48', '2022-05-16 21:36:48'),
(12, 979231391, '2022-05-16 21:36:49', '2022-05-16 21:36:49'),
(13, 969493815, '2022-05-16 21:36:52', '2022-05-16 21:36:52'),
(14, 914945562, '2022-05-16 21:36:52', '2022-05-16 21:36:52'),
(15, 951600260, '2022-05-16 21:36:54', '2022-05-16 21:36:54'),
(16, 951741620, '2022-05-16 21:36:54', '2022-05-16 21:36:54'),
(17, 995545817, '2022-05-16 21:36:58', '2022-05-16 21:36:58'),
(18, 991685583, '2022-05-16 21:36:58', '2022-05-16 21:36:58'),
(19, 996723884, '2022-05-16 21:37:01', '2022-05-16 21:37:01'),
(20, 962925527, '2022-05-16 21:37:01', '2022-05-16 21:37:01'),
(21, 933755843, '2022-05-16 21:37:03', '2022-05-16 21:37:03'),
(22, 997692793, '2022-05-16 21:37:03', '2022-05-16 21:37:03'),
(23, 916443563, '2022-05-16 21:37:07', '2022-05-16 21:37:07'),
(24, 930254943, '2022-05-16 21:37:07', '2022-05-16 21:37:07'),
(25, 993173458, '2022-05-16 21:37:11', '2022-05-16 21:37:11'),
(26, 983040728, '2022-05-16 21:37:11', '2022-05-16 21:37:11'),
(27, 935253053, '2022-05-16 21:37:14', '2022-05-16 21:37:14'),
(28, 943486350, '2022-05-16 21:37:14', '2022-05-16 21:37:14'),
(29, 909249238, '2022-05-16 21:37:17', '2022-05-16 21:37:17'),
(30, 993370927, '2022-05-16 21:37:17', '2022-05-16 21:37:17'),
(31, 909507629, '2022-05-16 21:37:21', '2022-05-16 21:37:21'),
(32, 986272913, '2022-05-16 21:37:21', '2022-05-16 21:37:21'),
(33, 938958947, '2022-05-16 21:37:25', '2022-05-16 21:37:25'),
(34, 922365353, '2022-05-16 21:37:25', '2022-05-16 21:37:25'),
(35, 902659627, '2022-05-16 21:37:27', '2022-05-16 21:37:27'),
(36, 949273464, '2022-05-16 21:37:27', '2022-05-16 21:37:27'),
(37, 946742770, '2022-05-16 21:37:29', '2022-05-16 21:37:29'),
(38, 939576208, '2022-05-16 21:37:29', '2022-05-16 21:37:29'),
(39, 980565216, '2022-05-16 21:37:32', '2022-05-16 21:37:32'),
(40, 960271616, '2022-05-16 21:37:32', '2022-05-16 21:37:32'),
(41, 941181895, '2022-05-16 21:37:34', '2022-05-16 21:37:34'),
(42, 997851565, '2022-05-16 21:37:34', '2022-05-16 21:37:34'),
(43, 926448689, '2022-05-16 21:37:36', '2022-05-16 21:37:36'),
(44, 954031145, '2022-05-16 21:37:36', '2022-05-16 21:37:36'),
(45, 923180340, '2022-05-16 21:37:39', '2022-05-16 21:37:39'),
(46, 956198261, '2022-05-16 21:37:39', '2022-05-16 21:37:39'),
(47, 995429653, '2022-05-16 21:37:42', '2022-05-16 21:37:42'),
(48, 977144320, '2022-05-16 21:37:42', '2022-05-16 21:37:42'),
(49, 992927023, '2022-05-16 21:37:45', '2022-05-16 21:37:45'),
(50, 902875683, '2022-05-16 21:37:45', '2022-05-16 21:37:45'),
(51, 990070705, '2022-05-16 21:37:49', '2022-05-16 21:37:49'),
(52, 993010569, '2022-05-16 21:37:49', '2022-05-16 21:37:49'),
(53, 911443256, '2022-05-16 21:37:52', '2022-05-16 21:37:52'),
(54, 981083349, '2022-05-16 21:37:52', '2022-05-16 21:37:52'),
(55, 925797348, '2022-05-16 21:37:56', '2022-05-16 21:37:56'),
(56, 998964100, '2022-05-16 21:37:56', '2022-05-16 21:37:56'),
(57, 941606465, '2022-05-16 21:38:00', '2022-05-16 21:38:00'),
(58, 972352685, '2022-05-16 21:38:00', '2022-05-16 21:38:00'),
(59, 918230279, '2022-05-16 21:38:05', '2022-05-16 21:38:05'),
(60, 966867585, '2022-05-16 21:38:05', '2022-05-16 21:38:05'),
(61, 995275945, '2022-05-16 21:38:13', '2022-05-16 21:38:13'),
(62, 960473001, '2022-05-16 21:38:13', '2022-05-16 21:38:13'),
(63, 925922123, '2022-05-16 21:38:17', '2022-05-16 21:38:17'),
(64, 985622631, '2022-05-16 21:38:17', '2022-05-16 21:38:17'),
(65, 967592035, '2022-05-16 21:38:24', '2022-05-16 21:38:24'),
(66, 902783525, '2022-05-16 21:38:24', '2022-05-16 21:38:24'),
(67, 912075032, '2022-05-16 21:38:26', '2022-05-16 21:38:26'),
(68, 974131744, '2022-05-16 21:38:26', '2022-05-16 21:38:26'),
(69, 987618577, '2022-05-16 21:38:29', '2022-05-16 21:38:29'),
(70, 913923920, '2022-05-16 21:38:29', '2022-05-16 21:38:29'),
(71, 982514562, '2022-05-16 21:38:32', '2022-05-16 21:38:32'),
(72, 983917709, '2022-05-16 21:38:32', '2022-05-16 21:38:32'),
(73, 911489313, '2022-05-16 21:38:36', '2022-05-16 21:38:36'),
(74, 940617370, '2022-05-16 21:38:36', '2022-05-16 21:38:36'),
(75, 931407803, '2022-05-16 21:38:38', '2022-05-16 21:38:38'),
(76, 964063745, '2022-05-16 21:38:38', '2022-05-16 21:38:38'),
(77, 969309950, '2022-05-16 21:38:41', '2022-05-16 21:38:41'),
(78, 966790242, '2022-05-16 21:38:41', '2022-05-16 21:38:41'),
(79, 933487535, '2022-05-16 21:38:45', '2022-05-16 21:38:45'),
(80, 937111634, '2022-05-16 21:38:45', '2022-05-16 21:38:45'),
(81, 984766877, '2022-05-16 21:38:48', '2022-05-16 21:38:48'),
(82, 905134023, '2022-05-16 21:38:48', '2022-05-16 21:38:48'),
(83, 926055946, '2022-05-16 21:38:49', '2022-05-16 21:38:49'),
(84, 930518428, '2022-05-16 21:38:49', '2022-05-16 21:38:49'),
(85, 979184636, '2022-05-16 21:38:51', '2022-05-16 21:38:51'),
(86, 917906149, '2022-05-16 21:38:51', '2022-05-16 21:38:51'),
(87, 975256164, '2022-05-16 21:38:56', '2022-05-16 21:38:56'),
(88, 918201667, '2022-05-16 21:38:57', '2022-05-16 21:38:57'),
(89, 935288450, '2022-05-16 21:39:01', '2022-05-16 21:39:01'),
(90, 985569736, '2022-05-16 21:39:01', '2022-05-16 21:39:01'),
(91, 931918868, '2022-05-16 21:39:02', '2022-05-16 21:39:02'),
(92, 948958791, '2022-05-16 21:39:03', '2022-05-16 21:39:03'),
(93, 958731283, '2022-05-16 21:39:08', '2022-05-16 21:39:08'),
(94, 959117370, '2022-05-16 21:39:08', '2022-05-16 21:39:08'),
(95, 941429898, '2022-05-16 21:39:12', '2022-05-16 21:39:12'),
(96, 968597096, '2022-05-16 21:39:12', '2022-05-16 21:39:12'),
(97, 989650432, '2022-05-16 21:39:16', '2022-05-16 21:39:16'),
(98, 954682976, '2022-05-16 21:39:16', '2022-05-16 21:39:16'),
(99, 992102740, '2022-05-16 21:39:18', '2022-05-16 21:39:18'),
(100, 931988142, '2022-05-16 21:39:18', '2022-05-16 21:39:18');
GO

/**********************************************
* USERS
*
***********************************************/
INSERT INTO users (id, nome, email, telemovel, data_nascimento, password, admin, active, created_at, updated_at) VALUES
(1, 'Admin', 'admin@gmail.com', 947991792, '2022-03-02', '$2y$10$VEzfl0ysICQnKydoAeUfKur0u0jJgTMdFD3senLN2V25GVMJZ/dD6', 1, 1, '2022-03-14 05:46:14', '2022-05-21 19:39:02'),
(2, 'Igor Nzaji', 'igornzaji@gmail.com', 945671234, '2022-03-02', '$2y$10$gNy2FvBA5LH6qpig/JXTxeFtg.sPKo2EMW966grxoT5.5NUTFI03i', 0, 1, '2022-03-14 05:52:49', '2022-03-14 05:52:49'),
(3, 'Ruben Sousa', 'ruben@gmail.com', 998675512, '2011-01-04', '$2y$10$GbHk2dWrMea/B/scfwHMr.i0hiVxpYBo0FK58WzOb/wuerQZdxc1m', 0, 0, '2022-03-14 05:54:14', '2022-05-08 19:28:53'),
(4, 'Douglas Costa', 'douglas@gmail.com', 986451344, '2019-06-04', '$2y$10$cQia/2DX3iLChbe58FwktuFymhFIPu.iwfDUwObuSV9YG5ri4M97O', 0, 1, '2022-04-23 19:48:21', '2022-04-23 19:48:21'),
(5, 'Teste', 'teste@gmail.com', 986651243, '2022-05-04', '$2y$10$LpBxXUfWhylq2c7CSl6lrOYO.7JKSUMuYpcGUgE5RqtdF9Ty8tyh.', 0, 1, '2022-05-19 07:35:00', '2022-05-19 07:35:00'),
(6, 'Master Video', 'mastervideo321@gmail.com', 900456665, '2021-06-07', '$2y$10$Pg8/bpDobTiPGqXlOA8KwO9Ury/wHf.v0XYzIFinfUdvSbCTtoC7e', 0, 1, '2022-05-21 19:54:55', '2022-05-30 03:52:17');
GO
