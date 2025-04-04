package kr.ac.hansung.info.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
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

    @Min(value = 2000, message = "수강년도는 2000년 이상이어야 합니다.")
    @Max(value = 2100, message = "수강년도는 2100년 이하여야 합니다.")
    private int year;            // 수강년도

    @Min(value = 1, message = "학기는 1 또는 2만 가능합니다.")
    @Max(value = 2, message = "학기는 1 또는 2만 가능합니다.")
    private int semester;        // 학기

    @NotBlank(message = "교과코드는 필수입니다.")
    @Pattern(regexp = "^[A-Z]{3}\\d{4}$", message = "예: CSE0032 형식으로 입력하세요.")
    private String code;         // 교과코드

    @NotBlank(message = "교과목명은 필수입니다.")
    private String name;         // 교과목명

    @NotBlank(message = "교과구분은 필수입니다.")
    @Pattern(regexp = "전기|전필|전선|교필|선필교|일선|일교", message = "교과구분은 전기, 전필, 전선, 교필, 선필교, 일선, 일교 중 하나여야 합니다.")
    private String category;     // 교과구분 (전필, 전선 등)

    @NotBlank(message = "담당교수는 필수입니다.")
    private String professor;    // 담당교수

    @Min(value = 1, message = "학점은 1 이상이어야 합니다.")
    @Max(value = 5, message = "학점은 5 이하이어야 합니다.")
    private int credit;          // 학점
}
