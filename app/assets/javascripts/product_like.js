$('.one-pro-inner').on("mouseenter", function() {
	var offset = $(this).offset();
	var $like = $(this).find('.like');
	$like.css({
	  "position": "absolute",
	  "top": offset.top - 235 + "px",
	  "left": offset.left - 110 + "px",
	});
	$like.slideToggle("fast");
});
$('.one-pro-inner').on("mouseleave", function() {
var $like = $(this).find('.like');
$like.slideToggle("fast");
});