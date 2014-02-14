<%@ include file="/WEB-INF/jsp/include.jsp" %>

<h1>
    <fmt:message key="servers.view">
        <fmt:param value="${server.name}" />
    </fmt:message>
</h1>

<ul>
    <li><fmt:message key="servers.view.name" /> <b><c:out value="${server.name}" /></b></li>
    <li><fmt:message key="servers.view.address" /> <b><c:out value="${server.ip}" /></b></li>
    <li><fmt:message key="servers.view.adapters" />
        <table>
        <c:forEach items="${server.adapters}" var="adapter">
            <c:if test="${fn:contains(adapter.type, 'DVB')}">
            <tr><td><b><c:out value="${adapter.name}" /></b>
                <c:choose>
                    <c:when test="${fn:contains(adapter.type, 'DVB-S')}">
                        <fmt:message key="servers.view.adapters.dvbs"><fmt:param value="${adapter.satellite.name}" /></fmt:message>
                    </c:when>
                    <c:when test="${fn:contains(adapter.type, 'DVB-T')}">
                        <fmt:message key="servers.view.adapters.dvbt" />
                    </c:when>
                </c:choose>
                <c:url value="serveradapterremove.htm" var="adapterRemoveUrl">
                    <c:param name="server" value="${server.id}" />
                    <c:param name="adapter" value="${adapter.name}" />
                </c:url></td>
                <td><a href="${adapterRemoveUrl}"><img src="<c:url value="/img/delete.png" />" title="<fmt:message key="servers.view.adapters.remove" />" /></a></td>
            </tr>
            </c:if>
        </c:forEach>
        </table>
        <c:url value="serveradapteradd.htm" var="adapterAddUrl">
            <c:param name="server" value="${server.id}" />
        </c:url>
        <a href="${adapterAddUrl}"><fmt:message key="servers.view.adapters.add" /></a>
    </li>
    <li><fmt:message key="servers.view.monitoring.load" /><br />
        <img alt="<fmt:message key="servers.view.monitoring.load-alt" />" src="<c:url value="/" />rrdgraph?server=<c:out value="${server.name}" />&what=cpu_load" />
    </li>
    <li><fmt:message key="servers.view.monitoring.traffic" /><br />
        <img alt="<fmt:message key="servers.view.monitoring.traffic-alt" />" src="<c:url value="/" />rrdgraph?server=<c:out value="${server.name}" />&what=traffic_out" />
    </li>
    <li><fmt:message key="servers.view.monitoring.resources" /><br />
        <img alt="<fmt:message key="servers.view.monitoring.resources-alt" />" src="<c:url value="/" />rrdgraph?server=<c:out value="${server.name}" />&what=vlc" />
    </li>
</ul>
