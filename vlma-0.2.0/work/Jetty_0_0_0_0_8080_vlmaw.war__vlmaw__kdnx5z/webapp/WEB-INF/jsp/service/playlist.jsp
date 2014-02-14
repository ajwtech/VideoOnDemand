#EXTM3U
<%@ page language="java" contentType="application/rss+xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<c:forEach items="${medias}" var="media">
#EXTINF:,${media.key.program.sapName}
${media.value}
</c:forEach>