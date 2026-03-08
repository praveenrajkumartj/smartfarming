package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.Equipment;
import com.smartfarminganddigitalagriplatform.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EquipmentRepository extends JpaRepository<Equipment, Long> {
    List<Equipment> findByOwner(User owner);

    List<Equipment> findByIsAvailableTrueAndIsApprovedTrueAndOwnerNot(User owner);

    List<Equipment> findByIsApprovedFalse();

    List<Equipment> findByStateContainingIgnoreCaseAndIsAvailableTrueAndIsApprovedTrueAndOwnerNot(String state,
            User owner);

    List<Equipment> findByTypeAndIsAvailableTrueAndIsApprovedTrueAndOwnerNot(String type, User owner);

    List<Equipment> findByTypeAndStateContainingIgnoreCaseAndIsAvailableTrueAndIsApprovedTrueAndOwnerNot(String type,
            String state, User owner);
}
