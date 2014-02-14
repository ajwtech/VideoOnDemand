
<%@ include file="/WEB-INF/jsp/include.jsp" %>

<h1><fmt:message key="medias.listDTT" /></h1>

<c:choose>
<c:when test="${empty dttChannels}">
    <p><fmt:message key="medias.DTTchannel.empty" /></p>
</c:when>
<c:otherwise>

<table width="100%">
    <tr>
        <th><fmt:message key="medias.list.frequency" /></th>
        <th><fmt:message key="medias.list.sid" /></th>
        <th><fmt:message key="medias.list.name" /></th>
        <th><fmt:message key="medias.list.status" /></th>
        <th><fmt:message key="medias.list.action" /></th>
    </tr>

    <c:set var="frequency" value="0" />

    <c:forEach items="${dttChannels}" var="dttChannel" varStatus="status">
    <c:choose>
        <c:when test='${(status.index)%2 eq 0}'>
            <c:set var="rowColor" value="even" scope="page"/>
        </c:when>
        <c:otherwise>
            <c:set var="rowColor" value="odd" scope="page"/>
        </c:otherwise>
    </c:choose>
    <tr class="${rowColor}">
        <td><small>
        <c:if test="${frequency != dttChannel.frequency}">
            <c:out value="${dttChannel.frequency}" />
        </c:if>
        </small></td>
        <td><small>
            <c:out value="${dttChannel.sid}" />
        </small></td>
        <c:set var="frequency" value="${dttChannel.frequency}" />
        <td>
            <strong>
                <a name="<c:out value="${dttChannel.id}" />">
                    <c:out value="${dttChannel.name}" />
                </a>
            </strong>
        </td>
        <%-- Build the URL to remove the channel from the list --%>
        <c:url value="mediaremove.htm" var="mediaRemoveUrl">
            <c:param name="id" value="${dttChannel.id}" />
        </c:url>
        <c:choose>
            <c:when test="${dttChannel.program == null}">
                <td><fmt:message key="medias.list.status.non-programmed" /></td>
                <c:url value="mediaprogramadd.htm" var="programAddUrl">
                <c:param name="media" value="${dttChannel.id}" />
                </c:url>
                <td>
                    <a href="${programAddUrl}"><img src="<c:url value="/img/play.png" />" title="<fmt:message key="medias.list.action.run" />" /></a>
                    <a href="${mediaRemoveUrl}"><img src="<c:url value="/img/delete.png" />" title="<fmt:message key="medias.list.action.removechannel" />" /></a>
                </td>
            </c:when>
            <c:otherwise>
                <td>
                <c:choose>
                    <c:when test="${channel.program.player == null}">
                        <fmt:message key="medias.list.status.programmed-nonrunning">
                            <fmt:param value="${dttChannel.program.priority}" />
                        </fmt:message>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${dttChannel.program.broadcastState}">
                                <fmt:message key="medias.list.status.programmed-running">
                                    <fmt:param value="${dttChannel.program.priority}" />
                                    <fmt:param value="${dttChannel.program.player.hostName}" />
                                </fmt:message>
                            </c:when>
                            <c:otherwise>
                                <fmt:message key="medias.list.status.programmed-assigned">
                                    <fmt:param value="${dttChannel.program.priority}" />
                                    <fmt:param value="${dttChannel.program.player.hostName}" />
                                </fmt:message>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
                </td>
                <c:url value="mediaprogramremove.htm" var="programRemoveUrl">
                    <c:param name="media" value="${dttChannel.id}" />
                </c:url>
                <td><a href="${programRemoveUrl}"><img src="<c:url value="/img/stop.png" />" title="<fmt:message key="medias.list.action.stop" />" /></a></td>
            </c:otherwise>
        </c:choose>
    </tr>
    </c:forEach>
</table>

</c:otherwise>
</c:choose>
