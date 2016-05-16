$(document).ready(function(){
	$(".messages.index").ready(function(){
    	poll();
	});
});
function poll() {
	var msg_id = $(".header:last-child").data("val");
	if(msg_id == null)
		msg_id = 0;
	var user_id = $(".messages").data("user");
	var convo_id = $(".messages").data("convo");
	var convo_url = '/conversations/' + convo_id + '/messages'
	var userClass;
	setTimeout(function(){
		$.ajax({
		url: convo_url,
		type:'get',
		dataType: 'json',
		data: { id: msg_id},
		success: function(data){
				console.log(data);
				console.log(msg_id);
				if(data != null) {

					if(data.user_id == user_id) {
						userClass = "me";	
					} else {
						userClass = "you"
					}
					var htmlStr = "<div class='header' data-val="+ data.id + ">" +
									"<div class='bubble " + userClass + "'>" +
									 	data.body + "<br>" +
									 	data.created_at +
								  	"</div>" +
								  "</div>";

					$('.messages').append(htmlStr).fadeIn('slow');

					console.log(data.id);
				}	
			},
		error: 'poop',
		complete: poll
		});
	},1000);
};