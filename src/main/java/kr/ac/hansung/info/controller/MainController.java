/*
    Controller: 클라이언트(Controller) ↔ DB(Dao) 사이에서 비즈니스 로직을 처리
 */
package kr.ac.hansung.info.controller;

import jakarta.validation.Valid;
import kr.ac.hansung.info.dto.SemesterCreditsDto;
import kr.ac.hansung.info.model.Course;
import kr.ac.hansung.info.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    private CourseService courseService;

    // 메인 페이지
    @GetMapping("/")
    public String home() {
        return "index"; // index.jsp로 이동
    }

    // 1.
    // 1.1 학점 통계 화면
    @GetMapping("/credits")
    public String showcredits(Model model) {
        // 1) 학기별 총 학점 구하기
        List<SemesterCreditsDto> creditsBySemester = courseService.getSemesterCredits();
        // 2) 총계 계산
        int totalCredits = creditsBySemester.stream()
                .mapToInt(SemesterCreditsDto::getTotalCredits)
                .sum();

        // 3) 모델에 담아서 뷰로 넘김
        model.addAttribute("creditsBySemester", creditsBySemester);
        model.addAttribute("totalCredits", totalCredits);

        return "credits";
    }

    // 1.2 상세보기
    @GetMapping("/credits-detail")
    public String showAllCredits(@RequestParam("year") int year,
                                 @RequestParam("semester") int semester,
                                 Model model) {
        System.out.println(">>> credits-detail 요청 진입");
        List<Course> courses = courseService.getCoursesByYearAndSemester(year, semester);
        model.addAttribute("year", year);
        model.addAttribute("semester", semester);
        model.addAttribute("courses", courses);
        return "creditsDetail";
    }

    // 2. 수강 신청 화면
    // 2.1 수강 신청하기 - 폼 화면
    @GetMapping("/registration")
    public String showRegistrationForm(Model model) {
        Course course = new Course();
        // 기본값 설정
        course.setYear(2025);
        course.setSemester(2);
        model.addAttribute("course", course);
        return "registration";
    }

    // 2.2 수강 신청하기 - 폼 제출 처리
    @PostMapping("/registration")
    public String processRegistration(@Valid @ModelAttribute("course") Course course,
                                      BindingResult bindingResult,
                                      Model model) {
        if (bindingResult.hasErrors()) {
            return "registration";
        }

        // DB에 저장
        courseService.saveCourse(course);
        return "redirect:/registration-success";
    }

    // 2.3 수강 신청하기 - 성공 시 뜨는 팝업
    @GetMapping("/registration-success")
    public String showSuccessPage() {
        return "registrationSuccess";
    }


    // 3. 수강 신청 내역 화면
    @GetMapping("/applications")
    public String applicationList(Model model) {
        List<Course> courses = courseService.getCoursesByYearAndSemester(2025, 2);
        model.addAttribute("courses", courses);
        return "applications";
    }
}
