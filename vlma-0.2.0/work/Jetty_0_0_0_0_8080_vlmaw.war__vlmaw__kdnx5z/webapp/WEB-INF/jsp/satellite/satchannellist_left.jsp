
<%@ include file="/WEB-INF/jsp/satellite/satellite_left.jsp" %>

<ul>
    <li><font color="#0000F0">Cha�ne normale</font></li>
    <li><font color="#808080">Cha�ne crypt�e</font></li>
    <li><font color="#900000">Cha�ne radio</font></li>
</ul>

<ul>
    <c:forEach items="${channels}" var="channel">
        <c:if test="${channel.program != null}">
            <li><a href="#${channel.id}"><c:out value="${channel.name}" /></a></li>
        </c:if>
    </c:forEach>
</ul>
