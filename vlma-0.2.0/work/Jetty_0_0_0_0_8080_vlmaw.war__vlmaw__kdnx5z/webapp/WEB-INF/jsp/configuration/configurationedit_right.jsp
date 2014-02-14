<%@ include file="/WEB-INF/jsp/include.jsp" %>

<h1><fmt:message key="configuration.page" /></h1>

<form method="post">

<h2><fmt:message key="configuration.vlc" /></h2>

<h3><fmt:message key="configuration.vlc.telnet" /></h3>

<table class="configuration fullwidth">
    <tr>
        <td><fmt:message key="vlc.telnet.port" /></td>
        <spring:bind path="configurationEdit.vlc_telnet_port">
            <td><input name="vlc_telnet_port" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlc.telnet.password" /></td>
        <spring:bind path="configurationEdit.vlc_telnet_password">
            <td><input name="vlc_telnet_password" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>

<h3><fmt:message key="configuration.vlc.snmp" /></h3>

<table class="configuration fullwidth">
    <tr>
        <td><fmt:message key="vlc.snmp.community" /></td>
        <spring:bind path="configurationEdit.vlc_snmp_community">
            <td><input name="vlc_snmp_community" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlc.snmp.oid.cpu_load" /></td>
        <spring:bind path="configurationEdit.vlc_snmp_oid_cpu_load">
            <td><input name="vlc_snmp_oid_cpu_load" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlc.snmp.oid.vlc_cpu" /></td>
        <spring:bind path="configurationEdit.vlc_snmp_oid_vlc_cpu">
            <td><input name="vlc_snmp_oid_vlc_cpu" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlc.snmp.oid.vlc_mem" /></td>
        <spring:bind path="configurationEdit.vlc_snmp_oid_vlc_mem">
            <td><input name="vlc_snmp_oid_vlc_mem" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlc.snmp.oid.traffic_in" /></td>
        <spring:bind path="configurationEdit.vlc_snmp_oid_traffic_in">
            <td><input name="vlc_snmp_oid_traffic_in" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlc.snmp.oid.traffic_out" /></td>
        <spring:bind path="configurationEdit.vlc_snmp_oid_traffic_out">
            <td><input name="vlc_snmp_oid_traffic_out" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>

<h2><fmt:message key="configuration.vlma.streaming" /></h2>

<h3><fmt:message key="configuration.vlma.streaming.default" /></h3>

<table class="configuration fullwidth">
    <tr>
        <td><fmt:message key="vlma.streaming" /></td>
        <spring:bind path="configurationEdit.vlma_streaming">
            <td>
                <select name="vlma_streaming">
                <c:forEach items="${protocols}" var="protocol">
                    <option <c:if test="${protocol == status.value}">selected="selected"</c:if>>${protocol}</option>
                </c:forEach>
                </select>
            </td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlma.encapsulation" /></td>
        <spring:bind path="configurationEdit.vlma_encapsulation">
            <td>
                <select name="vlma_encapsulation">
                <c:forEach items="${encapsulations}" var="encapsulation">
                    <option <c:if test="${encapsulation == status.value}">selected</c:if>>${encapsulation}</option>
                </c:forEach>
                </select>
            </td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>

<h3><fmt:message key="configuration.vlma.streaming.misc" /></h3>

<table class="configuration fullwidth">
    <tr>
        <td><fmt:message key="vlma.streaming.http.port" /></td>
        <spring:bind path="configurationEdit.vlma_streaming_http_port">
            <td><input name="vlma_streaming_http_port" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlma.streaming.udp.ipbank" /></td>
        <td><fmt:message key="vlma.streaming.udp.ipbank.min" />
        <spring:bind path="configurationEdit.vlma_streaming_udp_ipbank_min">
            <input name="vlma_streaming_udp_ipbank_min" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td></td>
        <td><fmt:message key="vlma.streaming.udp.ipbank.max" />
        <spring:bind path="configurationEdit.vlma_streaming_udp_ipbank_max">
            <input name="vlma_streaming_udp_ipbank_max" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlc.stream.ttl" /></td>
        <spring:bind path="configurationEdit.vlc_stream_ttl">
            <td><input name="vlc_stream_ttl" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlc.stream.dvb-bandwidth" /></td>
        <spring:bind path="configurationEdit.vlc_stream_dvb_bandwidth">
            <td><input name="vlc_stream_dvb_bandwidth" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>

