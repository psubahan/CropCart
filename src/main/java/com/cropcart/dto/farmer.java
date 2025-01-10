package com.cropcart.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter

public class farmer
{
	private int former_id;
	private String name;
	private String email;
	private String password;
	private String address;
	private String state;
	private String city;
	private long phone;
	private long pincode;
	private String bank_name;
	private String branch;
	private String ifsc;
	private long acc_no;

}
