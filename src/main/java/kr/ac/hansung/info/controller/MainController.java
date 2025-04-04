package kr.ac.hansung.info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {
    // 메인 페이지
    @GetMapping("/")
    public String home() {
        return "index"; // index.jsp로 이동
    }

    // 학점 조회 화면
    @GetMapping("/credits")
    public String credits() {
        return "credits";
    }

    // 수강 신청 화면
    @PostMapping("/register")
    public String registerForm(Model model) {
        return "register";
    }

    // 수강 신청 내역 화면
    @GetMapping("/applications")
    public String applicationList(Model model) {
        return "applications";
    }
}
