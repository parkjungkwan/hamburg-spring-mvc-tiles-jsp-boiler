package com.example.demo.pce.service;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.cmm.Pagination;

@Service
public class PlaceService{
	@Autowired
	PlaceMapper placeMapper;

	public int add(Place p) {
		return placeMapper.insert(p);
	}

	public int count() {
		return placeMapper.count();
	}

	public List<Place> list(Pagination page) {
		return placeMapper.list().stream()
				.sorted(Comparator.comparing(Place::getPceNum).reversed())
				.skip(page.getStartRow()-1)
				.limit(page.getPageSize())
				.collect(Collectors.toList());
	}

	public Place detail(String pceNum) {
		return placeMapper.select(pceNum);
	}

	public int delete(Place p) {
		return placeMapper.delete(p);
	}

	public int update(Place p) {
		
		return placeMapper.update(p);
	}

}
