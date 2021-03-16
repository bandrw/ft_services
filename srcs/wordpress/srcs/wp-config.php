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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'kfriese' );

/** MySQL database password */
define( 'DB_PASSWORD', 'kfriese' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-svc:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'xI$gpwCX83g&3?CBZ%(rAPdb49$b ;oLczPy~*A-py8j;wGyrF9mEXi,_L(Q{;5-' );
define( 'SECURE_AUTH_KEY',  '/gN+_l`P+V&EYabs+ggJTA%mAO/6av;f#o^VZ1ChOXlE0Sa9[LT{88BM1^E.U^;d' );
define( 'LOGGED_IN_KEY',    '{|^nK>z*mM%U@=huZ!m_L0Z5F a_(z)M,v@P,OQ.<t,wv[vQitdt8M<$%@-b@T58' );
define( 'NONCE_KEY',        'P =HB`)1K0WbLZV(IXzvmEP&m9{1g/r>Y:9E597|>hj^dp/!z(nF~Ppt93w:MJX)' );
define( 'AUTH_SALT',        '9^Y<d6Nk(Dp^2pRSM/8N{U~vv/.?Cw=bqvx`{q@ZntX{p9EwFh4o&]Y67kYoh_{L' );
define( 'SECURE_AUTH_SALT', '=WBLj YZXQ1U7BZxp0KIjRu~~8@F=XCF}+mt+)k@HS+FB4@<kKxAji*Ho6HM@SM[' );
define( 'LOGGED_IN_SALT',   'tWnmX&Q0hC5@w&{LmYp.%Vi.CD<po>$ g;S%k+^Ua9)a.tb3`~$1[L[<q.O;4cp;' );
define( 'NONCE_SALT',       ':iurvoY7?yq9#(i!.8_JD7@$v E4]_}c UeFPGf6/t3D@Y=r8ua??1CEJ`cG*+F<' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
