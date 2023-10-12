package com.quiz.lesson05.weather_history;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.weather_history.BO.WeatherBO;
import com.quiz.lesson05.weather_history.domain.Weather;

@Controller
public class WeatherHistroyController {
	//요청 url: http://localhost/
	@Autowired
	private WeatherBO weatherBO;
	
	@GetMapping("/lesson05/weather")
	public String weather(
				Model model) {
		List<Weather> newWeather = weatherBO.getWeather();
		model.addAttribute("weathers", newWeather);

		return "weather_history/weather";
		
	}
	
	// 날씨 추가 화면
	@GetMapping("/lesson05/add-weather-view")
	public String addWeatherView(
			@RequestParam("date") Date date, 
			@RequestParam("weather") String weather,
			@RequestParam("microDust") String microDust,
			@RequestParam("temperatures") float temperatures,
			@RequestParam("precipitation") float precipitation,
			@RequestParam("windSpeed") float windSpeed
			) {
		weatherBO.putWeather(date, weather, microDust, temperatures, precipitation, windSpeed);
		
		
		return "weather_history/addWeather";
	}
}
