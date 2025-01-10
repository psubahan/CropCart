package com.cropcart.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter

public class Admin 
{
	private int admin_id;
	private String name;
	private String mail;
	private long phone;
	private String password;
}
