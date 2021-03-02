<?php
/**
 * Add a custom post type with custom meta fields

 */

// creates custom post type
function create__approvals() {
  $labels = array(
    'name' => __( 'Approvals' ),
    'singular_name' => __( 'Approval' ),
    'add_new' => __( 'New Approval' ),
    'add_new_item' => __( 'Add Approval' ),
    'edit_item' => __( 'Edit Approval' ),
    'new_item' => __( 'New Approval' ),
    'view_item' => __( 'View Approval' ),
    'search_items' => __( 'Search Approvals' ),
    'not_found' =>  __( 'No Approvals Found' ),
    'not_found_in_trash' => __( 'No Approvals found in Trash' ),
  );
  $args = array(
    'labels' => $labels,
    'public' => true,  // sets a default for 'show_in_nav_menus', 'show_ui', 'exclude_from_search', and 'publicly_queryable'
    'hierarchical' => false,  // makes this post type a page (true) or a post (false)
    'exclude_from_search' => true,  // excludes this post type from front end search results (true)
    'publicly_queryable'  => true,  // makes the post type accessible by URL queries (true)
    'show_ui' => true,  // creates an admin menu (true)
    'show_in_menu' => true,  // creates a top level admin menu (true), a submenu item in another top level menu (e.g. 'tools.php', 'edit.php?post_type=page'), or no menu (false)
    'show_in_nav_menus' => false, // makes this post type available for use in the menu editor
    'menu_position' =>  8,  // sets post type admin menu position
    'menu_icon'   => 'dashicons-yes',  // sets admin menu icon, can be dashicon or SVG ('data:image/svg+xml;base64,'.svgURL)
    'supports' => array(  // sets core features for post type
      'title',
      'editor',
      'comments'
      // 'excerpt',
      // 'thumbnail',
      // 'revisions'
    ),
    'register_meta_box_cb' => 'create__approvals__meta', // sets callback function for custom meta fields
    'has_archive' => false  // creates archive page for post type (true)
  );
  register_post_type( 'approvals', $args );
}
add_action( 'init', 'create__approvals' );

// creates custom meta boxes
function create__approvals__meta() {
  // add_meta_box(
  //   'approvals__client',  // sets ID for the meta box attribute
  //   'Client',  // Title of the meta box
  //   'approvals__client',  // sets callback function to echo the box output
  //   'approvals',  // sets screens where the meta box will appear
  //   'side',  // positions the meta box on right column (side) or main column (normal)
  //   'high'  // positions the meta box at the top (high) or bottom (low) of its context
  // );
  add_meta_box(
    'approvals__status',  // sets ID for the meta box attribute
    'Approval Status',  // Title of the meta box
    'approvals__status',  // sets callback function to echo the box output
    'approvals',  // sets screens where the meta box will appear
    'advanced',  // positions the meta box on right column (side) or main column (normal)
    'high'  // positions the meta box at the top (high) or bottom (low) of its context
  );
  add_meta_box(
    'approvals__next',  // sets ID for the meta box attribute
    'Next Item',  // Title of the meta box
    'approvals__next',  // sets callback function to echo the box output
    'approvals',  // sets screens where the meta box will appear
    'side',  // positions the meta box on right column (side) or main column (normal)
    'high'  // positions the meta box at the top (high) or bottom (low) of its context
  );
  // add_meta_box(
  //   'approvals__related',  // sets ID for the meta box attribute
  //   'Related Approvals',  // Title of the meta box
  //   'approvals__related',  // sets callback function to echo the box output
  //   'approvals',  // sets screens where the meta box will appear
  //   'side',  // positions the meta box on right column (side) or main column (normal)
  //   'high'  // positions the meta box at the top (high) or bottom (low) of its context
  // );
}

