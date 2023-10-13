package com.quiz.lesson05.weather_history.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson05.weather_history.domain.Weather;

@Repository
public interface WeatherMapper {
	public List<Weather> selectWeather();
	
	public void insertWeather(@Param("date")Date date
			,@Param("weather") String weather
			,@Param("microDust")String microDust
			,@Param("temperatures")Double temperatures
			,@Param("precipitation") Double precipitation
			,@Param("windSpeed")Double windSpeed); // map으로 만들었다.
}
