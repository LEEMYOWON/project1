<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1500px;
    margin: 0 auto;
  }
</style>
<%@ include file="include/top.jsp" %>
<link href='/resources/sports/calendar_lib/fullcalendar.min.css' rel='stylesheet' />
<link href='/resources/sports/calendar_lib/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='/resources/sports/calendar_lib/moment.min.js'></script>
<script src='/resources/sports/calendar_lib/jquery.min.js'></script>
<script src='/resources/sports/calendar_lib/fullcalendar.min.js'></script>
<script>

  $(document).ready(function() {

	  function init_calendar() {
			
			var calendarList = [];
			var testCal = [];
			var teamsplit = [];
			$.ajax({
				type : 'get',
				url :  '/admin8/select_schedule',
				async : false,
				success : function(data) {
					calendarList = data;
				}
			})
			
		    if ("undefined" != typeof $.fn.fullCalendar) {
		        console.log("init_calendar");
		        var e, f, a = new Date,
		            b = a.getDate(),
		            c = a.getMonth(),
		            d = a.getFullYear(),
		            g = $("#calendar").fullCalendar({
		                header: {
		                    left: "prev,next today",
		                    center: "title",
		                    right: "month,agendaWeek,agendaDay,listMonth"
		                },
		                selectable: !0,
		                selectHelper: !0,
		                select: function(a, b, c) {
		                    $("#fc_create").click(), e = a, ended = b, $(".antosubmit").on("click", function() {
		     
		 						function spend_contents(d, c, b){
		                    		
		                    		var contents = $("#antoform").serialize();
		                    		$.ajax({
		                    			type : 'get',
		                    			url : '/admin8/insert_schedule',                    
		                    			async : false,
		                    			data : {
		                    				date1 : new Date(b),               
		                    				away1 : $("#away1").val(),
		                    				home1 : $("#home1").val(),
		                    				
		                    				date2 : new Date(b),               
		                    				away2 : $("#away2").val(),
		                    				home2 : $("#home2").val(),
		                    				
		                    				date3 : new Date(b),               
		                    				away3 : $("#away3").val(),
		                    				home3 : $("#home3").val(),
		                    				
		                    				date4 : new Date(b),               
		                    				away4 : $("#away4").val(),
		                    				home4 : $("#home4").val(),
		                    				
		                    				date5 : new Date(b),               
		                    				away5 : $("#away5").val(),
		                    				home5 : $("#home5").val()
		                    			},
		                    			success : location.href="/admin8/schedule"
		                    		});
		                    	}                                        	
		 						spend_contents(d, c, b);
		 						
		                        var a = $("#title").val();
		                        return b && (ended = b), f = $("#event_type").val(), a && g.fullCalendar("renderEvent", {
		                            title: a,
		                            start: e,
		                            end: b,
		                            allDay: c
		                        }, !0), $("#title").val(""), g.fullCalendar("unselect"), $(".antoclose").click(), !1
		                        
		                    })
		                    
		                    
		                },
		                eventClick: function(a, b, c) {
		                    $("#fc_edit").click(), $("#title2").val(a.title), 
		                    f = $("#event_type").val(), $(".antosubmit2").on("click", function() {
		                        a.title = $("#title2").val(), g.fullCalendar("updateEvent", a), $(".antoclose2").click()
		                    }), 
		                    g.fullCalendar("unselect");
		                },
		                editable: !0,
		                events: calendarList
		               
		            })
		    }
		    
			$('.fc-time').remove();
			$('.fc-content').css('text-align', 'center');
			
			
		}

		$(function(){
			
			$(".antosubmit").on("click", function(data) {
				console.log($('#title').val());
				console.log($('#descr').val());
				
			})
		})

		init_calendar()
		$('.fc-time').remove();

  });

</script>
<div class="news-letter">
	<div class="container">
  	<div id='calendar'></div>
<br/><br/>
</div>
</div>
<%@ include file="include/footer.jsp" %>
