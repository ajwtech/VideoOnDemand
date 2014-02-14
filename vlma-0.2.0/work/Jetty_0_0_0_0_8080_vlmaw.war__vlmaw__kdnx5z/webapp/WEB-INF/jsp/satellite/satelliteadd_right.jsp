
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h1><fmt:message key="satellites.adding" /></h1>

<form method="post">
<table>
    <tr>
        <td align="right"><fmt:message key="satellites.add.name" /></td>
        <spring:bind path="satelliteAdd.name">
            <td><input type="text" name="name"
                value="<c:out value="${status.value}"/>"></td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td align="right"><fmt:message key="satellites.add.coverage" /></td>
        <spring:bind path="satelliteAdd.coverage">
            <td><textarea rows="10" name="coverage"><c:out
                value="${status.value}" /></textarea></td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>
<spring:hasBindErrors name="satelliteAdd">
    <b><fmt:message key="satellites.add.error.fix" /></b>
</spring:hasBindErrors> <br />
<input type="submit" value="<fmt:message key="satellites.add.run" />">
</form>

<div class="help">
<table><tr><td style="width: 30px">
<img src="<c:url value="/img/help.png" />" alt="Help" />
</td><td>
<fmt:message key="satellites.coverage.help" />
</td></tr></table>
</div>
