package com.smartfarminganddigitalagriplatform.controller.api;

import com.smartfarminganddigitalagriplatform.service.WeatherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/weather")
public class WeatherController {

    @Autowired
    private WeatherService weatherService;

    @GetMapping
    public Map<String, Object> getWeather(@RequestParam(defaultValue = "Pune") String city) {
        return weatherService.getWeatherData(city);
    }
}
