<%@page import="user.st_UserDAO"%>
<%@ page import="reservation.ReservationDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>create reservation</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	st_UserDAO user = new st_UserDAO();
	out.println(request.getParameter("title"));
	ReservationDTO reservDTO = new ReservationDTO(request.getParameter("reservation_name"),
			request.getParameter("reservation_tel"), request.getParameter("reservation_number"),
			request.getParameter("title"), request.getParameter("reservation_date"));
	int result = user.insert_reservation(reservDTO);
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예약 실패')");
		script.println("history.back()");
		script.println("</script>");
	} else {//정상구동(result==1)
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예약 성공!!!')");
		script.println("location.href='../St_Join/main.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	%>


</body>
</html>