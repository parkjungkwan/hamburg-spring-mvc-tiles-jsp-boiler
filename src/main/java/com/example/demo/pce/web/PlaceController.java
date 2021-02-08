package com.example.demo.pce.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.cmm.Pagination;
import com.example.demo.pce.service.Place;
import com.example.demo.pce.service.PlaceService;

@RestController
public class PlaceController {
	@Autowired
	PlaceService placeService;
	
	@PostMapping("/place")
	public Map<?,?> add(@RequestBody Place p) {
		var map = new HashMap<>();
		int res = placeService.add(p);
		map.put("message",res==1?"SUCCESS":"FAILURE");
		return map;
	}
	
	@GetMapping("/place/{size}/{num}")
	public Map<?,?> list(@PathVariable String size,@PathVariable String num){
		var map = new HashMap<>();
		var page = new Pagination("Places", Integer.parseInt(size), Integer.parseInt(num), placeService.count());
		map.put("list",placeService.list(page));
		map.put("page",page);
		return map;
	}
	
	@GetMapping("/place/{pceNum}")
	public Place detail(@PathVariable String pceNum) {
		return placeService.detail(pceNum);
	}
	
	@PutMapping("/place")
	public Map<?,?> update(@RequestBody Place p){
		var map = new HashMap<>();
		int res = placeService.update(p);
		map.put("message",res==1?"SUCCESS":"FAILURE");
		return map;
	}
	
	@DeleteMapping("/place")
	public Map<?,?> delete(@RequestBody Place p){
		var map = new HashMap<>();
		int res = placeService.delete(p);
		map.put("message",res==1?"SUCCESS":"FAILURE");
		return map;
	}
}
