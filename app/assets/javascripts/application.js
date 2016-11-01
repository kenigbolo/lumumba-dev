// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require cloudinary
// require cloudinary/processing // Optional - client side processing (resizing and validation)
//= require_tree .

$(document).ready(function(){
	$('#new_address_form').hide();
	$('#upload-image').hide();
  $('#model-design-view').hide();

  $('#hideshow').on('click', function(event) {
    $('#model-design-view').toggle('show');
  });

  $('#edit-image').on('click', function(event) {
    $('#upload-image').toggle('show');
  });  

  $('#new-form').on('click', function(event) {
    $('#new_address_form').toggle('show');
  });  

	$('#new-form-display').click(function() {
	  $('#small-description').hide();
	  $('#hidden-design-form').show();
	});	

});

