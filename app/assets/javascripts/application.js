$(document).ready(function()
{
	
	//Hides elements upon loading

	$("#userHist").hide();
	$("#settings").hide();
	$("#logout").hide();
	$(".eventDetail").hide();
	$("#event0").hide();
	$(".bookItBtn").hide();
	$("#bookingPane").hide();
	$("#orderComplete").hide();
	$("#orderError").hide();
	$("#errorMessage").hide();
	$("#completeMessage").hide();
	
	
	
    $(".twoBoxes").mouseenter(function()
	{
		$(this).fadeTo(500,1);
		$(this).siblings().fadeTo(500, 0.5);
	});    
	



	
	
	//Hides and displays the user history pane
	$("#toggleHist").click(function(e) 
	{
		$("#userHist").toggle();
		e.stops();

	});
	
	
	//Controls which sheet tab is active and shows/hides appropriate content in the main pane
	$(".tabLinks .sheetTabs a").on("click", function(e)  {
        var currentAttrValue = $(this).attr("href");
        $("#jumboT " + ".mainPanel " + currentAttrValue).show().siblings().hide();
        $(this).parent(".sheetTabs").parent(".tabSpace").addClass("active").siblings().removeClass("active");
        //console.log("Showing" + currentAttrValue)
        e.preventDefault();
    });
	
	//Shows the details for the current event, when selected
	$(".eventThumb").on("click", function(e)  
	{
		var currentEvent = $(this).children().attr("href")
        $(this).addClass("selected").siblings().removeClass("selected");
		$(currentEvent).show().siblings(".eventDetail").hide();
		if(currentEvent !== "#event0")
		{
			$(".bookItBtn").show();
		}else
		{
			$(".bookItBtn").hide();
		}		
        e.preventDefault();
    });
	
	
	//Shows the booking panel, when the "book it" button is clicked
	$(".bookItBtn").on('click', function(e)
	{
		var bookEvent = $(".eventDetail:visible");
		$("#upcomingPane").hide();
		$(".bookItBtn").hide();
		$("#bookingPane").toggle();
		e.stop();
	});
	
	//Cancels bookingane. Brings user back to event upcoming events pane
	$("#goBack").on("click", function(e)
	{
		$("#upcomingPane").show();
		$("#bookingPane").hide();
		$(".bookItBtn").show();
		$("#orderComplete").hide();
		$("#home").show();		
	});
	
	//Cancels booking confirmation
	$("#goHome").on("click", function(e)
	{
		$("#upcomingPane").show();
		$("#bookingPane").hide();
		$(".bookItBtn").show();
		$("#orderComplete").hide();
		$("#home").show();		
	});
	
	//Places order and brings user to order confirmation screen.
	//Needs to interface with DB to determine if sufficient tickets are 
	//available and place order in back end
	$("#orderButton").on("click", function(e)
	{
		$("#upcomingPane").show();
		$("#bookingPane").hide();
		$(".bookItBtn").show();
		$("#home").hide();
		$("#orderComplete").show();
		$("#completeMessage").show();	
	});

});


//Shows the booking panel, when the "book it" button is clicked
function setEventFunction(val)
{
   $.ajax({
     methond: "POST",
     url: '/events/' + val,
     contentType: 'application/json; charset=UTF-8'
   });

   //$.get('/current_event?id=' + val, null, null, null);
   alert(val);
};	