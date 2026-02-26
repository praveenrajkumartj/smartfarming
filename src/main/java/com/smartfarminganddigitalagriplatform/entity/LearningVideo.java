package com.smartfarminganddigitalagriplatform.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "learning_videos")
public class LearningVideo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false, length = 500)
    private String description;

    @Column(nullable = false)
    private String category; // e.g., "crop", "organic", "disease", "machinery"

    // Only storing the YouTube video ID or the embed URL
    @Column(nullable = false)
    private String videoUrl;

    public LearningVideo() {
    }

    public LearningVideo(String title, String description, String category, String videoUrl) {
        this.title = title;
        this.description = description;
        this.category = category;
        this.videoUrl = videoUrl;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }
}
