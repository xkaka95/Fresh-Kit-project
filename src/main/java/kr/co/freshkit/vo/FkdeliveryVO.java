package kr.co.freshkit.vo;


import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class FkdeliveryVO {
	
	int dno;
	Timestamp ddate;
	String dstatus;
	int payno;
}
