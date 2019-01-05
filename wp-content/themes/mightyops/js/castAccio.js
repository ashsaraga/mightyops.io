function castAccio() {

	var accio, depulso, charm, lumos, nox, wand, caster, spell, book, auror, locale;
	accio = jQuery('#accioBox');			// Dark background back, controls z-indexing
	lumos = 'turnon';
	nox = 'turnoff';
	wand = jQuery('body');
	caster = jQuery('a.accioLink');			// link class that calls accio

	accioSetup();

  function accioSetup() {
  	// initial frame html
  	spell = '<div id="accioBox" class="has-position-fixed has-margin-none has-padding-none"><div id="accioImg" class="has-position-fixed"></div><div id="accioHalt" class="has-position-absolute has-text-weight-light has-text-white is-flex has-text-centered has-margin-none is-uppercase is-size-7 has-letter-spacing-1"><span class="has-text-font-awesome is-size-2 has-margin-none">times</span><span style="opacity:.75;">esc</span></div></div>';

  	if ( caster.length > 0 ) {
  		if ( accio.length == 0 ) {			// making sure not to call multiple frames
  			jQuery(wand).prepend(spell);
  			console.log('Spell prepared.');
  			accioListen(lumos);
  		} else {
  			console.warn('Spells cast out of turn, demanding a reset.  Finite Incantetem on all "Accio" spells, then recasting manually.');
  			jQuery(accio).remove();

  			if ( accio.length == 0 ) {
  				console.log('Obliviation successful.  Restarting setup.');
  				accioSetup();
  			} else {
  				console.warn("Something more dire is afoot.  Check setup.");
  			}
  		}
  	}
  }

  function accioListen(casting) {
  	charm = jQuery('#accioImg');
		if ( casting == lumos ) {
				console.log('Casting lumos listener.');
				jQuery(caster).click(function() {
					if ( jQuery(charm).contents().length == 0 ) {
						console.log('Passed single check.');
						book = jQuery(this).attr('name');
						auror = jQuery(this).attr('title');
						locale = '<img src="'+book+'" alt="'+auror+'" />';
						console.log('Using locale to reveal.');
						accioReveal(locale);
					} else { return; }
				});
		} else if ( casting == nox ) {
			console.log('Casting nox listener.');
			depulso = jQuery('#accioHalt');

			jQuery(depulso).click(function() {
				console.log('Used depulso to escape.');
				accioObscure();
			});
			jQuery(document).keyup(function(e) {
			  if (e.keyCode == 27 && jQuery(wand).hasClass('castingAccio') ) {
			    console.log('Manually escaped.');
			  	accioObscure();
			 	}
			});
		} else {
			if ( casting.length == 0 ) {
  			console.log("Someone tried to cast Accio with no words.");
  		} else if ( casting.length < 3 || casting.length > 5 ) {
  			console.log("Someone tried to cast Accio with the wrong words.");
  		} else {
  			console.log("Something else is afoot — check the listener.");
  		}
		}
  }

  function accioReveal(item) {
		if ( item.length > 23 ) {
			console.log(item);
  		jQuery(charm).append(item);
  		jQuery(wand).addClass('castingAccio');
  		console.log("As requested.");
  		accioListen(nox);
  	} else {
  		console.warn("That <img> tag ain't gonna cut it.  Send an owl in.");
  	}
  }

  function accioObscure() {
  	jQuery(wand).removeClass('castingAccio');
		jQuery(charm).empty();
		accioListen(lumos);
		console.log('Obscured for later viewing.');
  }

}