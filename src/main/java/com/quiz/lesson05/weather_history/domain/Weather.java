package com.quiz.lesson05.weather_history.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Weather {
//	@DateTimeFormat(pattern="yyyy-MM-dd") // 그 다음 modelattribute
	private Date date;
	private String weather;
	private Double temperatures;
	private Double precipitation;
	private String microDust;
	private Double windSpeed;
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public Double getTemperatures() {
		return temperatures;
	}
	public void setTemperatures(Double temperatures) {
		this.temperatures = temperatures;
	}
	public Double getPrecipitation() {
		return precipitation;
	}
	public void setPrecipitation(Double precipitation) {
		this.precipitation = precipitation;
	}
	public String getMicroDust() {
		return microDust;
	}
	public void setMicroDust(String microDust) {
		this.microDust = microDust;
	}
	public Double getWindSpeed() {
		return windSpeed;
	}
	public void setWindSpeed(Double windSpeed) {
		this.windSpeed = windSpeed;
	}
	
	

}
