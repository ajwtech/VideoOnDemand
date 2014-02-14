<%@ include file="/WEB-INF/jsp/include.jsp" %>

<h1>
    <fmt:message key="servers.adapter.adding">
        <fmt:param value="${server.name}" />
    </fmt:message>
</h1>

<script type="text/javascript">
function toggleGetSatellite() {
    var getType = document.getElementById("getTypeSelect");
    var getSatellite = document.getElementById("getSatelliteTr");
    if (getType.options[getType.selectedIndex].text != "DVB-S") {
        getSatellite.style.visibility = "hidden";
    } else {
        getSatellite.style.visibility = "visible";
    }
}
</script>

<form method="post">
<table>
    <tr>
        <td align="right"><fmt:message key="servers.adapter.add.name" /></td>
        <spring:bind path="serverAdapterAdd.name">
            <td><input type="text" name="name"
                value="<c:out value="${status.value}"/>"></td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td align="right"><fmt:message key="servers.adapter.add.type" /></td>
        <spring:bind path="serverAdapterAdd.type">
            <td>
                <select name="type" id="getTypeSelect" onchange="toggleGetSatellite()">
                    <option>DVB-S</option>
                    <option>DVB-T</option>
                </select>
            </td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr id="getSatelliteTr">
        <td align="right"><fmt:message key="servers.adapter.add.satellite" /></td>
        <spring:bind path="serverAdapterAdd.satellite">
            <td>
                <select name="satellite">
                    <c:forEach items="${satellites}" var="satellite">
                        <option value="<c:out value="${satellite.id}" />"><c:out value="${satellite.name}" /></option>
                    </c:forEach>
                </select>
            </td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>
<spring:hasBindErrors name="serverAdapterAdd">
    <b><fmt:message key="servers.adapter.add.error.fix" /></b>
</spring:hasBindErrors>
<br />
<input type="submit" value="<fmt:message key="servers.adapter.add.run" />">
</form>

<script type="text/javascript">
toggleGetSatellite();
</script>

<div class="help">
<table><tr><td style="width: 30px">
<img src="<c:url value="/img/help.png" />" alt="Help" />
</td><td>
<fmt:message key="servers.adapter.help" />
</td></tr></table>
</div>
