<%@ include file="/WEB-INF/jsp/include.jsp" %>

<h1><fmt:message key="welcome.page" /></h1>

<div class="right_right">
<h2><fmt:message key="welcome.servers" /></h2>

    <c:set var="serverCount" value="0" />

    <c:forEach items="${servers}" var="server">
        <c:if test="${!server.up}">
            <c:url value="serverview.htm" var="serverUrl">
                <c:param name="server" value="${server.id}" />
            </c:url>
            <p><a href="${serverUrl}">
            <fmt:message key="welcome.servers.unreachable">
                <fmt:param value="${server.name}" />
            </fmt:message>
            </a></p>
            <c:set var="serverCount" value="${serverCount + 1}" />
        </c:if>
    </c:forEach>
    <c:choose>
        <c:when test="${serverCount == 0}">
            <fmt:message key="welcome.servers.ok" />
        </c:when>
        <c:otherwise>
            <fmt:message key="welcome.servers.warning" />
        </c:otherwise>
    </c:choose>

</div>

<h2><fmt:message key="welcome.program" /></h2>

<c:if test="${empty dttChannels && empty satChannels && empty streamChannels && empty fileChannels}">
<p><fmt:message key="medias.empty" /></p>
</c:if>

<c:if test="${not empty dttChannels}">
<h3><fmt:message key="medias.listDTT" /></h3>

<table>
    <c:forEach items="${dttChannels}" var="channelDTT">
    <tr>
        <td>
            <strong>
                <a name="<c:out value="${channelDTT.id}" />">
                    <c:out value="${channelDTT.name}" />
                </a>
            </strong>
        </td>
        <c:choose><c:when test="${channelDTT.program == null}">
            <td><fmt:message key="medias.list.status.non-programmed" /></td></c:when>
            <c:otherwise><td>
                <c:choose>
                    <c:when test="${channelDTT.program.player == null}">
                        <fmt:message key="welcome.program.nonrunning">
                            <fmt:param value="${channelDTT.program.priority}" />
                        </fmt:message>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${channelDTT.program.broadcastState}">
                                <fmt:message key="welcome.program.running">
                                    <fmt:param value="${channelDTT.program.priority}" />
                                    <fmt:param value="${channelDTT.program.player.hostName}" />
                                </fmt:message>
                            </c:when>
                            <c:otherwise>
                                <fmt:message key="welcome.program.assigned">
                                    <fmt:param value="${channelDTT.program.priority}" />
                                    <fmt:param value="${channelDTT.program.player.hostName}" />
                                </fmt:message>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose></td>
            </c:otherwise>
        </c:choose>
    </tr>
    </c:forEach>
</table>

</c:if>

<c:if test="${not empty satChannels}">
<h3><fmt:message key="medias.fulllistSat" /></h3>

<table>
    <c:forEach items="${satChannels}" var="channelSat">
    <tr>
        <td>
            <strong>
                <a name="<c:out value="${channelSat.id}" />">
                    <font color="<c:choose><c:when test="${channelSat.isCrypted}">#808080</c:when><c:when test="${channelSat.isRadio}">#900000</c:when><c:otherwise>#0000F0</c:otherwise></c:choose>">
                        <c:out value="${channelSat.name}" />
                    </font>
                </a>
            </strong>
        </td>
        <c:choose><c:when test="${channelSat.program == null}">
            <td><fmt:message key="medias.list.status.non-programmed" /></td></c:when>
            <c:otherwise><td>
                <c:choose>
                    <c:when test="${channelSat.program.player == null}">
                        <fmt:message key="welcome.program.nonrunning">
                            <fmt:param value="${channelSat.program.priority}" />
                        </fmt:message>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${channelSat.program.broadcastState}">
                                <fmt:message key="welcome.program.running">
                                    <fmt:param value="${channelSat.program.priority}" />
                                    <fmt:param value="${channelSat.program.player.hostName}" />
                                </fmt:message>
                            </c:when>
                            <c:otherwise>
                                <fmt:message key="welcome.program.assigned">
                                    <fmt:param value="${channelSat.program.priority}" />
                                    <fmt:param value="${channelSat.program.player.hostName}" />
                                </fmt:message>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose></td>
            </c:otherwise>
        </c:choose>
    </tr>
    </c:forEach>
</table>

</c:if>

<c:if test="${not empty fileChannels}">
<h3><fmt:message key="files.list" /></h3>

<table>
    <c:forEach items="${fileChannels}" var="fileChannel">
    <tr>
        <td>
            <strong>
                <a name="<c:out value="${fileChannel.id}" />">
                    <c:out value="${fileChannel.name}" />
                </a>
            </strong>
        </td>
        <c:choose><c:when test="${fileChannel.program == null}">
            <td><fmt:message key="medias.list.status.non-programmed" /></td></c:when>
            <c:otherwise><td>
                <c:choose>
                    <c:when test="${fileChannel.program.player == null}">
                        <fmt:message key="welcome.program.nonrunning">
                            <fmt:param value="${fileChannel.program.priority}" />
                        </fmt:message>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${fileChannel.program.broadcastState}">
                                <fmt:message key="welcome.program.running">
                                    <fmt:param value="${fileChannel.program.priority}" />
                                    <fmt:param value="${fileChannel.program.player.hostName}" />
                                </fmt:message>
                            </c:when>
                            <c:otherwise>
                                <fmt:message key="welcome.program.assigned">
                                    <fmt:param value="${fileChannel.program.priority}" />
                                    <fmt:param value="${fileChannel.program.player.hostName}" />
                                </fmt:message>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose></td>
            </c:otherwise>
        </c:choose>
    </tr>
    </c:forEach>
</table>
</c:if>

<c:if test="${not empty  streamChannels}">
<h3><fmt:message key="streams.list" /></h3>

<table>
    <c:forEach items="${streamChannels}" var="streamChannel">
    <tr>
        <td>
            <strong>
                <a name="<c:out value="${streamChannel.id}" />">
                    <c:out value="${streamChannel.name}" />
                </a>
            </strong>
        </td>
        <c:choose><c:when test="${streamChannel.program == null}">
            <td><fmt:message key="medias.list.status.non-programmed" /></td></c:when>
            <c:otherwise><td>
                <c:choose>
                    <c:when test="${streamChannel.program.player == null}">
                        <fmt:message key="welcome.program.nonrunning">
                            <fmt:param value="${streamChannel.program.priority}" />
                        </fmt:message>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${streamChannel.program.broadcastState}">
                                <fmt:message key="welcome.program.running">
                                    <fmt:param value="${streamChannel.program.priority}" />
                                    <fmt:param value="${streamChannel.program.player.hostName}" />
                                </fmt:message>
                            </c:when>
                            <c:otherwise>
                                <fmt:message key="welcome.program.assigned">
                                    <fmt:param value="${streamChannel.program.priority}" />
                                    <fmt:param value="${streamChannel.program.player.hostName}" />
                                </fmt:message>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose></td>
            </c:otherwise>
        </c:choose>
    </tr>
    </c:forEach>
</table>

</c:if>