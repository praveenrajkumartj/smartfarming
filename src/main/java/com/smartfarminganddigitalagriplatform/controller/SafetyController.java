package com.smartfarminganddigitalagriplatform.controller;

import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/farmer")
public class SafetyController {

    @Autowired
    private UserService userService;

    private User getCurrentUser(Authentication auth) {
        return userService.findByEmail(auth.getName()).orElseThrow();
    }

    @GetMapping({ "/safety", "/safety-hub" })
    public String safetyDashboard(Authentication auth, Model model) {
        model.addAttribute("user", getCurrentUser(auth));
        return "farmer/safety-hub";
    }

    @PostMapping("/safety/sos")
    @ResponseBody
    public Map<String, Object> triggerSOS(Authentication auth) {
        User user = getCurrentUser(auth);
        Map<String, Object> response = new HashMap<>();

        // In a real app, this would trigger SMS/Email alerts to emergency contacts
        System.out.println("🚨 SOS ALERT TRIGGERED BY: " + user.getFullName() + " at " + user.getDistrict() + ", "
                + user.getState());

        response.put("success", true);
        response.put("status", "success");
        response.put("message",
                "Emergency Alert Broadcasted! Assistance is being coordinated with local authorities in "
                        + user.getDistrict());
        return response;
    }

    @GetMapping("/safety/snake-bite")
    public String snakeBiteSafety(Authentication auth, Model model) {
        model.addAttribute("user", getCurrentUser(auth));
        return "farmer/safety/snake-bite";
    }

    @GetMapping("/safety/electrical")
    public String electricalSafety(Authentication auth, Model model) {
        model.addAttribute("user", getCurrentUser(auth));
        return "farmer/safety/electrical";
    }

    @GetMapping("/safety/night-farming")
    public String nightFarmingSafety(Authentication auth, Model model) {
        model.addAttribute("user", getCurrentUser(auth));
        return "farmer/safety/night-farming";
    }

    @GetMapping("/safety/pesticide")
    public String pesticideSafety(Authentication auth, Model model) {
        model.addAttribute("user", getCurrentUser(auth));
        return "farmer/safety/pesticide";
    }

    @GetMapping("/safety/hardware")
    public String hardwareSafety(Authentication auth, Model model) {
        model.addAttribute("user", getCurrentUser(auth));
        return "farmer/safety/hardware";
    }

    @GetMapping("/safety/thermal")
    public String thermalSafety(Authentication auth, Model model) {
        model.addAttribute("user", getCurrentUser(auth));
        return "farmer/safety/thermal";
    }
}
