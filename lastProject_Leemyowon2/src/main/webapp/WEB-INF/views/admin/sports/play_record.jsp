<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script>

var awayPlayPList = [];
var awayPlayHList = [];
var homePlayPList = [];
var homePlayHList = [];
var awayNum = {awayNum : 4, awayN : 4};
var homeNum = {homeNum : 4, homeN : 4};
var thisis = null;
var inning = 1;
var gameValue = null;


function btn_selectDate(){
	
	var date = new Date($('#selectDate').val());
	$.ajax({
		url : '/admin8/select_startInfo',
		type : 'get',
		data : {'date': date},
		success : function(data) {
			items = data;
			console.log(items);
			select = $('#playTeams');
			for(var i = 0; i < items.length; i++){
				select.append("<option value='"+items[i].awayTeam_CD+" | " + items[i].homeTeam_CD + " | "+items[i].game_CD+"'>"+items[i].away+" VS "+items[i].home+"</option>");											
			}
		}		
	});
	
}

function selectTeam(){
			
	var teams = $('#playTeams').children("option:selected").text();
	var teamsArr = teams.split(' VS ');

	$('#awayteam').text(teamsArr[0]);
	$('#hometeam').text(teamsArr[1]);
	
	var teamValues = $('#playTeams').val();
	var teamValuesArr = teamValues.split(" | ");
	
	$.ajax({
		url : '/admin8/select_playP',
		type : 'get',
		data : {'team_CD' : teamValuesArr[1],
				'date' : $('#selectDate').val()},
		success : function(data){
			awayPlayPList.push(data[0]);
			console.log(teamValuesArr[0]);
			$("th[name='awayPlayP']");			
			$("th[name='awayPlayP']").append("<input type='hidden' value='"+data[0].player_CD+"'>"+data[0].pname);
			
		}
	});
	
	$.ajax({
		url : '/admin8/select_playP',
		type : 'get',
		data : {'team_CD' : teamValuesArr[0],
				'date' : $('#selectDate').val()},
		success : function(data){
			homePlayPList.push(data[0]);
			console.log(data);
			console.log(teamValuesArr[1]);
			console.log($("th[name='homePlayP']"));			
			$("th[name='homePlayP']").append("<input type='hidden' value='"+data[0].player_CD+"' name='playP'>"+data[0].pname);
		}
	});
	
	var teamValues = $('#playTeams').val();
	var teamValuesArr = teamValues.split(" | ");
	
	$.ajax({
		url : '/admin8/select_playH',
		type : 'get',
		data : {'team_CD' : teamValuesArr[1],
				'date' : $('#selectDate').val()},
		success : function(data){
			console.log(data);
			var cnt = 0;
			for(var i = 0; i < data.length; i++){
				if(teamValuesArr[1] == data[i].team_CD){
					awayPlayHList.push(data[i]);
					$("#awayLineup"+(cnt+1)).append(data[i].lineup);
					$("#awayPosition"+(cnt+1)).append(data[i].defenseP);
					$("#awayPlayerH"+(cnt+1)).append("<input type='hidden' value='"+data[i].player_CD+"'>"+data[i].pname);
					$("th[name='awayPlayerH"+(cnt+1)+"']").append("<input type='hidden' value='"+data[i].player_CD+"' name='awayplayH'>"+data[i].pname);
					cnt++;
				}
			} 
		}
	});
	
	$.ajax({
		url : '/admin8/select_playH',
		type : 'get',
		data : {'team_CD' : teamValuesArr[0],
				'date' : $('#selectDate').val()},
		success : function(data){
			
			console.log(data);
			var cnt = 0;
			for(var i = 0; i < data.length; i++){
				if(teamValuesArr[0] == data[i].team_CD){
					homePlayHList.push(data[i]);
					$("#homeLineup"+(cnt+1)).append(data[i].lineup);
					$("#homePosition"+(cnt+1)).append(data[i].defenseP);
					$("#homePlayerH"+(cnt+1)).append("<input type='hidden' value='"+data[i].player_CD+"'>"+data[i].pname);
					$("th[name='homePlayerH"+(cnt+1)+"']").append("<input type='hidden' value='"+data[i].player_CD+"' name='homeplayH'>"+data[i].pname);
					cnt++;
				}
			} 
		}
	});
}


