-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-11-2026 a las 20:00:20
-- Versión del servidor: 11.8.9-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `los_menos_buscados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add cartel', 7, 'add_cartel'),
(26, 'Can change cartel', 7, 'change_cartel'),
(27, 'Can delete cartel', 7, 'delete_cartel'),
(28, 'Can view cartel', 7, 'view_cartel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$M5d57qzGjQ5vzWPoo3ahR7$efZV0CEdQx5sVIRE9VG7lu54rIHgWemkGMWtI7kDA7c=', '2026-11-04 18:33:10.852939', 0, 'Hector', '', '', '', 0, 1, '2026-11-04 17:59:51.241363'),
(2, 'pbkdf2_sha256$390000$HpUZUhg2iUOT3gPWZTSghJ$LVXRegEUbOk3mYMaZSTf/Mj/AckPgj/NyUdHkSMxUGo=', '2026-11-04 18:33:58.822972', 1, 'Admin', '', '', 'Omegax650@gmail.com', 1, 1, '2026-11-04 18:29:47.773722'),
(3, 'pbkdf2_sha256$390000$wNU5mFeGFD1lcR555PZAl7$P7oh/fwpFX4gkoQpx+7kVxAC6fFecdJslyCBRN60tbA=', '2026-11-04 18:32:59.279693', 0, 'Esteban', '', '', '', 0, 1, '2026-11-04 18:31:59.904333');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carteles_criminale_cartel`
--

CREATE TABLE `carteles_criminale_cartel` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `foto` varchar(100) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `carteles_criminale_cartel`
--

INSERT INTO `carteles_criminale_cartel` (`id`, `nombre`, `descripcion`, `foto`, `usuario_id`) VALUES
(1, 'ARON ROA', 'Peligroso inhalador de azúcar y azúcar morena. A este peligroso criminal se le ha visto contrabandeando Yogu Yogu afuera de un instituto, con altos niveles de azúcar. Se recompensará con 3 Yogu Yogu al que pueda capturarlo.', 'carteles/1.jpg', NULL),
(2, 'Esteban ibañes', 'Peligroso ludópata de zapatos. Este criminal pasa todo el día apostando zapatos y acumulando deudas. Aquel que logre capturarlo recibirá todas las deudas que ha acumulado con los años. Pedimos su cooperación.', 'carteles/2.jpg', NULL),
(3, 'Benjamin Fuentes', 'Los policías que vinieron de intercambio desde EE. UU. nos han informado de este carterista, que ha estado robando una gran cantidad de celulares. Al que logre capturarlo se le entregarán los celulares que haya robado.', 'carteles/3.jpg', NULL),
(4, 'Miguel escobar', 'Este peligroso traficante de helados ha intentado vender helado en estado puro a niños de la zona central de Chile. Se le considera uno de los peores criminales del Estado. Al que logre capturarlo se le recompensará con 2 uvas y 1 mandarina que estaban en mi refrigerador.', 'carteles/4.jpg', NULL),
(5, 'Hector Campos', 'Se le ha visto a este criminal suplicándole a una tal Noelle. Se dice que incluso ha empezado a construir su propio piso cuando se le acabó el piso para arrastrarse. Por ende, su recompensa aumenta a una migaja y 1 palo.', 'carteles/7.jpg', NULL),
(6, 'VÍCTOR VÁSQUEZ', 'Este personaje es presentado como un peligroso criminal y profesor de un instituto, conocido por llevar a sus alumnos a la desesperación con preguntas muy difíciles. La recompensa por capturarlo es pasar el curso.', 'carteles/8.png', NULL),
(7, 'NICOLAS MADURO', 'Este cartel presenta a Nicolás Maduro como un personaje ficticio dentro de la temática humorística de la página. La recompensa indicada en el cartel es Venezuela.', 'carteles/5.jpg', NULL),
(8, 'Chuck Norris', 'No sé quién ha sido el estúpido que puso a Chuck Norris en esta lista, pero lo único que puedo decir es: pobre del pendejo que intente ir a capturarlo. La recompensa por esa ofensa es la posibilidad de no morir. Así, sin más, ahora repasemos algunas hazañas de nuestra deidad Chuck Norris. Chuck Norris ha contado hasta el infinito. Dos veces.', 'carteles/6.jpg', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'Carteles_criminale', 'cartel'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Carteles_criminale', '0001_initial', '2026-11-04 17:33:18.350477'),
(2, 'contenttypes', '0001_initial', '2026-11-04 17:33:18.487084'),
(3, 'auth', '0001_initial', '2026-11-04 17:33:19.159164'),
(4, 'admin', '0001_initial', '2026-11-04 17:33:19.313867'),
(5, 'admin', '0002_logentry_remove_auto_add', '2026-11-04 17:33:19.332437'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2026-11-04 17:33:19.354545'),
(7, 'contenttypes', '0002_remove_content_type_name', '2026-11-04 17:33:19.495943'),
(8, 'auth', '0002_alter_permission_name_max_length', '2026-11-04 17:33:19.572075'),
(9, 'auth', '0003_alter_user_email_max_length', '2026-11-04 17:33:19.619916'),
(10, 'auth', '0004_alter_user_username_opts', '2026-11-04 17:33:19.639906'),
(11, 'auth', '0005_alter_user_last_login_null', '2026-11-04 17:33:19.707790'),
(12, 'auth', '0006_require_contenttypes_0002', '2026-11-04 17:33:19.719790'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2026-11-04 17:33:19.740365'),
(14, 'auth', '0008_alter_user_username_max_length', '2026-11-04 17:33:19.787977'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2026-11-04 17:33:19.837531'),
(16, 'auth', '0010_alter_group_name_max_length', '2026-11-04 17:33:19.892066'),
(17, 'auth', '0011_update_proxy_permissions', '2026-11-04 17:33:19.911033'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2026-11-04 17:33:19.956705'),
(19, 'sessions', '0001_initial', '2026-11-04 17:33:20.032211'),
(20, 'Carteles_criminale', '0002_cartel_usuario', '2026-11-04 18:16:21.252282');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('c10pe71vlr5sqdzb16sea5oifi0ssx2z', '.eJxVjE0OgjAUhO_y1qYplbbA0r1nIO-nShWpoWVlvLs1YcNuZr6Z-YDEzDPGV1hH5PAuKAmGsm7hBCNuZRq3XFEUGMDAISPkZ1j-QB643JPitJQ1kvpX1E6zuiYJ82XvHg4mzFNd62B027nWeusNSYfeoe2q4Bs722qthejMJI22xnvXULWByPXE1NsGvj8tiUIX:1xOfo6:x4o5xzQbbBsOl3f1gmFTf2DyUPl6FosCK8OdX45wVoY', '2026-11-18 18:33:58.828788');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `carteles_criminale_cartel`
--
ALTER TABLE `carteles_criminale_cartel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Carteles_criminale_cartel_usuario_id_2414eb04_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carteles_criminale_cartel`
--
ALTER TABLE `carteles_criminale_cartel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `carteles_criminale_cartel`
--
ALTER TABLE `carteles_criminale_cartel`
  ADD CONSTRAINT `Carteles_criminale_cartel_usuario_id_2414eb04_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
