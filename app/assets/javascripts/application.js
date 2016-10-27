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
	$('#new-form-display').click(function() {
	  $('#small-description').hide();
	  $('#hidden-design-form').show();
	});	

	$(function() {
	  return $('select#address_country').change(function(event) {
	    var country, select_wrapper, url;
	    select_wrapper = $('#address_state_wrapper');
	    $('select', select_wrapper).attr('disabled', true);
	    country = $(this).val();
	    url = "/address/subregion_options?parent_region=" + country;
	    return select_wrapper.load(url);
	  });
	});
	   
});
