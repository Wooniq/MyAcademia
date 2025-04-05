<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>학년별 이수 학점 조회</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/common.css' />">
    <style>
        .logo img {
            height: 100px;
        }

        .userinfo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: bold;
            color: #003399;
        }

        .userinfo img {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
<div class="header">
    <!-- 로고 이미지 -->
    <div class="logo">
        <img src="<c:url value='/resources/images/logo.png' />" alt="한성대학교 로고" />
    </div>
    <!-- 사용자 정보 + 아이콘 -->
    <div class="userinfo">
        2291001 한지운
        <img src="<c:url value='/resources/images/sangsang.png' />" alt="사용자 아이콘" />
    </div>
</div>

<div class="container">
    <!-- 좌측 사이드바 -->
    <div class="sidebar">
        <form action="${pageContext.request.contextPath}/" method="get">
            <button type="submit" class="nav-button nav-main">메인 페이지</button>
        </form>
        <form action="${pageContext.request.contextPath}/credits" method="get">
            <button type="submit" class="nav-button nav-credits">학년별 이수학점 조회</button>
        </form>
        <form action="${pageContext.request.contextPath}/registration" method="get">
            <button type="submit" class="nav-button nav-register">수강 신청하기</button>
        </form>
        <form action="${pageContext.request.contextPath}/applications" method="get">
            <button type="submit" class="nav-button nav-view">수강 신청 조회</button>
        </form>
    </div>

    <!-- 우측 메인 영역 -->
    <div class="main">
        <!-- 실제 콘텐츠 영역 -->
        <div class="content-area">
            <h2 class="title">학년별 이수 학점 조회</h2>
            <hr />
            <div class="table-box">
                <table>
                    <thead>
                    <tr>
                        <th>년도</th>
                        <th>학기</th>
                        <th>취득 학점</th>
                        <th>상세보기</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- 컨트롤러에서 "creditsBySemester" 및 "totalCredits"로 넘긴 데이터를 사용 -->
                    <c:forEach var="entry" items="${creditsBySemester}">
                        <tr>
                            <td>${entry.year}</td>
                            <td>${entry.semester}</td>
                            <td>${entry.totalCredits}</td>
                            <td>
                                <!-- 선택한 연도와 학기를 URL 파라미터로 전송 -->
                                <a href="${pageContext.request.contextPath}/credits-detail?year=${entry.year}&semester=${entry.semester}">
                                    상세보기
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <!-- 총계 행 -->
                    <tr>
                        <td colspan="2">총계</td>
                        <td>${totalCredits}</td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
