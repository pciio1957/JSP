<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>

<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
<c:set var="dept" value="${dao.getDept(param.deptno) }"/>

<c:if test="${dept != null }">
{"deptno":${dept.deptno }, "dname":"${dept.dname }", "loc":"${dept.loc }"}
</c:if>
	