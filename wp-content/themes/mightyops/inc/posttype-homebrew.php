<?php
/**
 * Add a custom post type with custom meta fields

 */

// creates custom post type
function create__homebrew() {
	$labels = array(
		'name' => __( 'Projects' ),
		'singular_name' => __( 'Project' ),
		'add_new' => __( 'New Project' ),
		'add_new_item' => __( 'Add Project' ),
		'edit_item' => __( 'Edit Project' ),
		'new_item' => __( 'New Project' ),
		'view_item' => __( 'View Project' ),
		'search_items' => __( 'Search Projects' ),
		'not_found' =>  __( 'No Projects Found' ),
		'not_found_in_trash' => __( 'No Projects found in Trash' ),
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
		'menu_position' =>  7,  // sets post type admin menu position
		'menu_icon'   => 'dashicons-editor-code',  // sets admin menu icon, can be dashicon or SVG ('data:image/svg+xml;base64,'.svgURL)
		'supports' => array(  // sets core features for post type
			'title',
			// 'editor',
			'excerpt',
			'thumbnail',
			'revisions'
		),
		'register_meta_box_cb' => 'create__homebrew__meta', // sets callback function for custom meta fields
		'has_archive' => true  // creates archive page for post type (true)
	);
	register_post_type( 'homebrew', $args );
}
add_action( 'init', 'create__homebrew' );

// creates custom meta boxes
function create__homebrew__meta() {
	add_meta_box(
		'homebrew_details',  // sets ID for the meta box attribute
		'Project Details',  // Title of the meta box
		'homebrew_details',  // sets callback function to echo the box output
		'homebrew',  // sets screens where the meta box will appear
		'side',  // positions the meta box on right column (side) or main column (normal)
		'high'  // positions the meta box at the top (high) or bottom (low) of its context
	);
	add_meta_box(
		'homebrew_code',  // sets ID for the meta box attribute
		'Project Code',  // Title of the meta box
		'homebrew_code',  // sets callback function to echo the box output
		'homebrew',  // sets screens where the meta box will appear
		'normal',  // positions the meta box on right column (side) or main column (normal)
		'high'  // positions the meta box at the top (high) or bottom (low) of its context
	);
}

function homebrew_details() {
	global $post;  // set $post to the current post ID
	$originalpost = $post;  // stores the current $post so it can be reset after a wp_query()
	wp_nonce_field( basename( __FILE__ ), 'homebrew__meta_nonce' );  // sets nonce to be checked when saving meta

	$github = get_post_meta( $post->ID, '_github', true );
	// $services = get_post_meta( $post->ID, '_services', true );

	// outputs a simple text field
	echo'<label for="_github">Link to GitHub Repo:</label>';
	echo '<input type="text" name="_github" id="_github" value="' . esc_textarea( $github )  . '" class="widefat">';
}

function homebrew_code() {
	global $post;  // set $post to the current post ID
	$originalpost = $post;  // stores the current $post so it can be reset after a wp_query()
	wp_nonce_field( basename( __FILE__ ), 'homebrew__meta_nonce' );  // sets nonce to be checked when saving meta

	$code = get_post_meta( $post->ID, '_code', true );

	// outputs a simple text field
	echo '<textarea name="_code" rows="10" class="widefat">' . esc_textarea( $code ) .'</textarea>';

}

// saves custom meta box data
function save__homebrew__meta( $post_id, $post ) {
	// return if the user doesn't have edit permissions.
	if ( ! current_user_can( 'edit_post', $post_id ) ) {
		return $post_id;
	}
	// return unless nonce is verified
	if ( ! isset( $_POST['homebrew__meta_nonce'] ) || ! wp_verify_nonce( $_POST['homebrew__meta_nonce'], basename(__FILE__) ) ) {
		return $post_id;
	}

	$meta_array['_github'] = esc_attr( $_POST['_github'] );
	$meta_array['_code'] = esc_attr( $_POST['_code'] );

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
add_action( 'save_post', 'save__homebrew__meta', 10, 2 );  // hook to 'save_post' action, $callback, priority (1-10:high-low), $callback args
