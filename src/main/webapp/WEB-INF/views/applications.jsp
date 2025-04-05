<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수강 신청 조회</title>
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

    <div class="main">
        <h2 class="title">2025년 2학기 수강 신청 내역</h2>
        <hr />
        <div class="table-box">
            <table>
                <thead>
                <tr>
                    <th>년도</th>
                    <th>학기</th>
                    <th>교과목명</th>
                    <th>교과구분</th>
                    <th>담당교수</th>
                    <th>학점</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td>${course.year}</td>
                        <td>${course.semester}</td>
                        <td>${course.name}</td>
                        <td>${course.category}</td>
                        <td>${course.professor}</td>
                        <td>${course.credit}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
