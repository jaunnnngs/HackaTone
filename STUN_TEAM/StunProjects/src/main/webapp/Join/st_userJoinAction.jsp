<%@ page import= "user.st_UserDAO"%>
<%@ page import= "user.st_UserDTO"%>
<%@ page import= "java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	st_UserDTO NewUser = new st_UserDTO();
	if(request.getParameter("userID")!=null)
	{
		NewUser.setUserID(request.getParameter("userID"));
	}
	if(request.getParameter("userPassword")!=null)
	{
		NewUser.setUserPassword(request.getParameter("userPassword"));
	}
	if(request.getParameter("name")!=null)
	{
		NewUser.setName(request.getParameter("name"));
	}
	if(request.getParameter("email")!=null)
	{
		NewUser.setEmail(request.getParameter("email"));
	}
	if(request.getParameter("number")!=null)
	{
		NewUser.setNumber(request.getParameter("number"));
	}
	if(NewUser.getUserID().equals("") || NewUser.getUserPassword().equals("")|| NewUser.getName().equals("")|| NewUser.getEmail().equals("")|| NewUser.getNumber().equals(""))
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 게 있다.')");
		script.println("</script>");
		script.close();
		return;
	}
	
	
	//ID와 비밀번호가 모두 있는 경우
	st_UserDAO userDAO = new st_UserDAO();
	int result = userDAO.join(NewUser.getUserID(),NewUser.getUserPassword(),NewUser.getName(),NewUser.getEmail(),NewUser.getNumber());
	if(result == 1) //정상적으로 구동된 경우
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('잘 됐습니다!!!')");
		script.println("location.href='st_userJoin.jsp'");
		script.println("</script>");
		script.close();
	}

%>
</body>
</html>