<%@ include file="/WEB-INF/jsp/include.jsp" %>
<table>

    <tr>
        <th>N</th>
        <th><fmt:message key="orders.list.date" /></th>
        <th><fmt:message key="orders.list.server" /></th>
        <th><fmt:message key="orders.list.command" />/<fmt:message key="orders.list.response" /></th>
    </tr>

    <c:forEach items="${commands}" var="command" varStatus="status">

	<tr class="even">
        <td><c:out value="${status.index + 1}" /></td>
		<td style="text-align: center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${command.date}"/></td>
		<td><c:out value="${command.server.name}" /></td>
		<td><c:out value="${command.command}" /></td>
	</tr>
	<tr class="odd">
		<td colspan="3"></td>
		<td><c:out value="${command.response}" /></td>
	</tr>

    </c:forEach>

</table>