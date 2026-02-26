package com.smartfarminganddigitalagriplatform.service;

import com.smartfarminganddigitalagriplatform.entity.MarketPrice;
import com.smartfarminganddigitalagriplatform.repository.MarketPriceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class MarketPriceService {

    @Autowired
    private MarketPriceRepository marketPriceRepository;

    public List<MarketPrice> getAllPrices() {
        return marketPriceRepository.findAll();
    }

    public List<MarketPrice> searchByCrop(String cropName) {
        return marketPriceRepository.findByCropNameContainingIgnoreCase(cropName);
    }

    public List<MarketPrice> getByState(String state) {
        return marketPriceRepository.findByState(state);
    }

    public List<MarketPrice> getByStateAndDistrict(String state, String district) {
        return marketPriceRepository.findByStateAndDistrict(state, district);
    }

    public List<String> getDistinctCropNames() {
        return marketPriceRepository.findDistinctCropNames();
    }

    public List<String> getDistinctStates() {
        return marketPriceRepository.findDistinctStates();
    }

    public MarketPrice savePrice(MarketPrice price) {
        return marketPriceRepository.save(price);
    }

    public Optional<MarketPrice> getPriceById(Long id) {
        return marketPriceRepository.findById(id);
    }

    public void deletePrice(Long id) {
        marketPriceRepository.deleteById(id);
    }

    public long getTotalPrices() {
        return marketPriceRepository.count();
    }
}
