
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h1>
<fmt:message key="medias.fileschannel.editing">
    <fmt:param value="${fileChannelAdd.name}" />
</fmt:message>
</h1>

<form method="post">
<table>
    <tr>
        <td align="right"><fmt:message key="medias.fileschannel.add.server" /></td>
        <spring:bind path="fileChannelAdd.server">
            <td><select name="server">
                <option value="null"><fmt:message key="medias.fileschannel.server.none" /></option>
                <c:forEach items="${fileChannelAdd.servers}"
                    var="serverOption">
                    <c:choose>
                    <c:when test="${serverOption.id==fileChannelAdd.server}">
                        <option selected="selected" value="<c:out value="${serverOption.id}" />">
                            <c:out value="${serverOption.name}" />
                        </option>
                    </c:when>
                    <c:otherwise>
                        <option value="<c:out value="${serverOption.id}" />">
                            <c:out value="${serverOption.name}" />
                        </option>
                    </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select></td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>

    <tr>
        <td align="right"><fmt:message key="medias.fileschannel.add.fileslist" /></td>
        <spring:bind path="fileChannelAdd.files">
            <td><textarea rows="10" name="files"><c:out
                value="${status.value}" /></textarea></td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>
<spring:hasBindErrors name="filesChannelsAdd">
    <b><fmt:message key="medias.fileschannel.add.error.fix" /></b>
</spring:hasBindErrors> <br />
<input type="submit" value="<fmt:message key="satellites.edit.run" />">
</form>

<div class="help">
<table><tr><td style="width: 30px">
<img src="<c:url value="/img/help.png" />" alt="Help" />
</td><td>
<fmt:message key="medias.fileschannel.files.help" />
</td></tr></table>
</div>