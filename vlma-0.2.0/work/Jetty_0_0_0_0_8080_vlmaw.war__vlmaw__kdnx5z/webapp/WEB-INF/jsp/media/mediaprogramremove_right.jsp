
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h1>
    <fmt:message key="medias.program.removing">
        <fmt:param value="${media.name}" />
    </fmt:message>
</h1>

<form method="post">

<fmt:message key="medias.program.remove.text">
    <fmt:param value="${media.name}" />
</fmt:message>

<spring:hasBindErrors name="mediaProgramRemove">
    <b><fmt:message key="medias.program.remove.error.fix" /></b>
</spring:hasBindErrors> <br />

<input type="submit" value="<fmt:message key="medias.program.remove.run" />">

</form>
