
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h1>
    <fmt:message key="servers.removing">
        <fmt:param value="${server.name}" />
    </fmt:message>
</h1>

<form method="post">

<fmt:message key="servers.remove.text">
    <fmt:param value="${server.name}" />
</fmt:message>

<spring:hasBindErrors name="serversRemove">
    <b><fmt:message key="servers.remove.error.fix" /></b>
</spring:hasBindErrors> <br />

<input type="submit" value="<fmt:message key="servers.remove.run" />">

</form>