function approvals__client() {
  global $post;  // set $post to the current post ID
  $originalpost = $post;  // stores the current $post so it can be reset after a wp_query()
  wp_nonce_field( basename( __FILE__ ), 'approvals__meta_nonce' );  // sets nonce to be checked when saving meta

  $approvalClient = get_post_meta( $post->ID, '_approvalClient', true );
  $currentClients = get_posts([
    'post_type' => 'clients',
    'post_status' => 'publish',
    'numberposts' => -1,
    'order'    => 'ASC'
  ]);
  ?>
  <!-- generating <select> -->
  <div style="margin: .75rem 0;">
    <label for="_approvalClient">Client</label>
    <select name="_approvalClient" class="widefat">
      <option value="" disabled>unset</option>
      <?php 
      foreach ($currentClients as $client) {        
        ?>
        <option value="<?php printf( esc_html($client->name) ); ?>" <?php selected( $approvalClient, printf( esc_html($client->name) ) ); ?> ><?php printf( esc_html($client->name) ); ?></option>
        <?php
      }
      ?>
    </select>
  </div>
  <?php
}

function approvals__status() {
  global $post;  // set $post to the current post ID
  $originalpost = $post;  // stores the current $post so it can be reset after a wp_query()
  wp_nonce_field( basename( __FILE__ ), 'approvals__meta_nonce' );  // sets nonce to be checked when saving meta

  $status = get_post_meta( $post->ID, '_status', true ); 
  ?>
  <!-- generating <select> -->
  <div style="margin: .75rem 0;">
    <label for="_status">Approval Status</label>
    <select name="_status" class="widefat">
      <option value="" disabled>unset</option>
      <option value="initial review" <?php selected( $status, 'initial review' ); ?> >Initial Review</option>
      <option value="edits pending" <?php selected( $status, 'edits pending' ); ?> >Edits Pending</option>
      <option value="in review" <?php selected( $status, 'in review' ); ?> >In Review</option> 
      <option value="on hold" <?php selected( $status, 'on hold' ); ?> >On Hold</option>
      <option value="approved" <?php selected( $status, 'approved' ); ?> >Approved</option> 
    </select>
  </div>
  <?php
}

function approvals__next() {
  global $post;  // set $post to the current post ID
  $originalpost = $post;  // stores the current $post so it can be reset after a wp_query()
  wp_nonce_field( basename( __FILE__ ), 'approvals__meta_nonce' );  // sets nonce to be checked when saving meta

  $nextItem = get_post_meta( $post->ID, '_nextItem', true );
  $nextDate = get_post_meta( $post->ID, '_nextDate', true );
  ?>
  <!-- generating text <input> -->
  <label for="_nextItem">Next Item:</label>
  <input type="text" name="_nextItem" id="_nextItem" value="<?php echo esc_textarea($nextItem) ?>" class="widefat">
  <!-- generating date <input> -->
  <label for="_nextDate">Start Date:</label>
  <input type="date" name="_nextDate" id="_nextDate" value="<?php echo esc_textarea($nextDate)?>">
  <?php
}

// saves custom meta box data
function save__approvals__meta( $post_id, $post ) {
  // return if the user doesn't have edit permissions.
  if ( ! current_user_can( 'edit_post', $post_id ) ) {
    return $post_id;
  }
  // return unless nonce is verified
  if ( ! isset( $_POST['approvals__meta_nonce'] ) || ! wp_verify_nonce( $_POST['approvals__meta_nonce'], basename(__FILE__) ) ) {
    return $post_id;
  }

  $meta_array['_approvalClient'] = esc_attr( $_POST['_approvalClient'] );
  $meta_array['_status'] = esc_attr( $_POST['_status'] );
  $meta_array['_nextItem'] = esc_attr( $_POST['_nextItem'] );
  $meta_array['_nextDate'] = esc_attr( $_POST['_nextDate'] );

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
add_action( 'save_post', 'save__approvals__meta', 10, 2 );  // hook to 'save_post' action, $callback, priority (1-10:high-low), $callback args
