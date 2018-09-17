<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<script>

// btn_satrtInfo를 클릭하여 저장된 일정을 append하는 함수
function btn_satrtInfo(){
	
	alert($("#date_startInfo").val());	
	var date = new Date($('#date_startInfo').val());
	$("#playTeamAway").css("display", "");
	$("#playTeamHome").css("display", "");
	$.ajax({
		url : '/admin8/select_startInfo',
		type : 'get',
		data : {'date': date},
		success : function(data) {
			items = data;
			thAway = $('#playTeamAway');
			thHome = $('#playTeamHome');
			for(var i = 0; i < items.length; i++){
				thAway.append("<td id='away"+(i+1)+"'><input type='hidden' name='team_CD' value='"+items[i].awayTeam_CD+"'>"+items[i].away+"</td>");
				thHome.append("<td id='home"+(i+1)+"'><input type='hidden' name='team_CD' value='"+items[i].homeTeam_CD+"'>"+items[i].home+"</td>");
			}
		}		
	});
	
}

function btn_registration(num){
	
	alert($('#away'+num).text()+" VS "+$('#home'+num).text());
	$('#awayTeam').text($('#away'+ num).text());
	$('#homeTeam').text($('#home'+ num).text());
	
	/* 투수 셀렉트 */
	getnameAway(1)
	getnameHome(1)
}

// select option 선택으로 DB에 있는 선수 이름 가져오기
function getnameAway(param, number){
		
	var target = $("select[name='awayPlayerH']");
	var target1 = $("select[name='awayPlayerP']");
	
	// $target.empty();
	if(param == ""){
		target.append("<option value=''>선택</option>");
		target1.append("<option value=''>선택</option>");
		return;
	}
		
	$.ajax({
		type : "post",
		url : "/admin8/playerName",
		async : false,
		data : {
			'defenseP' : param,
			'tname' : $('#awayTeam').text(),				
		},
		dataType : "json",
		success : function(data){
			if(param == 1){				
				$('#awayPlayerP').empty();
				$('#awayPlayerP').append("<option value=''>"+"선택"+"</option>");
				$(data).each(function(i){
					$('#awayPlayerP').append("<option value='"+data[i].player_CD+"'>"+data[i].pname+"</option>");
				});
			} else {
				$('#awayPlayerH' + number).empty();
				$('#awayPlayerH' + number).append("<option value=''>"+"선택"+"</option>");
				$(data).each(function(i){
					$('#awayPlayerH' + number).append("<option value='"+data[i].player_CD+"'>"+data[i].pname+"</option>");
				});
			}
		}, error : function(xhr){
			console.log(xhr.responseText);
			alert("다시 시도해주세요");
			return;
			}
	});
}

function btn_lineupAway(){
			
	// alert(document.getElementsByName("defenseP_H").length);
	// alert(document.getElementsByName("defenseP_H")[0].value);
	
	var lineupDefenseP_H = document.getElementsByName("awayDefenseP_H");
	var lineupDefensetList = [];
	for(var i = 0; i < lineupDefenseP_H.length; i++){		
		lineupDefensetList.push(lineupDefenseP_H[i].value);
		// alert(lineupDefensetList)
		for(var j = 0; j < i; j++){
			if(lineupDefensetList[i]==lineupDefensetList[j]){
				alert("중복된 포지션이 있습니다. 다시 선택해주세요!");
				return;
			}
		}
	}

	var lineupPlayerH = document.getElementsByName("awayPlayerH");
	var lineupPlayerList = [];
	for(var i = 0; i < lineupPlayerH.length; i++){		
		lineupPlayerList.push(lineupPlayerH[i].value);
	    // alert(lineupPlayerList)
		for(var j = 0; j < i; j++){
			if(lineupPlayerList[i]==lineupPlayerList[j]){
				alert("중복된 선수가 있습니다. 다시 선택해주세요!");
				return;
			}
		}	    
	}
	
	var lineup = $("th[name='awayLineup']").text();
	var lineupList = [];
	for(var i = 0; i < lineup.length; i++){
		lineupList.push(lineup[i]);
		// alert(lineupList)
	}
	
	$.ajax({
		url : '/admin8/insert_playP',
		type : 'get',
		async : false,   
		data : {
			'date' : $("#date_startInfo").val(),
			'category_CD' : 1,
			'tname' : $('#awayTeam').text(),
			'player_CD' : $("select[name='awayPlayerP']").val(),
			'defenseP_CD' : $("input[name='awayDefenseP_P']").val()
		},
		
		success : alert('등록되었습니다.') 
	});	
	
	$.ajax({
		url : '/admin8/insert_playH',
		type : 'post',
		async : false,
		traditional : true,
		data : {
			'date' : $("#date_startInfo").val(),
			'category_CD' : 1,
			'tname' : $('#awayTeam').text(),
			'lineup' : lineupList,
			'player_CD' : lineupPlayerList,
			'defenseP_CD' : lineupDefensetList			
		},
		success : alert("HOME팀을 등록해주세요.")
	});

}