//html append(away 타석추가)
function addAt_batAway(){

	var awayNumber = awayNum.awayNum;
	var awayNumber1 = awayNum.awayN;
	if(awayNumber > 9){
		awayNumber = 1;
	}
	
	var appendHtml = Handlebars.compile($("#appendtableAway").html());
	appendHtml = appendHtml(awayNum);
	
	$("#accordion").append(appendHtml);
	$("#awayLineup"+(awayNumber1)).append(awayPlayHList[awayNumber-1].lineup);
	$("#awayPosition"+(awayNumber1)).append(awayPlayHList[awayNumber-1].defenseP);
	$("#awayPlayerH"+(awayNumber1)).append("<input type='hidden' value='"+awayPlayHList[awayNumber-1].player_CD+"' name='awayplayH'>"+awayPlayHList[awayNumber-1].pname);
	$("th[name='awayPlayerH"+(awayNumber1)+"']").append("<input type='hidden' value='"+awayPlayHList[awayNumber-1].player_CD+"' name='awayplayH'>"+awayPlayHList[awayNumber-1].pname);
	$("th[name='homePlayP']").empty();
	$("th[name='homePlayP']").append("<input type='hidden' value='"+homePlayPList[0].player_CD+"' name='playP'>"+homePlayPList[0].pname);

	awayNum = {awayNum : awayNumber+1, awayN : awayNumber1+1};

}

// html append(home 타석추가)
function addAt_batHome(){
	
	var homeNumber = homeNum.homeNum;
	var homeNumber1 = homeNum.homeN;
	if(homeNumber > 9){
		homeNumber = 1;
	}
	
	var appendHtml = Handlebars.compile($("#appendtableHome").html());
	appendHtml = appendHtml(homeNum);
	
	$("#accordion1").append(appendHtml);
	$("#homeLineup"+(homeNumber1)).append(homePlayHList[homeNumber-1].lineup);
	$("#homePosition"+(homeNumber1)).append(homePlayHList[homeNumber-1].defenseP);
	$("#homePlayerH"+(homeNumber1)).append("<input type='hidden' value='"+homePlayHList[homeNumber-1].player_CD+"' name='homeplayH'>"+homePlayHList[homeNumber-1].pname);
	$("th[name='homePlayerH"+(homeNumber1)+"']").append("<input type='hidden' value='"+homePlayHList[homeNumber-1].player_CD+"' name='homeplayH'>"+homePlayHList[homeNumber-1].pname); 
	console.log($("th[name='homePlayerH"+(homeNumber1)+"']"));
	$("th[name='awayPlayP']").empty();
	$("th[name='awayPlayP']").append("<input type='hidden' value='"+awayPlayPList[0].player_CD+"' name='playP'>"+awayPlayPList[0].pname);
	
	homeNum = {homeNum : homeNumber+1, homeN : homeNumber1+1};
}

function writeArsenal(){
	
	var selectA = $(":radio[name='optradio']:checked").val();	
	console.log(selectA);
	$(".btn-default").click();
	thisis.empty();
	thisis.parent().append($(":radio[name='optradio']:checked").parent().text());
	thisis.parent().append("<input type='hidden' name='arsenal_CD' value='"+selectA+"'>")	
	// 라디오버튼 check 해제 
	$(":radio[name='optradio']:checked").attr("checked", false);
	 		
}

function writeContents(){
	var selectC = $(":radio[name='optradio1']:checked").val();
	console.log(selectC);
	$(".btn-default").click();
	thisis.empty();
	thisis.parent().append($(":radio[name='optradio1']:checked").parent().text());
	thisis.parent().append("<input type='hidden' name='contents_CD' value='"+selectC+"'>")
	// 라디오버튼 check 해제
	$(":radio[name='optradio1']").attr("checked", false);
}

