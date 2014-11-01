$(document).ready(function()
{
    $(".twoBoxes").mouseenter(function()
	{
		$(this).fadeTo(500,1);
		$(this).siblings().fadeTo(500, 0.5);
	});    
	

});