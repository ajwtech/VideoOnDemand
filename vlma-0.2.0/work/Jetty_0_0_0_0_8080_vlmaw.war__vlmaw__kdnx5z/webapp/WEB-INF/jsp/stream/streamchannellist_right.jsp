
<%@ include file="/WEB-INF/jsp/include.jsp" %>

<h1><fmt:message key="streams.list" /></h1>

<c:choose>
<c:when test="${empty streamChannels}">
    <p><fmt:message key="medias.streamchannel.empty" /></p>
</c:when>
<c:otherwise>

<table width="100%">
    <tr>
        <th><fmt:message key="medias.list.name" /></th>
        <th><fmt:message key="medias.list.streamURL" /></th>
        <th><fmt:message key="medias.list.status" /></th>
        <th><fmt:message key="medias.list.action" /></th>
    </tr>

    <c:forEach items="${streamChannels}" var="streamChannel">
    <tr>
        <td>
            <strong>
                <a name="<c:out value="${streamChannel.id}" />">
                    <c:out value="${streamChannel.name}" />
                </a>
            </strong>
        </td>
        <td>
            <c:out value="${streamChannel.streamURL}" />
        </td>
        <%-- Build the URL to remove the channel from the list --%>
        <c:url value="mediaremove.htm" var="mediaRemoveUrl">
            <c:param name="id" value="${streamChannel.id}" />
        </c:url>
        <%-- Build the URL to delete the channel --%>
        <c:url value="streamchanneledit.htm" var="streamChannelEditUrl">
            <c:param name="Id" value="${streamChannel.id}" />
        </c:url>
        <c:choose>
            <c:when test="${streamChannel.program == null}">
                <td><fmt:message key="medias.list.status.non-programmed" /></td>
                <c:url value="mediaprogramadd.htm" var="programAddUrl">
                <c:param name="media" value="${streamChannel.id}" />
                </c:url>
                <td>
                    <a href="${programAddUrl}"><img src="<c:url value="/img/play.png" />" title="<fmt:message key="medias.list.action.run" />" /></a>
                    <a href="${streamChannelEditUrl}"><img src="<c:url value="/img/edit.png" />" title="<fmt:message key="medias.list.action.editchannel" />" /></a>
                    <a href="${mediaRemoveUrl}"><img src="<c:url value="/img/delete.png" />" title="<fmt:message key="medias.list.action.removechannel" />" /></a>
                </td>
            </c:when>
            <c:otherwise>
                <td>
                <c:choose>
                    <c:when test="${streamChannel.program.player == null}">
                        <fmt:message key="medias.list.status.programmed-nonrunning">
                            <fmt:param value="${streamChannel.program.priority}" />
                        </fmt:message>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${streamChannel.program.broadcastState}">
                                <fmt:message key="medias.list.status.programmed-running">
                                    <fmt:param value="${streamChannel.program.priority}" />
                                    <fmt:param value="${streamChannel.program.player.hostName}" />
                                </fmt:message>
                            </c:when>
                            <c:otherwise>
                                <fmt:message key="medias.list.status.programmed-assigned">
                                    <fmt:param value="${streamChannel.program.priority}" />
                                    <fmt:param value="${streamChannel.program.player.hostName}" />
                                </fmt:message>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
                </td>
                <c:url value="mediaprogramremove.htm" var="programRemoveUrl">
                    <c:param name="media" value="${streamChannel.id}" />
                </c:url>
                <td><a href="${programRemoveUrl}"><img src="<c:url value="/img/stop.png" />" title="<fmt:message key="medias.list.action.stop" />" /></a></td>
            </c:otherwise>
        </c:choose>
    </tr>
    </c:forEach>
</table>

</c:otherwise>
</c:choose>
