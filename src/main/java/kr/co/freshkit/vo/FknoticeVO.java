package kr.co.freshkit.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FknoticeVO {
	int nono;
	int no;
	String nocontents;
	Timestamp nodate;
	String notitle;
	String noimg;
}
