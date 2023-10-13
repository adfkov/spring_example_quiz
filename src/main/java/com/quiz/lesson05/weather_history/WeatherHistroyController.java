package com.quiz.lesson05.weather_history;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String addWeatherView() {
		return "weather_history/addWeather";
		
	}
	@PostMapping("/lesson05/add-weather-complete")
	public String afterAddWeather(
			@RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date, 
			@RequestParam("weather") String weather,
			@RequestParam("microDust") String microDust,
			@RequestParam("temperatures") Double temperatures,
			@RequestParam("precipitation") Double precipitation,
			@RequestParam("windSpeed") Double windSpeed,
			HttpServletResponse response
			) {
		weatherBO.putWeather(date, weather, microDust, temperatures, precipitation, windSpeed);
		
		// response
		// redirect => 히스토리 페이지
//		response.sendRedirect("/lesson05/weather")
		return "redirect:/lesson05/weather";
	
	}
}
