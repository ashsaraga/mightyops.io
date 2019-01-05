<?php
/**
 * Add a custom post type with custom meta fields

	Need:
		- gallery of screenshots
		- project logo
		// - skills tags

 */

// creates custom post type
function create__clients() {
	$labels = array(
		'name' => __( 'Clients' ),
		'singular_name' => __( 'Client' ),
		'add_new' => __( 'New Client' ),
		'add_new_item' => __( 'Add Client' ),
		'edit_item' => __( 'Edit Client' ),
		'new_item' => __( 'New Client' ),
		'view_item' => __( 'View Client' ),
		'search_items' => __( 'Search Clients' ),
		'not_found' =>  __( 'No Clients Found' ),
		'not_found_in_trash' => __( 'No Clients found in Trash' ),
	);
	$args = array(
		'labels' => $labels,
		'public' => true,  // sets a default for 'show_in_nav_menus', 'show_ui', 'exclude_from_search', and 'publicly_queryable'
		'hierarchical' => false,  // makes this post type a page (true) or a post (false)
		'exclude_from_search' => false,  // excludes this post type from front end search results (true)
		'publicly_queryable'  => true,  // makes the post type accessible by URL queries (true)
		'show_ui' => true,  // creates an admin menu (true)
		'show_in_menu' => true,  // creates a top level admin menu (true), a submenu item in another top level menu (e.g. 'tools.php', 'edit.php?post_type=page'), or no menu (false)
		'show_in_nav_menus' => true, // makes this post type available for use in the menu editor
		'menu_position' =>  6,  // sets post type admin menu position
		'menu_icon'   => 'dashicons-analytics',  // sets admin menu icon, can be dashicon or SVG ('data:image/svg+xml;base64,'.svgURL)
		'supports' => array(  // sets core features for post type
			'title',
			'editor',
			// 'excerpt',
			'thumbnail',
			'revisions'
		),
		'register_meta_box_cb' => 'create__clients__meta', // sets callback function for custom meta fields
		'has_archive' => true  // creates archive page for post type (true)
	);
	register_post_type( 'clients', $args );
}
add_action( 'init', 'create__clients' );

// creates custom meta boxes
function create__clients__meta() {
	add_meta_box(
		'clients__account',  // sets ID for the meta box attribute
		'Client Logo',  // Title of the meta box
		'clients__account',  // sets callback function to echo the box output
		'clients',  // sets screens where the meta box will appear
		'side',  // positions the meta box on right column (side) or main column (normal)
		'high'  // positions the meta box at the top (high) or bottom (low) of its context
	);
	add_meta_box(
		'clients__frontpage',  // sets ID for the meta box attribute
		'Front Page Feature',  // Title of the meta box
		'clients__frontpage',  // sets callback function to echo the box output
		'clients',  // sets screens where the meta box will appear
		'side',  // positions the meta box on right column (side) or main column (normal)
		'high'  // positions the meta box at the top (high) or bottom (low) of its context
	);
	add_meta_box(
		'clients__link',  // sets ID for the meta box attribute
		'Project Link',  // Title of the meta box
		'clients__link',  // sets callback function to echo the box output
		'clients',  // sets screens where the meta box will appear
		'side',  // positions the meta box on right column (side) or main column (normal)
		'high'  // positions the meta box at the top (high) or bottom (low) of its context
	);
	// add_meta_box(
	// 	'clients__projects',  // sets ID for the meta box attribute
	// 	'Projects',  // Title of the meta box
	// 	'clients__projects',  // sets callback function to echo the box output
	// 	'clients',  // sets screens where the meta box will appear
	// 	'normal',  // positions the meta box on right column (side) or main column (normal)
	// 	'high'  // positions the meta box at the top (high) or bottom (low) of its context
	// );
}

