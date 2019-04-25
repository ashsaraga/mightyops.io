<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package _s_|_Middle_Seat
 */

?>

	<footer class="has-text-white has-text-centered">
		<div>
			<div class="has-text-centered">
				<svg class="logo">
					<use xlink:href="#mighty-mono"></use>
				</svg>
			</div>
			<nav>
				<?php
				wp_nav_menu( array(
					'theme_location' 	=> 'Social Links',
					'menu_id'        	=> 'primary-social',
					'menu_class'			=> 'social__links',
					'container'				=> false
				) );
				?>
			</nav><!-- #site-navigation -->
		</div>
	</footer><!-- #colophon -->
</div><!-- #page -->

<?php wp_footer(); ?>

</body>
</html>
