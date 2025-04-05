<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>학기별 수강 내역 상세보기</title>
    <style>
        body {
            background-color: #eef2f7;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }
        /* 헤더 영역 */
        .header {
            background-color: #ffffff;
            padding: 10px 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            text-align: center;
        }
        .header h1 {
            margin: 0;
            color: #003399;
        }
        /* 콘텐츠 영역 */
        .content {
            margin: 20px;
        }
        .content h2 {
            color: #003399;
        }
        /* 테이블 박스 */
        .table-box {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.15);
            margin-top: 20px;
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
        /* 뒤로가기 링크 */
        .back-link {
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            color: #003399;
            font-weight: bold;
        }
    </style>
</head>
<body>
<!-- 헤더 영역 -->
<div class="header">
    <h1>학기별 수강 내역 상세보기</h1>
</div>

<!-- 콘텐츠 영역 -->
<div class="content">
    <!-- 선택한 년도와 학기 표시 -->
    <h2>년도: ${year} / 학기: ${semester}</h2>

    <!-- 상세 테이블 -->
    <div class="table-box">
        <table>
            <thead>
            <tr>
                <th>교과목 코드</th>
                <th>교과목명</th>
                <th>교과구분</th>
                <th>담당 교수</th>
                <th>학점</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="course" items="${courses}">
                <tr>
                    <td>${course.code}</td>
                    <td>${course.name}</td>
                    <td>${course.category}</td>
                    <td>${course.professor}</td>
                    <td>${course.credit}</td>
                </tr>
            </c:forEach>

            <c:if test="${empty courses}">
                <tr>
                    <td colspan="5">해당 학기 수강 내역이 없습니다.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

    <!-- 뒤로가기 링크 -->
    <a class="back-link" href="/myAcademia_war/credits">← 뒤로 가기</a>
</div>
</body>
</html>
