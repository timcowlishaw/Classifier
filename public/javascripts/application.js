// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
	var form = $('#classify_form');
	if(form) {
		form.find('.submit').hide();
		form.find('.category').each(function(idx, elem) {
			elem = $(elem);
			elem.bind('click', function(event) {
				form.submit();
			});
		});
	}
	
	$("div.category ul.messages li").hover(function () {
      $(this).addClass("hover");
    },
    function () {
      $(this).removeClass("hover");
  });
  
  $("div.category ul.messages li input").click(function() {
    $(this).parents("ul").addClass("fixed");
    $("#update_messages").show();
  });
});