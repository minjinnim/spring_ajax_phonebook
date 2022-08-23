<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
header{height:100px;width:100%;border:2px solid navy; background-color:#91CFFE}
#headerLocation{line-height:100px}
main{display:flex;height:600px;width:100%;border:2px solid navy; background-color:#91CFFE}
#search{padding:10px 10px 0 20px}
#list{padding-left:10px}
aside{height:600px;width:20%;border:2px solid navy; overflow:scroll; background-color:#91CFFE}
#content{margin:110px 200px 200px 300px;width:100px; height:100px; padding:100px 100px 100px 100px; border:2px solid gray; background-color:white}

footer{height:100px;width:100%;border:2px solid navy;background-color:navy }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	function getlist(){
		//$('#list').html("aaaaa"); /*여기에 list.jsp가 들어오면 됨  */
		$.ajax({
			url:"/list",
			success:function(result){$("#list").html(result);}
		});//ajax호출
		
	}
	function search(search){
		//$('#content').html(search);
		
		$.ajax({
			url:"/find?search="+search,
			success:function(result){$("#list").html(result);}
		});
	}
	function findIdx(idx){
		//$('#content').html(idx);
		$.ajax({
			url:"/findOne?idx="+idx,
			success:function(result){$("#content").html(result);}
		});
	}
	
	function insert(){
		var name=document.getElementById("name").value;
		var hp=document.getElementById("hp").value;
		var memo=document.getElementById("memo").value;
		//파라미터값 잘 받았는지 확인
		/*
		console.log(name);
		console.log(hp);
		console.log(memo);
		*/
		
		//db입력 리스트 출력
		$.ajax({
			url:"/insert?name="+name+"&hp="+hp+"&memo="+memo,
			success:function(result){$("#list").html(result);}
		});
		
		document.querySelector("#name").value="";
		document.querySelector("#hp").value="";
		document.querySelector("#memo").value="";
	}
	
	function update(idx){
		$.ajax({
			url:"/update?idx="+idx,
			success:function(result){$("#content").html(result);}
		});
	}
	function del(idx){
		$.ajax({
			url:"/delete?idx="+idx,
			success:function(result){$("#list").html(result);}
		});
	}


	
</script>

</head>
<body onload="getlist()"> <!-- 처음 로드할때   -->
<header>
<div id="headerLocation">
<!-- <form action="/insertProc" method=""> </form>-->
<lable for="name">이름 </lable>
<input type="text" id="name" name="name">

<lable for="hp">전화번호 </lable>
<input type="text" id="hp" name="hp">

<lable for="memo">메모 </lable>
<input type="text" id="memo" name="memo">
<!-- <input type="submit" value="전화번호입력"> -->
<input type="button" value="전화번호입력" onclick="insert()">
</div> 
</header>

<main>
<aside>
<div id="search"><input type="text" name="search" onkeyup="search(this.value)" placeholder="검색"></div>
<div id="list">전체리스트 or 검색리스트 결과</div>
</aside>
<div id="content">선택 결과</div>
</main>
<footer></footer>
</body>
</html>