jQuery(document).ready(function() {

  var meta_gallery_frame;
  // Runs when the image button is clicked.
  jQuery('#projects_screenshots_gallery_button').click(function(e){

    //Attachment.sizes.thumbnail.url/ Prevents the default action from occuring.
    e.preventDefault();

    // If the frame already exists, re-open it.
    if ( meta_gallery_frame ) {
      meta_gallery_frame.open();
      return;
    }

    // Sets up the media library frame
    meta_gallery_frame = wp.media.frames.meta_gallery_frame = wp.media({
      title: projects_screenshots_gallery.title,
      button: { text:  projects_screenshots_gallery.button },
      library: { type: 'image' },
      multiple: true
    });

    // Create Featured Gallery state. This is essentially the Gallery state, but selection behavior is altered.
    meta_gallery_frame.states.add([
      new wp.media.controller.Library({
        id:         'projects-screenshots-gallery',
        title:      'Select Images for Project Screenshot Gallery',
        priority:   20,
        toolbar:    'main-gallery',
        filterable: 'uploaded',
        library:    wp.media.query( meta_gallery_frame.options.library ),
        multiple:   meta_gallery_frame.options.multiple ? 'reset' : false,
        editable:   true,
        allowLocalEdits: true,
        displaySettings: true,
        displayUserSettings: true
      }),
    ]);

    meta_gallery_frame.on('open', function() {
      var selection = meta_gallery_frame.state().get('selection');
      var library = meta_gallery_frame.state('gallery-edit').get('library');
      var ids = jQuery('#projects_screenshots_gallery').val();
      if (ids) {
        idsArray = ids.split(',');
        idsArray.forEach(function(id) {
          attachment = wp.media.attachment(id);
          attachment.fetch();
          selection.add( attachment ? [ attachment ] : [] );
        });
      }
    });

    meta_gallery_frame.on('ready', function() {
      jQuery( '.media-modal' ).addClass( 'no-sidebar' );
    });

    // When an image is selected, run a callback.
    //meta_gallery_frame.on('update', function() {
    meta_gallery_frame.on('select', function() {
      var imageIDArray = [];
      var imageHTML = '';
      var metadataString = '';
      images = meta_gallery_frame.state().get('selection');
      imageHTML += '<ul class="projects_screenshots_gallery_list">';
      images.each(function(attachment) {
        imageIDArray.push(attachment.attributes.id);
        imageHTML += '<li><div class="projects_screenshots_gallery_container"><span class="projects_screenshots_gallery_close"><img id="'+attachment.attributes.id+'" src="'+attachment.attributes.sizes.thumbnail.url+'"></span></div></li>';
      });
      imageHTML += '</ul>';
      metadataString = imageIDArray.join(",");
      if (metadataString) {
        jQuery("#projects_screenshots_gallery").val(metadataString);
        jQuery("#projects_screenshots_gallery_src").html(imageHTML);
        setTimeout(function(){
                ajaxUpdateTempMetaData();
        },0);
      }
    });

    // Finally, open the modal
    meta_gallery_frame.open();

  });

  jQuery(document.body).on('click', '.projects_screenshots_gallery_close', function(event){

    event.preventDefault();

    if (confirm('Are you sure you want to remove this image?')) {
      var removedImage = jQuery(this).children('img').attr('id');
      var oldGallery = jQuery("#projects_screenshots_gallery").val();
      var newGallery = oldGallery.replace(','+removedImage,'').replace(removedImage+',','').replace(removedImage,'');
      jQuery(this).parents().eq(1).remove();
      jQuery("#projects_screenshots_gallery").val(newGallery);
    }

  });
});