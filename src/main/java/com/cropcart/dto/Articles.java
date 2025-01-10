package com.cropcart.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter

public class Articles
{
	private String article_id;
	private String date;
	private String title;
	private String description;
	private String Article_image;
}