$(function(){
	
	// SELECT arsenal
	$.ajax({ 
		url : '/admin8/selectArsenal',
		type : 'get',
		async : false,
		success : function(data){
			//console.log(data);
			div = $("#arsenalList");
			for(var i = 0; i < data.length; i++){
				div.append("<label><input type='radio' id='optradio' name='optradio' value='"+data[i].arsenal_CD+"' onchange='writeArsenal()'>"+data[i].paname+"</label></br>");			
			}
			
		}		
	});
				
	
	// 구종 모달창 open
	$(document).on('click', '.arsenal', function(){
		console.log($(this));		
		thisis = $(this);
		$(".btn-sm").click();		
	});
	
	
	// SELECT contents
	$.ajax({
		url : '/admin8/selectContents', //연필
		type : 'get',
		success : function(data){
			console.log(data);
			div = $("#contentsList");
			for(var i = 0; i < data.length; i++){
				div.append("<label><input type='radio' name='optradio1' value='"+data[i].contents_CD+"' onchange='writeContents()'>"+data[i].contents+"</label></br>");			
			}
		}		
	});
	
	// 내용 모달창 open
	$(document).on('click', '.contents', function(){
		console.log($(this));
		thisis = $(this);
		$(".btn-sm1").click();
	});
	
	// Record insert
	$(document).on('click', "button[name='btn_awaySubmit']", function(){		
		
		console.log($(this));
		
		var formNum = $(this).val();
		console.log($('#awayForm' + formNum));
		var teamValues = $('#playTeams').val();
		var teamValuesArr = teamValues.split(" | ");
		gameValue = teamValuesArr[2]
		
		var form = $('#awayForm' + formNum);
		$("<input></input>").attr({type:"hidden", name:"inning", value: inning }).appendTo(form);
		$("<input></input>").attr({type:"hidden", name:"game_CD", value: gameValue}).appendTo(form);
		var queryString = form.serializeArray();
		
		console.log(queryString);
				
		$.ajax({
			url : '/admin8/insertRecord',
			type : 'post',
			data : queryString,
			success : function(){
				// out 값 비교
				var out = ["4","5","6","11","12","17"];
				for(var i=0;i<queryString.length;i++){
					if(queryString[i].name=="contents_CD"){
						if(out.indexOf(queryString[i].value)!=-1){ // out 존재 
							i++;
							$("#awayteam").append("&nbsp;<img src='../resources/sports/images/outcount.png'>");
							$("#heading"+(parseInt(formNum) + 1)).click();
								break;
						}else{  // out no
							i++;
							$("#heading"+(parseInt(formNum) + 1)).click();
						}
					}
					
				} if($("#awayteam").children().length == 3){
					inning++;
					$("#accordion").empty();
					for(var i = 0; i < 3; i++){
						addAt_batAway();
					}
					var th = $(".awayinning");
					th.text("");
					th.append(inning);
					alert("3아웃 체인지");
					$("#awayteam").children().remove();
					$("#heading11").click();
				}
			}
		})		
		
	});
	
})


function btn_homeR(){
	
	inning++;
	$("#accordion1").empty();
	for(var i = 0; i < 3; i++){
		addAt_batHome();
	}
	var th = $(".homeinning");
	th.text("");
	th.append(inning);
	alert("3아웃 체인지");
	
}



</script>

<%@ include file="../include/header.jspf" %>
<c:url var="ball" value="resources/sports/images/ball.png"></c:url>
<c:url var="recordicon" value="resources/sports/images/recordicon.png"></c:url>
    <!-- Bootstrap -->
    <link href="/resources/admin/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/resources/admin/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/resources/admin/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="/resources/admin/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- bootstrap-datetimepicker -->
    <link href="/resources/admin/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <!-- Ion.RangeSlider -->
    <link href="/resources/admin/vendors/normalize-css/normalize.css" rel="stylesheet">
    <link href="/resources/admin/vendors/ion.rangeSlider/css/ion.rangeSlider.css" rel="stylesheet">
    <link href="/resources/admin/vendors/ion.rangeSlider/css/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <!-- Bootstrap Colorpicker -->
    <link href="/resources/admin/vendors/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet">

    <link href="/resources/admin/vendors/cropper/dist/cropper.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/resources/admin/build/css/custom.min.css" rel="stylesheet">    
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>경기 기록</h3>
              </div>


