package com.smartfarminganddigitalagriplatform.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.HashMap;
import java.util.Map;

@Service
public class WeatherService {

    @Value("${weather.api.key:YOUR_API_KEY}")
    private String apiKey;

    private final RestTemplate restTemplate = new RestTemplate();

    public Map<String, Object> getWeatherData(String city) {
        if ("YOUR_API_KEY".equals(apiKey) || apiKey.isEmpty()) {
            return getMockWeatherData(city);
        }

        String url = UriComponentsBuilder.fromHttpUrl("https://api.openweathermap.org/data/2.5/weather")
                .queryParam("q", city)
                .queryParam("appid", apiKey)
                .queryParam("units", "metric")
                .toUriString();

        try {
            @SuppressWarnings("unchecked")
            Map<String, Object> result = restTemplate.getForObject(url, Map.class);
            return result;
        } catch (Exception e) {
            return getMockWeatherData(city);
        }
    }

    private Map<String, Object> getMockWeatherData(String city) {
        Map<String, Object> mockData = new HashMap<>();
        mockData.put("name", city);
        Map<String, Object> main = new HashMap<>();
        main.put("temp", 28.5);
        main.put("humidity", 65);
        mockData.put("main", main);

        Map<String, Object> wind = new HashMap<>();
        wind.put("speed", 5.5);
        mockData.put("wind", wind);

        java.util.List<Map<String, Object>> weatherList = new java.util.ArrayList<>();
        Map<String, Object> weather = new HashMap<>();
        weather.put("main", "Clear");
        weather.put("description", "clear sky");
        weather.put("icon", "01d");
        weatherList.add(weather);
        mockData.put("weather", weatherList);

        return mockData;
    }
}
