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

    public List<GovernmentScheme> getByCategory(@org.springframework.lang.NonNull String category) {
        return schemeRepository.findByCategory(category);
    }

    public List<GovernmentScheme> searchByTitle(@org.springframework.lang.NonNull String title) {
        return schemeRepository.findByTitleContainingIgnoreCase(title);
    }

    public GovernmentScheme saveScheme(@org.springframework.lang.NonNull GovernmentScheme scheme) {
        return schemeRepository.save(scheme);
    }

    public Optional<GovernmentScheme> getSchemeById(@org.springframework.lang.NonNull Long id) {
        return schemeRepository.findById(id);
    }

    public void deleteScheme(@org.springframework.lang.NonNull Long id) {
        schemeRepository.deleteById(id);
    }

    public long getTotalSchemes() {
        return schemeRepository.count();
    }
}
