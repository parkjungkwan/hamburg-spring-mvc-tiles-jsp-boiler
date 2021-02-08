package com.example.demo.bkg.service;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface BookingMapper {
	public int insert(Booking booking);
	public List<Booking> selectAll();
	public List<Booking> list();
	public int count();
    public Booking selectById(int bookNum);
    public int update(Booking booking);
    public int delete(Booking booking);
}