function clients__account() {
	global $post;  // set $post to the current post ID
	$originalpost = $post;  // stores the current $post so it can be reset after a wp_query()
	wp_nonce_field( basename( __FILE__ ), 'clients__meta_nonce' );  // sets nonce to be checked when saving meta

	// Get WordPress' media upload URL
	$upload_link = esc_url( get_upload_iframe_src( 'image', $post->ID ) );

	$client = get_post_meta( $post->ID, '_client', true );
	$clientURI = wp_get_attachment_image_src( $client, 'full' );
	$has_client = is_array( $clientURI );
	?>
	<!-- Your image container, which can be manipulated with js -->
	<div class="client-container" style="background-color:#3a3a54;padding:.5rem;">
	    <?php if ( $has_client ) : ?>
	        <img src="<?php echo $clientURI[0] ?>" alt="" style="max-width:100%;" />
	    <?php endif; ?>
	</div>

	<!-- Your add & remove image links -->
	<p class="hide-if-no-js">
	    <a class="upload-client <?php if ( $has_client  ) { echo 'hidden'; } ?>"
	       href="<?php echo $upload_link ?>">
	        <?php _e('Add client logo') ?>
	    </a>
	    <a class="delete-client <?php if ( ! $has_client  ) { echo 'hidden'; } ?>"
	      href="#">
	        <?php _e('Remove logo') ?>
	    </a>
	</p>

	<!-- A hidden input to set and post the chosen image id -->
	<input class="client-id" name="_client" id="_client" type="hidden" value="<?php echo esc_attr( $client ); ?>" />

	<script type="text/javascript">
		jQuery(function($){

		  // Set all variables to be used in scope
		  var frame,
		      metaBox = $('#clients__account.postbox'), // Your meta box id here
		      addImgLink = metaBox.find('.upload-client'),
		      delImgLink = metaBox.find( '.delete-client'),
		      imgContainer = metaBox.find( '.client-container'),
		      imgIdInput = metaBox.find( '.client-id' );

		  // ADD IMAGE LINK
		  addImgLink.on( 'click', function( event ){

		    event.preventDefault();

		    // If the media frame already exists, reopen it.
		    if ( frame ) {
		      frame.open();
		      return;
		    }

		    // Create a new media frame
		    frame = wp.media({
		      title: 'Select or Upload Media',
		      button: {
		        text: 'Select'
		      },
		      multiple: false  // Set to true to allow multiple files to be selected
		    });


		    // When an image is selected in the media frame...
		    frame.on( 'select', function() {

		      // Get media attachment details from the frame state
		      var attachment = frame.state().get('selection').first().toJSON();

		      // Send the attachment URL to our custom image input field.
		      imgContainer.append( '<img src="'+attachment.url+'" alt="" style="max-width:100%;"/>' );

		      // Send the attachment id to our hidden input
		      imgIdInput.val( attachment.id );

		      // Hide the add image link
		      addImgLink.addClass( 'hidden' );

		      // Unhide the remove image link
		      delImgLink.removeClass( 'hidden' );
		    });

		    // Finally, open the modal on click
		    frame.open();
		  });


		  // DELETE IMAGE LINK
		  delImgLink.on( 'click', function( event ){

		    event.preventDefault();

		    // Clear out the preview image
		    imgContainer.html( '' );

		    // Un-hide the add image link
		    addImgLink.removeClass( 'hidden' );

		    // Hide the delete image link
		    delImgLink.addClass( 'hidden' );

		    // Delete the image id from the hidden input
		    imgIdInput.val( '' );

		  });

		});
	</script>
	<?php
}

function clients__frontpage() {
	global $post;  // set $post to the current post ID
	$originalpost = $post;  // stores the current $post so it can be reset after a wp_query()
	wp_nonce_field( basename( __FILE__ ), 'clients__meta_nonce' );  // sets nonce to be checked when saving meta

	$is_featured = get_post_meta( $post->ID, '_featured', true );
	?>

	<label for="_featured"><input type="checkbox" name="_featured" value="featured" id="_featured" <?php checked( $is_featured, 'featured' ); ?> /> on Front Page</label>

	<?php
}

function clients__link() {
	global $post;  // set $post to the current post ID
	$originalpost = $post;  // stores the current $post so it can be reset after a wp_query()
	wp_nonce_field( basename( __FILE__ ), 'clients__meta_nonce' );  // sets nonce to be checked when saving meta

	$liveLink = get_post_meta( $post->ID, '_link', true );

	// outputs a simple text field
	echo'<label for="_link">URL for live site:</label>';
	echo '<input type="text" name="_link" id="_link" value="' . esc_textarea( $liveLink )  . '" class="widefat">';
	?>

	<?php
}

function clients__projects() {
	global $post;  // set $post to the current post ID
	$originalpost = $post;  // stores the current $post so it can be reset after a wp_query()
	wp_nonce_field( basename( __FILE__ ), 'clients__meta_nonce' );  // sets nonce to be checked when saving meta
}

// saves custom meta box data
function save__clients__meta( $post_id, $post ) {
	// return if the user doesn't have edit permissions.
	if ( ! current_user_can( 'edit_post', $post_id ) ) {
		return $post_id;
	}
	// return unless nonce is verified
	if ( ! isset( $_POST['clients__meta_nonce'] ) || ! wp_verify_nonce( $_POST['clients__meta_nonce'], basename(__FILE__) ) ) {
		return $post_id;
	}

	$meta_array['_client'] = esc_attr( $_POST['_client'] );
	$meta_array['_featured'] = esc_attr( $_POST['_featured'] );
	$meta_array['_link'] = esc_attr( $_POST['_link'] );

	foreach ( $meta_array as $key => $value ) :
		// avoid duplicate data during revisions
		if ( 'revision' === $post->post_type ) {
			return;
		}
		// update the meta value it if already has one
		if ( get_post_meta( $post_id, $key, false ) ) {
			update_post_meta( $post_id, $key, $value );
		// otherwise create meta entry with new value
		} else {
			add_post_meta( $post_id, $key, $value);
		}
		// delete meta entry if the field has no value
		if ( ! $value ) {
			delete_post_meta( $post_id, $key );
		}
	endforeach;
}
add_action( 'save_post', 'save__clients__meta', 10, 2 );  // hook to 'save_post' action, $callback, priority (1-10:high-low), $callback args
