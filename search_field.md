##게시판 검색 버튼 
<!-- ------검색 처리-------- -->
	
	<div style="width:600px; margin-top:10px; text-align:right;">
	
	<form name="frm" method="post" action="boardList.jsp" >
	<div style ="float:left; width:50%; text-align:left">
	<select name="search_field">
	
	<option value="">선택</option>
	<option value="title"> 제목 </option>
	<option value="content"> 내용 </option>
	</select>
	
	<input type ="text" name ="search_text">
	<button type="submit" class="btn1"> 검색 </button>
	</div>
	</form>
	<div style ="float:left; width:50%; text-align:right">
	<button type="button" class="button1" onclick="location='boardWrite.jsp';" >글쓰기</button>
	</div>
	</div>
	</div>


<!-- ------검색 처리-------- -->


--sql문


select b.* from (
 select rownum rn, a.* from (
 select unq, title, name, to_char(rdate, 'yyy-mm-dd') rdate , hits
from nboard order by unq desc ) a ) b
where rn BETWEEN  1  and  10;


-title 에 text를 검색하면 나오도록
select b.* from (
 select rownum rn, a.* from (
 select unq, title, name, to_char(rdate, 'yyy-mm-dd') rdate , hits
from nboard order by unq desc ) a ) b
where title like '%test%';


select b.* from (
 select rownum rn, a.* from (
 select unq, title, name, to_char(rdate, 'yyy-mm-dd') rdate , hits
from nboard 
where title like '%test%'
order by unq desc ) a ) b

//
where title like '%test%' 처음에 조건문(where)을 쓰면 행번호가 제대로 출력된다, 행번호를 맨 마지막으로 출력하기 때문에


select b.* from (
select rownum rn, a.* from (
select unq, title, name, to_char(rdate, 'yyy-mm-dd') rdate , hits 
from nboard 
where null like '%null%' order by unq desc ) a ) b
where rn BETWEEN 1 and 10;
--- where 문이 검색을 하지 않아도  null 값을 검색을 하게 되므로 if문으로 처리;



////검색 
String search_field = request.getParameter("search_field");
String search_text = request.getParameter("search_text");

String nullfield ="";

///검색을 안했을때 필드에 아무것도 없을때 , 있을때만 나오게

if( search_field !=null && search_text !=null ){

nullfield = " where "+search_field+" like '%"+search_text+"%'" ;

}

String sql2= " select b.* from ("
			+" select rownum rn, a.* from ("
			+" select unq, title, name, to_char(rdate, 'yyy-mm-dd') rdate , hits "
			+" from nboard  "+nullfield+" order by unq desc ) a ) b"
			+" where rn BETWEEN "+rn_sno+" and "+rn_eno+""; 
										// 11,20
										// 21,30

>>
처음으로 조건문을 쓰면(가장 안쪽 select에 where조건문을 써야  ) 행번호( rownum )가 제대로 출력 행번호를 맨 마지막으로 출력하기 때문에;	

>sql : 검색을 안하면(null 일때 ) 전체 게시글을 다 보여주게 해야한다, where 조건


String sql_Total= "select count(*) total from nboard "+ nullfield ;






