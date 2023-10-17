package com.quiz.lesson06.BO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.domain.Url;
import com.quiz.lesson06.mapper.UrlMapper;

@Service
public class UrlBO {
	@Autowired
	private UrlMapper urlMapper;
	
	public void addUrl(String name, String url) {
		// insert 후 끝
		urlMapper.insertUser(name, url);
	}
	
	public List<Url> getUrl() {
		return urlMapper.selectUrl();
	}
	

}
