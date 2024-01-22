<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<style>
	body{
		text-align: center;
	}
</style>
</head>
<body>
	<img src="${path }/resources/images/500.avif" alt="에러화면" width="700" height="700">
	<script>
		setTimeout(()=>{
			location.replace('${path}/');
		},3000)
	</script>
</body>
</html>