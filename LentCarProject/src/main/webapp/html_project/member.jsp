<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/member.css">
    <title>제주 렌트카 회원 가입</title>
</head>

<script>
function fn_submit() {
	if( document.frm.username.value ==""){
		
		alert(" 아이디를 확인 해주세요 ");
		document.frm.username.focus();
		return false;
	}
	
	if( document.frm.userpass.value ==""){
		
		alert(" 비밀번호를 다시 입력 해주세요 ");
		document.frm.userpass.focus();
		return false;
	}

//////
document.frm.submit();
}

</script>

<body>
    <div class="bg_top">
    </div>
    <div class="wrap">
    <header>
         <%@ include file="../include/HEADER.jsp" %>

    </header>
    <nav>
         <%@ include file="../include/TOPMENU.jsp" %>
    </nav>
    <section>
        <article>
            <div class="mem_wrap">
            <div class="mem_title">
                회원가입
            </div>
            
            
            <form  name="frm" method="post" action="memberSave.jsp"   >
            <table class="mem_tbl">
                <caption class="mem_cap">사이트 이용정보 입력</caption>
                <tr>
                    <th>아이디</th>
                    <td><span class="mem_str">영문자, 숫자,_만 입력 가능. 최소 3자이상 입력하세요.<br></span>
                        <input type="text" name="userid" class="inputBox"></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="userpass" class="inputBox"></td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" name="userpass_chk" class="inputBox"></td>
                </tr>
            </table>
            <table class="mem_tbl">
                <colgroup>
                
                </colgroup>
                <caption class="mem_cap">개인정보입력</caption>
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="username" class="inputBox" style="width:70px"></td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td><span class="mem_str">공백없이 한글, 영문 숫자만 입력 가능 (한글2자, 영문4자 이상) <br>
                        닉네임을 바꾸시면 앞으로 60일 이내에는 변경할 수 없습니다.</span> <br>
                        <input type="text" name="nickname" class="inputBox" style="width:100px"></td>
                </tr>
                <tr>
                    <th>E-mail</th>
                    <td><input type="email" name="email" class="inputBox" style="width:400px"></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><input type="tel" name="tel" class="inputBox"></td>
                </tr>
                <tr>
                    <th>휴대폰번호</th>
                    <td><input type="tel" name="phone" class="inputBox"></td>
                </tr>
            </table>
            </form>
            
            <div class="mem_div_btn">
                <button type="submit" class="mem_btn1" onclick="fn_submit();return false;">회원가입</button>
                <button type="reset" class="mem_btn2">취소</button>
            </div>
        </div>
        </article>

    </section>
    <footer>
    <%@ include file="../include/BOTTOM.jsp" %>
    </footer>
</body>
</html>