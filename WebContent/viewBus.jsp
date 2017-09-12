<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="modal.Bus ,java.util.List,java.util.Iterator"%>
<%@include file="searchBus.jsp" %>
<%if(name!=null)
{       
 Object obj=request.getAttribute("list");
 @SuppressWarnings("unchecked")
 List<Bus> list=(List<Bus>)obj;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="images/logo.png">
<link rel="stylesheet" href="css/table.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/button.css">
<title>Insert title here</title>
</head>
<body>
<br>
  <table class="tbl">
  
    <tr>
       <th>BusID</th>
       <th>Name</th>
       <th>Type</th>
       <th>From</th>
       <th>Departure</th>
       <th>To</th>
       <th>Arrival</th>
       <th>Seats</th>
       <th>Description</th>       
    </tr>
    <%Iterator<Bus> itr=list.iterator();
    while(itr.hasNext()){
    	Bus b=itr.next();
    	%>
    <tr>
      <td><%=b.getId() %></td>
      <td><%=b.getName() %></td>
      <td><%=b.getType() %></td>
      <td><%=b.getStart() %></td>
      <td><%=b.getDeparture() %></td>
      <td><%=b.getDest() %></td>
      <td><%=b.getArrival() %></td>
      <td><%=b.getNoSeats() %></td>
      <td><%=b.getDescription() %></td>
      <td><form method="post" action="GetEditParam">
           <input type="hidden" name="busId" value=<%=b.getId()%>>
           <button class="btn shadowBtn" type="submit">Edit</button>
            </form>
       </td>
    </tr>
  <%} %>
</table>

</body>
</html>
<%}%>