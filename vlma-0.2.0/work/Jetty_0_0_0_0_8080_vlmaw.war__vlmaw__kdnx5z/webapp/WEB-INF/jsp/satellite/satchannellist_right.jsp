

<%@ include file="/WEB-INF/jsp/include.jsp" %>

<h1>
    <c:choose>
        <c:when test="${shortList}">
            <fmt:message key="medias.shortlistSat" />
        </c:when>
        <c:otherwise>
            <fmt:message key="medias.fulllistSat" />
        </c:otherwise>
    </c:choose>
</h1>

<c:choose>
<c:when test="${empty satChannels}">
    <p><fmt:message key="medias.sat.empty" /></p>
</c:when>
<c:otherwise>

<table width="100%">
    <tr>
        <th colspan="2"><fmt:message key="medias.list.frequency" /></th>
        <th><fmt:message key="medias.list.name" /></th>
        <th><fmt:message key="medias.list.status" /></th>
        <th><fmt:message key="medias.list.action" /></th>
    </tr>

    <c:set var="frequency" value="0" />

    <c:forEach items="${satChannels}" var="satChannel" varStatus="status">
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
            <c:if test="${frequency != satChannel.frequency}">
                <c:out value="${satChannel.coverage}" />
            </c:if>
        </small></td>
        <td><small>
            <c:if test="${frequency != satChannel.frequency}">
                <c:out value="${satChannel.frequency}" />
            </c:if>
        </small></td>
        <c:set var="frequency" value="${satChannel.frequency}" />
        <td>
            <strong>
                <a name="<c:out value="${satChannel.id}" />">
                    <font color="<c:choose><c:when test="${satChannel.isCrypted}">#808080</c:when><c:when test="${satChannel.isRadio}">#900000</c:when><c:otherwise>#0000F0</c:otherwise></c:choose>">
                        <c:out value="${satChannel.name}" />
                    </font>
                </a>
            </strong>
        </td>
        <c:choose><c:when test="${satChannel.program == null}">
            <td><fmt:message key="medias.list.status.non-programmed" /></td>
            <c:url value="mediaprogramadd.htm" var="programAddUrl">
                <c:param name="media" value="${satChannel.id}" />
            </c:url>
            <td><a href="${programAddUrl}"><img src="<c:url value="/img/play.png" />" title="<fmt:message key="medias.list.action.run" />" /></a></td></c:when>
            <c:otherwise><td>
                <c:choose>
                    <c:when test="${satChannel.program.player == null}">
                        <fmt:message key="medias.list.status.programmed-nonrunning">
                            <fmt:param value="${satChannel.program.priority}" />
                        </fmt:message>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${satChannel.program.broadcastState}">
                                <fmt:message key="medias.list.status.programmed-running">
                                    <fmt:param value="${satChannel.program.priority}" />
                                    <fmt:param value="${satChannel.program.player.hostName}" />
                                </fmt:message>
                            </c:when>
                            <c:otherwise>
                                <fmt:message key="medias.list.status.programmed-assigned">
                                    <fmt:param value="${satChannel.program.priority}" />
                                    <fmt:param value="${satChannel.program.player.hostName}" />
                                </fmt:message>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose></td>
            <c:url value="mediaprogramremove.htm" var="programRemoveUrl">
                <c:param name="media" value="${satChannel.id}" />
            </c:url>
            <td><a href="${programRemoveUrl}"><img src="<c:url value="/img/stop.png" />" title="<fmt:message key="medias.list.action.stop" />" /></a></td>
            </c:otherwise>
        </c:choose>
    </tr>
    </c:forEach>
</table>

</c:otherwise>
</c:choose>
