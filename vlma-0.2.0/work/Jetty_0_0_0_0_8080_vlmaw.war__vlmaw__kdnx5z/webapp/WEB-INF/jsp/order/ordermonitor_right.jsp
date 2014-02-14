<%@ include file="/WEB-INF/jsp/include.jsp" %>

<h1><fmt:message key="orders.monitor.page" /></h1>

<script type="text/javascript">
function forward() {
    AjaxData.getOrdersCommands(function(data) {
    dwr.util.setValue("commands", data, { escapeHtml:false });
    setTimeout("forward()", 5000);
  });
}
</script>

<div id="commands">
</div>

<script type="text/javascript">
forward();
</script>