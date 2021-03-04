<?php
/**
 * The template for displaying comments
 *
 * This is the template that displays the area of the page that contains both the current comments
 * and the comment form.
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package mightyops
 */

/*
 * If the current post is protected by a password and
 * the visitor has not yet entered the password we will
 * return early without loading the comments.
 */
if ( post_password_required() ) {
  return;
}
?>

<div id="comments" class="comments-area">

  <?php
  // You can start editing here -- including this comment!
  if ( have_comments() ) :
    if ( get_post_type() == 'approvals' ) {
    ?>
      <h2 class="comments-title is-size-7 has-text-midnight has-background-codeGradient has-text-right is-uppercase has-text-weight-regular has-padding-8 has-letter-spacing-0 has-borderradius-02 has-margin-8">
        <?php
        $_mightyops_comment_count = get_comments_number();
        if ( '1' === $_mightyops_comment_count ) {
          printf(
            /* translators: 1: title. */
            esc_html__( '1 Comment in Thread', '_mightyops' )
          );
        } else {
          printf( 
            /* translators: 1: comment count number, 2: title. */
            esc_html( _nx( '%1$s Comment in Thread', '%1$s Comments in Thread', $_mightyops_comment_count, 'comments title', '_mightyops' ) ),
            number_format_i18n( $_mightyops_comment_count ), // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
            '<span>' . wp_kses_post( get_the_title() ) . '</span>'
          );
        }
        ?>
      </h2><!-- .comments-title -->

      <?php the_comments_navigation(); ?>

      <ul class="comment-list has-margin-none has-padding-none">
        <?php
        wp_list_comments('type=comment&callback=approvals__comments');
        ?>
      </ul><!-- .comment-list -->

      <?php
      the_comments_navigation();

      // If comments are closed and there are comments, let's leave a little note, shall we?
      if ( ! comments_open() ) :
        ?>
        <p class="no-comments"><?php esc_html_e( 'Comments are closed.', '_mightyops' ); ?></p>
        <?php
      endif;
    } else {
    ?>
      <h2 class="comments-title">
        <?php
        $_mightyops_comment_count = get_comments_number();
        if ( '1' === $_mightyops_comment_count ) {
          printf(
            /* translators: 1: title. */
            esc_html__( 'One thought on &ldquo;%1$s&rdquo;', '_mightyops' ),
            '<span>' . wp_kses_post( get_the_title() ) . '</span>'
          );
        } else {
          printf( 
            /* translators: 1: comment count number, 2: title. */
            esc_html( _nx( '%1$s thought on &ldquo;%2$s&rdquo;', '%1$s thoughts on &ldquo;%2$s&rdquo;', $_mightyops_comment_count, 'comments title', '_mightyops' ) ),
            number_format_i18n( $_mightyops_comment_count ), // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
            '<span>' . wp_kses_post( get_the_title() ) . '</span>'
          );
        }
        ?>
      </h2><!-- .comments-title -->

      <?php the_comments_navigation(); ?>

      <ol class="comment-list">
        <?php
        wp_list_comments(
          array(
            'style'      => 'ol',
            'short_ping' => true,
          )
        );
        ?>
      </ol><!-- .comment-list -->

      <?php
      the_comments_navigation();

      // If comments are closed and there are comments, let's leave a little note, shall we?
      if ( ! comments_open() ) :
        ?>
        <p class="no-comments"><?php esc_html_e( 'Comments are closed.', '_mightyops' ); ?></p>
      <?php
      endif;
    }
    
  endif; // Check for have_comments().

  // comment_form();
  //Declare Vars
  $comment_send = 'Post Comment';
  $comment_reply = 'Reply';
   
  $comment_author = 'Client';
  $comment_email = 'client@mightyops.io';
  $comment_body = 'Begin your message here...';
   
  //Array
  $comments_args = array(
      //Define Fields
      'fields' => array(
          //Author field
          'author' => '<p class="comment-form-author" style="display:none;"><br /><input id="author" name="author" aria-required="true" value="' . $comment_author .'"></input></p>',
          //Email Field
          'email' => '<p style="display:none;" class="comment-form-email"><br /><input id="email" name="email" value="' . $comment_email .'"></input></p>',
          //URL Field
          'url' => '',
      ),
      // Change the title of send button
      'label_submit' => __( $comment_send ),
      // Change the title of the reply section
      'title_reply' => __( $comment_reply ),
      // Redefine your own textarea (the comment body).
      'comment_field' => '<div class="comment-form-comment has-margin-none"><textarea id="comment" name="comment" aria-required="true" rows="4" placeholder="' . $comment_body .'"></textarea></div>',
      //Message Before Comment
      'comment_notes_before' => '',
      // Remove "Text or HTML to be displayed after the set of comment fields".
      'comment_notes_after' => '',
      //Submit Button ID
      'id_submit' => __( 'comment-submit' ),
  );
  comment_form( $comments_args );

  ?>

</div><!-- #comments -->