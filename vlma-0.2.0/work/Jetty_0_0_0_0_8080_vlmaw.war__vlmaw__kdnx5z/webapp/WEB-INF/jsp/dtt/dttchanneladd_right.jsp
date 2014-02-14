
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h1><fmt:message key="medias.DTTchannel.add" /></h1>

<form method="post">
<table>
    <tr>
        <td align="right"><fmt:message key="medias.DTTchannel.add.name" /></td>
        <spring:bind path="dTTChannelAdd.name">
            <td><input type="text" name="name" value="<c:out value="${status.value}"/>"></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td align="right"><fmt:message key="medias.DTTchannel.add.frequency" /></td>
        <spring:bind path="dTTChannelAdd.frequency">
            <td><input type="text" name="frequency" value="<c:out value="${status.value}"/>"></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td align="right"><fmt:message key="medias.DTTchannel.add.sid" /></td>
        <spring:bind path="dTTChannelAdd.sid">
            <td><input type="text" name="sid" value="<c:out value="${status.value}"/>"></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>

<spring:hasBindErrors name="dTTChannelAdd">
    <b><fmt:message key="satellites.add.error.fix" /></b>
</spring:hasBindErrors> <br />
<input type="submit" value="<fmt:message key="satellites.add.run" />">
</form>
