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
				if(data != null) {
					var now = new Date(data.created_at);
					if(data.user_id == user_id) {
						userClass = "me";	
					} else {
						userClass = "you"
					}
					var htmlStr = "<div class='header' data-val="+ data.id + ">" +
									"<div class='bubble " + userClass + "'>" +
									 	data.body + "<br>" +
									 	format_time(now) +
								  	"</div>" +
								  "</div>";
					$('.messages').append(htmlStr).fadeIn('slow');
				}	
			},
		error: 'poop',
		complete: poll
		});
	},1000);

};

function format_time(date_obj) {

	var hour = date_obj.getHours();
	var minute = date_obj.getMinutes();
	var amPM = (hour > 11) ? "PM" : "AM";
	var day = date_obj.getDate();
	var month = date_obj.getMonth() + 1;
	var year = date_obj.getFullYear();
	if(hour > 12) {
		hour -= 12;
	} else if(hour == 0) {
		hour = "12";
	}
	if(minute < 10) {
		minute = "0" + minute;
	}
	return month + "/" + day + "/" + year + " at " + hour + ":" + minute + amPM;
}

