package kr.ac.hansung.info.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Entity
@Table(name = "courses")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // DB 저장할 때 결정됨

    private int year;            // 수강년도

    private int semester;        // 학기

    private String code;         // 교과코드

    private String name;         // 교과목명

    private String category;     // 교과구분 (전필, 전선 등)

    private String professor;    // 담당교수

    private int credit;          // 학점
}
