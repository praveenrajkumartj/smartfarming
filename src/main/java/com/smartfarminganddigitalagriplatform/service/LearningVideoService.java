package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.LearningVideo;
import com.smartfarminganddigitalagriplatform.repository.LearningVideoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LearningVideoService {
    @Autowired
    private LearningVideoRepository repository;

    public List<LearningVideo> getAllVideos() {
        return repository.findAll();
    }

    public LearningVideo saveVideo(LearningVideo video) {
        return repository.save(video);
    }

    public void deleteVideo(Long id) {
        repository.deleteById(id);
    }
}
