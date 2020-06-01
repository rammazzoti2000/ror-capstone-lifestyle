// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("bootstrap/dist/js/bootstrap")


$(document).on('turbolinks:load', function(){

	$('.menu-toggler').on('click', function () {
      $('.navbar-content').toggleClass('open');
      $(this).toggleClass('open');
	});

	$('#register').on('click', function(){
		$('.sign-up-form').show()
		$('.sign-in-form').hide()
		$(".sign-up-form").css("display", "block");
		$(".sign-in-form").css("display", "none");
	})

})
