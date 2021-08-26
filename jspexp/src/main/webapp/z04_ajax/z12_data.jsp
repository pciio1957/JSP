<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
<h3 align="center">${dao.login(param.id, param.pw)?'인증성공':'인증실패'}</h3>
<h3 align="center">${param.id}  ${param.pw}</h3>
<c:set var="mem" value="${dao.login2(param.id, param.pw)}"/>
