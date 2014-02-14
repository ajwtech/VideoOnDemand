
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h1><fmt:message key="medias.sat.updating" /></h1>

<form method="post">
<table>
    <tr>
        <td align="right"><fmt:message key="medias.sat.update.url" /></td>
        <spring:bind path="satChannelUpdate.url">
            <td><input type="text" name="url"
                value="<c:out value="${status.value}"/>"></td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
</table>
<spring:hasBindErrors name="satChannelUpdate">
    <b><fmt:message key="medias.sat.update.error.fix" /></b>
</spring:hasBindErrors> <br />
<input type="submit" value="<fmt:message key="medias.sat.update.run" />"></form>

<div class="help">
<table><tr><td style="width: 30px">
<img src="<c:url value="/img/help.png" />" alt="Help" />
</td><td>
<fmt:message key="medias.sat.update.help" />
</td></tr></table>
</div>