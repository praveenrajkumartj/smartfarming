package com.smartfarminganddigitalagriplatform.controller;

import com.smartfarminganddigitalagriplatform.entity.Equipment;
import com.smartfarminganddigitalagriplatform.repository.EquipmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
public class DebugController {

    @Autowired
    private EquipmentRepository equipmentRepository;

    @GetMapping("/debug/equipment")
    public List<Equipment> debugEquipment() {
        return equipmentRepository.findAll();
    }

    @GetMapping("/debug/equipment/unapproved")
    public List<Equipment> debugUnapproved() {
        return equipmentRepository.findByIsApprovedFalse();
    }

    @GetMapping("/debug/equipment/admin-dash")
    public int debugAdminDash() {
        int count1 = equipmentRepository.findByIsAvailableTrueAndIsApprovedTrueAndOwnerNot(null).size();
        int count2 = equipmentRepository.findByOwner(null).size();
        return count1 + count2;
    }

    @GetMapping("/debug/admin-dash-render")
    public String renderDash(org.springframework.ui.Model model) {
        // simulate dashboard logic
        return "forward:/admin/dashboard"; // let the actual controller handle it
    }

    @GetMapping("/debug/admin-approvals-render")
    public String renderApprovals() {
        return "forward:/admin/equipment-approvals";
    }
}
