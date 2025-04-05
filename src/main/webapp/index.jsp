<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>학사 정보 대시보드</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/common.css' />">
    <style>
        body {
            background-color: #eef2f7;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        .dashboard-wrapper {
            display: flex;
            min-height: 100vh;
        }

        /* 헤더 우상단 */
        .header-bar {
            position: absolute;
            top: 20px;
            right: 30px;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .header-icon {
            width: 40px;
            height: 40px;
            background-color: white;
            border: 2px solid #3f3fbb;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            color: #3f3fbb;
        }

        /* 메인 컨텐츠 */
        .main {
            flex: 1;
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            padding: 40px;
            justify-content: flex-start;
        }

        .card-box {
            background-color: #dde6f5;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 1px 5px rgba(0,0,0,0.1);
            flex: 1 1 calc(33% - 30px); /* 3개씩 */
            max-width: calc(33% - 30px);
            min-width: 280px;
        }

        .card-text-large {
            font-size: 3rem;
            font-weight: bold;
        }

        .section-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        canvas {
            max-width: 100%;
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
<div class="dashboard-wrapper">

    <!-- Sidebar -->
    <div class="sidebar">
        <form action="${pageContext.request.contextPath}/" method="get">
            <button type="submit" class="nav-button nav-main">Main</button>
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
        <!-- Previous Semester GPA Bar -->
        <div class="card-box" style="flex: 1 1 300px; max-width: 400px;">
            <div class="section-title" style="font-style: italic;">Previous Semester</div>
            <div class="progress mb-3" style="height: 12px; background-color: #c7cbe9;">
                <div class="progress-bar bg-primary" role="progressbar" style="width: 80%; background-color: #3e3e91;"></div>
            </div>
            <div class="d-flex justify-content-between fw-bold">
                <div>전공 평점<br/><strong>4.0</strong></div>
                <div>전체 평점<br/><strong>4.08</strong></div>
            </div>
        </div>

        <!-- 원형 학점 그래프 -->
        <div class="card-box text-center" style="flex: 1 1 320px; max-width: 400px;">
            <canvas id="creditChart" width="160" height="160"></canvas>
            <div class="card-text-large mt-2">108 <span style="font-size: 1.3rem;">/130</span></div>
            <div class="mt-3">
                <div style="font-size: 14px;">Remaining Credits</div>
                <div style="font-weight: bold;">22</div>
                <div class="mt-2" style="font-size: 14px;">Current Extracurricular Points</div>
                <div style="font-weight: bold;">1,135 /800</div>
            </div>
        </div>

        <!-- 시계 카드 -->
        <div class="card-box text-center" style="flex: 1 1 320px; max-width: 400px; background-color: #d0def3;">
            <h2 id="clock" class="text-primary fw-bold">--:--</h2>
            <p class="text-muted mb-0">한성대학교 서버 시간</p>
            <p id="serverDate" class="text-muted">2025년 4월 4일 (목) 18:35</p>
        </div>

        <!-- GPA 그래프 -->
        <div class="card-box text-center" style="flex: 1 1 400px; max-width: 480px;">
            <canvas id="gpaChart" height="100"></canvas>
            <div class="text-primary mt-3 fw-bold">Great Job!<br/>마지막 남은 학기에 4.0 이상 받는 걸 권장해요.</div>
        </div>

        <!-- GPA 점수 카드 -->
        <div class="card-box text-center" style="flex: 1 1 400px; max-width: 380px; background-color: #ffffff;">
            <h6 class="text-primary fw-bold">GPA</h6>
            <div class="d-flex justify-content-around mt-3">
                <div>
                    <div>Major GPA</div>
                    <strong>4.08</strong><br/><span style="font-size: 0.9rem;">/4.5</span>
                </div>
                <div>
                    <div>Overall GPA</div>
                    <strong>4.12</strong><br/><span style="font-size: 0.9rem;">/4.5</span>
                </div>
            </div>
        </div>

        <!-- 요일별 수업 카드 -->
        <div class="card-box" style="flex: 1 1 760px; background-color: #d0def3;">
            <h5 class="fw-bold">Mon.</h5>
            <div style="font-style: italic;">iOS 프로그래밍 <span class="float-end">13:30</span></div>
            <div style="font-style: italic;">웹프로그래밍 기초 <span class="float-end">16:30</span></div>
        </div>

    </div> <!-- Main 끝 -->
</div> <!-- dashboard-wrapper 끝 -->
<script>
    function updateClock() {
        const now = new Date();
        const hours = now.getHours();
        const minutes = now.getMinutes().toString().padStart(2, '0');
        const ampm = hours >= 12 ? 'PM' : 'AM';
        const displayHour = hours % 12 || 12;
        document.getElementById("clock").innerText = `${displayHour}:${minutes} ${ampm}`;
    }
    setInterval(updateClock, 1000);
    updateClock();

    new Chart(document.getElementById("creditChart"), {
        type: 'doughnut',
        data: {
            labels: ["Earned", "Remaining"],
            datasets: [{
                data: [108, 22],
                backgroundColor: ["#9bb0ff", "#dee2e6"]
            }]
        },
        options: {
            cutout: "75%",
            plugins: { legend: { display: false } }
        }
    });

    new Chart(document.getElementById("gpaChart"), {
        type: 'line',
        data: {
            labels: ["1", "2", "3", "4", "5", "6", "7"],
            datasets: [{
                label: "GPA",
                data: [3.8, 3.6, 3.1, 3.4, 3.6, 3.9, 4.08],
                borderColor: "#4f55e0",
                tension: 0.3,
                fill: false,
                pointRadius: 5,
                pointBackgroundColor: "#4f55e0"
            }]
        },
        options: {
            plugins: { legend: { display: false } },
            scales: {
                y: { beginAtZero: false, min: 2.5, max: 4.5 }
            }
        }
    });
</script>
</body>
</html>
