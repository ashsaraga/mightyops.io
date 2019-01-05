<?php
/**
 * Add a custom post type with custom meta fields

	Need:
		- gallery of screenshots
		- project logo
		// - skills tags

 */

// creates custom post type
function create__skills() {
	$labels = array(
		'name' => __( 'Skills' ),
		'singular_name' => __( 'Skill' ),
		'add_new' => __( 'New Skill' ),
		'add_new_item' => __( 'Add Skill' ),
		'edit_item' => __( 'Edit Skill' ),
		'new_item' => __( 'New Skill' ),
		'view_item' => __( 'View Skill' ),
		'search_items' => __( 'Search Skills' ),
		'not_found' =>  __( 'No Skills Found' ),
		'not_found_in_trash' => __( 'No Skills found in Trash' ),
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
		'menu_icon'   => 'dashicons-star-filled',  // sets admin menu icon, can be dashicon or SVG ('data:image/svg+xml;base64,'.svgURL)
		'supports' => array(  // sets core features for post type
			'title',
			// 'editor',
			// 'excerpt',
			// 'thumbnail',
			// 'revisions'
		),
		'register_meta_box_cb' => 'create__skills__meta', // sets callback function for custom meta fields
		'has_archive' => true  // creates archive page for post type (true)
	);
	register_post_type( 'skills', $args );
}
add_action( 'init', 'create__skills' );

// creates custom meta boxes
function create__skills__meta() {
	add_meta_box(
		'skills__details',  // sets ID for the meta box attribute
		'Skill Details',  // Title of the meta box
		'skills__details',  // sets callback function to echo the box output
		'skills',  // sets screens where the meta box will appear
		'side',  // positions the meta box on right column (side) or main column (normal)
		'high'  // positions the meta box at the top (high) or bottom (low) of its context
	);
}

function skills__details() {
	global $post;  // set $post to the current post ID
	$originalpost = $post;  // stores the current $post so it can be reset after a wp_query()
	wp_nonce_field( basename( __FILE__ ), 'skills__meta_nonce' );  // sets nonce to be checked when saving meta

	$rating = get_post_meta( $post->ID, '_rating', true );
	$icon = get_post_meta( $post->ID, '_icon', true );
	$iconSet = get_post_meta( $post->ID, '_iconSet', true );
	$stack = get_post_meta( $post->ID, '_stack', true );

	?>
	<div style="margin: .75rem 0;">
		<label for="_rating">Skill Rating</label>
		<select name="_rating" class="widefat">
	    <option value="" disabled>Rating</option>';
	    <?php
	    $i = 1;
	    while ( $i < 101 ) {
	    	?>
	      <option value="<?php echo $i; ?>" <?php selected( $rating, $i ); ?> ><?php echo $i; ?></option>
	    	<?php
	    	$i++;
	    }
	    ?>
	  </select>
	</div>
	<div style="margin: .75rem 0;">
		<label for="_stack">Skill Set</label>
		<select name="_stack" class="widefat">
	    <option value="" disabled>Full Stack</option>';
	    <option value="front-end" <?php selected( $stack, 'front-end' ); ?> >Front End</option>
	    <option value="back-end" <?php selected( $stack, 'back-end' ); ?> >Back End</option>
	  </select>
	</div>
  <hr />
  <div style="margin: .75rem 0;">
  	<label for="_icon">Font Awesome Icon
  		<input type="text" name="_icon" id="_icon" value="<?php echo esc_textarea( $icon ); ?>" class="widefat">
  	</label>
  	<div style="margin: .75rem 0;">
  		<label for="_iconSet">Font Awesome Set</label>
			<select name="_iconSet" class="widefat">
		    <option value="" disabled>Set</option>';
		    <option value="font-awesome" <?php selected( $iconSet, 'font-awesome' ); ?> >Font Awesome Pro</option>
		    <option value="font-awesome-brands" <?php selected( $iconSet, 'font-awesome-brands' ); ?> >Font Awesome Brands</option>
		   </select>
  	</div>
  </div>
	<?php
}

// saves custom meta box data
function save__skills__meta( $post_id, $post ) {
	// return if the user doesn't have edit permissions.
	if ( ! current_user_can( 'edit_post', $post_id ) ) {
		return $post_id;
	}
	// return unless nonce is verified
	if ( ! isset( $_POST['skills__meta_nonce'] ) || ! wp_verify_nonce( $_POST['skills__meta_nonce'], basename(__FILE__) ) ) {
		return $post_id;
	}

	$meta_array['_rating'] = esc_attr( $_POST['_rating'] );
	$meta_array['_icon'] = esc_attr( $_POST['_icon'] );
	$meta_array['_iconSet'] = esc_attr( $_POST['_iconSet'] );
	$meta_array['_stack'] = esc_attr( $_POST['_stack'] );

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
add_action( 'save_post', 'save__skills__meta', 10, 2 );  // hook to 'save_post' action, $callback, priority (1-10:high-low), $callback args
