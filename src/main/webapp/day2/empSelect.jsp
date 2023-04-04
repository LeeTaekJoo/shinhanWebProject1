<%@page import="java.util.List"%>
<%@page import="aproject.vo.EmpVO"%>
<%@page import="aproject.model.EmpService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
EmpService eService = new EmpService();
List<EmpVO> emplist = eService.selectAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
/* #container{
       
      width: 80%;
      margin: 0 auto;
  }
  h1{
    border : 1px solid gray;
    text-align: center;
    width:100%;
    
  }
  thead tr, thead td{
	 background-color: lightblue;
	 padding: 10px;
  }
  table, tr, td{
     border: 1px solid gray;
     border-collapse: collapse;
     padding: 0.5em;
  }
  .aa:hover, 	::selection {
    background-color: orange;
  } */
.orange {
	background-color: orange;
}

.white {
	background-color: white;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(function() {
		$("thead tr th").click(function(e) {
			//내가 클릭한 th가 몇번째인가?
			var trNum = $(this).closest("th").prevAll().length;
			console.log(trNum);
			var a = $("tbody tr").each(function(index, item) {
				var col = $(item).find("td:nth-child(" + (trNum + 1) + ")");
				console.dir(col);
				//되돌리기(기존선택을 clear)
				$(item).find("td").css("background-color", "white");
				//신규선택의 색깔 바꾸기
				$(col).css("background-color", "orange");

			});

		});
	});
</script>
<script>
	$(function() {

		$("#btn1").click(function() {
			$("tr:nth-child(2n)").css("background-color", "lightgray");
			$("tr:nth-child(2n+1)").css("background-color", "white");
		});
		//body > div > table > tbody > tr:nth-child(1) > td:nth-child(2)
		$("#btn2").click(function() {
			$("tr > td:nth-child(2):contains('S')").css("color", "red");
		});
		$("#btn3").click(function() {
			$("tr td:contains('S')").css("color", "red");

		});
		$("#btn4").on("click", function() {
			var selector = "tr > td:nth-child(5)";

			$(selector).each(function(index, item) {
				var sal = parseInt($(item).html()) + 1;
				if (sal >= 1000) {
					$(item).css("background-color", "lightgreen")
				}
			});	
		});
		
		$("select").change(function() {
			var jobid = $(this).val();
			//init();
			$("tr td").css("color", "black");
			$("tr td:contains('" + jobid + "')").css("color", "red");
		});
		
		var str="";
		var arr = ["IT_PROG", "AD_VP", "AD_PRES", "ST_MAN", "ST_CLERK"];
		$.each(arr, function(index, item){
			//str += `<option>${item}</option>`;
			str += "<option>" + item + "</option>";
			
		});
		$("#jobs").html(str); // html() : jQuery함수, innerHTML: 자바스크립트 함수
		
	});
</script>
</head>
<body>
	<div class="container mt-3">
		<h1>직원목록</h1>

		<button onclick="location.href='emp_insert.html'" type="button"
			class="btn btn-success">직원등록</button>
		<a type="button" class="btn btn-success" href="emp_insert.html">직원등록</a>
		<hr>
		<button id="btn1">짝수row선택</button>
		<button id="btn2">이름 S로 시작하는 직원</button>
		<button id="btn3">S문자가 포함</button>
		<button id="btn4">급여1000이상</button>
		<button id="btn5">직원번호가 홀수인 직원</button>
		
		<select id="jobs">
		
		
		</select>
		
		<select>
			<option value="IT_PROG">IT_PROG</option>
			<option>AD_VP</option>
			<option>PU_CLERK</option>
			<option>ST_MAN</option>
		</select>
		<hr>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>직원번호</th>
					<th>이름</th>
					<th>성</th>
					<th>이메일</th>
					<th>급여</th>
					<th>입사일</th>
					<th>전화번호</th>
					<th>직책</th>
					<th>메니져</th>
					<th>커미션</th>
					<th>부서</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (EmpVO emp : emplist) {
				%>
				<tr>
					<td><%=emp.getEmployee_id()%></td>
					<td><%=emp.getFirst_name()%></td>
					<td><%=emp.getLast_name()%></td>
					<td><%=emp.getEmail()%></td>
					<td><%=emp.getSalary()%></td>
					<td><%=emp.getHire_date()%></td>
					<td><%=emp.getPhone_number()%></td>
					<td><%=emp.getJob_id()%></td>
					<td><%=emp.getManager_id()%></td>
					<td><%=emp.getCommission_pct()%></td>
					<td><%=emp.getDepartment_id()%></td>
				</tr>
				<%
				}
				%>
			</tbody>

		</table>
	</div>
</body>
</html>