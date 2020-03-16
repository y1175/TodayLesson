package com.todaylesson.DTO;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OptionsDTO {
	private int lesson_no;
	private int product_no;
	private String option_name;
	private int option_cost;


}
