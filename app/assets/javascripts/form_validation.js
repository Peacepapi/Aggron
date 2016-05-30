$(document).ready(function(){
	$(".tools.create").ready(function(){
		var $new_tool = $('#new_tool');
		var $edit_tool = $('.edit_tool');
		getToolValidation($new_tool);
		getToolValidation($edit_tool);
	});
	$(".users.create").ready(function(){
		var $new_user = $("#new_user");
		var $edit_user = $(".edit_user");
		getUserValidation($new_user);
		getUserValidation($edit_user);
	});
	function getToolValidation($form_id) {
		$form_id.validate({
			rules: {
				"tool[name]": {
					required: true,
					minlength: 4,
					maxlength: 100
				},
				"tool[tooltype_id]": "required",
				"tool[description]": {
					required: true,
					minlength: 10,
					maxlength: 254
				}
			},
			messages: {
				"tool[name]": {
					required: "Please enter the tool name",
					minlength: "Tool's name must consist of at least 4 characters"
				},
				"tool[tooltype_id]": {
					required: "Please provide a type for the tool",
				},
				"tool[description]": {
					required: "Please provide a description",
					minlength: "Your description must be at least 10 characters long",
				}
			}
		});
	}
	function getUserValidation($form_id) {//passed in a class
		$form_id.validate({
			rules: {
				"user[username]": {
					required: true,
					minlength: 5,
					maxlength: 20
				},
				"user[email]": {
					required: true,
					maxlength: 254
				},
				"user[password]": {
					required: true,
					minlength: 7,
					maxlength: 50
				},
				"user[password_confirmation]": {
					required: true,
					minlength: 7,
					maxlength: 50,
					equalTo: "#user_password"
				}
			},
			messages: {
				"user[username]": {
					required: "Please choose a username",
					minlength: "Username must be longer than 5 characters",
					maxlength: "Username must be shorter than 20 characters"
				},
				"user[email]": {
					required: "Please enter a valid e-mail",
					maxlength: "E-mail cannot be longer than 254 characters"
				},
				"user[password]": {
					required: "Please provide a password",
					minlength: "Your password must longer than 7 characters",
					maxlength: "Your password must shorter than 50 characters"
				},
				"user[password_confirmation]": {
					required: "Please provide a password",
					minlength: "Your password must longer than 8 characters",
					maxlength: "Your password must shorter than 50 characters",
					equalTo: "Your password must match"
				}
			}
		});
	}	
});