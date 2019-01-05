<?php

function create_skills() {

  $labels = array(
    'name' => _x( 'Skills', 'taxonomy general name' ),
    'singular_name' => _x( 'Skill', 'taxonomy singular name' ),
    'search_items' =>  __( 'Search Skills' ),
    'popular_items' => __( 'Popular Skills' ),
    'all_items' => __( 'All Skills' ),
    'parent_item' => null,
    'parent_item_colon' => null,
    'edit_item' => __( 'Edit Topic' ),
    'update_item' => __( 'Update Topic' ),
    'add_new_item' => __( 'Add New Topic' ),
    'new_item_name' => __( 'New Topic Name' ),
    'separate_items_with_commas' => __( null ),
    'add_or_remove_items' => __( 'Add or remove Skills' ),
    'choose_from_most_used' => __( null ),
    'menu_name' => __( 'Skills' )
  );

  $args = array(
    'hierarchical' => false,
    'labels' => $labels,
    'show_ui' => true,
    'show_admin_column' => true,
    'update_count_callback' => '_update_post_term_count',
    'rewrite' => array( 'slug' => 'topic' )
  );

  register_taxonomy( 'skills', 'clients' , $args);
}

add_action( 'init', 'create_skills', 0 );