<div class="x_panel" style="">
    <div class="x_title">
        <h2>Start Play</h2>
        <ul class="nav navbar-right panel_toolbox">
            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
            </li>
        </ul>
        <div class="clearfix"></div>
    </div>
    <div class="x_content">
        <div class="container">
            <div class="row">
               
                <div class='col-sm-4'>
                    Play Date 
                    <div class="form-group">
                    	<div class="col-md-9 col-sm-9 col-xs-12">
							<input type = "date" id="selectDate"/>
                        	<input type="button" id="btn_selectDate" onclick="btn_selectDate()" value="확인"/>
                        </div>	
                    </div>
                </div>               
 
               <div class="col-sm-4">
               Team
                <div class="form-group" >
                    <div class="col-md-9 col-sm-9 col-xs-12">
                    	<select class="form-control" id="playTeams" name="playTeams" onchange="selectTeam()" >
							<option value="">선택하세요</option>
                        </select>
                    </div>
                </div>
            </div>
                <button type="button" class="btn" onclick="location='read_record'">오늘기록보기</button>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>

              <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>AWAY /&nbsp<h2 id="awayteam"></h2></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-exchange"></i></a> 
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">투수교체</a>
                          </li>
                          <li><a href="#">수비교체</a>
                          </li>
                          <li><a href="#">타자교체</a>
                          </li>                          
                        </ul>                                                                   
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#" onclick="addAt_batAway()">타석 추가</a>
                          </li>
                          <li><a href="#">테이블 row 추가</a>
                          </li>
                        </ul>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <!-- start accordion -->
                    <!-- away팀 기록 -->
                    <div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">                     
                      <c:forEach var="j" begin="1" end="3" step="1">
                      <div class="panel" id="at_batAway">
                        <a class="panel-heading collapsed" role="tab" id="heading${j}" data-toggle="collapse" data-parent="#accordion" href="#collapse${j}" aria-expanded="false" aria-controls="collapse${j}">
                          <h4 class="panel-title">#<span id="awayLineup${j}"></span>&nbsp<span id="awayPosition${j}"></span>&nbsp<span id="awayPlayerH${j}"></span></h4>
                        </a>
                        <div id="collapse${j}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${j}">
                          <form name="awayForm" id="awayForm${j}">
                          <div class="panel-body">
                            <table class="table table-bordered">
                              <thead>
                                <tr>
                                  <th class="awayinning">1</th>
                                  <th>1</th>
                                  <th>2</th>
                                  <th>3</th>
                                  <th>4</th>
                                  <th>5</th>
                                  <th>6</th>
                                  <th>7</th>
                                  <th>8</th>
                                  <th>9</th>
                                  <th>10</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <th scope="row" name="homePlayP"></th>
                                  <c:forEach var="i" begin="1" end="10" step="1">
                                  	<td><a href="#" class="contents"><img src="${recordicon}" width=20px height=20px class="img-responsive" alt=""/></a></td>
                                  </c:forEach>    
                                </tr>
                                <tr>
                                  <th scope="row">구종</th>
                                  <c:forEach var="i" begin="1" end="10" step="1">
                                  	<td><a href="#" class="arsenal"><img src="${ball}" width=20px height=20px class="img-responsive" alt=""/></a></td>
                                  </c:forEach>    
                                </tr>
                                <tr>
                                  <th scope="row">구속</th>
                                  <c:forEach var="i" begin="1" end="10" step="1">
                                  	<td><input type="text" name="ballSpeed" value="" style="width:30px; height:24px; border:none"></td>
                                  </c:forEach>    
                                <tr>
                                  <th scope="row" name="awayPlayerH${j}"></th>
                                  <c:forEach var="i" begin="1" end="10" step="1">
                                  	<td><a href="#" class="contents"><img src="${recordicon}" width=20px height=20px class="img-responsive" alt=""/></a></td>
                                  </c:forEach>    
                                </tr>                                                            
                              </tbody>
                            </table>
                            <label>타점&nbsp</label><input type="text" name="rbi" value="" style="width:30px; height:24px;">
                            <button type="button" class="btn btn-dark" name="btn_awaySubmit" value="${j}">Submit</button>
                          </div>
                          </form>
                        </div>
                      </div>
                      </c:forEach>
                    </div>                                                            
                    <!-- end of accordion -->
                  </div>               
                </div>
              </div>

             
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel" id="homeRecord">
                  <div class="x_title">
                    <h2> HOME /&nbsp<h2 id="hometeam"></h2></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-exchange"></i></a> 
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">투수교체</a>
                          </li>
                          <li><a href="#">수비교체</a>
                          </li>
                          <li><a href="#">타자교체</a>
                          </li>                          
                        </ul>                                                                   
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#" onclick="addAt_batHome()">타석 추가</a>
                          </li>
                          <li><a href="#">테이블 row 추가</a>
                          </li>
                        </ul>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <!-- start accordion -->
                    <!-- home팀 기록 -->
                    <div class="accordion" id="accordion1" role="tablist" aria-multiselectable="true">
                      <c:forEach var="j" begin="1" end="3" step="1">
                      <div class="panel">
                        <a class="panel-heading collapsed" role="tab" id="heading${j}1" data-toggle="collapse" data-parent="#accordion1" href="#collapse${j}1" aria-expanded="false" aria-controls="collapse${j}">
                          <h4 class="panel-title">#<span id="homeLineup${j}"></span>&nbsp<span id="homePosition${j}"></span>&nbsp<span id="homePlayerH${j}"></span></h4>
                        </a>
                        <div id="collapse${j}1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${j}1">
                          <div class="panel-body">
                            <table class="table table-bordered">
                              <thead>
                                <tr>
                                  <th class="homeinning">1</th>
                                  <th>1</th>
                                  <th>2</th>
                                  <th>3</th>
                                  <th>4</th>
                                  <th>5</th>
                                  <th>6</th>
                                  <th>7</th>
                                  <th>8</th>
                                  <th>9</th>
                                  <th>10</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <th scope="row" name="awayPlayP"></th>
                                  <c:forEach var="i" begin="1" end="10" step="1">
                                  	<td name="awaypitcherR"><a href="#" class="contents"><img src="${recordicon}" width=20px height=20px class="img-responsive" alt=""/></a></td>
                                  </c:forEach> 
                                </tr>
                                <tr>
                                  <th scope="row">구종</th>
                                  <c:forEach var="i" begin="1" end="10" step="1">
                                  	<td name="p_arsenal"><a href="#" class="arsenal"><img src="${ball}" width=20px height=20px class="img-responsive" alt=""/></a></td>
                                  </c:forEach> 
                                </tr>
                                <tr>
                                  <th scope="row">구속</th>
                                  <c:forEach var="i" begin="1" end="10" step="1">
                                  	<td><input type="text" name="" value="" style="width:30px; height:24px; border:none"></td>
                                  </c:forEach> 
                                <tr>
                                  <th scope="row" name="homePlayerH${j}"></th>
                                  <c:forEach var="i" begin="1" end="10" step="1">
                                  	<td name="homehitterR"><a href="#" class="contents"><img src="${recordicon}" width=20px height=20px class="img-responsive" alt=""/></a></td>
                                  </c:forEach> 
                                </tr>                                                               
                              </tbody>
                            </table>
                            <button type="button" class="btn btn-dark">commit</button>
                          </div>
                        </div>
                      </div>
                      </c:forEach>
                    </div>
                    <!-- end of accordion -->
                  </div>
                </div>
              </div>

            </div>
            <div class="clearfix"></div>
            

                    <!-- end pop-over -->

                  </div>
                </div>
              </div>
              
          </div>
      </div>
      
      
