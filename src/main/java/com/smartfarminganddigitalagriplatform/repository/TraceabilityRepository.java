package com.smartfarminganddigitalagriplatform.repository;

import com.smartfarminganddigitalagriplatform.entity.TraceabilityRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface TraceabilityRepository extends JpaRepository<TraceabilityRecord, Long> {
    Optional<TraceabilityRecord> findByTraceabilityId(String traceabilityId);
}
