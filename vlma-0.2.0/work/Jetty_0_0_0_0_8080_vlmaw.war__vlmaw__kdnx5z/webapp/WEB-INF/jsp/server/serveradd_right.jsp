
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h1><fmt:message key="servers.adding" /></h1>

<form method="post">
<table>
    <tr>
        <td align="right"><fmt:message key="servers.add.name" /></td>
        <spring:bind path="serverAdd.name">
            <td><input type="text" name="name"
                value="<c:out value="${status.value}"/>"></td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td align="right"><fmt:message key="servers.add.address" /></td>
        <spring:bind path="serverAdd.address">
            <td><input type="text" name="address"
                value="<c:out value="${status.value}"/>"></td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>
<spring:hasBindErrors name="serversAdd">
    <b><fmt:message key="servers.add.error.fix" /></b>
</spring:hasBindErrors>
<br />
<input type="submit" value="<fmt:message key="servers.add.run" />">
</form>
