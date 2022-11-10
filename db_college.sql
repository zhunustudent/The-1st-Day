-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 10 2022 г., 19:09
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db_college`
--

-- --------------------------------------------------------

--
-- Структура таблицы `classroom`
--

CREATE TABLE `classroom` (
  `classroom_id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `classroom`
--

INSERT INTO `classroom` (`classroom_id`, `name`) VALUES
(1, '404 П. АиП'),
(2, '101 ИС. АИС'),
(3, '303 Эл. Промышленная электротехника');

-- --------------------------------------------------------

--
-- Структура таблицы `course`
--

CREATE TABLE `course` (
  `course_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `special_id` int NOT NULL,
  `hours` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `course`
--

INSERT INTO `course` (`course_id`, `name`, `special_id`, `hours`) VALUES
(1, 'Основы алгоритмизации', 1, 90),
(2, 'Электротехника', 3, 106),
(3, 'Основы алгоритмизации', 5, 52),
(4, 'Мультимедиа технологии', 1, 36),
(5, 'Техническая механика', 6, 96),
(6, 'Промышленная электротехника', 4, 108),
(7, 'Автоматизированные информационные  системы', 1, 86),
(8, 'Пакеты прикладных программ', 5, 84);

-- --------------------------------------------------------

--
-- Структура таблицы `day`
--

CREATE TABLE `day` (
  `day_id` tinyint NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `day`
--

INSERT INTO `day` (`day_id`, `name`) VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота'),
(7, 'Воскресенье');

-- --------------------------------------------------------

--
-- Структура таблицы `gender`
--

CREATE TABLE `gender` (
  `gender_id` tinyint NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `gender`
--

INSERT INTO `gender` (`gender_id`, `name`) VALUES
(1, 'Мужской'),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `graduate`
--

CREATE TABLE `graduate` (
  `graduate_id` int NOT NULL,
  `gruppa_id` int NOT NULL,
  `course_id` int NOT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `graduate`
--

INSERT INTO `graduate` (`graduate_id`, `gruppa_id`, `course_id`, `user_id`) VALUES
(1, 1, 1, 1),
(2, 4, 2, 4),
(3, 3, 7, 2),
(4, 7, 6, 4),
(5, 6, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `graduate_time`
--

CREATE TABLE `graduate_time` (
  `graduate_time_id` int NOT NULL,
  `graduate_id` int NOT NULL,
  `day_id` tinyint NOT NULL,
  `lesson_num_id` int NOT NULL,
  `classroom_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `graduate_time`
--

INSERT INTO `graduate_time` (`graduate_time_id`, `graduate_id`, `day_id`, `lesson_num_id`, `classroom_id`) VALUES
(1, 1, 1, 8, 2),
(2, 5, 2, 9, 1),
(3, 5, 5, 10, 1),
(4, 4, 3, 11, 3),
(5, 4, 4, 12, 3),
(6, 1, 6, 13, 2),
(7, 4, 5, 10, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `gruppa`
--

CREATE TABLE `gruppa` (
  `gruppa_id` int NOT NULL,
  `name` varchar(10) NOT NULL,
  `special_id` int NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `gruppa`
--

INSERT INTO `gruppa` (`gruppa_id`, `name`, `special_id`, `date_begin`, `date_end`) VALUES
(1, '101 ИС', 1, '2016-09-01', '2020-07-01'),
(2, '102 АС', 3, '2016-09-01', '2020-07-01'),
(3, '302 ИС', 1, '2014-09-01', '2018-07-01'),
(4, '302 АС', 3, '2014-09-01', '2018-07-01'),
(5, '202 С', 6, '2015-09-01', '2019-07-01'),
(6, '404 П', 5, '2014-09-01', '2017-07-01'),
(7, '303 ЭЛ', 4, '2014-09-01', '2018-07-01');

-- --------------------------------------------------------

--
-- Структура таблицы `lesson_num`
--

CREATE TABLE `lesson_num` (
  `lesson_num_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `time_lesson` time NOT NULL,
  `year_lesson` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `lesson_num`
--

INSERT INTO `lesson_num` (`lesson_num_id`, `name`, `time_lesson`, `year_lesson`) VALUES
(8, '1 пара', '08:30:00', 2017),
(9, '2 пара', '10:10:00', 2017),
(10, '3 пара', '12:10:00', 2017),
(11, '4 пара', '13:50:00', 2017),
(12, '5 пара', '15:40:00', 2017),
(13, '6 пара', '17:20:00', 2017),
(14, '7 пара', '19:00:00', 2017);

-- --------------------------------------------------------

--
-- Структура таблицы `otdel`
--

CREATE TABLE `otdel` (
  `otdel_id` smallint NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `otdel`
--

INSERT INTO `otdel` (`otdel_id`, `name`) VALUES
(1, 'Информационные системы'),
(2, 'Технические специальности'),
(3, 'Автоматизация и управление');

-- --------------------------------------------------------

--
-- Структура таблицы `special`
--

CREATE TABLE `special` (
  `special_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `otdel_id` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `special`
--

INSERT INTO `special` (`special_id`, `name`, `otdel_id`) VALUES
(1, 'Информационные системы', 1),
(2, 'Нефтегазовое дело', 2),
(3, 'Автоматизация и управление', 3),
(4, 'Электроснабжение', 3),
(5, 'Программное обеспечение ВТ и  ПО', 1),
(6, 'Строительство и эксплуатация  зданий и сооружений', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `user_id` bigint NOT NULL,
  `gruppa_id` int NOT NULL,
  `num_zach` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`user_id`, `gruppa_id`, `num_zach`) VALUES
(6, 1, 'К1020'),
(7, 2, 'А5292'),
(8, 6, 'А5292'),
(9, 5, 'Р5285'),
(10, 4, 'Ф5285'),
(11, 6, 'К7485'),
(12, 3, 'А2585'),
(14, 1, 'К5285');

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

CREATE TABLE `teacher` (
  `user_id` bigint NOT NULL,
  `otdel_id` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `teacher`
--

INSERT INTO `teacher` (`user_id`, `otdel_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(5, 2),
(13, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` bigint NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `patronomic` varchar(50) NOT NULL,
  `login` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `pass` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `gender_id` tinyint NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `lastname`, `firstname`, `patronomic`, `login`, `pass`, `gender_id`, `birthday`) VALUES
(1, 'Иванов', 'Иван', 'Иванович', NULL, NULL, 1, '1975-05-25'),
(2, 'Петров', 'Петр', 'Петрович', NULL, NULL, 1, '1980-08-06'),
(3, 'Козлов', 'Иван', 'Афанасьевич', NULL, NULL, 1, '1985-04-15'),
(4, 'Чурюмова', 'Кристина', 'Федоровна', NULL, NULL, 2, '1990-05-20'),
(5, 'Васильев', 'Феофан', 'Александрович', NULL, NULL, 1, '1991-01-13'),
(6, 'Федорова', 'Милана', 'Андреевна', NULL, NULL, 2, '1998-04-15'),
(7, 'Нуржанов', 'Нуржан', 'Нуржанович', NULL, NULL, 1, '1999-09-18'),
(8, 'Канатов', 'Канат', 'Канатович', NULL, NULL, 1, '1999-07-07'),
(9, 'Золотая', 'Ирина', 'Кайратовна', NULL, NULL, 2, '2000-09-14'),
(10, 'Серая', 'Арина', 'Радионовна', NULL, NULL, 2, '2001-10-29'),
(11, 'Петухов', 'Виталий', 'Фадеевич', NULL, NULL, 1, '2000-02-20'),
(12, 'Котова', 'Аурелия', 'Ароновна', NULL, NULL, 2, '2002-12-19'),
(13, 'Валентинов', 'Валентин', 'Валентинович', NULL, NULL, 1, '1973-11-05'),
(14, 'Ким', 'Валерия', 'Вадимовна', NULL, NULL, 2, '2001-12-25');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`classroom_id`);

--
-- Индексы таблицы `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `special_id` (`special_id`);

--
-- Индексы таблицы `day`
--
ALTER TABLE `day`
  ADD PRIMARY KEY (`day_id`);

--
-- Индексы таблицы `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Индексы таблицы `graduate`
--
ALTER TABLE `graduate`
  ADD PRIMARY KEY (`graduate_id`),
  ADD KEY `gruppa_id` (`gruppa_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `graduate_time`
--
ALTER TABLE `graduate_time`
  ADD PRIMARY KEY (`graduate_time_id`),
  ADD KEY `classroom_id` (`classroom_id`),
  ADD KEY `day_id` (`day_id`),
  ADD KEY `graduate_tid` (`graduate_id`),
  ADD KEY `lesson_num_id` (`lesson_num_id`);

--
-- Индексы таблицы `gruppa`
--
ALTER TABLE `gruppa`
  ADD PRIMARY KEY (`gruppa_id`),
  ADD KEY `special_id` (`special_id`);

--
-- Индексы таблицы `lesson_num`
--
ALTER TABLE `lesson_num`
  ADD PRIMARY KEY (`lesson_num_id`);

--
-- Индексы таблицы `otdel`
--
ALTER TABLE `otdel`
  ADD PRIMARY KEY (`otdel_id`);

--
-- Индексы таблицы `special`
--
ALTER TABLE `special`
  ADD PRIMARY KEY (`special_id`),
  ADD KEY `otdel_id` (`otdel_id`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `gruppa_id` (`gruppa_id`);

--
-- Индексы таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `otdel_id` (`otdel_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `gender_id` (`gender_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `classroom`
--
ALTER TABLE `classroom`
  MODIFY `classroom_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `day`
--
ALTER TABLE `day`
  MODIFY `day_id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `graduate`
--
ALTER TABLE `graduate`
  MODIFY `graduate_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `graduate_time`
--
ALTER TABLE `graduate_time`
  MODIFY `graduate_time_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `gruppa`
--
ALTER TABLE `gruppa`
  MODIFY `gruppa_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `lesson_num`
--
ALTER TABLE `lesson_num`
  MODIFY `lesson_num_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `otdel`
--
ALTER TABLE `otdel`
  MODIFY `otdel_id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `special`
--
ALTER TABLE `special`
  MODIFY `special_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`special_id`) REFERENCES `special` (`special_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `graduate`
--
ALTER TABLE `graduate`
  ADD CONSTRAINT `graduate_ibfk_1` FOREIGN KEY (`gruppa_id`) REFERENCES `gruppa` (`gruppa_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `graduate_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `graduate_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `teacher` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `graduate_time`
--
ALTER TABLE `graduate_time`
  ADD CONSTRAINT `graduate_time_ibfk_1` FOREIGN KEY (`classroom_id`) REFERENCES `classroom` (`classroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `graduate_time_ibfk_2` FOREIGN KEY (`day_id`) REFERENCES `day` (`day_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `graduate_time_ibfk_3` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`graduate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `graduate_time_ibfk_4` FOREIGN KEY (`lesson_num_id`) REFERENCES `lesson_num` (`lesson_num_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `gruppa`
--
ALTER TABLE `gruppa`
  ADD CONSTRAINT `gruppa_ibfk_1` FOREIGN KEY (`special_id`) REFERENCES `special` (`special_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `special`
--
ALTER TABLE `special`
  ADD CONSTRAINT `special_ibfk_1` FOREIGN KEY (`otdel_id`) REFERENCES `otdel` (`otdel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`gruppa_id`) REFERENCES `gruppa` (`gruppa_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`otdel_id`) REFERENCES `otdel` (`otdel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
