package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.LearningVideo;
import com.smartfarminganddigitalagriplatform.repository.LearningVideoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LearningVideoService {
    @Autowired
    private LearningVideoRepository repository;

    public List<LearningVideo> getAllVideos() {
        return repository.findAll();
    }

    public Optional<LearningVideo> findById(Long id) {
        if (id == null)
            return Optional.empty();
        return repository.findById(id);
    }

    public LearningVideo saveVideo(LearningVideo video) {
        return repository.save(video);
    }

    public LearningVideo updateVideo(LearningVideo video) {
        return repository.save(video);
    }

    public void deleteVideo(Long id) {
        if (id != null) {
            repository.deleteById(id);
        }
    }
}
