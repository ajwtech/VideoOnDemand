<%@ include file="/WEB-INF/jsp/include.jsp" %>

<h1><fmt:message key="satellites.list" /></h1>

<c:choose>
<c:when test="${empty satellites}">
    <p><fmt:message key="satellites.empty" /></p>
</c:when>
<c:otherwise>

<table width="80%">
    <c:forEach items="${satellites}" var="satellite">
    <tr>
        <td width="30%"><b><c:out value="${satellite.name}" /></b></td>
        <c:url value="satelliteedit.htm" var="editUrl">
            <c:param name="satellite" value="${satellite.id}" />
        </c:url>
        <c:url value="satelliteremove.htm" var="removeUrl">
            <c:param name="satellite" value="${satellite.id}" />
        </c:url>
        <td>
            <a href="${editUrl}"><img src="<c:url value="/img/edit.png" />" title="<fmt:message key="satellites.edit" />" /></a>
            <a href="${removeUrl}"><img src="<c:url value="/img/delete.png" />" title="<fmt:message key="satellites.remove" />" /></a>
        </td>
    </tr>
    </c:forEach>
</table>

</c:otherwise>
</c:choose>