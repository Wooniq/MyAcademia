/*
    Service: 컨트롤러와 DAO 사이에서 비즈니스 로직을 처리하는 계층
 */
package kr.ac.hansung.info.service;

import kr.ac.hansung.info.dao.CourseDao;
import kr.ac.hansung.info.dto.SemesterCreditsDto;
import kr.ac.hansung.info.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
public class CourseService {

    @Autowired
    private CourseDao courseDao;

    // 전체 수강 내역
    public List<Course> getAllCourses() { return courseDao.getAllCourses(); }

    // 학기별 수강 합계
    public List<SemesterCreditsDto> getSemesterCredits() {
        // 1. 모든 과목 조회
        List<Course> allCourses = courseDao.getAllCourses();
        // 2. (year, semester)별로 groupBy 해서 학점 합계 구함
        Map<String, Integer> map = new HashMap<>();
        // key는 "year-semester" 형태로, value는 학점 합계
        for(Course c : allCourses) {
            String key = c.getYear() + "-" + c.getSemester();
            map.put(key, map.getOrDefault(key, 0) + c.getCredit());
        }

        // 3. map을 순회하며 SemesterCredits 리스트 생성
        List<SemesterCreditsDto> result = new ArrayList<>();
        for(String key : map.keySet()) {
            String[] split = key.split("-");
            int year = Integer.parseInt(split[0]);
            int semester = Integer.parseInt(split[1]);
            int totalCredits = map.get(key);
            result.add(new SemesterCreditsDto(year, semester, totalCredits));
        }

        // 연도+학기 순으로 정렬
        result.sort(Comparator.comparingInt(SemesterCreditsDto::getYear).thenComparingInt(SemesterCreditsDto::getSemester));

        return result;
    }

    // 연도&학기로 수강 내역 조회
    public List<Course> getCoursesByYearAndSemester(int year, int semester) {
        return courseDao.getCoursesByYearAndSemester(year, semester);
    }

    // 수강 신청 DB 저장
    public void saveCourse(Course course) {
        courseDao.save(course);
    }
}