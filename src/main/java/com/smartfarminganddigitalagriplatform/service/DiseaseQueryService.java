package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.DiseaseQuery;
import com.smartfarminganddigitalagriplatform.entity.User;
import com.smartfarminganddigitalagriplatform.repository.DiseaseQueryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class DiseaseQueryService {

    @Autowired
    private DiseaseQueryRepository diseaseQueryRepository;

    public List<DiseaseQuery> getAllQueries() {
        return diseaseQueryRepository.findAll();
    }

    public List<DiseaseQuery> getQueriesByUser(User user) {
        return diseaseQueryRepository.findByUserOrderByCreatedAtDesc(user);
    }

    public List<DiseaseQuery> getPendingQueries() {
        return diseaseQueryRepository.findByStatus(DiseaseQuery.Status.PENDING);
    }

    public DiseaseQuery saveQuery(DiseaseQuery query) {
        return diseaseQueryRepository.save(query);
    }

    public Optional<DiseaseQuery> getQueryById(Long id) {
        return diseaseQueryRepository.findById(id);
    }

    public long getPendingCount() {
        return diseaseQueryRepository.countByStatus(DiseaseQuery.Status.PENDING);
    }

    public long getTotalQueries() {
        return diseaseQueryRepository.count();
    }

    public void deleteQuery(Long id) {
        diseaseQueryRepository.deleteById(id);
    }
}
