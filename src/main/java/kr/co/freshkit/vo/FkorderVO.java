package kr.co.freshkit.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class FkorderVO {
	String ono;
	Timestamp odate;
	int pno;
	int count;
	int oprice;
	String ostatus;
	String omessage;
	String oaddress;
	String opost;
	String oname;
	String ophone;
	int no;
	
	
	
}
