
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h1>
    <fmt:message key="servers.adapter.removing">
        <fmt:param value="${adapter.name}" />
        <fmt:param value="${server.name}" />
    </fmt:message>
</h1>

<form method="post">

<fmt:message key="servers.adapter.remove.text">
    <fmt:param value="${adapter.name}" />
    <fmt:param value="${server.name}" />
</fmt:message>

<spring:hasBindErrors name="serversAdapterRemove">
    <b><fmt:message key="servers.adapter.remove.error.fix" /></b>
</spring:hasBindErrors> <br />

<input type="submit" value="<fmt:message key="servers.adapter.remove.run" />">

</form>
