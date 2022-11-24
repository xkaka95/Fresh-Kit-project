package kr.co.freshkit.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FkproductVO {
	int pno;
	String pname;
	int price;
	String pimg1;
	String pimg2;
	String pimg3;
	String pimg4;
	int dcratio;
	String pexplain;
	int hsno;
	

}
