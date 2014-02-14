<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h1>
    <fmt:message key="medias.removing">
        <fmt:param value="${channel.name}" />
    </fmt:message>
</h1>

<form method="post">

<fmt:message key="medias.remove.text">
    <fmt:param value="${channel.name}" />
</fmt:message>

<spring:hasBindErrors name="mediaRemove">
    <b><fmt:message key="medias.remove.error.fix" /></b>
</spring:hasBindErrors> <br />

<input type="submit" value="<fmt:message key="medias.remove.run" />">

</form>
