<?php
/**
 * Add a custom post type with custom meta fields

	Need:
		- gallery of screenshots
		- project logo
		// - skills tags

 */

// creates custom post type
function create__projects() {
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
		'menu_position' =>  6,  // sets post type admin menu position
		'menu_icon'   => 'dashicons-analytics',  // sets admin menu icon, can be dashicon or SVG ('data:image/svg+xml;base64,'.svgURL)
		'supports' => array(  // sets core features for post type
			'title',
			'editor',
			'excerpt',
			'thumbnail',
			'revisions'
		),
		'register_meta_box_cb' => 'create__projects__meta', // sets callback function for custom meta fields
		'has_archive' => true  // creates archive page for post type (true)
	);
	register_post_type( 'projects', $args );
}
add_action( 'init', 'create__projects' );

// creates custom meta boxes
function create__projects__meta() {
	add_meta_box(
		'projects__gallery',  // sets ID for the meta box attribute
		'Screenshots',  // Title of the meta box
		'projects__gallery',  // sets callback function to echo the box output
		'projects',  // sets screens where the meta box will appear
		'normal',  // positions the meta box on right column (side) or main column (normal)
		'high'  // positions the meta box at the top (high) or bottom (low) of its context
	);
}

$screenshots_gallery = array(
	array(
		'label' => 'Preview Shot',
		'desc' => 'Preview image for the front page.',
		'id' => 'projects_screenshots_preview',
		'type' => 'media'
	),
	array(
		'label' => 'Gallery Shots',
		'desc' => 'Gallery of project screenshots.',
		'id' => 'projects_screenshots_gallery',
		'type' => 'gallery'
	)
);

// creates custom meta box output
function projects__gallery() {
	global $post, $screenshots_gallery;  // set $post to the current post ID
	$originalpost = $post;  // stores the current $post so it can be reset after a wp_query()
	wp_nonce_field( basename( __FILE__ ), 'projects__meta_nonce' );  // sets nonce to be checked when saving meta

	// Begin the field table and loop
  echo '<table class="form-table">';
  foreach ($screenshots_gallery as $field) {
    // get value of this field if it exists for this post
    $meta = get_post_meta($post->ID, $field['id'], true);
    // begin a table row with
    echo '<tr>
    <th><label for="'.$field['id'].'">'.$field['label'].'</label></th>
    <td>';
    switch($field['type']) {
      case 'media':
      $close_button = null;
      if ($meta) {
        $close_button = '<span class="projects_screenshots_close"></span>';
      }
      echo '<input id="projects_screenshots_image" type="hidden" name="projects_screenshots_image" value="' . esc_attr($meta) . '" />
      <div class="projects_screenshots_image_container">' . $close_button . '<img id="projects_screenshots_image_src" src="' . wp_get_attachment_thumb_url(projects_screenshots_get_image_id($meta)) . '"></div>
      <input id="projects_screenshots_image_button" type="button" value="Add Image" />';
      break;
      case 'gallery':
      $meta_html = null;
      if ($meta) {
        $meta_html .= '<ul class="projects_screenshots_gallery_list">';
        $meta_array = explode(',', $meta);
        foreach ($meta_array as $meta_gall_item) {
          $meta_html .= '<li><div class="projects_screenshots_gallery_container"><span class="projects_screenshots_gallery_close"><img id="' . esc_attr($meta_gall_item) . '" src="' . wp_get_attachment_thumb_url($meta_gall_item) . '"></span></div></li>';
        }
        $meta_html .= '</ul>';
      }
      echo '<input id="projects_screenshots_gallery" type="hidden" name="projects_screenshots_gallery" value="' . esc_attr($meta) . '" />
      <span id="projects_screenshots_gallery_src">' . $meta_html . '</span>
      <div class="projects_screenshots_gallery_button_container"><input id="projects_screenshots_gallery_button" type="button" value="Add Gallery" /></div>';
      break;
    } //end switch
    echo '</td></tr>';
  } // end foreach
  echo '</table>'; // end table
}

// Register admin scripts for custom fields
function projects_screenshots_load_wp_admin_style() {
  wp_enqueue_media();
  wp_enqueue_script('media-upload');
  wp_enqueue_style( 'projects_screenshots_admin_css', get_template_directory_uri() . '/css/projects_screenshots_admin.css' );
  wp_enqueue_script( 'projects_screenshots_admin_script', get_template_directory_uri() . '/js/projects_screenshots_admin.js' );
}
add_action( 'admin_enqueue_scripts', 'projects_screenshots_load_wp_admin_style' );

// Get image ID from URL
function projects_screenshots_get_image_id($image_url) {
  global $wpdb;
  $attachment = $wpdb->get_col($wpdb->prepare("SELECT ID FROM $wpdb->posts WHERE guid='%s';",$image_url ));
  return $attachment;
}

// saves custom meta box data
function save__projects__meta( $post_id, $post ) {
	global $screenshots_gallery;

	// return if the user doesn't have edit permissions.
	if ( ! current_user_can( 'edit_post', $post_id ) ) {
		return $post_id;
	}
	// return unless nonce is verified
	if ( ! isset( $_POST['projects__meta_nonce'] ) || ! wp_verify_nonce( $_POST['projects__meta_nonce'], basename(__FILE__) ) ) {
		return $post_id;
	}

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

	foreach ($screenshots_gallery as $field) {
    $new_meta_value = esc_attr($_POST[$field['id']]);
		$meta_key = $field['id'];
    $meta_value = get_post_meta( $post_id, $meta_key, true );
    // If theres a new meta value and the existing meta value is empty
    if ( $new_meta_value && $meta_value == null ) {
      add_post_meta( $post_id, $meta_key, $new_meta_value, true );
    // If theres a new meta value and the existing meta value is different
    } elseif ( $new_meta_value && $new_meta_value != $meta_value ) {
      update_post_meta( $post_id, $meta_key, $new_meta_value );
    } elseif ( $new_meta_value == null && $meta_value ) {
      delete_post_meta( $post_id, $meta_key, $meta_value );
    }
  }
}
add_action( 'save_post', 'save__projects__meta', 10, 2 );  // hook to 'save_post' action, $callback, priority (1-10:high-low), $callback args
