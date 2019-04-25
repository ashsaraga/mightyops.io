<?php
/**
 * The template for displaying 404 pages (not found)
 *
 * @link https://codex.wordpress.org/Creating_an_Error_404_Page
 *
 * @package _s_|_Middle_Seat
 */

get_header();
?>

	<section class="has-text-daybreak">
		<div class="has-text-centered">
			<div class="has-padding-7">
				<h4 class="has-text-weight-medium is-uppercase is-size-0 has-margin-8">404</h4>
				<h4 class="has-text-weight-light is-uppercase is-size-5 has-margin-0">UNCHARTED SPACE</h4>
			</div>
			<div class="has-margin-3">
				<h1 class="is-size-0 has-text-weight-medium"><span class="has-underline-modGradient has-position-relative">Don't Panic</span></h1>
				<p class="has-margin-6 is-size-4">This page doesn't exist yet, but we can get you back to the known universe.</p>
				<div class="is-flex has-padding-1">
					<a class="fits-flex-33 has-background-evening has-text-daybreak is-uppercase has-text-centered is-size-6 has-letter-spacing-1 has-padding-8 has-margin-top has-margin-8 has-underline-mod2 disapparateLink">Go Back</a>
					<a href="<?php echo home_url(); ?>" class="fits-flex-33 has-background-evening has-text-daybreak is-uppercase has-text-centered is-size-6 has-letter-spacing-1 has-padding-8 has-margin-top has-margin-8 has-underline-mod4">Head Home</a>
				</div>
			</div>
		</div>
	</section>

<?php
get_footer();
