
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h1>
    <fmt:message key="medias.program.adding">
        <fmt:param value="${media.name}" />
    </fmt:message>
</h1>

<form method="post">
<table>
    <tr>
        <td align="right"><fmt:message key="medias.program.add.sap" /></td>
        <spring:bind path="mediaProgramAdd.sap">
            <td><input type="text" name="sap" value="<c:out
                value="${status.value}" />" /></td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td align="right"><fmt:message key="medias.program.add.priority" /></td>
        <spring:bind path="mediaProgramAdd.priority">
            <td><input type="text" name="priority"
                value="<c:out value="${status.value}"/>"></td>
            <td><span class="error"><c:out
                value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td align="right"><fmt:message key="medias.program.add.protocol" /></td>
        <spring:bind path="mediaProgramAdd.protocol">
            <td><select name="protocol">
                <c:forEach items="${mediaProgramAdd.protocols}" var="protocolOption">
                    <option name="${protocolOption}" <c:if test="${mediaProgramAdd.protocol == protocolOption}">selected="true"</c:if>>
                        <c:out value="${protocolOption}" />
                    </option>
                </c:forEach>
            </select></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td align="right"><fmt:message key="medias.program.add.mux" /></td>
        <spring:bind path="mediaProgramAdd.mux">
            <td><select name="mux">
                <c:forEach items="${mediaProgramAdd.muxs}" var="muxOption">
                    <option name="${muxOption}" <c:if test="${mediaProgramAdd.mux == muxOption}">selected="true"</c:if>>
                        <c:out value="${muxOption}" />
                    </option>
                </c:forEach>
            </select></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td align="right"><fmt:message key="medias.program.add.announcements" /></td>
        <td><c:forEach items="${mediaProgramAdd.announcementCheckboxes}" var="announcementOption" varStatus="loopStatus">
            <spring:bind path="mediaProgramAdd.announcementCheckboxes[${loopStatus.index}].checked">
                <input type="hidden" name="_<c:out value="${status.expression}"/>" />
                <input type="checkbox" name="<c:out value="${status.expression}"/>" <c:if test="${announcementOption.checked}">checked="checked"</c:if> />
                <c:out value="${announcementOption.announcement}" />
                ${status.errorCode}
                <br />
            </spring:bind>
        </c:forEach></td>
    </tr>
</table>
<spring:hasBindErrors name="mediaProgramAdd">
    <b><fmt:message key="medias.program.add.error.fix" /></b>
</spring:hasBindErrors> <br />
<input type="submit" value="<fmt:message key="medias.program.add.run" />">
</form>
