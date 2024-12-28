<!DOCTYPE html>

<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Notes Taker : All Notes</title>

<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="navbar">
		<%@include file="navbar.jsp"%>
	</div>

	<div class="notes">



		<% 
			Session s = FactoryProvider.getFactory().openSession();
			Query q =  s.createQuery("From Note");
			List<Note> list = q.list(); 
			for(Note note : list){
			%>
		<div class="notes-card">
			<h2><%= note.getTitle() %></h2>
			<p class="notes-content"><%= note.getContent() %></p>
			<p class="date">
				<b style="color: blue"><%=note.getAddedDate()%></b>
			</p>

			<div class="button1">
				<a style="background-color: red;"
					href="DeleteServlet?note_id=<%= note.getId() %>">Delete</a> <a
					style="background-color: rgb(0, 166, 255);"
					href="edit.jsp?note_id=<%= note.getId() %>">Edit</a>

			</div>
		</div>


		<%	
			}			
			
			s.close();
			%>
	</div>



</body>
</html>