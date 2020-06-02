// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("bootstrap/dist/js/bootstrap")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//= require froala_editor.min.js
//= require plugins/align.min.js
//= require plugins/char_counter.min.js
//= require plugins/code_beautifier.min.js
//= require plugins/code_view.min.js
//= require plugins/colors.min.js
//= require plugins/emoticons.min.js
//= require plugins/entities.min.js
//= require plugins/file.min.js
//= require plugins/font_family.min.js
//= require plugins/font_size.min.js
//= require plugins/fullscreen.min.js
//= require plugins/help.min.js
//= require plugins/image.min.js
//= require plugins/image_manager.min.js
//= require plugins/inline_class.min.js
//= require plugins/inline_style.min.js
//= require plugins/line_breaker.min.js
//= require plugins/line_height.min.js
//= require plugins/link.min.js
//= require plugins/lists.min.js
//= require plugins/paragraph_format.min.js
//= require plugins/paragraph_style.min.js
//= require plugins/print.min.js
//= require plugins/quick_insert.min.js
//= require plugins/quote.min.js
//= require plugins/save.min.js
//= require plugins/table.min.js
//= require plugins/special_characters.min.js
//= require plugins/url.min.js
//= require plugins/video.min.js

//= require third_party/embedly.min.js
//= require third_party/font_awesome.min.js
//= require third_party/image_tui.min.js
//= require third_party/spell_checker.min.js

//= require languages/ro.js

$(document).on('turbolinks:load', function(){

	$('.menu-toggler').on('click', function () {
      $('.navbar-content').toggleClass('open');
      $(this).toggleClass('open');
	});

	$(document).scroll(function (){
		var $nav = $(".nav");
		if($(this).scrollTop() >= 200){
			$nav.addClass('scrolled');
			$nav.removeClass('none');
			$('.nav-link').addClass('scrolled')
		} else if ($(this).scrollTop() < 200 && $(this).scrollTop() >= $nav.height()) {
			$nav.removeClass('scrolled');
			$('.cat-links .nav-link').removeClass('scrolled')
			$nav.addClass('none');
		}else{
			$nav.removeClass('scrolled');
			$nav.removeClass('none');
			$('.cat-links .nav-link').removeClass('scrolled')

		}

	})

	$('#article-image').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    console.log(image.size);
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      img.src = file.target.result;
			$('#display-img').html(img);

			$('#article-image').css({
				'width': '100%',
				'height' : '100%',
		 });

		 $('#article-featured').css({
			'height' : 'auto',
	 		});

			$('#drop_zone').css({
				'width': '100%',
				'height' : '100%',
				'opacity' : '0',
				'border': 'none'
		 });
    }
    reader.readAsDataURL(image);
    console.log(files);
  });

})
// $("#pictureInput").width(100).height(200);
