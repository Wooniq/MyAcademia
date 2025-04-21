# 📚 웹프레임워크2 과제1: SpringMVC를 활용한 학사정보시스템

이 저장소는 **웹프레임워크2** 교과목의 **과제 1**을 위한 Spring Framework 기반 프로젝트입니다.

  <p align="center">
  <a href="https://spring.io/projects/spring-framework">
    <img src="https://img.shields.io/badge/Spring_Framework-%236DB33F.svg?style=flat-square&logo=spring&logoColor=white"/>
  </a>
  <a href="https://www.mysql.com/">
    <img src="https://img.shields.io/badge/MySQL-%234479A1.svg?style=flat-square&logo=mysql&logoColor=white"/>
  </a>
  <a href="https://www.java.com/">
    <img src="https://img.shields.io/badge/Java-%23ED8B00.svg?style=flat-square&logo=java&logoColor=white"/>
  </a>
</p>

## 🛠️ 기술 스택
- Spring Framework 6.2.3
- Java 21
- Maven
- MySQL (데이터베이스)

## 📂 프로젝트 개요
Spring MVC 아키텍처를 활용하여 수강 신청 시스템을 구현한 웹 애플리케이션입니다.  
기본적인 **요청-응답 흐름**, **Model-View-Controller 설계**, **데이터 검증 및 바인딩**, **JDBC / JPA 연동** 등을 포함합니다.

## ✅ 주요 기능
- 학년별 이수 학점 조회
- 수강 신청
- 수강 신청 내역 확인 및 상세 조회

> **전체 GPA 및 학점, 학기별 과목 현황을 한눈에 확인할 수 있으며, 직관적인 UI/UX로 설계되었습니다.**

<p align="center">
    <img src="https://img.shields.io/github/stars/Wooniq/MyAcademia" alt="GitHub stars">
    <img src="https://img.shields.io/github/license/Wooniq/MyAcademia" alt="GitHub license">
</p>

## 📄 과제 제출 정보
- **과목명**: 웹프레임워크2
- **담당 교수님**: 김남윤
- **제출자**: 한지운 / 2291001
- **과제명**: 과제 1 - Spring 기반 웹 애플리케이션

---


### ✅ 시스템 주요 화면 예시

| 기능 | 구현 결과 |
|------|--------|
| 메인 페이지 | ![메인 페이지](https://github.com/user-attachments/assets/9ac83553-3e0b-4067-80eb-fc0519fc1306) |
| 학년별 이수 학점 조회 | ![image](https://github.com/user-attachments/assets/4f7e565f-9af9-4707-8498-f721d95dfd1d) |
| 수강 신청 내역(DB) | ![image](https://github.com/user-attachments/assets/97bdb879-b881-4992-90e7-5943fda8c731) |
| 상세보기 | ![image](https://github.com/user-attachments/assets/51222188-c658-4927-8234-b246839a1609) |
| 수강신청 | ![image](https://github.com/user-attachments/assets/e26e453b-255e-463a-a37e-39d501073caf) |
| 수강신청 내역 조회 | ![image](https://github.com/user-attachments/assets/41852ca9-92f5-451a-a08a-08675c7f843a) |


---

## ✨ 주요 기능 ✨

- **메인 대시보드**  
  - 학생 정보, 총 이수 학점, GPA, 시간표 등을 시각적으로 표시  
  - 성적 추이 그래프 제공 및 학습 동기 부여 메시지 제공

- **① 학년별 이수 학점 조회**  
  - 학기별 취득 학점 및 총계 표시  
  - “상세보기” 버튼 클릭 시 해당 학기의 과목 리스트, 담당 교수, 학점 등 상세 정보 확인 가능

- **② 수강 신청하기**  
  - 사용자가 신청할 과목 정보를 입력  
  - Spring Validation을 활용한 **입력 검증 로직 내장**  
  - 검증 성공 시 DB에 저장

- **③ 수강 신청 조회**  
  - 사용자가 신청한 2025년 2학기 수강 내역을 테이블 형식으로 조회

---

## 📚 기술 스택 📚

- **Spring MVC**: Java 기반 백엔드 프레임워크
- **Spring Validation (JSR-303)**: 사용자 입력값 검증
- **MySQL**: 학사 정보를 저장하는 관계형 데이터베이스
- **HTML/CSS/JavaScript**: 프론트엔드 화면 구현
- **Maven**: 빌드 및 의존성 관리 도구

---

## 📂 프로젝트 구조 📂
```
myAcademia/
├── src/
│   └── main/
│       ├── java/kr/ac/hansung/info/
│       │   ├── controller/          # 컨트롤러 계층: 사용자의 요청을 받아 처리
│       │   ├── model/               # 도메인 모델: Entity 클래스 위치
│       │   ├── dto/                 # 데이터 전달 객체: 계층 간 데이터 이동용
│       │   ├── dao/                 # DAO 계층: DB 접근 로직
│       │   └── service/             # 서비스 계층: 비즈니스 로직 처리
│       ├── resources/
│       │   └── logback.xml          # 로깅 설정 파일
│       ├── webapp/
│       │   ├── resources/
│       │   │   ├── css/             # 정적 CSS 파일
│       │   │   └── images/          # 정적 이미지 파일
│       │   ├── WEB-INF/
│       │   │   ├── props/           # 환경설정 파일 (jdbc.properties 등)
│       │   │   ├── spring/          # 스프링 설정 파일 (servlet-context.xml 등)
│       │   │   └── views/           # JSP 뷰 파일 위치 (ViewResolver 대상)
│       │   └── index.jsp            # 메인 진입 JSP (forward로 controller로 넘김)
├── pom.xml                          # Maven 빌드 설정 파일
```

---

## 🚀 시작하기 🚀

1. **레포지토리 클론하기:**  
   ```bash
   git clone https://github.com/Wooniq/MyAcademia.git
   ```
2. **프로젝트 디렉토리로 이동:**
   ```bash
    cd MyAcademia
    ```
3. **빌드 및 실행**

4. **웹 브라우저로 접속:**
  `http://localhost:8080`

---

## 💡 기능 세부 설명
### 📈 GPA 및 이수 학점 시각화
전체 GPA 및 전공 GPA를 실시간으로 표시

남은 학점과 현재 이수 학점 현황을 시각적으로 확인

### 📝 수강 신청 폼 예시
  ```html
  <form action="/courses/apply" method="post">
  <input type="text" name="courseCode" placeholder="CSE0032" required />
  <input type="text" name="courseName" placeholder="웹프레임워크 I" required />
  <select name="semester">
    <option value="1">1학기</option>
    <option value="2">2학기</option>
  </select>
  ...
  </form>
  ```
