<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>학년별 이수 학점 조회</title>
    <style>
        /* 기본 스타일 초기화 */
        body {
            background-color: #eef2f7;
            font-family: 'Arial', sans-serif;
        }

        /* 헤더 영역 */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ffffff;
            padding: 10px 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .logo {
            font-size: 20px;
            font-weight: bold;
            color: #003399;
        }
        .userinfo {
            font-size: 14px;
            color: #666;
        }

        /* 메인 컨테이너: 헤더 아래 전체를 감싸는 컨테이너 */
        .container {
            display: flex;
            min-height: calc(100vh - 60px); /* 헤더 높이 제외 */
        }

        /* 좌측 사이드바 */
        .sidebar {
            min-height: 100vh;
            background-color: #ffffff;
            padding-top: 40px;
            padding-left: 30px;
        }
        .sidebar button {
            display: block;
            width: 100%;
            margin-bottom: 15px;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background-color: #ffffff;
            color: #003399;
            font-size: 15px;
            text-align: left;
            cursor: pointer;
            box-shadow: 0 1px 3px rgba(0,0,0,0.2);
        }
        .sidebar button.active {
            box-shadow: 0 1px 5px rgba(0,0,0,0.3);
            font-weight: bold;
        }
        /* 사이드바 버튼 색상 지정 */
        .sidebar button:nth-child(1) {
            background-color: #FFC9C9;
        }
        .sidebar button:nth-child(2) {
            background-color: #FFDFA3;
        }
        .sidebar button:nth-child(3) {
            background-color: #BDDBBF;
        }
        .sidebar button:nth-child(4) {
            background-color: #C7DBFF;
        }

        /* 우측 메인 콘텐츠 영역 */
        .main {
            flex: 1;
            background-color: #dce6f7;
            padding: 30px;
        }

        /* 제목, 구분선 */
        .title {
            font-size: 22px;
            font-weight: bold;
            color: #003399;
            margin-bottom: 10px;
        }
        hr {
            margin-bottom: 20px;
            border: none;
            border-top: 2px solid #bbb;
        }

        /* 내부 콘텐츠 영역 */
        .content-area {
            /* 추가 스타일 필요시 여기에 */
        }

        /* 테이블을 감싸는 박스 */
        .table-box {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.15);
        }

        /* 표 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
        }
        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }
        th {
            background-color: #b2db7c;
            color: #003366;
        }
        tbody tr:hover {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>

<!-- 헤더 영역 -->
<div class="header">
    <div class="logo">한성대학교 HANSUNG UNIVERSITY</div>
    <div class="userinfo">2291001 한지운</div>
</div>

<!-- 메인 컨테이너: 사이드바 + 메인 콘텐츠 -->
<div class="container">
    <!-- 좌측 사이드바 -->
    <div class="sidebar">
        <button>메인 페이지</button>
        <button class="active">학년별 이수학점 조회</button>
        <button>수강 신청하기</button>
        <button>수강 신청 조회</button>
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
                    <!-- 총계 행 (필요한 경우) -->
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
