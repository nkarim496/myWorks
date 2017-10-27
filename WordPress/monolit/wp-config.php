<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define('DB_NAME', '');

/** Имя пользователя MySQL */
define('DB_USER', '');

/** Пароль к базе данных MySQL */
define('DB_PASSWORD', '');

/** Имя сервера MySQL */
define('DB_HOST', 'localhost');

/** Кодировка базы данных для создания таблиц. */
define('DB_CHARSET', 'utf8mb4');

/** Схема сопоставления. Не меняйте, если не уверены. */
define('DB_COLLATE', '');

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '3KxDMeb&?4:Qz@D,ro>RD^CbP%Xu#fe5|gI#0`W1+KA>v_wLcbu` EK70E]N1#T;');
define('SECURE_AUTH_KEY',  ']2C:Si8(0ldwZdx8RK0o5yg33{BJn?aG`LEKB<C5dLh5FCIoA}p~eW^l6Atpt2&9');
define('LOGGED_IN_KEY',    'M~Ans@#p6r#dy,awrthA^NEA=fXZj<Ly`(e.p-PY .?`]2>U*{)&zKtJ>W;2]_+g');
define('NONCE_KEY',        'uY4<S5)dm+K-;i<mKu{wb~Gp(8Hkr~Vm!^dTC2Y/0X?LRBb;d5O^lT.VziTF]a:L');
define('AUTH_SALT',        'BV.[jxQQ_;Qp2,it`p=.VryNb7^@3r(}C]_?pwYn^ PzTs(}]@0,Ff$E4&@bPHtB');
define('SECURE_AUTH_SALT', '<kD]!3>mYI5d!fSsH;1*{,@&RQ/KWh5ESK.Tt:uqO!EMV~XbSzIo&s_`B0Iz7p`L');
define('LOGGED_IN_SALT',   'a9jtxSt((ta7H>M%rD,T&D[=xF1$vK.0w0BG#ZoF[GO_)Tc9+B}VA9i)V<)y0_i-');
define('NONCE_SALT',       'e&w.Om{TFj$j-sUQv.bpp|b^3J=<XJ/UT*0at-(<e|.u;vd~o_n)lzP$$CSu$4oh');

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix  = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 * 
 * Информацию о других отладочных константах можно найти в Кодексе.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Инициализирует переменные WordPress и подключает файлы. */
require_once(ABSPATH . 'wp-settings.php');
