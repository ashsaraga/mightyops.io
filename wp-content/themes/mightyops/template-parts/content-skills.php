<?php
/**
 * Template part displaying page content for Endorsements
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package Perseus_|_Middle_Seat
 */

$rating = get_post_meta( $post->ID, '_rating', true );
$icon = get_post_meta( $post->ID, '_icon', true );
$iconSet = get_post_meta( $post->ID, '_iconSet', true );
$stack = get_post_meta( $post->ID, '_stack', true );

$homeClasses = array( 'has-margin-7', 'has-margin-bottom');

// Front Page Feed
if ( is_front_page() ) { ?>
<article id="progress_<?php echo the_title(); ?>" <?php post_class( $homeClasses ); ?>>
	<div>
		<h4 class="is-size-5 has-margin-none has-text-weight-regular has-letter-spacing-2">
			<span class="icon has-text-<?php echo $iconSet; ?> has-margin-none is-size-5 has-text-weight-regular <?php if ( $stack == 'front-end' ) { echo 'has-text-mod3'; } else if ( $stack == 'back-end' ) { echo 'has-text-mod5'; } ?>"><?php echo $icon; ?></span><?php echo the_title(); ?>
		</h4>
		<progress value="<?php echo $rating; ?>" max="100"></progress>
		<h5 class="is-size-7 has-margin-none has-text-right has-text-mod3 <?php if ( $stack == 'front-end' ) { echo 'has-text-mod3'; } else if ( $stack == 'back-end' ) { echo 'has-text-mod5'; } ?> has-text-weight-bold is-uppercase"><?php if ( $rating <= 25 ) { echo 'Novice'; } else if ( $rating <= 51 ) { echo 'Intermediate'; } else if ( $rating < 76 ) { echo 'Professional'; } else if ( $rating <= 100 ) { echo 'Expert'; } ?></h5>
	</div>
<?php
}
// Single Post
elseif ( is_singular() ) {
?>
<article id="progress_<?php echo the_title(); ?>" <?php post_class(); ?>>
<?php
}
// Archive
else { ?>
?>
<article id="progress_<?php echo the_title(); ?>" <?php post_class(); ?>>
	<?php
}
?>
</article><!-- #post-<?php the_ID(); ?> -->