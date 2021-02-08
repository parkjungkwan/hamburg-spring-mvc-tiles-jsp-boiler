package com.example.demo.pce.service;

import org.springframework.stereotype.Component;

import lombok.Data;

/*
	create table places(
		pce_num int primary key auto_increment,
		name varchar(20),
		address varchar(100),
		phone_number varchar(50),
		category varchar(20),
		city varchar(20),
		placeImg text
	);
 */
@Component @Data
public class Place {
	private int pceNum;
	private String name,address,phoneNumber,category,city,placeImg;
}
