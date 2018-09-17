<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/top.jsp" %>
<script>
	
	function tbl_hitter1Visible() {
		document.getElementById('tbl_hitter2').style.display='none';
		document.getElementById('tbl_hitter1').style.display='inline';	
	}
	
	function tbl_hitter2Visible() {
		document.getElementById('tbl_hitter1').style.display='none';	
		document.getElementById('tbl_hitter2').style.display='inline';	
	}
	
</script>
<div class="services">
	<div class="container">
		<h2 class="w3ls_head"><span>Hitting </span>Records</h2>
	<div class="page-header">
			</div>
			<span style="text-align:left;"><a href="#" onclick="tbl_hitter1Visible()">타자기록</a></span> |
			<span style="text-align:left;"><a href="#" onclick="tbl_hitter2Visible()">상세기록</a></span>			
			<div class="bs-docs-example" >
			<div id="tbl_hitter1">
				<table class="table table-bordered" >
					<thead>
						<tr>
							<th style="text-align:center;">#</th>
							<th style="text-align:center;">선수명</th>
							<th style="text-align:center;">팀명</th>
							<th style="text-align:center;">경기</th>
							<th style="text-align:center;">타석</th>
							<th style="text-align:center;">타수</th>
							<th style="text-align:center;">안타</th>
							<th style="text-align:center;">득점</th>
							<th style="text-align:center;">타점</th>
							<th style="text-align:center;">BABIP</th>
							<th style="text-align:center;">타율</th>
							<th style="text-align:center;">출루율</th>
							<th style="text-align:center;">장타율</th>
							<th style="text-align:center;">OPS</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>양의지</td>
							<td>두산</td>
							<td>83</td>
							<td>322</td>
							<td>282</td>
							<td>108</td>
							<td>56</td>
							<td>56</td>
							<td>0.373</td>
							<td>0.383</td>
							<td>0.450</td>
							<td>0.645</td>
							<td>1.095</td>																					
						</tr>
						<tr>
							<td>1</td>
							<td>양의지</td>
							<td>두산</td>
							<td>83</td>
							<td>322</td>
							<td>282</td>
							<td>108</td>
							<td>56</td>
							<td>56</td>
							<td>0.373</td>
							<td>0.383</td>
							<td>0.450</td>
							<td>0.645</td>
							<td>1.095</td>
						</tr>
						<tr>
							<td>1</td>
							<td>양의지</td>
							<td>두산</td>
							<td>83</td>
							<td>322</td>
							<td>282</td>
							<td>108</td>
							<td>56</td>
							<td>56</td>
							<td>0.373</td>
							<td>0.383</td>
							<td>0.450</td>
							<td>0.645</td>
							<td>1.095</td>
						</tr>
						<tr>
							<td>1</td>
							<td>양의지</td>
							<td>두산</td>
							<td>83</td>
							<td>322</td>
							<td>282</td>
							<td>108</td>
							<td>56</td>
							<td>56</td>
							<td>0.373</td>
							<td>0.383</td>
							<td>0.450</td>
							<td>0.645</td>
							<td>1.095</td>	
						</tr>
					</tbody>
				</table>
			</div>
			</div>
			
			<div class="bs-docs-example">
			<div  id="tbl_hitter2" style="display: none;">
				<table class="table table-bordered"  >
					<thead>
						<tr>
							<th style="text-align:center;">#</th>
							<th style="text-align:center;">선수명</th>
							<th style="text-align:center;">팀명</th>
							<th style="text-align:center;">1루타</th>
							<th style="text-align:center;">2루타</th>
							<th style="text-align:center;">3루타</th>
							<th style="text-align:center;">홈런</th>
							<th style="text-align:center;">볼넷</th>
							<th style="text-align:center;">고4</th>
							<th style="text-align:center;">HBP</th>
							<th style="text-align:center;">삼진</th>
							<th style="text-align:center;">희플</th>
							<th style="text-align:center;">희타</th>
							<th style="text-align:center;">병살</th>
							<th style="text-align:center;">도루</th>
							<th style="text-align:center;">도실</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>양의지</td>
							<td>두산</td>
							<td>69</td>
							<td>21</td>
							<td>1</td>
							<td>17</td>
							<td>29</td>
							<td>5</td>
							<td>8</td>
							<td>24</td>
							<td>3</td>
							<td>3</td>
							<td>11</td>
							<td>3</td>
							<td>0</td>																
						</tr>
						<tr>
							<td>1</td>
							<td>양의지</td>
							<td>두산</td>
							<td>69</td>
							<td>21</td>
							<td>1</td>
							<td>17</td>
							<td>29</td>
							<td>5</td>
							<td>8</td>
							<td>24</td>
							<td>3</td>
							<td>3</td>
							<td>11</td>
							<td>3</td>
							<td>0</td>			
						</tr>
						<tr>
							<td>1</td>
							<td>양의지</td>
							<td>두산</td>
							<td>69</td>
							<td>21</td>
							<td>1</td>
							<td>17</td>
							<td>29</td>
							<td>5</td>
							<td>8</td>
							<td>24</td>
							<td>3</td>
							<td>3</td>
							<td>11</td>
							<td>3</td>
							<td>0</td>			
						</tr>
						<tr>
							<td>1</td>
							<td>양의지</td>
							<td>두산</td>
							<td>69</td>
							<td>21</td>
							<td>1</td>
							<td>17</td>
							<td>29</td>
							<td>5</td>
							<td>8</td>
							<td>24</td>
							<td>3</td>
							<td>3</td>
							<td>11</td>
							<td>3</td>
							<td>0</td>		
						</tr>
					</tbody>
				</table>
			</div>			
			</div>
	</div>
</div>
<%@ include file="include/footer.jsp" %>