<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="application/rss+xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>

<rss version="2.0">
    <channel>
        <title><fmt:message key="podcast.title" /></title>
        <description><fmt:message key="podcast.description" /></description>
        <generator>VLMa - VideoLAN Manager - http://www.videolan.org/vlma</generator>
        <c:forEach items="${medias}" var="media">
        <item>
            <title>${media.key.program.sapName}</title>
            <enclosure url="${media.value}" />
        </item>
        </c:forEach>
    </channel>
</rss>
