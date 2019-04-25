jQuery(document).ready(function( $ ) {
  castAccio();
  disapparate();

  function disapparate() {
    $('.disapparateLink').click(function() {
      window.history.back();
    });
  }
});