package com.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class CrudDTO {
	int teamno;
	String tname;
	String skills;
	String rdate;
	String phone;
	String address;
	String zipcode;
	String gender;
}
