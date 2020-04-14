package com.todaylesson.DTO;

public class PageMaker {

	private int currPage;
	private int totalCount;
	private int pageSize;
	private int blockSize;
		
	private int startRow;
	private int endRow;

	private int startBlock;
	private int endBlock;

	private boolean prev;
	private boolean next;

		
		public PageMaker(int currPage,int totalCount, int pageSize, int blockSize)
		{
			this.currPage=currPage;
			this.totalCount=totalCount;
			this.pageSize=pageSize;
			this.blockSize=blockSize;
			calData();
		}
		
		private void calData()
		{
			startRow=(currPage-1)*pageSize;
			endRow=startRow+pageSize;
			//System.out.println(endRow+","+startRow);
			if(endRow>totalCount)
			{
				endRow=totalCount;
			}
			
			int totalpage=(int)Math.ceil(totalCount/(float)pageSize);
			
			startBlock=((currPage-1)/blockSize)*blockSize+1;
			endBlock=startBlock+blockSize-1;
			
			if(endBlock>totalpage)
				endBlock=totalpage;
			
			prev=(startBlock==1)? false:true;
			next=(endBlock <totalpage)? true:false;
			
		}

		public boolean isPrev() {
			return prev;
		}

		public void setPrev(boolean prev) {
			this.prev = prev;
		}

		public boolean isNext() {
			return next;
		}

		public void setNext(boolean next) {
			this.next = next;
		}

		public int getStartRow() {
			return startRow;
		}

		public int getEndRow() {
			return endRow;
		}

		public int getStartBlock() {
			return startBlock;
		}

		public int getCurrPage() {
			return currPage;
		}

		public void setCurrPage(int currPage) {
			this.currPage = currPage;
		}

		public int getEndBlock() {
			return endBlock;
		}



	 
	}



	
	

