<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="pb" items="${list}">
<li onclick="findIdx(${pb.idx})" style="list-style-type:none" onclick="getPhonebook('$(pb.idx)')">
<img alt="zzal" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsLMTkQ8o3d3pyKR1Wi9Ldjfb2qLZ0I5jOoA&usqp=CAU"
	 style="padding:10px;padding-top:10px; padding-bottom:0px;width:40px; height:30px; border-radius:100px"><br>
이름:<c:out value="${pb.name}"/><br>

전화번호:<c:out value="${pb.hp}"/><br>
메모:<c:out value="${pb.memo}"/><br>
</li>
</c:forEach>