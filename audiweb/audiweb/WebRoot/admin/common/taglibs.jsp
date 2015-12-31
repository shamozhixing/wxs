<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.oemp.cms.bean.CmsUser"%>
<%@page import="com.oemp.frame.util.CmsConstants"%>
<%
	String path = request.getContextPath();
	Object sessionObj = request.getSession().getAttribute(
			CmsConstants.ADMIN_USER);
	CmsUser sessionLoginUser = sessionObj == null ? new CmsUser()
			: (CmsUser) sessionObj;
	if (sessionObj == null) {
		//getServletContext().getRequestDispatcher("/admin/login.jsp").forward(request,response);
		response.sendRedirect( path + "/admin/login.jsp");
	}
%>