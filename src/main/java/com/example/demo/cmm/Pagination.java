package com.example.demo.cmm;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.NoArgsConstructor;

@Component("page") @Data @Lazy @NoArgsConstructor
public class Pagination {
	private int totalCount,startRow,endRow,
				pageCount,pageSize,startPage,endPage,pageNum,
				blockCount,nextBlock,prevBlock,blockNum;
	
	public final int BLOCK_SIZE = 5;
	private String tname;
	private boolean existPrev,existNext;
	
	public Pagination(String tname,int pageSize,int pageNum,int count) {
		this.tname=tname;
		this.pageSize=pageSize;
		this.pageNum=pageNum;
		totalCount = count;
		pageCount = (totalCount%pageSize!=0)?totalCount/pageSize+1:(totalCount/pageSize);
		blockCount = (pageCount%BLOCK_SIZE!=0)?pageCount/BLOCK_SIZE+1:pageCount/BLOCK_SIZE;
		startRow = (pageNum-1)*pageSize+1;
		endRow = pageNum<pageCount?pageNum*pageSize:totalCount;
		blockNum = (pageNum-1) / BLOCK_SIZE+1;
		startPage=(blockNum-1)*BLOCK_SIZE+1;
		endPage=blockNum<blockCount?blockNum*BLOCK_SIZE:pageCount;
		existPrev = blockNum !=1;
		existNext = blockNum < blockCount;
		nextBlock = startPage + BLOCK_SIZE;
		prevBlock = startPage - BLOCK_SIZE;
	}
}
