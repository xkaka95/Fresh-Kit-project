package kr.co.freshkit.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FkpaymentVO {
	int payno;
	Timestamp paydate;
	int payamount;
	String paystatus;
	String paymethod;
	Long ono;
	
}
