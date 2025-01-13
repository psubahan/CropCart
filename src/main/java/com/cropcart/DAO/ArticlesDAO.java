package com.cropcart.DAO;

import java.util.ArrayList;

import com.cropcart.dto.Articles;

public interface ArticlesDAO {
  public ArrayList<Articles> getArticles();
  public Articles getArticle(int articles_id); 
}
