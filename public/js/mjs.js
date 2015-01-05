$(document).ready(function() {
	
	var start = 0;
	var name, email, message;

	if ($("#tweet").length > 0) {
		getTweets();	
	}

	$(".contact-form").focus(function(event) {
		/* Act on the event */
	});

	$(".next>a").click(function(event) {

		if (start ==0) {
			var $name = $("#name");
			$name.removeClass('slide-in');
			$name.addClass('slide-out');
			$name.css('display', 'none');
			name = $("#input-name").val();
			var $email = $("#email");
			$email.removeClass('contact-d');
			$email.addClass('contact');
			$email.addClass('slide-in');
			start++;
			addToProvided(name);
		} else if (start == 1) {
			var $email = $("#email");
			$email.removeClass('slide-in');
			$email.addClass('slide-out');
			$email.css('display', 'none');
			email = $("#input-email").val();
			var $text = $("#text");
			$text.removeClass('contact-d');
			$text.addClass('contact');
			$text.addClass('slide-in');
			$(this).html("SEND IT");
			addToProvided(email);
			start++;
		} else {
			message = $("#input-message").val();
			sendEmail(name,email,message);
		}		
	});

});

function getTweets() {
	var $tweet = $("#tweet");
	var $date = $("#tweet-date");
	var $link = $("#tweet-link");

	$.post('/gtweet', 
		{count: "1"}, 
		function(data, textStatus, xhr) {
			$tweet.html("\"" + data.tweet + "\"");
			$date.html(data.time.toUpperCase());
			$link.attr('href', data.link);
	});
};

function addToProvided(info) {
	$(".provided").append('<span class="slide-in-right">' + info + '</span>');
}

function sendEmail(name, sender, message) {
	$.post('/sendEmail', {
		name : name,
		sender : sender,
		message : message
	}, function(data, textStatus, xhr) {
		alert("Sent");
	});
}