package com.example.demo.bkg.service;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component @Data @AllArgsConstructor @Lazy @NoArgsConstructor
public class Booking {
	private int bookNum;
	private String showTitle, showDate, showLocation, showPrice, bookId, bookName, bookEmail, bookPnumber;
}
