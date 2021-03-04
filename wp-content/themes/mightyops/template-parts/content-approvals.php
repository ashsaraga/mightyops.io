<?php
/**
 * Template part displaying page content for Approvals 
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package mightyops
 */

$title = the_title('', '', false);
$featured = get_the_post_thumbnail_url( $post->ID, 'full');
$approvalClient = get_post_meta( $post->ID, '_approvalClient', true ); 
$status = get_post_meta( $post->ID, '_status', true ); 
$nextItem = get_post_meta( $post->ID, '_nextItem', true );
$nextDate = get_post_meta( $post->ID, '_nextDate', true );
$id = $approvalClient . strtolower( str_replace(' ', '_', $title) ) . 'approval';

// $archiveClasses = array( 'fits-flex-33', 'is-flex-column');

// Front Page Feed
if ( is_front_page() ) { 
  // no front page content 
}
// Single Post
elseif ( is_singular() ) {
?>
<section>
  <article id="<?php echo $id; ?>" <?php post_class(); ?>>
    <div class="is-flex has-margin-bottom has-margin-7">
      <div class="fits-flex-66">
        <h2 class="is-size-6 is-uppercase has-text-prism has-margin-8 has-text-weight-regular has-letter-spacing-1"><?php echo $approvalClient; ?></h2>
        <h1 class="is-size-1 has-text-daybreak has-margin-7 has-margin-bottom"><?php echo $title; ?></h1>
        <p class="has-text-dawn is-uppercase">Last Revision: <?php the_modified_time('Y-m-d'); ?></p>  
      </div>
      <div class="fits-flex-34">
        <p class="is-uppercase has-text-mist is-size-6">Status: 
          <span class="has-text-<?php 
            if ( $status == "initial review" ) {
              echo "code4";
            } elseif ( $status == "edits pending" ) {
              echo "code3";
            } elseif ( $status == "in review" ) {
              echo "code2";
            } elseif ( $status == "on hold" ) {
              echo "code5";
            } elseif ( $status == "approved" ) {
              echo "code1";
            } else {
              echo "mist";
            }
          ?>"><?php echo $status; ?></span></p>
        <div class="is-flex">
          <div class="fits-flex-49 flex-grow-1">
            <p class="has-background-twilight has-text-prism is-size-8 has-padding-8 has-margin-none is-uppercase">Next Step</p>
            <p class="has-padding-8 has-text-daybreak is-size-7 has-margin-8 has-margin-bottom"><?php echo $nextItem; ?></p>
          </div>
          <div class="fits-flex-49">
            <p class="has-background-evening has-text-prism is-size-8 has-padding-8 has-margin-none is-uppercase">Start</p>
            <p class="has-padding-8 has-text-daybreak is-size-7 has-margin-8 has-margin-bottom"><?php echo $nextDate; ?></p>
          </div>
        </div>
      </div>
    </div>
    <div class="is-flex">
      <div class="fits-flex-66 is-flex-column is-flex-start"> 
        <h3 class="is-uppercase has-text-twilight has-text-weight-medium is-size-5">Content for Review</h3>
        <div class="has-background-daybreak has-borderradius-02 has-padding-5 has-margin-bottom has-margin-4">
          <?php the_content(); ?>
        </div>
      </div>
      <div class="fits-flex-34">
        <h3 class="is-uppercase has-text-twilight is-size-5 has-text-weight-medium">Discussion</h3>
        <?php comments_template(); ?>
      </div>
    </div>
  <?php
}
// Archive
else { 
  // no archive content 
}
?>
  </article><!-- #post-<?php the_ID(); ?> -->
</section>