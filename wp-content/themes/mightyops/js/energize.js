jQuery(document).ready(function( $ ) {
  energize();
  
  function energize(){
    var energy;
    energy = randomInt(5,12);
    create(energy);
  }
  
  function create(energy) {
    var bursts;
    bursts = 0;
    while (bursts < energy) {
      var stars;
      stars = randomInt(3,7);
      constellation(stars);
      bursts++;
    }
  }
  
  function constellation(stars) {
    var starfield, count, galaxy, expanse, dimension, t, l;
    expanse = $('.expanse');
    starfield = '';
    count = 0;
    while (count < stars) {
      starfield += spark();
      count++;
    }
    dimension = randomInt(7,25);
    t = randomInt(1,100);
    l = randomInt(1,100);
    galaxy = '<div class="galaxy" style="height:'+dimension+'rem;left:'+l+'%;top:'+t+'%;width:'+dimension+'rem;">'+starfield+'<div>';
    $(expanse).append(galaxy);
  }
  
  function spark() {
    var x, y, z;
    x = randomInt(1,100);
    y = randomInt(1,100);
    z = (randomInt(20,90))/100;
    return '<div class="star" style="left:'+x+'%;opacity:'+z+';top:'+y+'%;"></div>';
  }
  
  function randomInt(min,max) {
    return Math.floor(Math.random() * (max - min + 1) ) + min;
  }
});