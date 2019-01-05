<?php
/**
 * The template for displaying all pages
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site may use a
 * different template.
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package _s_|_Middle_Seat
 */

get_header();
?>

	<section class="hero has-background-evening has-text-daybreak">
		<div class="has-text-centered">
			<svg class="logo">
				<use xlink:href="#mighty"></use>
			</svg>
		</div>
		<div>
			<div class="has-text-centered has-margin-3">
				<h2 class="has-text-weight-light is-uppercase is-size-3 has-margin-6">Welcome to</h2>
				<h1 class="is-size-0"><span class="has-underline-modGradient has-position-relative">Mighty<span class="has-text-weight-light">Ops</span></span></h1>
			</div>
			<!-- <div class="fits-flex-50">
				<select name="ops">
					<option>code</option>
					<option>graphics</option>
				</select>
			</div> -->
		</div>
	</section>
	<section class="has-background-daybreak">
		<div>
			<h2 class="has-text-midnight has-text-weight-medium is-size-3">Nice of you to stop by.  <span class="has-underline-mod1">I'm Ash.</span></h2>
			<p class="is-size-4 has-text-black has-text-weight-regular">During the course of a single project I usually wear many hats.  Need a brand new site?  Let's talk <span class="has-text-weight-bold has-text-mod2">design</span>, <span class="has-text-weight-bold has-text-mod2">framework</span> and <span class="has-text-weight-bold has-text-mod2">servers</span>.  Working with <span class="has-text-weight-bold has-text-mod3">WordPress</span>, <span class="has-text-weight-bold has-text-mod3">ActionKit</span> or similar management system?  I can build you a <span class="has-text-weight-bold has-text-mod4">custom theme</span> and help <span class="has-text-weight-bold has-text-mod4">launch a campaign</span>.  Not sure where to start?  Tell me about your ideas, describe your goals — help me get to know you so I can help you <span class="has-text-weight-bold has-text-mod5">get to work</span>.</p>
		</div>
	</section>
	<section class="has-background-midnight has-text-daybreak">
		<div>
			<h2 class="is-size-3 has-text-weight-medium">Some of <span class="has-underline-mod5">my work.</span></h2>
			<div class="has-margin-1">
				<h3 class="is-size-4 is-uppercase has-hr has-text-weight-light has-text-right has-letter-spacing-1 hr-header"><span class="has-background-midnight has-padding-6 has-padding-left">Recent Campaigns</span></h3>
			</div>
			<div class="is-flex">
				<?php
				global $post;
				$clientArgs = array('posts_per_page' => 6, 'post_type' => 'clients', 'order' => 'ASC', 'order_by' => 'title');
				$clientPosts = get_posts($clientArgs);
				foreach ($clientPosts as $post) : setup_postdata($post) ;
					get_template_part( 'template-parts/content', 'clients' );
				endforeach ;
				wp_reset_postdata();
				?>
			</div>
			<!-- <a href="<?php echo get_post_type_archive_link('endorsements') ?>" class="_display">View All </a> -->
		</div>
	</section>
	<section class="has-background-daybreak has-text-black">
		<div>
			<h2 class="is-size-3 has-text-weight-medium">My skillset, <span class="has-underline-mod1">Full Stack</span> and growing.</h2>
			<p class="is-size-5 has-text-black has-text-weight-regular">I’m always looking for new skills and ways to improve my work.  Using a system or language not listed here?  Drop me a line!  Good chance I’ve come across it and have some ideas for you.</p>
			<div class="is-flex has-margin-2">
				<div class="has-background-mist has-padding-4 fits-flex-50 cat1">
					<h3 class="is-size-5 is-uppercase has-text-weight-regular">Front End</h3>
					<hr class="has-background-midnight has-margin-5" />
					<?php
					global $post;
					$skillsArgs = array('posts_per_page' => -1, 'post_type' => 'skills', 'order' => 'ASC', 'order_by' => 'title');
					$skillsPosts = get_posts($skillsArgs);
					foreach ($skillsPosts as $post) : setup_postdata($post) ;
						$stack = get_post_meta( $post->ID, '_stack', true );
						if ( $stack == 'front-end') {
							get_template_part( 'template-parts/content', 'skills' );
						}
					endforeach ;
					wp_reset_postdata();
					?>
				</div>
				<div class="has-background-mist has-padding-4 fits-flex-50 cat2">
					<h3 class="is-size-5 is-uppercase has-text-weight-regular">Back End</h3>
					<hr class="has-background-midnight has-margin-5" />
					<?php
					global $post;
					$skillsArgs = array('posts_per_page' => -1, 'post_type' => 'skills', 'order' => 'ASC', 'order_by' => 'title');
					$skillsPosts = get_posts($skillsArgs);
					foreach ($skillsPosts as $post) : setup_postdata($post) ;
						$stack = get_post_meta( $post->ID, '_stack', true );
						if ( $stack == 'back-end') {
							get_template_part( 'template-parts/content', 'skills' );
						}
					endforeach ;
					wp_reset_postdata();
					?>
				</div>
			</div>
		</div>
	</section>
	<section class="portrait has-background-evening has-text-white">
		<div class="is-flex">
			<div class="fits-flex-66">
				<h2 class="is-size-3 has-text-weight-medium">About <span class="has-underline-modGradient">Mighty.</span></h2>
				<p class="is-size-5 has-text-weight-regular">I began freelancing as one of many jobs during college, after deciding Adobe Illustrator looked fun to learn.  Over the seven years since then it's become an anchor for my most passionate work.</p>
				<p class="is-size-5 has-text-weight-regular">In 2017 I joined Middle Seat, a digital consulting firm, working two years to build and lead the development program.  These days I can be found in DC doing progressive campaigning and coding the occasional text-based adventure game.</p>
			</div>
			<div class="fits-flex-33"></div>
		</div>
	</section>

<?php

get_footer();
