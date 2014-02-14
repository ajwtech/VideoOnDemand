
<%@ include file="/WEB-INF/jsp/include.jsp" %>

<h1><fmt:message key="files.list" /></h1>

<c:choose>
<c:when test="${empty filesChannels}">
    <p><fmt:message key="medias.fileschannel.empty" /></p>
</c:when>
<c:otherwise>

<table width="100%">
    <tr>
        <th><fmt:message key="medias.list.name" /></th>
        <th><fmt:message key="medias.list.server" /></th>
        <th><fmt:message key="medias.list.files" /></th>
        <th><fmt:message key="medias.list.status" /></th>
        <th><fmt:message key="medias.list.action" /></th>
    </tr>

    <c:forEach items="${filesChannels}" var="filesChannel">
    <tr>
        <td>
            <strong>
                <a name="<c:out value="${filesChannel.id}" />">
                    <c:out value="${filesChannel.name}" />
                </a>
            </strong>
        </td>
        <td>
            <c:out value="${filesChannel.server.name}"/>
        </td>
        <td>
            <ul>
            <c:forEach items="${filesChannel.files}" var="file">
                <li><c:out value="${file}"/></li>
            </c:forEach>
            </ul>
        </td>
        <%-- Build the URL to remove the channel from the list --%>
        <c:url value="mediaremove.htm" var="mediaRemoveUrl">
            <c:param name="id" value="${filesChannel.id}" />
        </c:url>
        <%-- Build the URL to delete the channel --%>
        <c:url value="filechanneledit.htm" var="filesChannelEditUrl">
            <c:param name="Id" value="${filesChannel.id}" />
        </c:url>
        <c:choose>
            <c:when test="${filesChannel.program == null}">
                <td><fmt:message key="medias.list.status.non-programmed" /></td>
                <c:url value="mediaprogramadd.htm" var="programAddUrl">
                <c:param name="media" value="${filesChannel.id}" />
                </c:url>
                <td>
                    <a href="${programAddUrl}"><img src="<c:url value="/img/play.png" />" title="<fmt:message key="medias.list.action.run" />" /></a>
                    <a href="${filesChannelEditUrl}"><img src="<c:url value="/img/edit.png" />" title="<fmt:message key="medias.list.action.editchannel" />" /></a>
                    <a href="${mediaRemoveUrl}"><img src="<c:url value="/img/delete.png" />" title="<fmt:message key="medias.list.action.removechannel" />" /></a>
                </td>
            </c:when>
            <c:otherwise>
                <td>
                <c:choose>
                    <c:when test="${filesChannel.program.player == null}">
                        <fmt:message key="medias.list.status.programmed-nonrunning">
                            <fmt:param value="${filesChannel.program.priority}" />
                        </fmt:message>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${filesChannel.program.broadcastState}">
                                <fmt:message key="medias.list.status.programmed-running">
                                    <fmt:param value="${filesChannel.program.priority}" />
                                    <fmt:param value="${filesChannel.program.player.hostName}" />
                                </fmt:message>
                            </c:when>
                            <c:otherwise>
                                <fmt:message key="medias.list.status.programmed-assigned">
                                    <fmt:param value="${filesChannel.program.priority}" />
                                    <fmt:param value="${filesChannel.program.player.hostName}" />
                                </fmt:message>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
                </td>
                <c:url value="mediaprogramremove.htm" var="programRemoveUrl">
                    <c:param name="media" value="${filesChannel.id}" />
                </c:url>
                <td><a href="${programRemoveUrl}"><img src="<c:url value="/img/stop.png" />" title="<fmt:message key="medias.list.action.stop" />" /></a></td>
            </c:otherwise>
        </c:choose>
    </tr>
    </c:forEach>
</table>

</c:otherwise>
</c:choose>
