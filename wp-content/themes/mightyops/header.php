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

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-132277996-1"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-132277996-1');
	</script>

</head>

<svg style="display:none;">
	<symbol id="mighty" viewBox="0 0 512 512">
		<polygon class="leftArc" points="256,290.6 75.2,471.4 6,471.4 6,40.6 "/>
		<polygon class="bridge" points="436.8,471.4 75.2,471.4 256,290.6 "/>
		<polygon class="rightArc" points="506,40.6 506,471.4 436.8,471.4 256,290.6 "/>
	</symbol>
	<symbol id="mighty-mono" viewBox="0 0 512 512">
		<style type="text/css">
			.st0{fill:#FFFFFF;}
			.st1{opacity:0.2;fill:#FFFFFF;}
		</style>
		<g>
			<polygon class="st0" points="256,222.7 99.3,379.5 39.3,379.5 39.3,6 		"/>
			<polygon class="st1" points="412.7,379.5 99.3,379.5 256,222.7 		"/>
			<polygon class="st0" points="472.7,6 472.7,379.5 412.7,379.5 256,222.7 		"/>
		</g>
		<g>
			<path class="st0" d="M98.7,505h-6.8l-2.6-39.3c-0.6-9.4-0.8-23.8-1-25.6l-13.2,52h-7.9L53,440c0.1,2.4,0.1,17.3-0.4,25.5L50.2,505
				h-6.6l4-71.2h11.1l12.7,49.6l12.1-49.6h11.2L98.7,505z"/>
			<path class="st0" d="M165.4,439.3h-16.2v60h16.2v5.6h-39.2v-5.6h16.2v-60h-16.2v-5.6h39.2V439.3z"/>
			<path class="st0" d="M194.8,469.3c0-24.6,14.4-36.6,28.9-36.6c8.9,0,14,2.5,19.6,7.6l-4.4,4.6c-4.4-4.1-9.3-6-15.5-6
				c-10.6,0-21.5,7.3-21.5,30.5c0,21.3,7.2,30.6,20.5,30.6c5.4,0,10.4-1.3,14.9-3.8v-23.3H222l-0.8-6.2h23.2v33.6
				c-6.2,3.2-12.7,5.9-22.8,5.9C205.7,506,194.8,494,194.8,469.3z"/>
			<path class="st0" d="M310.1,470h-29.9V505h-6.5v-71.2h6.5v30.9h29.9v-30.9h6.5V505h-6.5V470z"/>
			<path class="st0" d="M373,505h-6.6v-65.1h-22.9v-6.1H396l-0.7,6.1H373V505z"/>
			<path class="st0" d="M448,505h-6.8v-27.6l-24.3-43.7h7.4l20.5,37.2l20.7-37.2h6.7L448,477.3V505z"/>
		</g>
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
