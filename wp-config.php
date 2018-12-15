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
define( 'AUTH_KEY',          'HX3-cwqpPN8AxL#/EP<Ym0N8v/1*:2w%6i:)uUB[wl^GQ!a2Wcj 3_*4xusP%^%*' );
define( 'SECURE_AUTH_KEY',   '<.QWvv0k:5zm2I^%7fb2tELgd{M2{wLY%y)-diQ>kLtmlpr!{>**]+WT[2MgCzfs' );
define( 'LOGGED_IN_KEY',     'b#V{rZxxl5nujcBJf5&y!4{h:C@d0|?9ktKl3ijBb#X`^OfLI-41CTB7u$wCzYP&' );
define( 'NONCE_KEY',         '^|G^rfk6M`[}VbOS+5$Leq&x,?OFT,IvU&5I qxNxItMP%M5&HO@A%%U|8V3_uK:' );
define( 'AUTH_SALT',         'jMDq%{4Lz`uSew>N [DqDrkuN~-2*q76,rLt3Rmmq$aOUa/:90/$(/8p4|k/Cw69' );
define( 'SECURE_AUTH_SALT',  '1?w2L[&$#3@lu1qId%b&/M-8nS(N:Y:?L+OS] {vKo0@uC=@9_}elpD5mHUe1a7i' );
define( 'LOGGED_IN_SALT',    'ZO4J=Tbbv*L?Xe4oOPcly]VmLQIR{bmn7I#2LO7M4K82Y#@6C&{4A#PqLg~]YvVW' );
define( 'NONCE_SALT',        '>~S0V49KVt/,QxR{.:UZalF.x6uxFdt1-UK}Z%;`BV$o:S{j24;UIL.oSUqfjqy7' );
define( 'WP_CACHE_KEY_SALT', 'j(&6,!L<^GOF2:^UfgD0:z2&Uf)~@o*]XdNeafB+$->rewfNwyq-D>A@|&}@9@S?' );

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
