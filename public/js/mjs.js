$(document).ready(function() {
	
	if ($("#tweet").length > 0) {
		getTweets();	
	}

	$(".contact-form").focus(function(event) {
		/* Act on the event */
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


