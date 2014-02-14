<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="author" content="The VideoLAN Team" />
<meta http-equiv="Content-Language" content="fr" />
<link rel="shortcut icon" type="image/png" href="<c:url value="/img/favicon.png" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css" />" />
<script src="<c:url value="/js/utils.js" />" type="text/javascript"></script>
<script src="<c:url value="/dwr/interface/AjaxData.js" />" type="text/javascript"></script>
<script src="<c:url value="/dwr/engine.js" />" type="text/javascript"></script>
<script src="<c:url value="/dwr/util.js" />" type="text/javascript"></script>
<title><fmt:message><tiles:getAsString name="title" ignore="true"/></fmt:message></title>
</head>
<body onload="spamproof(); return false;">

<div id="content">
<div class="header">
    <div class="lang">
        <a href="?lang=en">English</a> -
        <a href="?lang=fr">Français</a>
    </div>
    <a href="index.jsp">
        <img src="<c:url value="/img/VLMa.png" />" alt="VLMa" />
    </a>
</div>

<div class="subheader">
<div class="subheader_left">
    <fmt:message><tiles:insertAttribute name="subheader_left" /></fmt:message>
</div>
<div class="subheader_right">
    <tiles:insertAttribute name="subheader_right" />
</div>
</div>

<div class="left">
    <tiles:insertAttribute name="left" />
</div>

<div class="right">
    <tiles:insertAttribute name="right" />
</div>

<div class="footer">
    <p><a href="http://www.videolan.org"><fmt:message key="footpage.website" /></a> |
    <span class="spamproof" title="<fmt:message key="footpage.contact" />">vlma (at) videolan (dot) org</span></p>
</div>

</div>

</body>
</html>
