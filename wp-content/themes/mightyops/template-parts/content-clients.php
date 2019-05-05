<?php
/**
 * Template part displaying page content for Endorsements
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package mightyops
 */

$client = $image_attributes = wp_get_attachment_image_src( $attachment_id = get_post_meta( $post->ID, '_client', true ) );
$featured = get_the_post_thumbnail_url( $post->ID, 'full');
$link = get_post_meta( $post->ID, '_link', true );
$title = the_title('', '', false);
$id = strtolower( str_replace(' ', '_', $title) );
$terms = get_the_terms( get_the_ID(), 'skills' );

$archiveClasses = array( 'fits-flex-33', 'is-flex-column');

// Front Page Feed
if ( is_front_page() ) { ?>
<article id="<?php echo $id; ?>" <?php post_class($archiveClasses); ?>>
	<div class="has-background-evening has-underline-mod4 has-text-centered has-padding-6">
		<img src="<?php echo $image_attributes[0]; ?>" class="campaign" />
	</div>
	<div class="has-background-daybreak has-text-black has-padding-7 flex-grow-1 is-flex-column">
		<h4 class="is-size-4 has-margin-none has-text-weight-bold"><?php the_title(); ?></h4>
		<div class="has-margin-7 is-flex-start">
			<?php
			if ( $terms && ! is_wp_error( $terms ) ) :
			    foreach ( $terms as $term ) {
			    	printf( '<span class="tags-mod3">' . esc_html($term->name) . "</span>" );
			    }
			endif ;
			?>
		</div>
		<div class="is-flex flex-grow-1 flex-alignitems-end">
			<a name="<?php echo $featured; ?>" title="<?php the_title(); ?>" class="accioLink fits-flex-50 has-background-midnight has-text-daybreak is-uppercase has-text-centered is-size-6 has-letter-spacing-1 has-padding-8 has-margin-none has-underline-mod2">Preview</a>
			<a href="<?php echo $link; ?>" class="liveLine fits-flex-50 has-background-midnight has-text-daybreak is-uppercase has-text-centered is-size-6 has-letter-spacing-1 has-padding-8 has-margin-top has-margin-8 has-underline-mod1" target="_blank">Live</a>
		</div>
	</div>
<?php
}
// Single Post
elseif ( is_singular() ) {
?>
<article id="<?php echo $client; ?>" <?php post_class(); ?>>
<?php
}
// Archive
else { ?>
?>
<article id="<?php echo $client; ?>" <?php post_class(); ?>>
	<?php
}
?>
</article><!-- #post-<?php the_ID(); ?> -->