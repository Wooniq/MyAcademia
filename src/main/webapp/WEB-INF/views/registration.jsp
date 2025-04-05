<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수강 신청</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/common.css' />">
    <style>
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

        .form-box {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.15);
            max-width: 600px;
        }

        table {
            width: 100%;
            margin-top: 10px;
        }

        td {
            padding: 10px;
        }

        .error {
            color: red;
            font-size: 12px;
        }

        .submit-btn {
            width: 100%;
            padding: 10px;
            background-color: #b2db7c;
            border: none;
            color: #003366;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

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

<!-- 헤더 -->
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

<!-- 사이드바 + 메인 -->
<div class="container">

    <!-- 사이드바 -->
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

    <!-- 메인 콘텐츠 -->
    <div class="main">
        <h2 class="title">수강 신청 (2025년 2학기)</h2>
        <hr />
        <div class="form-box">
            <form:form method="post" modelAttribute="course">
                <table>
                    <tr>
                        <td>수강년도</td>
                        <td><form:input path="year" readonly="true"/></td>
                    </tr>
                    <tr>
                        <td>학기</td>
                        <td><form:input path="semester" readonly="true"/></td>
                    </tr>
                    <tr>
                        <td>교과코드</td>
                        <td>
                            <form:input path="code" placeholder="예: CSE0032"/>
                            <form:errors path="code" cssClass="error"/>
                        </td>
                    </tr>
                    <tr>
                        <td>교과목명</td>
                        <td>
                            <form:input path="name" placeholder="교과목명을 입력하세요"/>
                            <form:errors path="name" cssClass="error"/>
                        </td>
                    </tr>
                    <tr>
                        <td>교과구분</td>
                        <td>
                            <form:input path="category" placeholder="전기, 전필 등"/>
                            <form:errors path="category" cssClass="error"/>
                        </td>
                    </tr>
                    <tr>
                        <td>담당교수</td>
                        <td>
                            <form:input path="professor" placeholder="담당 교수"/>
                            <form:errors path="professor" cssClass="error"/>
                        </td>
                    </tr>
                    <tr>
                        <td>학점</td>
                        <td>
                            <form:input path="credit" placeholder="1 ~ 5"/>
                            <form:errors path="credit" cssClass="error"/>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="신청하기" class="submit-btn"/>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
