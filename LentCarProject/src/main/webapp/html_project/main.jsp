<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/main_content.css">
    <title>Document</title>
</head>
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
        <table class="tbl1">
            <div class="tbl1_cap">
                <span class="str1">최신형 할인</span>
                <span class="str2">렌트카</span>
                <span class="str3">&nbsp고객님을 위해 추천해드리는 신규 할인 렌트카</span>
            </div>
            <div class="tbl1_btn">
                <button type="button" class="btn1"><a href="#">◀</a></button>
                <button type="button" class="btn1"><a href="#">▶</a></button>
            </div>

            <tr>
                <td class="td1"><a href="#"><img src="img/car1.jpg" class="carImg"></a></td>
                <td class="td1"><a href="#"><img src="img/car2.jpg" class="carImg"></a></td>
                <td class="td1"><a href="#"><img src="img/car3.jpg" class="carImg"></a></td>
                <td class="td1"><a href="#"><img src="img/car4.jpg" class="carImg"></a></td>
            </tr>   
            <tr>
                <td class="td2"><a href="#">아반떼AD/뉴K3 (랜덤) + 고급자차</a></td>
                <td class="td2"><a href="#">쏘울 부스터 + 고급자차</a></td>
                <td class="td2"><a href="#">LF소나타 / 올뉴K5 (랜덤) + 고급자차</a></td>
                <td class="td2"><a href="#">올뉴말리부 / SM6 (랜덤) + 고급자차</a></td>
            </tr>
            <tr>
                <td class="td3">
                    <span class="dis_before">120,000원</span>
                    <span class="dis_after">60,000원</span>
                </td>
                <td class="td3">
                    <span class="dis_before">155,000원</span>
                    <span class="dis_after">77,500원</span>
                </td>
                <td class="td3">
                    <span class="dis_before">150,000원</span>
                    <span class="dis_after">75,000원</span>
                </td>
                <td class="td3">
                    <span class="dis_before">160,000원</span>
                    <span class="dis_after">80,000원</span>
                </td>
            </tr>
        </table>

        <div class="box1">
            <div class="box1_title">
                <a href="#">예약상담</a>
                <a href="#" class="box1_plus">+</a>
            </div>
            <ul>
                <li>
                    <a href="#">안녕하세요 </a><span class="box_date">08-29</span>
                </li>
                <li>
                    <a href="#">RE: 안녕하세요 </a><span class="box_date">09-01</span>
                </li>
                <li>
                    <a href="#">결제 </a><span class="box_date">04-13</span>
                </li>
                <li>
                    <a href="#">Re:결제 </a><span class="box_date">04-14</span>
                </li>
                <li>
                    <a href="#">예약했어요 </a><span class="box_date">12-03</span>
                </li>
            </ul>
        </div>
        
        <div class="box1">
            <div class="box1_title">
                <a href="#">공지사항</a>
                <a href="#" class="box1_plus">+</a>
            </div>
            <ul>
                <li>
                    <a href="#">2021년도 여름 성수기 [제주도… </a><span class="box_date">06-07</span>
                </li>
                <li>
                    <a href="#">여름성수기 제주도렌트카 예약 오픈… </a><span class="box_date">06-03</span>
                </li>
                <li>
                    <a href="#">신용카드 이용내역 조회 </a><span class="box_date">04-02</span>
                </li>   
                <li>
                    <a href="#">제네시스GV80 7인승 / K7프… </a><span class="box_date">03-19</span>
                </li>
                <li>
                    <a href="#">★ 이달의 특가차량 ☆ 판매시작 </a><span class="box_date">03-04</span>
                </li>
            </ul>
        </div>

        <div class="box2">
        <img src="img/call2.jpg">
        </div>
        </article>

    </section>
    <footer>
       <%@ include file="../include/BOTTOM.jsp" %>
    </footer>
</body>
</html>