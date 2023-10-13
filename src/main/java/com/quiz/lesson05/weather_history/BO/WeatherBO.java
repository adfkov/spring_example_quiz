package com.quiz.lesson05.weather_history.BO;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.weather_history.domain.Weather;
import com.quiz.lesson05.weather_history.mapper.WeatherMapper;

@Service
public class WeatherBO {
	@Autowired
	private WeatherMapper weatherMapper;
	public List<Weather> getWeather() {
		return weatherMapper.selectWeather();
	}
	
	public void putWeather(Date date, String weather,String microDust,Double temperatures, Double precipitation,Double windSpeed) {
		weatherMapper.insertWeather( date,  weather, microDust,temperatures,  precipitation, windSpeed);
	}
	
}
