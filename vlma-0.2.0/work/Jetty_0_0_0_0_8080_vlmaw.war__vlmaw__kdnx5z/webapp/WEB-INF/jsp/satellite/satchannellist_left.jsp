
<%@ include file="/WEB-INF/jsp/satellite/satellite_left.jsp" %>

<ul>
    <li><font color="#0000F0">Chaîne normale</font></li>
    <li><font color="#808080">Chaîne cryptée</font></li>
    <li><font color="#900000">Chaîne radio</font></li>
</ul>

<ul>
    <c:forEach items="${channels}" var="channel">
        <c:if test="${channel.program != null}">
            <li><a href="#${channel.id}"><c:out value="${channel.name}" /></a></li>
        </c:if>
    </c:forEach>
</ul>
