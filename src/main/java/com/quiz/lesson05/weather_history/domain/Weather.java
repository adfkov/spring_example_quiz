package com.quiz.lesson05.weather_history.domain;

import java.util.Date;

public class Weather {
	private Date date;
	private String weather;
	private float temperatures;
	private float precipitation;
	private String microDust;
	private float windSpeed;
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
	public float getTemperatures() {
		return temperatures;
	}
	public void setTemperatures(float temperatures) {
		this.temperatures = temperatures;
	}
	public float getPrecipitation() {
		return precipitation;
	}
	public void setPrecipitation(float precipitation) {
		this.precipitation = precipitation;
	}
	public String getMicroDust() {
		return microDust;
	}
	public void setMicroDust(String microDust) {
		this.microDust = microDust;
	}
	public float getWindSpeed() {
		return windSpeed;
	}
	public void setWindSpeed(float windSpeed) {
		this.windSpeed = windSpeed;
	}
	
	

}
