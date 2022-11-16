package kr.co.freshkit.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FkcustomerVO {
	
	int no;
	String grade;
	String id;
	String pw;
	String name;
	String gender;
	String email;
	String address;
	String post;
	String phone;

}
