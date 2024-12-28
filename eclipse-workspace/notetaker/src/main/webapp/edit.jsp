<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="navbar">
		<%@include file="navbar.jsp"%>
	</div>
	<div class="container">
		<div class="cont">
			<h1>Please Edit your note details</h1>
			<%
			Session s = FactoryProvider.getFactory().openSession();
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			
			Note note = (Note) s.get(Note.class, noteId);
			
			%>
			<form class="forms" action="EditServlet" method="post">
				<input value="<%=note.getId() %>" name="note_id" type="hidden">
				<label for="title">Note Title</label> <input type="text"
					name="title" id="title" placeholder="Enter Title" required
					value="<%=note.getTitle()%>"> <label for="content">Note
					Content</label>
				<textarea name="content" id="content" rows="10"
					placeholder="Enter your content here" required><%=note.getContent()%> </textarea>
				<div class="bt">
					<button style="background-color: green" type="submit">Save
						your note</button>
				</div>

			</form>
			<% s.close(); %>
		</div>
	</div>


</body>
</html>