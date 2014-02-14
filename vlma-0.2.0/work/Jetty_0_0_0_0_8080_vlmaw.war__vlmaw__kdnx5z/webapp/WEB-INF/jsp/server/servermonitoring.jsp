<?xml version="1.0" encoding="UTF-8" ?>

<%@ include file="/WEB-INF/jsp/include.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="author" content="The VideoLAN Team" />
        <link rel="shortcut icon" type="image/png" href="<c:url value="/img/favicon.png" />" />
        <title>Monitoring</title>
    </head>
<body>

<table>
    <c:forEach items="${servers}" var="server">
    <tr>
        <td>
            <b><c:out value="${server.name}" /></b>
        </td>
        <td>
            <img alt="<fmt:message key="servers.view.monitoring.load-alt" />" src="<c:url value="/" />rrdgraph?server=<c:out value="${server.name}" />&what=cpu_load" />
        </td>
        <td>
            <img alt="<fmt:message key="servers.view.monitoring.traffic-alt" />" src="<c:url value="/" />rrdgraph?server=<c:out value="${server.name}" />&what=traffic_out" />
        </td>
        <td>
            <img alt="<fmt:message key="servers.view.monitoring.resources-alt" />" src="<c:url value="/" />rrdgraph?server=<c:out value="${server.name}" />&what=vlc" />
        </td>
    </tr>
    </c:forEach>
</table>

</body>
</html>