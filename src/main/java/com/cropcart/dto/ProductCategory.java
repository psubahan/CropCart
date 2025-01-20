package com.cropcart.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class ProductCategory {
	
	
	private int ProductCategory_id;
	private String category;
	private String img;
	private String description;
	private String status;

}
