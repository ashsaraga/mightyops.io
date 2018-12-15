<?php
/**
 * The header for our theme
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package _s_|_Middle_Seat
 */

?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="profile" href="https://gmpg.org/xfn/11">

	<meta name="theme-color" content="#29293a">

	<?php wp_head(); ?>
</head>

<svg style="display:none;">
	<symbol id="mighty" viewBox="0 0 512 512">
		<polygon class="leftArc" points="256,290.6 75.2,471.4 6,471.4 6,40.6 "/>
		<polygon class="bridge" points="436.8,471.4 75.2,471.4 256,290.6 "/>
		<polygon class="rightArc" points="506,40.6 506,471.4 436.8,471.4 256,290.6 "/>
	</symbol>
</svg>

<body <?php body_class( 'mod-code' ); ?>>
<div id="page" class="site">
	<a class="skip-link screen-reader-text" href="#content"><?php esc_html_e( 'Skip to content', 'mightyops | Mighty' ); ?></a>

	<header id="masthead" class="site-header has-position-absolute">
		<div class="is-flex">
			<div></div>
			<div>
				<?php if ( !is_front_page() ) { ?>
				<svg>
					<use xlink:href="#mighty"></use>
				</svg>
				<?php } ?>
			</div>
			<div></div>
		</div>
	</header><!-- #masthead -->
