/**
 * Switch content inside Metro UI blocks
 *
 * @requires {data-switch} 		Set data-switch="true" inside the dom
 */
$(function() {
	/**
	 * Get all switch elements
	 */
	var switches = $("[data-switch]");
	/**
	 * Check if elements exists
	 */
	if(switches.length > 0) {
		/**
		 * Loop through objects
		 *
		 * @var c 	Object Key
		 * @var e 	Object Value
		 */
		$.each(switches, function(c, e) {
			/**
			 * Get switches data current object
			 */
			var switches_data = $(this).data("switches");
			/**
			 * Get next div
			 */
			var next = $(this);
			next = $(next);
			/**
			 * Set type animation
			 */
			var animation = "flipInX";
			/**
			 * Set index where to start from
			 */
			var index = 0;
			/**
			 * Loop through switches
			 *
			 * @var i 	Object Key
			 * @var b	Object Value
			 */
			$.each(switches_data, function(i, b) {
				/**
			 	 * Create new element for each switches
			 	 */
				var el = $("<div />").attr({class: "metro-ui-column-content animated", id: "content-column-" + i});
				/**
				 * Append el to next element, previous defined
				 */
				el.appendTo(next);
				/**
				 * If image isset, set it as background image
				 */
				if(b.image) {
					/**
					 * Set background image for el
					 */
					el.css({
						"background": "url("+ b.image +") no-repeat",
						"background-size": "cover"
					});
				}
				/**
				 * Append html content
				 */
				el.html( "<div class=\"metro-ui-column-html\">" + b.content + "</div>");
			});

			/**
			 * Shortcut for $(this)
			 */
			var self = $(this);
			/**
			 * Find all animated objects
			 */
			var animated = $(this).find(".animated");
			/**
			 * Generate random number between 2000 and 4000, it acts as seconds for interval
			 */
			var x = Math.floor((Math.random() * 8000) + 4000);
			/**
			 * Loop through animated objects
			 *
			 * @var i	Object Index
			 * @var e	Object Value
			 */
			$.each(animated, function(i, e) {
				/**
				 * Start with the first animated object in the current loop
				 */
				if(i === 0) {
					/**
					 * Start with an timeout with random generated seconds, so no content will ever be loaded at the same time
					 */
					setTimeout(function() {
						/**
					 	 * Gets visible by setting the z-index
					 	 */
						$(e).css("z-index", 2).addClass("flipInX");
					}, x);
				}
			});
			/**
			 * Set new index higher than first object
			 */
			var index = 3 ;
			/**
			 * Set interval function to start looping the animation
			 */
			setInterval(function() {
				/**
				 * Get next object from current object
				 */
				var next = self.find(".flipInX").next();
				/**
				 * If there is no next object, reset to first object
				 */
				if(next.length === 0) {
					/**
					 * Update next to first object cause next doenst exist
					 */
					var next = self.find(".animated").first();
				}
				/**
				 * Set new index and add animation class
				 */
				next.css("z-index", index++).addClass("flipInX").siblings().removeClass("flipInX");
			}, x);
		});
	}

});
