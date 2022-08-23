<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<form action="/updateProc" method="post">
<input type="text" id="idx" name="idx" value="${list.idx}" hidden="hidden">
이름:<input type="text" id="name" name="name" value="${list.name}"><br>
전화번호:<input type="text" id="hp" name="hp" value="${list.hp}"><br>
메모:<input type="text" id="memo" name="memo" value="${list.memo}"><br>
<input type="submit" value="완료">
</form>

