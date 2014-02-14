
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h1>
    <fmt:message key="satellites.editing">
        <fmt:param value="${satellite.name}" />
    </fmt:message>
</h1>

<form method="post">
<table>
    <tr>
        <td align="right"><fmt:message key="satellites.edit.coverage" /></td>
        <spring:bind path="satelliteEdit.coverage">
            <td><textarea rows="10" name="coverage"><c:out
                value="${status.value}" /></textarea></td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>
<spring:hasBindErrors name="satelliteEdit">
    <b><fmt:message key="satellites.edit.error.fix" /></b>
</spring:hasBindErrors> <br />
<input type="submit" value="<fmt:message key="satellites.edit.run" />">

</form>

<div class="help">
<table><tr><td style="width: 30px">
<img src="<c:url value="/img/help.png" />" alt="Help" />
</td><td>
<fmt:message key="satellites.coverage.help" />
</td></tr></table>
</div>
