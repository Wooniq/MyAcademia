<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>학사 정보 대시보드</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #eef2f7;
            font-family: 'Arial', sans-serif;
        }
        .sidebar {
            min-height: 100vh;
            background-color: #ffffff;
            padding-top: 40px;
            padding-left: 30px;
        }
        .sidebar .nav-button {
            display: block;
            width: 180px;
            padding: 10px 20px;
            margin-bottom: 16px;
            border-radius: 20px;
            font-weight: bold;
            border: none;
            text-align: left;
        }
        .nav-main { background-color: #ffc9cc; }
        .nav-credits { background-color: #fef3a0; }
        .nav-register { background-color: #c0f2cb; }
        .nav-view { background-color: #bfdfff; }
        .card {
            border-radius: 20px;
            border: none;
        }
        .text-large {
            font-size: 3rem;
            font-weight: bold;
        }
        .gpa-card {
            background-color: #fff;
            border-radius: 20px;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <img src="/images/logo.png" class="img-fluid mb-4" alt="Hansung University" style="width: 80%;"/>
            <button class="nav-button nav-main">Main</button>
            <button class="nav-button nav-credits">학년별 이수학점 조회</button>
            <button class="nav-button nav-register">수강 신청하기</button>
            <button class="nav-button nav-view">수강 신청 조회</button>
        </div>

        <!-- Main Dashboard -->
        <div class="col-md-10 p-5">
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="card p-4">
                        <h5>2291001</h5>
                        <h4>모바일소프트웨어 트랙<br/>웹공학 트랙</h4>
                        <h5 class="fw-bold">한지운</h5>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card p-4">
                        <div class="mb-2">Previous Semester</div>
                        <div class="progress mb-3" style="height: 12px;">
                            <div class="progress-bar bg-dark" role="progressbar" style="width: 80%;"></div>
                        </div>
                        <div class="d-flex justify-content-between">
                            <div>전공 평점<br/><strong>4.0</strong></div>
                            <div>전체 평점<br/><strong>4.08</strong></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="card p-4 text-center">
                        <h2 id="clock" class="text-primary">--:--</h2>
                        <p class="text-muted">한성대학교 서버 시간<br/>2025년 4월 4일 (목) 18:35</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card p-4 text-center">
                        <canvas id="creditChart" width="200" height="200"></canvas>
                        <div class="mt-3">
                            <div>Remaining Credits</div>
                            <div class="text-large">108 <span style="font-size: 1.5rem;">/130</span></div>
                            <div class="mt-2">Current Earned Credits</div>
                            <div>108 /130</div>
                            <div>Current Extracurricular Points</div>
                            <div>1,135 /800</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="card p-4 text-center">
                        <canvas id="gpaChart" height="100"></canvas>
                        <div class="text-primary mt-3">
                            <strong>Great Job!</strong><br/>마지막 남은 학기에 4.0 이상 받는 걸 권장해요.
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="gpa-card">
                        <h6 class="text-primary fw-bold">GPA</h6>
                        <div class="d-flex justify-content-around">
                            <div>
                                <div>Major GPA</div>
                                <strong>4.08</strong> / 4.5
                            </div>
                            <div>
                                <div>Overall GPA</div>
                                <strong>4.12</strong> / 4.5
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <div class="card p-3">
                        <h5 class="fw-bold">Mon.</h5>
                        <div><em>iOS 프로그래밍</em> <span class="float-end">13:30</span></div>
                        <div><em>웹프로그래밍 기초</em> <span class="float-end">16:30</span></div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

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