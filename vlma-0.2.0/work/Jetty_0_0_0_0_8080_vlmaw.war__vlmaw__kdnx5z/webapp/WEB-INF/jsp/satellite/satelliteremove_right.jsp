
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h1>
    <fmt:message key="satellites.removing">
        <fmt:param value="${satellite.name}" />
    </fmt:message>
</h1>

<form method="post">

<fmt:message key="satellites.remove.text">
    <fmt:param value="${satellite.name}" />
</fmt:message>


<spring:hasBindErrors name="satellitesRemove">
    <b><fmt:message key="satellites.remove.error.fix" /></b>
</spring:hasBindErrors> <br />

<input type="submit" value="<fmt:message key="satellites.remove.run" />">

</form>
