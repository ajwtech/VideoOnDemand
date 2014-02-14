
<%@ include file="/WEB-INF/jsp/include.jsp" %>

<h1><fmt:message key="servers.list" /></h1>

<c:choose>
<c:when test="${empty servers}">
    <p><fmt:message key="servers.empty" /></p>
</c:when>
<c:otherwise>

<table width="80%">
    <c:forEach items="${servers}" var="server">
    <c:url value="serverview.htm" var="serversViewUrl">
        <c:param name="server" value="${server.id}" />
    </c:url>
    <c:url value="serverremove.htm" var="serversRemoveUrl">
        <c:param name="server" value="${server.id}" />
    </c:url>
    <tr>
        <td width="25%"><b><c:out value="${server.name}" /></b></td>
        <td><c:out value="${server.ip.hostName}" /> (<c:out value="${server.ip.hostAddress}" />)</td>
        <td>
            <c:if test="${!server.up}">
                <span class="error"><fmt:message key="servers.unreachable" /></span>
            </c:if>
        </td>
        <td>
            <a href="${serversViewUrl}"><img src="<c:url value="/img/edit.png" />" title="<fmt:message key="servers.details" />" /></a>
            <a href="${serversRemoveUrl}"><img src="<c:url value="/img/delete.png" />" title="<fmt:message key="servers.remove" />" /></a>
        </td>
    </tr>
    </c:forEach>
</table>

</c:otherwise>
</c:choose>