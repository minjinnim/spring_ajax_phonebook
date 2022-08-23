<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


이름: <c:out value="${list.name}"/><br>
전화번호: <c:out value="${list.hp}"/><br>
메모: <c:out value="${list.memo}"/><br>
<input type="button" value="수정" onclick="update(${list.idx})">
<input type="button" value="삭제" onclick="del(${list.idx})">