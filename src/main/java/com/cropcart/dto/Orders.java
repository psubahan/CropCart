package com.cropcart.dto;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class Orders {
	private int order_Id;
	private int cart_Id;
	private int cart_Cast;
	private String order_Address;
	private String order_State;
	private String order_city;
	private int customer_Id;
	private String customer_Name;
	private String order_date;
	private String status;
}
