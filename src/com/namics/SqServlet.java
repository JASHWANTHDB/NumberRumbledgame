package com.namics;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("")

public class SqServlet extends HttpServlet {
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException {
		
		int k =Integer.parseInt(req.getParameter("k"));
		k=k*k;
		
//		int k = (int) req.getAttribute("k");
		
		PrintWriter out = res.getWriter();
		out.println("<html><body bgcolor='cyan'>");
		out.println(k);
		out.print("</body></html>");
		System.out.println("ihj");
	}
}