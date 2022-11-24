package kr.co.freshkit.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class FkreviewVO {
	int reno;
	int no;
	String recontents;
	Timestamp redate;
	String retitle;
	String reimg;
}
