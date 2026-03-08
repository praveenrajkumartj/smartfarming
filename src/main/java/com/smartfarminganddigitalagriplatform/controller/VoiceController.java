package com.smartfarminganddigitalagriplatform.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/voice")
public class VoiceController {

    @Autowired
    private com.smartfarminganddigitalagriplatform.service.WeatherService weatherService;

    @PostMapping("/advisory")
    public Map<String, String> getAiAdvisory(@RequestBody Map<String, String> request) {
        String query = request.get("query").toLowerCase();
        Map<String, String> response = new HashMap<>();

        String advisory = "";

        if (query.contains("weather") || query.contains("mausam")) {
            Map<String, Object> data = weatherService.getWeatherData("Pune");
            if (data != null && data.containsKey("main")) {
                Map<String, Object> main = (Map<String, Object>) data.get("main");
                List<Map<String, Object>> weather = (List<Map<String, Object>>) data.get("weather");
                String desc = (String) weather.get(0).get("description");
                advisory = "The current temperature is " + main.get("temp") + " degrees with " + desc + ". It's a "
                        + (desc.contains("rain") ? "rainy" : "good") + " day for your crops.";
            } else {
                advisory = "The weather today in your region is clear. It's a good time for harvesting. High probability of rain next Tuesday.";
            }
        } else if (query.contains("pest") || query.contains("keeda")) {
            advisory = "Seeing pests? Try using Neem oil spray for organic control. If it looks like fungal growth, consider Carbendazim.";
        } else if (query.contains("market") || query.contains("bazaar")) {
            advisory = "Market prices for Wheat are currently stable. Tomato prices are expected to rise by 10 percent this weekend.";
        } else if (query.contains("help") || query.contains("madad")) {
            advisory = "I can help you with crop advice, market prices, and disease detection. Just ask me anything about your farm.";
        } else {
            advisory = "I heard you say: " + query
                    + ". Currently, I am learning more about specialized farming. Can I check your market prices for you?";
        }

        response.put("advisory", advisory);
        return response;
    }
}
