package com.cropcart.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter

public class Articles
{
	private int article_id;
	private String article_type;
	private String publish_Date;
	private String title;
	private String description;
	private String Article_image;
}
