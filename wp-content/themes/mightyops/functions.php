<?php
/**
 * mightyops | Mighty functions and definitions
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package mightyops
 */

if ( ! function_exists( '_mightyops_setup' ) ) :
	/**
	 * Sets up theme defaults and registers support for various WordPress features.
	 *
	 * Note that this function is hooked into the after_setup_theme hook, which
	 * runs before the init hook. The init hook is too late for some features, such
	 * as indicating support for post thumbnails.
	 */
	function _mightyops_setup() {
		/*
		 * Make theme available for translation.
		 * Translations can be filed in the /languages/ directory.
		 * If you're building a theme based on mightyops | Mighty, use a find and replace
		 * to change 'mightyops | Mighty' to the name of your theme in all the template files.
		 */
		load_theme_textdomain( 'mightyops | Mighty', get_template_directory() . '/languages' );

		// Add default posts and comments RSS feed links to head.
		add_theme_support( 'automatic-feed-links' );

		/*
		 * Let WordPress manage the document title.
		 * By adding theme support, we declare that this theme does not use a
		 * hard-coded <title> tag in the document head, and expect WordPress to
		 * provide it for us.
		 */
		add_theme_support( 'title-tag' );

		/*
		 * Enable support for Post Thumbnails on posts and pages.
		 *
		 * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
		 */
		add_theme_support( 'post-thumbnails' );

		// This theme uses wp_nav_menu()
		register_nav_menus( array(
			'Nav Links' => esc_html__( 'Main', '_mightyops' ),
			'Social Links' => esc_html__( 'Social', '_mightyops' )
		) );

		/*
		 * Switch default core markup for search form, comment form, and comments
		 * to output valid HTML5.
		 */
		add_theme_support( 'html5', array(
			'search-form',
			'comment-form',
			'comment-list',
			'gallery',
			'caption',
		) );

		// Set up the WordPress core custom background feature.
		add_theme_support( 'custom-background', apply_filters( '_mightyops_custom_background_args', array(
			'default-color' => 'ffffff',
			'default-image' => '',
		) ) );

		// Add theme support for selective refresh for widgets.
		add_theme_support( 'customize-selective-refresh-widgets' );

		/**
		 * Add support for core custom logo.
		 *
		 * @link https://codex.wordpress.org/Theme_Logo
		 */
		add_theme_support( 'custom-logo', array(
			'height'      => 250,
			'width'       => 250,
			'flex-width'  => true,
			'flex-height' => true,
		) );
	}
endif;
add_action( 'after_setup_theme', '_mightyops_setup' );

/**
 * Set the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 */
function _mightyops_content_width() {
	// This variable is intended to be overruled from themes.
	// Open WPCS issue: {@link https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards/issues/1043}.
	// phpcs:ignore WordPress.NamingConventions.PrefixAllGlobals.NonPrefixedVariableFound
	$GLOBALS['content_width'] = apply_filters( '_mightyops_content_width', 640 );
}
add_action( 'after_setup_theme', '_mightyops_content_width', 0 );

/**
 * Enqueue scripts and styles.
 */
