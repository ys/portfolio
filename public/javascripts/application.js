function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

function  checkImage(o) { 
	if(o.prev().attr('checked') == true){
		o.prev().attr('checked', false);
		o.removeClass('selected');
	} else{
		o.prev().attr('checked', true);
		o.addClass('selected');
	}
        
    
}