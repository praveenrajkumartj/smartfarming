package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.GovernmentScheme;
import com.smartfarminganddigitalagriplatform.repository.GovernmentSchemeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class GovernmentSchemeService {

    @Autowired
    private GovernmentSchemeRepository schemeRepository;

    public List<GovernmentScheme> getAllSchemes() {
        return schemeRepository.findAll();
    }

    public List<GovernmentScheme> getActiveSchemes() {
        return schemeRepository.findByActiveTrue();
    }

    public List<GovernmentScheme> getByCategory(String category) {
        return schemeRepository.findByCategory(category);
    }

    public List<GovernmentScheme> searchByTitle(String title) {
        return schemeRepository.findByTitleContainingIgnoreCase(title);
    }

    public GovernmentScheme saveScheme(GovernmentScheme scheme) {
        return schemeRepository.save(scheme);
    }

    public Optional<GovernmentScheme> getSchemeById(Long id) {
        return schemeRepository.findById(id);
    }

    public void deleteScheme(Long id) {
        schemeRepository.deleteById(id);
    }

    public long getTotalSchemes() {
        return schemeRepository.count();
    }
}
