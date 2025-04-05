package kr.ac.hansung.info.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class SemesterCreditsDto {
    private int year;
    private int semester;
    private int totalCredits;
}