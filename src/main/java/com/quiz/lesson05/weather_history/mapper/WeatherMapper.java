package com.quiz.lesson05.weather_history.mapper;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson03.domain.RealEstate;
import com.quiz.lesson05.weather_history.domain.Weather;

@Repository
public interface WeatherMapper {
	public List<Weather> selectWeather();
	
	public void insertWeather(Date date, String weather,String microDust,float temperatures, float precipitation,float windSpeed);
}
