
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h1>
<fmt:message key="medias.streamchannel.editing">
    <fmt:param value="${streamChannelAdd.name}" />
</fmt:message>
</h1>

<form method="post">
<table>
    <tr>
        <td align="right"><fmt:message key="medias.streamchannel.add.streamURL" /></td>
        <spring:bind path="streamChannelAdd.streamURL">
            <td><input type="text" name="streamURL"
                value="<c:out value="${status.value}"/>"></td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>
<spring:hasBindErrors name="streamChannelAdd">
    <b><fmt:message key="medias.streamchannel.add.error.fix" /></b>
</spring:hasBindErrors> <br />
<input type="submit" value="<fmt:message key="satellites.edit.run" />">
</form>
