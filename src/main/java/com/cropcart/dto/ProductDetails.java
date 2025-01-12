package com.cropcart.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class ProductDetails
{
	private String category;
	private String title;
	private String image;
	private int quantity;
	private String description;
	private String quantity_type;
	private long price;
	private String status;

}