<h2><fmt:message key="configuration.vlma.notification" /></h2>

<h3><fmt:message key="configuration.vlma.notification.mail" /></h3>

<table class="configuration fullwidth">
    <tr>
        <td><fmt:message key="vlma.notification.mail.host" /></td>
        <spring:bind path="configurationEdit.vlma_notification_mail_host">
            <td><input name="vlma_notification_mail_host" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlma.notification.mail.sender" /></td>
        <spring:bind path="configurationEdit.vlma_notification_mail_sender">
            <td><input name="vlma_notification_mail_sender" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlma.notification.mail.recipients" /></td>
        <spring:bind path="configurationEdit.vlma_notification_mail_recipients">
            <td><input name="vlma_notification_mail_recipients" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>

<h3><fmt:message key="configuration.vlma.notification.irc" /></h3>

<table class="configuration fullwidth">
    <tr>
        <td><fmt:message key="vlma.notification.irc.host" /></td>
        <spring:bind path="configurationEdit.vlma_notification_irc_host">
            <td><input name="vlma_notification_irc_host" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlma.notification.irc.port" /></td>
        <spring:bind path="configurationEdit.vlma_notification_irc_port">
            <td><input name="vlma_notification_irc_port" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlma.notification.irc.nick" /></td>
        <spring:bind path="configurationEdit.vlma_notification_irc_nick">
            <td><input name="vlma_notification_irc_nick" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlma.notification.irc.pass" /></td>
        <spring:bind path="configurationEdit.vlma_notification_irc_pass">
            <td><input name="vlma_notification_irc_pass" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlma.notification.irc.chan" /></td>
        <spring:bind path="configurationEdit.vlma_notification_irc_chan">
            <td><input name="vlma_notification_irc_chan" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>

<h3><fmt:message key="configuration.vlma.notification.msn" /></h3>

<table class="configuration fullwidth">
    <tr>
        <td><fmt:message key="vlma.notification.msn.login" /></td>
        <spring:bind path="configurationEdit.vlma_notification_msn_login">
            <td><input name="vlma_notification_msn_login" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlma.notification.msn.pass" /></td>
        <spring:bind path="configurationEdit.vlma_notification_msn_pass">
            <td><input name="vlma_notification_msn_pass" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
    <tr>
        <td><fmt:message key="vlma.notification.msn.recipients" /></td>
        <spring:bind path="configurationEdit.vlma_notification_msn_recipients">
            <td><input name="vlma_notification_msn_recipients" type="text" value="<c:out value="${status.value}"/>" /></td>
            <td><span class="error"><c:out value="${status.errorMessage}" /></span></td>
        </spring:bind>
    </tr>
</table>

<input type="submit" value="<fmt:message key="configuration.save.button" />" />
</form>

<script type="text/javascript">
document.getElementsByClassName = function(clsName){
    var retVal = new Array();
    var elements = document.getElementsByTagName("*");
    for(var i = 0;i < elements.length;i++){
        if(elements[i].className.indexOf(" ") >= 0){
            var classes = elements[i].className.split(" ");
            for(var j = 0;j < classes.length;j++){
                if(classes[j] == clsName)
                    retVal.push(elements[i]);
            }
        }
        else if(elements[i].className == clsName)
            retVal.push(elements[i]);
    }
    return retVal;
}

var tables = document.getElementsByClassName("configuration");
for(var i=0; i<tables.length; i++) {
    var tds = tables[i].getElementsByTagName("td");
    tds[0].style.width="30%";
    tds[1].style.width="50%";
    var inputs = tables[i].getElementsByTagName("input");
    for(var j=0; j<inputs.length; j++) {
        inputs[j].parentNode.style.textAlign = "right";
        inputs[j].style.width = "88%";
    }
    var selects = tables[i].getElementsByTagName("select");
    for(var j=0; j<selects.length; j++) {
        selects[j].parentNode.style.textAlign = "right";
        selects[j].style.width = "88%";
    }
}
</script>