function _mightyops_scripts() {
	wp_enqueue_style( '_mightyops-style', get_stylesheet_uri() );

	// Normalize Styles
	wp_enqueue_style('_mightyops-normalize', get_template_directory_uri() . '/css/normalize.css');

	// _s Styles
	wp_enqueue_style('_mightyops-styles', get_template_directory_uri() . '/css/main.css');

	// Accio Script
	wp_enqueue_script('_accio-scripts', get_template_directory_uri() . '/js/castAccio.js', array('jquery'), true);

	if ( is_404() ) {
		wp_enqueue_script('_energize-scripts', get_template_directory_uri() . '/js/energize.js', array('jquery'), true);
	}

	// _s Scripts
	wp_enqueue_script('_mightyops-scripts', get_template_directory_uri() . '/js/main.js', array('jquery'), true);

	wp_enqueue_script( '_mightyops-navigation', get_template_directory_uri() . '/js/navigation.js', array(), '20151215', true );

	wp_enqueue_script( '_mightyops-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), '20151215', true );

}
add_action( 'wp_enqueue_scripts', '_mightyops_scripts' );

/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Functions which enhance the theme by hooking into WordPress.
 */
require get_template_directory() . '/inc/template-functions.php';

/**
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Load Jetpack compatibility file.
 */
if ( defined( 'JETPACK__VERSION' ) ) {
	require get_template_directory() . '/inc/jetpack.php';
}



/**
 * Custom Post Types
 */
// Projects
require get_template_directory() . '/inc/posttype-clients.php';
// Skills
require get_template_directory() . '/inc/posttype-skills.php';
// Homebrews
require get_template_directory() . '/inc/posttype-homebrew.php';

/**
 * Custom Taxonomies
 */
// Skills
require get_template_directory() . '/inc/taxonomy-skills.php';

// Enable WP media uploader for custom post types
function media_uploader() {
  global $post_type;
  if( 'projects' == $post_type) {
    if(function_exists('wp_enqueue_media')) {
      wp_enqueue_media();
    }
    else {
      wp_enqueue_script('media-upload');
      wp_enqueue_script('thickbox');
      wp_enqueue_style('thickbox');
    }
  }
}
add_action('admin_enqueue_scripts', 'media_uploader');

// Enable SVGs in media uploader
function add_svg_to_upload_mimes( $upload_mimes ) {
	$upload_mimes['svg'] = 'image/svg+xml';
	$upload_mimes['svgz'] = 'image/svg+xml';
	return $upload_mimes;
}
add_filter( 'upload_mimes', 'add_svg_to_upload_mimes', 10, 1 );

// Enable the excerpt on pages
add_post_type_support( 'page', 'excerpt' );

// Move Yoast SEO to the bottom of the page editor
function yoasttobottom() {
  return 'low';
}
add_filter( 'wpseo_metabox_prio', 'yoasttobottom');

// Clean Archive Titles
add_filter( 'get_the_archive_title', function ($title) {
  if ( is_category() ) {
    $title = single_cat_title( '', false );  // set $title to 'Category Title', but do not display
  } elseif ( is_tag() ) {
    $title = single_tag_title( '', false );  // set $title to 'Tag Title', but do not display
  } elseif ( is_author() ) {
    $title = '<span class="vcard">' . get_the_author() . '</span>' ;  // set $title to 'Author'
  }
  return $title;
});

// Customize the WordPress login screen
function custom_login() {
echo '<link rel="stylesheet" type="text/css" href="' . get_template_directory_uri() . '/css/login-styles.css" />';
}
add_action('login_head', 'custom_login');

function custom_loginlogo_url($url) {
    return home_url();
}
add_filter( 'login_headerurl', 'custom_loginlogo_url' );

/* Disable Comments Block --------------------------------------------------------------- */
// Disable support for comments and trackbacks in post types
function df_disable_comments_post_types_support() {
	$post_types = get_post_types();
	foreach ($post_types as $post_type) {
		if(post_type_supports($post_type, 'comments')) {
			remove_post_type_support($post_type, 'comments');
			remove_post_type_support($post_type, 'trackbacks');
		}
	}
}

add_action('admin_init', 'df_disable_comments_post_types_support');

// Close comments on the front-end
function df_disable_comments_status() {
	return false;
}

add_filter('comments_open', 'df_disable_comments_status', 20, 2);
add_filter('pings_open', 'df_disable_comments_status', 20, 2);

// Hide existing comments
function df_disable_comments_hide_existing_comments($comments) {
	$comments = array();
	return $comments;
}

add_filter('comments_array', 'df_disable_comments_hide_existing_comments', 10, 2);

// Remove comments page in menu
function df_disable_comments_admin_menu() {
	remove_menu_page('edit-comments.php');
}

add_action('admin_menu', 'df_disable_comments_admin_menu');

// Redirect any user trying to access comments page
function df_disable_comments_admin_menu_redirect() {
	global $pagenow;
	if ($pagenow === 'edit-comments.php') {
		wp_redirect(admin_url()); exit;
	}
}

add_action('admin_init', 'df_disable_comments_admin_menu_redirect');

// Remove comments metabox from dashboard
function df_disable_comments_dashboard() {
	remove_meta_box('dashboard_recent_comments', 'dashboard', 'normal');
}

add_action('admin_init', 'df_disable_comments_dashboard');

// Remove comments links from admin bar
function df_disable_comments_admin_bar() {
	if (is_admin_bar_showing()) {
		remove_action('admin_bar_menu', 'wp_admin_bar_comments_menu', 60);
	}
}

add_action('init', 'df_disable_comments_admin_bar');
/* End Disable Comments Block ----------------------------------------------------------- */