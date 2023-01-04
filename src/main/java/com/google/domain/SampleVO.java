package com.google.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor //SampleVO(int,String,String)
@NoArgsConstructor //SampleVO()
public class SampleVO {

	private int mno;
	private String firstName;
	private String lastName;
}
