package kr.co.freshkit.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FkcsVO {
	int csno;
	int no;
	String cscontents;
	Timestamp csdate;
	String cstitle;
	String csimg;
}
