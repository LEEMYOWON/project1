<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- FullCalendar -->
    <link href="/resources/admin/vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
    <link href="/resources/admin/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">

  </head>
 
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">

            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Calendar</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div id='calendar'></div>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- calendar modal -->
    <div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel">일정등록</h4>
          </div>
          <div class="modal-body">
            <div id="testmodal" style="padding: 5px 10px;">
              <form id="antoform" class="form-horizontal calender" role="form">
                <div class="form-group" style="float:left; width:50%;">
                  <label class="col-sm-3 control-label">AWAY</label>
                  <div class="col-sm-9">
                    <select class="form-control" id="away1" name="away1">
                            <option value='1'>넥센 히어로즈</option>
                            <option value='2'>두산 베어스</option>
                            <option value='3'>롯데 자이언츠</option>
                            <option value='4'>삼성 라이온즈</option>
                            <option value='5'>한화 이글스</option>
                            <option value='6'>KIA 타이거즈</option>
                            <option value='7'>KT 위즈</option>
                            <option value='8'>LG 트윈스</option>
                            <option value='9'>NC 다이노스</option>
                            <option value='10'>SK 와이번즈</option>
                    </select>            
                  </div>
                </div>
              <div class="form-group" style="float:right; width:50%;">
                  <label class="col-sm-3 control-label">HOME</label>
                  <div class="col-sm-9">
                    <select class="form-control" id="home1" name="home1">
                            <option value='1'>넥센 히어로즈</option>
                            <option value='2'>두산 베어스</option>
                            <option value='3'>롯데 자이언츠</option>
                            <option value='4'>삼성 라이온즈</option>
                            <option value='5'>한화 이글스</option>
                            <option value='6'>KIA 타이거즈</option>
                            <option value='7'>KT 위즈</option>
                            <option value='8'>LG 트윈스</option>
                            <option value='9'>NC 다이노스</option>
                            <option value='10'>SK 와이번즈</option>
                    </select>            
                  </div>
                </div>
              </form>
              <form id="antoform" class="form-horizontal calender" role="form">
                <div class="form-group" style="float:left; width:50%;">
                  <label class="col-sm-3 control-label">AWAY</label>
                  <div class="col-sm-9">
                    <select class="form-control" id="away2" name="away2">
                            <option value='1'>넥센 히어로즈</option>
                            <option value='2'>두산 베어스</option>
                            <option value='3'>롯데 자이언츠</option>
                            <option value='4'>삼성 라이온즈</option>
                            <option value='5'>한화 이글스</option>
                            <option value='6'>KIA 타이거즈</option>
                            <option value='7'>KT 위즈</option>
                            <option value='8'>LG 트윈스</option>
                            <option value='9'>NC 다이노스</option>
                            <option value='10'>SK 와이번즈</option>
                    </select>            
                  </div>
                </div>
              <div class="form-group" style="float:right; width:50%;">
                  <label class="col-sm-3 control-label">HOME</label>
                  <div class="col-sm-9">
                    <select class="form-control" id="home2" name="home2">
                            <option value='1'>넥센 히어로즈</option>
                            <option value='2'>두산 베어스</option>
                            <option value='3'>롯데 자이언츠</option>
                            <option value='4'>삼성 라이온즈</option>
                            <option value='5'>한화 이글스</option>
                            <option value='6'>KIA 타이거즈</option>
                            <option value='7'>KT 위즈</option>
                            <option value='8'>LG 트윈스</option>
                            <option value='9'>NC 다이노스</option>
                            <option value='10'>SK 와이번즈</option>
                    </select>            
                  </div>
                </div>
              </form>
              <form id="antoform" class="form-horizontal calender" role="form">
                <div class="form-group" style="float:left; width:50%;">
                  <label class="col-sm-3 control-label">AWAY</label>
                  <div class="col-sm-9">
                    <select class="form-control" id="away3" name="away3">
                            <option value='1'>넥센 히어로즈</option>
                            <option value='2'>두산 베어스</option>
                            <option value='3'>롯데 자이언츠</option>
                            <option value='4'>삼성 라이온즈</option>
                            <option value='5'>한화 이글스</option>
                            <option value='6'>KIA 타이거즈</option>
                            <option value='7'>KT 위즈</option>
                            <option value='8'>LG 트윈스</option>
                            <option value='9'>NC 다이노스</option>
                            <option value='10'>SK 와이번즈</option>
                    </select>            
                  </div>
                </div>
              <div class="form-group" style="float:right; width:50%;">
                  <label class="col-sm-3 control-label">HOME</label>
                  <div class="col-sm-9">
                    <select class="form-control" id="home3" name="home3">
                            <option value='1'>넥센 히어로즈</option>
                            <option value='2'>두산 베어스</option>
                            <option value='3'>롯데 자이언츠</option>
                            <option value='4'>삼성 라이온즈</option>
                            <option value='5'>한화 이글스</option>
                            <option value='6'>KIA 타이거즈</option>
                            <option value='7'>KT 위즈</option>
                            <option value='8'>LG 트윈스</option>
                            <option value='9'>NC 다이노스</option>
                            <option value='10'>SK 와이번즈</option>
                    </select>            
                  </div>
                </div>
              </form>
              <form id="antoform" class="form-horizontal calender" role="form">
                <div class="form-group" style="float:left; width:50%;">
                  <label class="col-sm-3 control-label">AWAY</label>
                  <div class="col-sm-9">
                    <select class="form-control" id="away4" name="away4">
                            <option value='1'>넥센 히어로즈</option>
                            <option value='2'>두산 베어스</option>
                            <option value='3'>롯데 자이언츠</option>
                            <option value='4'>삼성 라이온즈</option>
                            <option value='5'>한화 이글스</option>
                            <option value='6'>KIA 타이거즈</option>
                            <option value='7'>KT 위즈</option>
                            <option value='8'>LG 트윈스</option>
                            <option value='9'>NC 다이노스</option>
                            <option value='10'>SK 와이번즈</option>
                    </select>            
                  </div>
                </div>
              <div class="form-group" style="float:right; width:50%;">
                  <label class="col-sm-3 control-label">HOME</label>
                  <div class="col-sm-9">
                    <select class="form-control" id="home4" name="home4">
                            <option value='1'>넥센 히어로즈</option>
                            <option value='2'>두산 베어스</option>
                            <option value='3'>롯데 자이언츠</option>
                            <option value='4'>삼성 라이온즈</option>
                            <option value='5'>한화 이글스</option>
                            <option value='6'>KIA 타이거즈</option>
                            <option value='7'>KT 위즈</option>
                            <option value='8'>LG 트윈스</option>
                            <option value='9'>NC 다이노스</option>
                            <option value='10'>SK 와이번즈</option>
                    </select>            
                  </div>
                </div>
              </form>
              <form id="antoform" class="form-horizontal calender" role="form">
                <div class="form-group" style="float:left; width:50%;">
                  <label class="col-sm-3 control-label">AWAY</label>
                  <div class="col-sm-9">
                    <select class="form-control" id="away5" name="away5">
                            <option value='1'>넥센 히어로즈</option>
                            <option value='2'>두산 베어스</option>
                            <option value='3'>롯데 자이언츠</option>
                            <option value='4'>삼성 라이온즈</option>
                            <option value='5'>한화 이글스</option>
                            <option value='6'>KIA 타이거즈</option>
                            <option value='7'>KT 위즈</option>
                            <option value='8'>LG 트윈스</option>
                            <option value='9'>NC 다이노스</option>
                            <option value='10'>SK 와이번즈</option>
                    </select>            
                  </div>
                </div>
              <div class="form-group" style="float:right; width:50%;">
                  <label class="col-sm-3 control-label">HOME</label>
                  <div class="col-sm-9">
                    <select class="form-control" id="home5" name="home5">
                            <option value='1'>넥센 히어로즈</option>
                            <option value='2'>두산 베어스</option>
                            <option value='3'>롯데 자이언츠</option>
                            <option value='4'>삼성 라이온즈</option>
                            <option value='5'>한화 이글스</option>
                            <option value='6'>KIA 타이거즈</option>
                            <option value='7'>KT 위즈</option>
                            <option value='8'>LG 트윈스</option>
                            <option value='9'>NC 다이노스</option>
                            <option value='10'>SK 와이번즈</option>
                    </select>            
                  </div>
                </div>
              </form>                                                        
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default antoclose" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary antosubmit">Save changes</button>
          </div>
        </div>
      </div>
    </div>

    <div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
    <div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
    <!-- /calendar modal -->
        
    <!-- jQuery -->
    <script src="/resources/admin/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/resources/admin/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/resources/admin/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/resources/admin/vendors/nprogress/nprogress.js"></script>
    <!-- FullCalendar -->
    <script src="/resources/admin/vendors/moment/min/moment.min.js"></script>
    <script src="/resources/admin/vendors/fullcalendar/dist/fullcalendar.min.js"></script>
    <script src="/resources/admin/build/js/custom.min.js"></script>

    <!-- Custom Theme Scripts -->
<script>
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


</script>
  </body>
</html>