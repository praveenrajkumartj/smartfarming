package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.EquipmentRental;
import com.smartfarminganddigitalagriplatform.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface EquipmentRentalRepository extends JpaRepository<EquipmentRental, Long> {
    List<EquipmentRental> findByRenter(User renter);

    List<EquipmentRental> findByEquipmentOwner(User owner);

    List<EquipmentRental> findByEquipment(com.smartfarminganddigitalagriplatform.entity.Equipment equipment);
}