function getnameHome(param, number){
	
	var target = $("select[name='homePlayerH']");
	var target1 = $("select[name='homePlayerP']");
		
	// $target.empty();
	if(param == ""){
		target.append("<option value=''>선택</option>");
		target1.append("<option value=''>선택</option>");
		return;
	}
	$.ajax({
		type : "post",
		url : "/admin8/playerName",
		async : false,
		data : {
			'defenseP' : param,
			'tname' : $('#homeTeam').text(),				
		},
		dataType : "json",
		success : function(data){
			if(param == 1){				
				$('#homePlayerP').empty();
				$('#homePlayerP').append("<option value=''>"+"선택"+"</option>");
				$(data).each(function(i){
					$('#homePlayerP').append("<option value='"+data[i].player_CD+"'>"+data[i].pname+"</option>");
				});
			} else {
				$('#homePlayerH' + number).empty();
				$('#homePlayerH' + number).append("<option value=''>"+"선택"+"</option>");
				$(data).each(function(i){
					$('#homePlayerH' + number).append("<option value='"+data[i].player_CD+"'>"+data[i].pname+"</option>");
				});
			}
		}, error : function(xhr){
			console.log(xhr.responseText);
			alert("다시 시도해주세요");
			return;
			}
	});
}

function btn_lineupHome(){
	
	// alert(document.getElementsByName("defenseP_H").length);
	// alert(document.getElementsByName("defenseP_H")[0].value);
	
	var lineupDefenseP_H = document.getElementsByName("homeDefenseP_H");
	var lineupDefensetList = [];
	for(var i = 0; i < lineupDefenseP_H.length; i++){		
		lineupDefensetList.push(lineupDefenseP_H[i].value);
		// alert(lineupDefensetList)
		for(var j = 0; j < i; j++){
			if(lineupDefensetList[i]==lineupDefensetList[j]){
				alert("중복된 포지션이 있습니다. 다시 선택해주세요!");
				return;
			}
		}		
	}

	var lineupPlayerH = document.getElementsByName("homePlayerH");
	var lineupPlayerList = [];
	for(var i = 0; i < lineupPlayerH.length; i++){		
		lineupPlayerList.push(lineupPlayerH[i].value);
	    // alert(lineupPlayerList)
		for(var j = 0; j < i; j++){
			if(lineupPlayerList[i]==lineupPlayerList[j]){
				alert("중복된 선수가 있습니다. 다시 선택해주세요!");
				return;
			}
		}	    
	}
	
	var lineup = $("th[name='homeLineup']").text();
	var lineupList = [];
	for(var i = 0; i < lineup.length; i++){
		lineupList.push(lineup[i]);
		// alert(lineupList)
	}

	$.ajax({
		url : '/admin8/insert_playP',
		type : 'get',
		async : false,
		data : {
			'date' : $("#date_startInfo").val(),
			'category_CD' : 1,
			'tname' : $('#awayTeam').text(),
			'player_CD' : $("select[name='homePlayerP']").val(),
			'defenseP_CD' : $("input[name='homeDefenseP_P']").val()
		},
		
		success : alert('등록되었습니다.') 
	});		
		
	$.ajax({
		url : '/admin8/insert_playH',
		type : 'post',
		async : false,
		traditional : true,
		data : {
			'date' : $("#date_startInfo").val(),
			'category_CD' : 1,
			'tname' : $('#awayTeam').text(),
			'lineup' : lineupList,
			'player_CD' : lineupPlayerList,
			'defenseP_CD' : lineupDefensetList			
		},
		success : location.href="/admin8/starting_info"
	});

}	
 
