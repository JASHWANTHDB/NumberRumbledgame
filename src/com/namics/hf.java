//package com.namics;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// * Servlet implementation class hf
// */
//@WebServlet("/hf")
//public class hf extends HttpServlet {
//
//    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        res.setContentType("text/html");
//        PrintWriter out = res.getWriter();
//        String t = "jfvbasjfsvsgjf";
//        
//        out.println("<html>");
//        out.println("<head><title>" + t + "</title></head>");
//        out.println("<body>");
//        out.println("<h1>" + t + "</h1>");
//        out.println("<ul>");
//        out.println("<li><b>First:</b> " + req.getParameter("first") + "</li>");
//        out.println("<li><b>Last:</b> " + req.getParameter("last") + "</li>");
//        out.println("</ul>");
//        out.println("</body>");
//        out.println("</html>");
//    }
//}