<!-- 구종선택 Modal -->
<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" style="display:none;">Open Modal</button>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Select Arsenal</h4>
        </div>
        <div class="modal-body">
          <p>구종을 선택해주세요.</p>
          	<div class="radio" id="arsenalList">
   
    		</div>			
  			<button type="button" class="btn btn-default" data-dismiss="modal" style="display: none;">Close</button>
  			
        </div>
      </div>
    </div>
  </div>
  
<!-- 내용선택 Modal -->
<button type="button" class="btn btn-info btn-sm1" data-toggle="modal" data-target="#myModalR" style="display:none;">Open Modal</button>
  <div class="modal fade" id="myModalR" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Select Contents</h4>
        </div>
        <div class="modal-body">
          <p>내용을 선택해주세요.</p>
          	<div class="radio" id="contentsList">
   
    		</div>
  			<button type="button" class="btn btn-default" data-dismiss="modal" style="display: none;">Close</button>  			   			   			   			
        </div>
      </div>
    </div>
  </div>
 
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

    <!-- jQuery -->
    <script src="/resources/admin/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/resources/admin/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/resources/admin/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/resources/admin/vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="/resources/admin/vendors/moment/min/moment.min.js"></script>
    <script src="/resources/admin/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-datetimepicker -->    
    <script src="/resources/admin/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
    <!-- Ion.RangeSlider -->
    <script src="/resources/admin/vendors/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
    <!-- Bootstrap Colorpicker -->
    <script src="/resources/admin/vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
    <!-- jquery.inputmask -->
    <script src="/resources/admin/vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
    <!-- jQuery Knob -->
    <script src="/resources/admin/vendors/jquery-knob/dist/jquery.knob.min.js"></script>
    <!-- Cropper -->
    <script src="/resources/admin/vendors/cropper/dist/cropper.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="/resources/admin/build/js/custom.min.js"></script>           


