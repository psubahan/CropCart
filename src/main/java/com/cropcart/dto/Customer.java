package com.cropcart.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class Customer
{
	private int customer_id;
	private String name;
	private long phone;
	private String mail;
	private String password;
	private String address;
	private String state;
	private String city;
	private int pincode;
	private String customer_type;
}
