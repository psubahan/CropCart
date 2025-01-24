package com.cropcart.dto;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class Cart 
{
	private int Cart_Id;
	private String product_Image;
	private String product_Title;
	private String product_Category;
	private String quantity;
	private int customer_Id;
	private String customer_Name;
	private String product_Cost;
	private String farmer_Id;
}