<script id="appendtableAway" type="text/x-handlebars-template">
    <div class="panel" id="at_batAway">
    <a class="panel-heading collapsed" role="tab" id="heading{{awayN}}" data-toggle="collapse" data-parent="#accordion" href="#collapse{{awayN}}" aria-expanded="false" aria-controls="collapse{{awayN}}">
      <h4 class="panel-title">#<span id="awayLineup{{awayN}}"></span>&nbsp<span id="awayPosition{{awayN}}"></span>&nbsp<span id="awayPlayerH{{awayN}}"></span></h4>
    </a>
    <div id="collapse{{awayN}}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading{{awayN}}">
    <form name="awayForm" id="awayForm{{awayN}}">  
	<div class="panel-body">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th class="awayinning">1</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7</th>
              <th>8</th>
              <th>9</th>
              <th>10</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row" name="homePlayP"></th>
              <c:forEach var="i" begin="1" end="10" step="1">
              	<td><a href="#" class="contents"><img src="${recordicon}" width=20px height=20px class="img-responsive" alt=""/></a></td>
              </c:forEach>    
            </tr>
            <tr>
              <th scope="row">구종</th>
              <c:forEach var="i" begin="1" end="10" step="1">
              	<td><a href="#" class="arsenal"><img src="${ball}" width=20px height=20px class="img-responsive" alt=""/></a></td>
              </c:forEach>    
            </tr>
            <tr>
              <th scope="row">구속</th>
              <c:forEach var="i" begin="1" end="10" step="1">
              	<td><input type="text" name="ballSpeed" value="" style="width:30px; height:24px; border:none"></td>
              </c:forEach>    
            <tr>
              <th scope="row" name="awayPlayerH{{awayN}}"></th>
              <c:forEach var="i" begin="1" end="10" step="1">
              	<td><a href="#" class="contents"><img src="${recordicon}" width=20px height=20px class="img-responsive" alt=""/></a></td>
              </c:forEach>    
            </tr>                                                            
          </tbody>
        </table>
		<label>타점&nbsp</label><input type="text" name="rbi" value="" style="width:30px; height:24px;">
        <button type="button" class="btn btn-dark" name="btn_awaySubmit" value="{{awayN}}">Submit</button>
      </div>
	  </form>
    </div>
  </div>
</script>

<script id="appendtableHome" type="text/x-handlebars-template">
    <div class="panel">
    	<a class="panel-heading collapsed" role="tab" id="heading{{homeN}}1" data-toggle="collapse" data-parent="#accordion1" href="#collapse{{homeN}}1" aria-expanded="false" aria-controls="collapse{{homeN}}">
    		<h4 class="panel-title">#<span id="homeLineup{{homeN}}"></span>&nbsp<span id="homePosition{{homeN}}"></span>&nbsp<span id="homePlayerH{{homeN}}"></span></h4>
		</a>
    	<div id="collapse{{homeN}}1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading{{homeN}}1">
    		<div class="panel-body">
				<table class="table table-bordered">
    				<thead>
    					<tr>
							<th class="homeinning">1</th>
							<th>1</th>
							<th>2</th>
							<th>3</th>
							<th>4</th>
							<th>5</th>
							<th>6</th>
							<th>7</th>
							<th>8</th>
							<th>9</th>
							<th>10</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" name="awayPlayP"></th>
							<c:forEach var="i" begin="1" end="10" step="1">
								<td><a href="#" class="contents"><img src="${recordicon}" width=20px height=20px class="img-responsive" alt=""/></a></td>
							</c:forEach> 
						</tr>
						<tr>
							<th scope="row">구종</th>
							<c:forEach var="i" begin="1" end="10" step="1">
								<td><a href="#" class="arsenal"><img src="${ball}" width=20px height=20px class="img-responsive" alt=""/></a></td>
							</c:forEach> 
						</tr>
						<tr>
							<th scope="row">구속</th>
							<c:forEach var="i" begin="1" end="10" step="1">
								<td><input type="text" name="" value="" style="width:30px; height:24px; border:none"></td>
							</c:forEach> 
						<tr>
							<th scope="row" name="homePlayerH{{homeN}}"></th>
							<c:forEach var="i" begin="1" end="10" step="1">
								<td><a href="#" class="contents"><img src="${recordicon}" width=20px height=20px class="img-responsive" alt=""/></a></td>
							</c:forEach> 
						</tr>                                                               
						</tbody>
					</table>
					<button type="button" class="btn btn-dark">commit</button>
				</div>
			</div>
		</div>

</script>

