<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/top.jsp" %>
<script>
	
	function tbl_pitcher1Visible() {
		document.getElementById('tbl_pitcher2').style.display='none';
		document.getElementById('tbl_pitcher1').style.display='inline';
	}
	
	function tbl_pitcher2Visible(){
		document.getElementById('tbl_pitcher1').style.display='none';
		document.getElementById('tbl_pitcher2').style.display='inline';
	}

</script>

<div class="services">
	<div class="container">
		<h2 class="w3ls_head"><span>Pitching </span>Records</h2>
	<div class="page-header">
			</div>
			<span style="text-align:left;"><a href="#" onclick="tbl_pitcher1Visible()">투수기록</a></span> |
			<span style="text-align:right;"><a href="#" onclick="tbl_pitcher2Visible()">상세기록</a></span>
			<div class="bs-docs-example" >
			<div id="tbl_pitcher1">
				<table class="table table-bordered" >
					<thead>
						<tr>
							<th style="text-align:center;">#</th>
							<th style="text-align:center;">선수명</th>
							<th style="text-align:center;">팀명</th>
							<th style="text-align:center;">승</th>
							<th style="text-align:center;">패</th>
							<th style="text-align:center;">세</th>
							<th style="text-align:center;">홀드</th>
							<th style="text-align:center;">블론</th>
							<th style="text-align:center;">경기</th>
							<th style="text-align:center;">이닝</th>
							<th style="text-align:center;">BABIP</th>
							<th style="text-align:center;">ERA</th>
							<th style="text-align:center;">WAR</th>
							<th style="text-align:center;">WHIP</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>소사</td>
							<td>LG</td>
							<td>8</td>
							<td>5</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>19</td>
							<td>132.1</td>
							<td>0.304</td>
							<td>2.58</td>
							<td>5.52</td>
							<td>1.07</td>														
						</tr>
						<tr>
							<td>1</td>
							<td>소사</td>
							<td>LG</td>
							<td>8</td>
							<td>5</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>19</td>
							<td>132.1</td>
							<td>0.304</td>
							<td>2.58</td>
							<td>5.52</td>
							<td>1.07</td>		
						</tr>
						<tr>
							<td>1</td>
							<td>소사</td>
							<td>LG</td>
							<td>8</td>
							<td>5</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>19</td>
							<td>132.1</td>
							<td>0.304</td>
							<td>2.58</td>
							<td>5.52</td>
							<td>1.07</td>		
						</tr>
						<tr>
							<td>1</td>
							<td>소사</td>
							<td>LG</td>
							<td>8</td>
							<td>5</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>19</td>
							<td>132.1</td>
							<td>0.304</td>
							<td>2.58</td>
							<td>5.52</td>
							<td>1.07</td>		
						</tr>
					</tbody>
				</table>
			</div>
			</div>
			
			<div class="bs-docs-example">
			<div  id="tbl_pitcher2" style="display: none;">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th style="text-align:center;">#</th>
							<th style="text-align:center;">선수명</th>
							<th style="text-align:center;">팀명</th>
							<th style="text-align:center;">안타</th>
							<th style="text-align:center;">2루타</th>
							<th style="text-align:center;">3루타</th>
							<th style="text-align:center;">홈런</th>
							<th style="text-align:center;">실점</th>
							<th style="text-align:center;">자책</th>
							<th style="text-align:center;">삼진</th>
							<th style="text-align:center;">볼넷</th>
							<th style="text-align:center;">고4</th>
							<th style="text-align:center;">HBP</th>
							<th style="text-align:center;">폭투</th>
							<th style="text-align:center;">보크</th>
							<th style="text-align:center;">PK</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>소사</td>
							<td>LG</td>
							<td>122</td>
							<td>31</td>
							<td>0</td>
							<td>9</td>
							<td>47</td>
							<td>38</td>
							<td>131</td>
							<td>20</td>
							<td>1</td>
							<td>4</td>
							<td>5</td>
							<td>0</td>
							<td>0</td>																
						</tr>
						<tr>
							<td>1</td>
							<td>소사</td>
							<td>LG</td>
							<td>122</td>
							<td>31</td>
							<td>0</td>
							<td>9</td>
							<td>47</td>
							<td>38</td>
							<td>131</td>
							<td>20</td>
							<td>1</td>
							<td>4</td>
							<td>5</td>
							<td>0</td>
							<td>0</td>			
						</tr>
						<tr>
							<td>1</td>
							<td>소사</td>
							<td>LG</td>
							<td>122</td>
							<td>31</td>
							<td>0</td>
							<td>9</td>
							<td>47</td>
							<td>38</td>
							<td>131</td>
							<td>20</td>
							<td>1</td>
							<td>4</td>
							<td>5</td>
							<td>0</td>
							<td>0</td>			
						</tr>
						<tr>
							<td>1</td>
							<td>소사</td>
							<td>LG</td>
							<td>122</td>
							<td>31</td>
							<td>0</td>
							<td>9</td>
							<td>47</td>
							<td>38</td>
							<td>131</td>
							<td>20</td>
							<td>1</td>
							<td>4</td>
							<td>5</td>
							<td>0</td>
							<td>0</td>		
						</tr>
					</tbody>
				</table>
			</div>			
			</div>
	</div>
</div>
<%@ include file="include/footer.jsp" %>