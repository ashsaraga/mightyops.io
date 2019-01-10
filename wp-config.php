<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_main' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'ty#HBc_*qFSt?`u){wuXdi*N>4|d? F)ya=2!2$<68CjIJ]R`j?LV8 =d`$s|E6B' );
define( 'SECURE_AUTH_KEY',   'mzvez]P~;R6{p{,V#^1;nFrwivVM$;R&L%F;}y4IYd&N@K1(v$qk_eWHEGOoR%l<' );
define( 'LOGGED_IN_KEY',     'BoQ5cvYG/x.N&G_zi^mdgn!h}q7PEJ%+va^7B)P{k]T_EOg5K+EBO@-ytI8QU&fJ' );
define( 'NONCE_KEY',         ')a=8G`@=.0`wzg/vI0+mk3{p`>NSR}EY{c*`28h~$qD0zXh1MYY[c#bD/k$XZ#+,' );
define( 'AUTH_SALT',         'P0Co}97/K%=qppq_^;j)rLyI?ZI}bmMrM=.cwrtzU/e~ai/sUyF)$~l=EyEZ~<R-' );
define( 'SECURE_AUTH_SALT',  'c[+>4kJsJP8UzJnWAv9cy|<$[|ATB;BD|B5.,%bVRVI@9KhiT6 lvMUg0z&?R^Mi' );
define( 'LOGGED_IN_SALT',    'pG5GIc{~o;_`y8*qOMD~?T])rJ6>VO6uUG<^bl8-Vp,<gq 4X+7+jnJATPWm[@`8' );
define( 'NONCE_SALT',        'vYtyCCq$~3#)NeR9BL>Wiy_BR9UMpH0=43sbF[+b/nYu-a)-WTz$9C+`bHYh&dxQ' );
define( 'WP_CACHE_KEY_SALT', ')k1By2d?nu.F:idn6aFO;5yK4SwwPuth68fdufvz/,B;FGVJ[_lb5hY|`A^6:R^C' );

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


define( 'WP_DEBUG', true );
define( 'WP_DEGUB_LOG', true );
define( 'FS_METHOD', 'direct' );

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
