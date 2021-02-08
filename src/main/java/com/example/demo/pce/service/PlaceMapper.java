package com.example.demo.pce.service;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface PlaceMapper {

	public int insert(Place p);

	public int count();

	public List<Place> list();

	public Place select(String pceNum);

	public int delete(Place p);

	public int update(Place p);

}