</script>

<%@ include file="../include/header.jspf" %>
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>선발 라인업 등록</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>


              <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel" style="width:1300px; height:300px;">
                  <div class="x_title" style="width:1200px; height:200px;">
                  </br>                 
                    <table class="table table-bordered">
                      <thead>                      
                        <tr>
                          <th colspan="6" align="center">DATE <input type = "date" id="date_startInfo"/>
                          <input type="button" id="btn_satrtInfo" onclick="btn_satrtInfo()" value="확인"/>
                          </th>
                        </tr>
                      </thead>
                      <tbody id="playTeam">
                        <tr>
                          <th scope="row"></th>
                          <td><button type="button" class="btn btn-success btn-xs" onclick="btn_registration(1)">등록하기</button></td>
                          <td><button type="button" class="btn btn-success btn-xs" onclick="btn_registration(2)">등록하기</button></td>
                          <td><button type="button" class="btn btn-success btn-xs" onclick="btn_registration(3)">등록하기</button></td>
                          <td><button type="button" class="btn btn-success btn-xs" onclick="btn_registration(4)">등록하기</button></td>
                          <td><button type="button" class="btn btn-success btn-xs" onclick="btn_registration(5)">등록하기</button></td>
                        </tr>
                        <tr id="playTeamAway" style="display:none;">
                      		<th scope="row" >AWAY</th>
                      	</tr>
                      	<tr id="playTeamHome" style="display:none;">
                      		<th scope="row" >HOME</th>
                      	</tr>
                      </tbody>
                      
                    </table>

                  </div>
                </div>
              </div>

              <div class="clearfix"></div>
              
              <div class="row">
              <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>AWAY <small id="awayTeam"></small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>포지션</th>
                          <th>이름</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">선발</th>
                          <td><input type="hidden" id="awayDefenseP_P" name="awayDefenseP_P" value="1"><span>P</span></td>
                          <td><select class="form-control" id="awayPlayerP" name="awayPlayerP"></select></td>
                        </tr>
                        <tr>
                          <th scope="row" name="awayLineup">1</th>
                          <td>
                             <select class="form-control" id="awayDefenseP_H1" name="awayDefenseP_H" onchange="getnameAway(this.value, 1)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="awayPlayerH1" name="awayPlayerH">
                          </select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="awayLineup">2</th>
                          <td>
                             <select class="form-control" id="awayDefenseP_H2" name="awayDefenseP_H" onchange="getnameAway(this.value, 2)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="awayPlayerH2" name="awayPlayerH">
                          </select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="awayLineup">3</th>
                          <td>
                             <select class="form-control" id="awayDefenseP_H3" name="awayDefenseP_H" onchange="getnameAway(this.value, 3)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="awayPlayerH3" name="awayPlayerH"></select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="awayLineup">4</th>
                          <td>
                             <select class="form-control" id="awayDefenseP_H4" name="awayDefenseP_H" onchange="getnameAway(this.value, 4)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="awayPlayerH4" name="awayPlayerH"></select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="awayLineup">5</th>
                          <td>
                             <select class="form-control" id="awayDefenseP_H5" name="awayDefenseP_H" onchange="getnameAway(this.value, 5)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="awayPlayerH5" name="awayPlayerH"></select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="awayLineup">6</th>
                          <td>
                             <select class="form-control" id="awayDefenseP_H6" name="awayDefenseP_H" onchange="getnameAway(this.value, 6)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="awayPlayerH6" name="awayPlayerH"></select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="awayLineup">7</th>
                          <td>
                             <select class="form-control" id="awayDefenseP_H7" name="awayDefenseP_H" onchange="getnameAway(this.value, 7)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="awayPlayerH7" name="awayPlayerH"></select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="awayLineup">8</th>
                          <td>
                             <select class="form-control" id="awayDefenseP_H8" name="awayDefenseP_H" onchange="getnameAway(this.value, 8)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="awayPlayerH8" name="awayPlayerH"></select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="awayLineup">9</th>
                          <td>
                             <select class="form-control" id="awayDefenseP_H9" name="awayDefenseP_H" onchange="getnameAway(this.value, 9)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="awayPlayerH9" name="awayPlayerH"></select>
                          </td>
                        </tr>                                                                                                                                                                     
                      </tbody>
                    </table>
                    <input type="button" class="btn btn-success btn-sm" onclick="btn_lineupAway()" value="COMMIT"></input>

                  </div>
                </div>
              </div>
              
              <div class="row">
              <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>HOME <small id="homeTeam"></small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>포지션</th>
                          <th>이름</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">선발</th>
                          <td><input type="hidden" id="homeDefenseP_P" name="homeDefenseP_P" value="1"><span>P</span></td>
                          <td><select class="form-control" id="homePlayerP" name="homePlayerP"></select></td>
                        </tr>
                        <tr>
                          <th scope="row" name="homeLineup">1</th>
                          <td>
                             <select class="form-control" id="homeDefenseP_H1" name="homeDefenseP_H" onchange="getnameHome(this.value, 1)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="homePlayerH1" name="homePlayerH">
                          </select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="homeLineup">2</th>
                          <td>
                             <select class="form-control" id="homeDefenseP_H2" name="homeDefenseP_H" onchange="getnameHome(this.value, 2)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="homePlayerH2" name="homePlayerH">
                          </select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="homeLineup">3</th>
                          <td>
                             <select class="form-control" id="homeDefenseP_H3" name="homeDefenseP_H" onchange="getnameHome(this.value, 3)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="homePlayerH3" name="homePlayerH"></select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="homeLineup">4</th>
                          <td>
                             <select class="form-control" id="homeDefenseP_H4" name="homeDefenseP_H" onchange="getnameHome(this.value, 4)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="homePlayerH4" name="homePlayerH"></select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="homeLineup">5</th>
                          <td>
                             <select class="form-control" id="homeDefenseP_H5" name="homeDefenseP_H" onchange="getnameHome(this.value, 5)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="homePlayerH5" name="homePlayerH"></select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="homeLineup">6</th>
                          <td>
                             <select class="form-control" id="homeDefenseP_H6" name="homeDefenseP_H" onchange="getnameHome(this.value, 6)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="homePlayerH6" name="homePlayerH"></select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="homeLineup">7</th>
                          <td>
                             <select class="form-control" id="homeDefenseP_H7" name="homeDefenseP_H" onchange="getnameHome(this.value, 7)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="homePlayerH7" name="homePlayerH"></select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="homeLineup">8</th>
                          <td>
                             <select class="form-control" id="homeDefenseP_H8" name="homeDefenseP_H" onchange="getnameHome(this.value, 8)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="homePlayerH8" name="homePlayerH"></select>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" name="homeLineup">9</th>
                          <td>
                             <select class="form-control" id="homeDefenseP_H9" name="homeDefenseP_H" onchange="getnameHome(this.value, 9)">
	                            <option value=''>선택</option>
	                            <option value='2'>C</option>
	                            <option value='3'>1B</option>
	                            <option value='4'>2B</option>
	                            <option value='5'>3B</option>
	                            <option value='6'>SS</option>
	                            <option value='7'>LF</option>
	                            <option value='8'>CF</option>
	                            <option value='9'>RF</option>
	                            <option value='10'>DH</option>
                    		</select>           
                          </td>
                          <td>
                          <select class="form-control" id="homePlayerH9" name="homePlayerH"></select>
                          </td>
                        </tr>                                                                                                                                                                     
                      </tbody>
                    </table>
                    <input type="button" class="btn btn-success btn-sm" onclick="btn_lineupHome()" value="COMMIT"></input>
                  </div>
                </div>
              </div>
              
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

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
