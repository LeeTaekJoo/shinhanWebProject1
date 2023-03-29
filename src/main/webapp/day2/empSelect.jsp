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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
  .orange{
    background-color: orange;
  }
  .white{
    background-color: white;
  }
</style>
<script
  src="https://code.jquery.com/jquery-3.6.4.min.js" ></script>
  <script>
   $(function(){
	   $("thead tr th").click(function(e){
		   var trNum = $(this).closest("th").prevAll().length;
		   //$(this).find(" ~ th").css("background-color", "white");
		   //$(this).css("background-color", "orange");
		   var a = $("tbody tr").each(function(index, item){
			   var col = $(item).find("td:nth-child(" + (trNum+1) + ")");
			   console.log(col);
			   $(item).find("td").css("background-color", "white");
			   $(col).css("background-color", "orange");
			   
		   });
		   
	   });
   });
  </script>
</head>
<body>
<div class="container mt-3">
	<h1>직원목록</h1>
	
	<button 
	onclick="location.href='emp_insert.html'"
	type="button" class="btn btn-success">직원등록</button>
	<a type="button" class="btn btn-success" href="emp_insert.html">직원등록</a>
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
	   <%for(EmpVO emp : emplist){%>
	   <tr>
	     <td><%=emp.getEmployee_id() %></td>
	     <td><%=emp.getFirst_name() %></td>
	     <td><%=emp.getLast_name() %></td>
	     <td><%=emp.getEmail() %></td>
	     <td><%=emp.getSalary() %></td>
	     <td><%=emp.getHire_date() %></td>
	     <td><%=emp.getPhone_number() %></td>
	     <td><%=emp.getJob_id()%></td>
	     <td><%=emp.getManager_id() %></td>
	     <td><%=emp.getCommission_pct() %></td>
	     <td><%=emp.getDepartment_id() %></td>
	   </tr>
	  <%} %>
	</tbody> 
	 
	</table>
</div>	
</body>
</html>