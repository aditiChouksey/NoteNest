<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Notes Taker : Add Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="navbar">
		<%@include file="navbar.jsp"%>
	</div>
	<div class="container">
		<div class="cont">
			<h1>Please fill your note details</h1>
			<form class="forms" action="SaveNoteServlet" method="post">
				<label for="note-title">Note Title</label> <input type="text"
					name="note-title" id="note-title" placeholder="Enter Title"
					required> <label for="note-content">Note Content</label>
				<textarea name="note-content" id="note-content" rows="10"
					placeholder="Enter your content here" required></textarea>
				<div class="bt">
					<button type="submit">Add</button>
				</div>

			</form>
		</div>
	</div>

</body>
</html>