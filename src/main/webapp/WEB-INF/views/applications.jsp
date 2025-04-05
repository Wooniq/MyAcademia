<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수강 신청 조회</title>
    <style>
        body {
            background-color: #eef2f7;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

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

        .container {
            display: flex;
            min-height: calc(100vh - 60px);
        }

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

        .sidebar button:nth-child(1) { background-color: #FFC9C9; }
        .sidebar button:nth-child(2) { background-color: #FFDFA3; }
        .sidebar button:nth-child(3) { background-color: #BDDBBF; }
        .sidebar button:nth-child(4) { background-color: #C7DBFF; }

        .main {
            flex: 1;
            background-color: #dce6f7;
            padding: 30px;
        }

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

        .table-box {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.15);
        }

        table {
            width: 100%;
            border-collapse: collapse;
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

<!-- 헤더 -->
<div class="header">
    <div class="logo">한성대학교 HANSUNG UNIVERSITY</div>
    <div class="userinfo">2291001 한지운</div>
</div>

<!-- 사이드바 + 콘텐츠 -->
<div class="container">
    <!-- 사이드바 -->
    <div class="sidebar">
        <button>메인 페이지</button>
        <button>학년별 이수학점 조회</button>
        <button>수강 신청하기</button>
        <button class="active">수강 신청 조회</button>
    </div>

    <!-- 메인 -->
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
