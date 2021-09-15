<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
 <head>
  <meta charset="UTF-8">
	<title>Document</title>
  	<link rel="stylesheet" href="../css/layout.css">
	<link rel="stylesheet" href="../css/main.css">
 </head>

<style>

</style>

<body>

<header>
Header
</header>

<nav>
<div>
<%@ include file="../include/topmenu.jsp" %>
</div>
</nav>

<section>
	<aside>
	 좌 메뉴
	</aside>
	<article>

<form name="" method="post" action="">

<table class="table1" align="center">
	<caption class="caption1">
		회원가입 폼
	</caption>
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>

	<tr>
		<th class="th1">아이디</th>
		<td class="td2">
			<input type="text" name="userid" class="input2" autofocus placeholder="아이디입력">
			<input type="button" value="아이디찾기" class="button2" >
		</td>
	</tr>
	<tr>
		<th class="th1">암호</th>
		<td class="td2"><input type="password" name="pass" class="input2"></td>
	</tr>
	<tr>
		<th class="th1">이름</th>
		<td class="td2"><input type="text" name="name" class="input2" placeholder="이름입력" ></td>
	</tr>
	<!--
	String userid = "abc";
	String gender = "M";
	String gender = "F";
	-->
	<tr>
		<th class="th1">성별</th>
		<td class="td2">남 <input type="radio" name="gender" value="M">,
		    여 <input type="radio" name="gender" value="F">
		</td>
	</tr>
	
	<tr>
		<th class="th1">생일</th>
		<td class="td2">
			<select name="year">
				<option value="">1998년</option>
				<option value="">1999년</option>
				<option value="">2000년</option>
			</select>
			<select name="month">
				<option value="">1월</option>
				<option value="">2월</option>
				<option value="">3월</option>
			</select>
			<select name="day">
				<option value="">1일</option>
				<option value="">2일</option>
				<option value="">3일</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<th class="th1">주소</th>
		<td class="td2"><input type="text" name="addr" class="input1"></td>
	</tr>
	<tr>
		<th class="th1">취미</th>
		<td class="td2">
			<input type="checkbox" name="hh" value="바둑">바둑,
			<input type="checkbox" name="hh" value="야구">야구,
			<input type="checkbox" name="hh" value="축구">축구
		</td>
	</tr>
	<tr>
		<th class="th1">이메일</th>
		<td class="td2"><input type="email" name="email" class="input2"></td>
	</tr>

	<tr>
		<th class="th1">홈페이지</th>
		<td class="td2"><input type="url" name="homepage" class="input2"></td>
	</tr>

	<tr>
		<th class="th1" colspan="2">
			<input type="submit" value="저장" class="button1">
			<input type="reset" value="재설정" class="button1">
		</th>
	</tr>
</table>

</form>


	</article>
</section>

<footer>
회사소개
</footer>

</body>
</html>
