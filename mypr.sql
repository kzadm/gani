-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 05 2017 г., 07:40
-- Версия сервера: 10.1.19-MariaDB
-- Версия PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mypr`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1510385177),
('admin', '7', 1510389458),
('user', '12', 1511324347),
('user', '13', 1511350476),
('user', '14', 1511351222),
('user', '15', 1511412923),
('user', '16', 1512384023),
('user', '17', 1512444180),
('user', '2', 1510385177),
('user', '6', 1510389416);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, 1510385177, 1510385177),
('adminAuth', 2, 'Admin login', NULL, NULL, 1510385177, 1510385177),
('user', 1, NULL, NULL, NULL, 1510385177, 1510385177),
('userAuth', 2, 'User login', NULL, NULL, 1510385177, 1510385177);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'adminAuth'),
('admin', 'user'),
('user', 'userAuth');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1510384493),
('m130524_201442_init', 1510384496),
('m140506_102106_rbac_init', 1510384610),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1510384610);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(6, 'newuser', 'VLZz45LVMrX5iP4BxOtUzvmXvcMOHQzz', '$2y$13$VzE3rNVQm2bs.T4zMUg.beuBP7j2hYh.Ak.It2RiAiw88EOjKC.Wq', NULL, 'asd@masd.si', 10, 1510389416, 1510389416),
(7, 'newadmin', 'Ino-C_YU_apuvy-0rF4BVY6zjZUFnZbK', '$2y$13$vy8irvAKz6mGARonfPanz.q/56HGQWIXNTwinm8w7TY35UWOShTnO', NULL, 'asd@masd.ru', 10, 1510389458, 1510389458),
(8, 'none_user', 'm3xIOkm7WVwXgVfyOP13P3Ll0frSaTvq', '$2y$13$9IPLduPV.fR6ZW8EN6zlButQrYY.ty0loazx2MW71Wh13L61zTcbm', NULL, 'usr@usr.usr', 10, 1511178913, 1511178913),
(9, 'test_test', 'S2QWlg9-ORrE8gODVfV67TlY5Gz8UBbi', '$2y$13$xVmKV8AXW0x.yDiLnXViDuytn5iJZnmicexQcOUPP7RrpLgadVjoG', NULL, 'test@test.ru', 10, 1511179013, 1511179013),
(10, 'testuser', 'pT3pRJWPASFP_rS13J1mYDb8isf4YB_X', '$2y$13$mBwZ9ZSuUYXGOtZ.1gdGse8YAkMLHTUPOUVvCtuOg5dYgeyaKcuIS', NULL, 'test@test.com', 10, 1511236662, 1511236662),
(11, 'Фарик', 'r7Bm9ZDWDLestCapZlltvun2OoMq3ka2', '$2y$13$8gKREyfXs7l3CwaqziTKq.zmoDWJDmCPnuaelp8xAAihHeaEcOnYy', NULL, 'asd@sng.staff', 10, 1511239860, 1511239860),
(12, 'olol', 'Bve_N4gFw5PsBUb325e0fXSqkwTrxMl1', '$2y$13$lUzLS192v8QmAf8EzFJTt.5qgwaaSgQCDTPbwNqA4GR81Zzu5tiVG', NULL, 'asd@asd.ru', 10, 1511324347, 1511324347),
(13, 'ex', 'IERN5P5wF5G9DhbE7RIEc9shbwnLeHo8', '$2y$13$tZQNggNY0XBELOpBo/WHlOPAt1ChZ.OOr22pKrlpax9yaejklTB8S', NULL, 'ex@ex.ex', 10, 1511350476, 1511350476),
(14, 'gg', '6W4ecUAbUl49FoisXFuCev6F9epZXe7X', '$2y$13$LsgVLfLtYUgUdSLt3UlFQO2AneT6274LabYy244o0j9APpKDod9E2', NULL, 'gg@gg.gg', 10, 1511351222, 1511351222),
(15, 'mmkk', '1sBXOZS7IbGjnc1ITg1CPLQRO0LnrG75', '$2y$13$3MMG7PSYoXx7Kr482FWSXefReCEmtOPmRvZp2TnWndcQxQgyQu0Oa', NULL, 'mm@mm.kz', 10, 1511412923, 1511412923),
(16, 'testUserLogin', 'L-3_9mS79yr08qBt2VMxfEPYnG7Vy7r_', '$2y$13$YK1UBpQohTVoB/JymjFmJuzumgsOMcJrkz/dCRK5IMowj6SKaFsVi', NULL, 'ts@ts.ts', 10, 1512384022, 1512384022),
(17, 'HELL', 'GXxYHk11CCiQ-Jet2dXMtgrz5gdq9pCt', '$2y$13$wYfz5yTmJIPmLW1fsRMFquqwAkQSj2UQt1jtEZM2A3ugnKeijRzxi', NULL, 'hel@hel.hel', 10, 1512444180, 1512444180);

-- --------------------------------------------------------

--
-- Структура таблицы `users_info`
--

CREATE TABLE `users_info` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `information` varchar(255) NOT NULL,
  `country` varchar(130) NOT NULL,
  `surname` varchar(60) NOT NULL,
  `bdate` varchar(25) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `mailindex` varchar(255) NOT NULL,
  `user_photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_info`
--

INSERT INTO `users_info` (`id`, `users_id`, `phone`, `user_name`, `city`, `information`, `country`, `surname`, `bdate`, `adres`, `mailindex`, `user_photo`) VALUES
(1, 15, 'Ole', 'ole', 'oled', 'ole', '', '', '0000-00-00', '', '', ''),
(2, 11, '8 (707) 693-42-31', 'Фарух', 'Алматы', 'I AM PROGGER', '0', 'Баратов', '07.09.98', 'Айтеке-би 5', '999999', 'panzerotti-228x228.jpg'),
(3, 14, '555', 'Egege', 'APPLE', 'MORE INFO', '0', 'EGEG', '0000-00-00', '', '', 'gege.jpg'),
(4, 13, 'phone', 'username', 'city', 'info', 'country', 'surname', 'bdtea', 'adres', 'mailindex', ''),
(5, 16, '8 (707) 693-42-31', 'Фарух', 'Алматы', 'Ищу супер тур со скидками', '0', 'Баратов', '07.09.98', 'Айтеке-би 5', '999999', ''),
(6, 17, '', '', '', '', '0', '', '', '', '', 'logo.png');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Индексы таблицы `users_info`
--
ALTER TABLE `users_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_id` (`users_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT для таблицы `users_info`
--
ALTER TABLE `users_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
