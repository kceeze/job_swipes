$( document ).ready(function() {

	$('body').on('click', '.remove-worker-fields', function() {
    	$(this).prev("input[type=hidden]").val(true);
    	//$(".worker-name-fields").hide();
    	$(this).closest(".worker-name-fields").hide();
	});

	$('body').on('click', '.remove-physical-address-fields', function() {
    	$(this).prev("input[type=hidden]").val(true);
    	$(this).closest(".worker-physical-address-fields").hide();
	});

	$('body').on('click', '.remove-email-address-fields', function() {
    	$(this).prev("input[type=hidden]").val(true);
    	$(this).closest(".worker-email-addresses-fields").hide();
	});


	$('body').on('click', '.remove-phone-number-fields', function() {
    	$(this).prev("input[type=hidden]").val(true);
    	$(this).closest(".worker-phone-number-fields").hide();
	});

	$('body').on('click', '.submit-job-search', function(){
		search_string = $("#job_search_search_string").val();
		worker_id = $("#worker_id").val();
		distance = $("#distance-field").val();
		post_url = "/workers/" + worker_id + "/job_searches";
      	$.ajax({type: "POST",
	        url: post_url,
	        data: {"search_string": search_string, "distance": distance},
	        success: function(data)
	        {
	    		alert("Success");
	        },
	        error: function(request, error)
	        {
	          alert("Error Loading Job Searches");
	        }
      	});


	});

});

function add_fields(link, association, content)
{
	var id = new Date();
	id.getTime();
	var regexp = new RegExp("new_" + association, "g");
	$(link).before(content); 
}