<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	class B {
		int age;
	}

	String a = (String) application.getAttribute("msg");
	
	application.setAttribute("msg", new B());
	
	B b = (B) application.getAttribute("msg");
	
	
	
%>