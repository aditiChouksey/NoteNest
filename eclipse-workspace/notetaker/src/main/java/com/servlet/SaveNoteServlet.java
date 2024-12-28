package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String title = request.getParameter("note-title");
			String content = request.getParameter("note-content");
			
			Note note = new Note(title,content,new Date());
			
//			System.out.println(note.getId() + "  " + note.getTitle() + "   " + note.getContent());
			
			Session session =  FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.persist(note);	
			
			tx.commit();			
			session.close();
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>note is saved successfully</h1>");
			out.println("<h1 style='text-align:center;'><a style='text-decoration: none;' href='show_notes.jsp'>View all notes</a></h1>");
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
