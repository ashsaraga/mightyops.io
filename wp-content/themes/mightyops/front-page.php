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

	<section class="has-background-evening has-text-daybreak">
		<div class="has-text-centered">
			<svg>
				<use xlink:href="#mighty"></use>
			</svg>
		</div>
		<div class="is-flex">
			<div class="is-flex-50">
				<h2>Welcome to</h2>
				<h1>Mighty</h1>
			</div>
			<div class="is-flex-50">
				<select name="ops">
					<option>code</option>
					<option>graphics</option>
				</select>
			</div>
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
			<h3 class="is-size-4 is-uppercase has-hr has-text-weight-regular"><span class="has-background-midnight">Recent Campaigns</span></h3>
			<div class="is-flex">
				<div class="is-flex-33">
					<div class="has-background-evening has-underline-mod4 has-text-centered has-padding-6">
						<img src="./img/aclu.svg" class="campaign" />
					</div>
					<div class="has-background-daybreak has-text-black has-padding-7">
						<h4 class="is-size-4 has-margin-none has-text-weight-bold">ACLU People Power</h4>
						<div>
							<span class="tags-mod3">action kit</span>
							<span class="tags-mod3">django</span>
							<span class="tags-mod3">js</span>
						</div>
						<div class="is-flex">
							<button class="is-flex-50 has-background-midnight has-text-daybreak is-uppercase has-text-centered is-size-6 has-letter-spacing-1 has-padding-8 has-margin-none has-underline-mod2">Preview</button>
							<a class="is-flex-50 has-background-midnight has-text-daybreak is-uppercase has-text-centered is-size-6 has-letter-spacing-1 has-padding-8 has-margin-none has-underline-mod1">Gallery</a>
						</div>
					</div>
				</div>
				<div class="is-flex-33">
					<div class="has-background-evening has-underline-mod4 has-text-centered has-padding-6">
						<img src="./img/beto.svg" class="campaign" />
					</div>
					<div class="has-background-daybreak has-text-black has-padding-7">
						<h4 class="is-size-4 has-margin-none has-text-weight-bold">Beto O'Rourke</h4>
						<div>
							<span class="tags-mod3">action kit</span>
							<span class="tags-mod3">django</span>
							<span class="tags-mod3">js</span>
						</div>
						<div class="is-flex">
							<button class="is-flex-50 has-background-midnight has-text-daybreak is-uppercase has-text-centered is-size-6 has-letter-spacing-1 has-padding-8 has-margin-none has-underline-mod2">Preview</button>
							<a class="is-flex-50 has-background-midnight has-text-daybreak is-uppercase has-text-centered is-size-6 has-letter-spacing-1 has-padding-8 has-margin-none has-underline-mod1">Gallery</a>
						</div>
					</div>
				</div>
				<div class="is-flex-33">
					<div class="has-background-evening has-underline-mod4 has-text-centered has-padding-6">
						<img src="./img/commondefense.svg" class="campaign" />
					</div>
					<div class="has-background-daybreak has-text-black has-padding-7">
						<h4 class="is-size-4 has-margin-none has-text-weight-bold">Common Defense</h4>
						<div>
							<span class="tags-mod3">action kit</span>
							<span class="tags-mod3">django</span>
							<span class="tags-mod3">js</span>
						</div>
						<div class="is-flex">
							<button class="is-flex-50 has-background-midnight has-text-daybreak is-uppercase has-text-centered is-size-6 has-letter-spacing-1 has-padding-8 has-margin-none has-underline-mod2">Preview</button>
							<a class="is-flex-50 has-background-midnight has-text-daybreak is-uppercase has-text-centered is-size-6 has-letter-spacing-1 has-padding-8 has-margin-none has-underline-mod1">Gallery</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="has-background-daybreak has-text-black">
		<div>
			<h2 class="is-size-3 has-text-weight-medium">My skillset, <span class="has-underline-mod1">Full Stack</span> and growing.</h2>
			<p class="is-size-5 has-text-black has-text-weight-regular">I’m always looking for new skills and ways to improve my work.  Using a system or language not listed here?  Drop me a line!  Good chance I’ve come across it and have some ideas for you.</p>
			<div class="is-flex">
				<div class="has-background-mist has-padding-4 is-flex-50 cat1">
					<h3 class="is-size-5 is-uppercase has-text-weight-regular">Front End</h3>
					<div>
						<h4 class="is-size-6 has-margin-none has-text-weight-bold">html / css</h4>
						<progress value="95" max="100"></progress>
					</div>
					<div>
						<h4 class="is-size-6 has-margin-none has-text-weight-bold">html / css</h4>
						<progress value="95" max="100"></progress>
					</div>
					<div>
						<h4 class="is-size-6 has-margin-none has-text-weight-bold">html / css</h4>
						<progress value="95" max="100"></progress>
					</div>
					<div>
						<h4 class="is-size-6 has-margin-none has-text-weight-bold">html / css</h4>
						<progress value="95" max="100"></progress>
					</div>
					<div>
						<h4 class="is-size-6 has-margin-none has-text-weight-bold">html / css</h4>
						<progress value="95" max="100"></progress>
					</div>
					<div>
						<h4 class="is-size-6 has-margin-none has-text-weight-bold">html / css</h4>
						<progress value="95" max="100"></progress>
					</div>
				</div>
				<div class="has-background-mist has-padding-4 is-flex-50 cat2">
					<h3 class="is-size-5 is-uppercase has-text-weight-regular">Back End</h3>
					<div>
						<h4 class="is-size-5 has-text-weight-bold">linux</h4>
						<progress value="95" max="100"></progress>
					</div>
					<div>
						<h4 class="is-size-5 has-text-weight-bold">linux</h4>
						<progress value="95" max="100"></progress>
					</div>
					<div>
						<h4 class="is-size-5 has-text-weight-bold">linux</h4>
						<progress value="95" max="100"></progress>
					</div>
					<div>
						<h4 class="is-size-5 has-text-weight-bold">linux</h4>
						<progress value="95" max="100"></progress>
					</div>
					<div>
						<h4 class="is-size-5 has-text-weight-bold">linux</h4>
						<progress value="95" max="100"></progress>
					</div>
					<div>
						<h4 class="is-size-5 has-text-weight-bold">linux</h4>
						<progress value="95" max="100"></progress>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="has-background-evening has-text-white">
		<div>
			<h2 class="is-size-3 has-text-weight-medium">About <span class="has-underline-modGradient">Mighty.</span></h2>
			<p class="is-size-5 has-text-weight-regular">I began freelancing as one of many jobs during college, after deciding Adobe Illustrator looked fun to learn.  Over the seven years since then it's become an anchor for my most passionate work.</p>
			<p class="is-size-5 has-text-weight-regular">In 2017 I joined Middle Seat, a digital consulting firm, working two years to build and lead the development program.  These days I can be found in DC doing progressive campaigning and coding the occasional text-based adventure game.</p>
		</div>
	</section>

<?php

get_footer();
