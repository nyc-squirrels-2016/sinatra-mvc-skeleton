$(document).ready(function() {

	$("#create").click(function(){
		var form = "<form id='create-form' action='/comment' method='post'> Content: <input type='text' name='content'> <input type='submit' value='Submit'> </form>"
		$("#create-container").append(form)
		$("#create").hide();
	});

	$("#create-container").on("submit", "#create-form", function(e){
		e.preventDefault();
		var request = $.ajax({
			type: "POST",
			url: "/comment",
			data: $(this).serialize(),
			dataType: "json"});
		request.done(function(response){
			$("#comment-container").prepend("<a class='like' id='" + response.id + "' href='#'>" + response.likes + "</a> <a href='/comment/" + response.id + "'>" + response.content + "</a> <br>")
		});

		$("#create-container").html("")
		$("#create").show();
	});

	$("#comment-container").on("click", ".like", function(e){
		e.preventDefault();
		var link = $(this)
		var id = $(this).attr("id")
		var request = $.ajax({
			type: "POST",
			url: "/likes",
			data: {"id": id},
			dataType: "json"});

		request.done(function(response){
			link.text(response.likes);
		});
		$("#create").show();
	});






});
