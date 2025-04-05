package kr.ac.hansung.info.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import kr.ac.hansung.info.model.Course;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CourseDao {

    @PersistenceContext
    private EntityManager entityManager;

    //  전체 Courses 검색
    public List<Course> getAllCourses() {
        return entityManager.createQuery("SELECT c FROM Course c", Course.class)
                .getResultList();
    }

    // 연도, 학기별 Courses 검색
    public List<Course> getCoursesByYearAndSemester(int year, int semester) {
        return entityManager.createQuery("SELECT c FROM Course c WHERE c.year = :year AND c.semester = :semester", Course.class)
                .setParameter("year", year)
                .setParameter("semester", semester)
                .getResultList();
    }

    // DB 저장
    public void save(Course course) {
        entityManager.persist(course);
    }
}