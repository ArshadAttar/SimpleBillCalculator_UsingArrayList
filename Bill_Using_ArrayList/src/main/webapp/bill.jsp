<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="model.DTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<style type="text/css">

.table{
		border: 2px solid black;
	}
body{
   	
   			text-align: center;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            display: flex;
    }
#div1{
    background-color: #ADD8E6;
     	border-radius: 10px;
    width:800px;
    text-align: center;
     padding: 50px;
      border: 2px solid black;
    }
</style>

<title>Bill Page</title>
</head>
<body>
<center><div class="mb-3" id="div1">
<% List<DTO> info=(List<DTO>)request.getAttribute("result"); %>


<center><h2>Sir Your Bill</h2>
<br>
<table class="table" style="width:500px">
  <thead class="table-light">
    <th>Dish Name</th>
    <th>Dish Quantity</th>
    <th>Dish Price</th>
    <th>Amount</th>
  </thead>
  <tbody>
   <tr>
   <%
 	double overallTotal = 0;
		for(DTO dto:info){
			String name=dto.getDishName();
			int qty=dto.getDishQuantity();
			double price=dto.getDishPrice();

			double total=qty*price;
			overallTotal+=total;
%>
      <td><%=name %></td>
      <td><%= qty %></td>
      <td><%= price %></td>
      <td><%= total %></td>
      
   </tr>
   <%} %>
  </tbody>
</table>
<h2>Payble Amount : <%=overallTotal %></h2>
<br>
<a href="index.html"><button class="btn btn-outline-success">Home Page</button></a>
<a href="clearList"><button class="btn btn-outline-danger">Clear History </button></a>
</div>
</center>

</body>
</html>