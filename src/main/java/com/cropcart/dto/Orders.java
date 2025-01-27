package com.cropcart.dto;
import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class Orders {
	private int order_Id;
	private int cart_Id;
	private int cart_Cost;
	private String product_Image;
	private String product_Name;
	private String order_Address;
	private String order_State;
	private String order_city;
	private int customer_Id;
	private String customer_Name;
	private String order_date;
	private String status;
	private String farmer_id;
	private String paymet_mode;
	private String delivary_Date;
	private String decline_reason;
	private String quantity;
}
