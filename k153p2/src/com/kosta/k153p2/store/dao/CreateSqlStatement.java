package com.kosta.k153p2.store.dao;

import java.util.Random;

public class CreateSqlStatement {
	
	static Random r;
	String[] store_item;
	int[] master_Price;
	
	public CreateSqlStatement() {
		r = new Random();
		store_item = new String[81];
		master_Price = new int[256];
	}
	
	public void memberinfo(){
		System.out.println("--insert memberinfo========================================================================================");
		for (int i = 1; i < 1000; i++) {
			String id = "member"+i;
		    
		    String email = id + "@kosta.com";
		    
		    String grade;
		    if(i%128==0){
				grade = "A";
			}else if(i%12==0){
				grade = "M";
			}else{
				grade = "U";
			}
		    
		    String icon = "/img/user/"+id+".jpg";
		    //'"+
		    //+"'
		    //아이디, 비밀번호, 유저이름, 이메일, 등급, 이미지경로
			//member_id, member_pass, member_name, member_email, member_grade, member_icon
			System.out.println("insert into memberinfo "
					+ " (member_id, member_pass, member_name, member_email, member_grade, member_icon) " + " values "
					+ " ('"+id+"', '"+id+"', '"+id+"', '"+email+"', '"+grade+"', '"+icon+"');");
		}//memberinfo for
		System.out.println("commit;");
		System.out.print("\n\n\n\n\n");
	}//memberinfo
	
	public void storeinfo(){
		System.out.println("--insert storeinfo========================================================================================");
		int count = 0;
		for(int i=1;i<1000;i++){
			if(i%128==0){
				//아무것도 안 함
			}else if (i%12==0) {
				count++;
				String sname = "store" + count;
				String ownid = "member" + i;
				
				String tel, tel2_str, tel3_str;
				int tel2 = r.nextInt(10000);
				int tel3 = r.nextInt(10000);
				if (tel2 < 10) {
					tel2_str = "-000" + tel2;
				} else if (tel2 < 100) {
					tel2_str = "-00" + tel2;
				} else if (tel2 < 1000) {
					tel2_str = "-0" + tel2;
				} else {
					tel2_str = "-" + tel2;
				}
				if (tel3 < 10) {
					tel3_str = "-000" + tel3;
				} else if (tel3 < 100) {
					tel3_str = "-00" + tel3;
				} else if (tel3 < 1000) {
					tel3_str = "-0" + tel3;
				} else {
					tel3_str = "-" + tel3;
				}
				tel = "010" + tel2_str + tel3_str;
				String prod = "";
				for (int j = 0; j < 64; j++) {
					prod += Integer.toHexString(r.nextInt(16));
				}
				store_item[count-1] = prod;
				
				int year = r.nextInt(20) + 2000;
				int month = r.nextInt(12);
				int day = r.nextInt(28);
				String month_str, day_str;
				if (month < 10) {
					month_str = "-0" + month;
				} else {
					month_str = "-" + month;
				}
				if (day < 10) {
					day_str = "-0" + day;
				} else {
					day_str = "-" + day;
				}
				String open = year + month_str + day_str;
				int addr = r.nextInt(4845) + 1;
				String photo = "/img/store/" + sname + ".jpg";
				String adminid = "member"+(128*((count%7)+1));
				//'"+
				//+"'
				//지점번호, 지점소유자의 아이디, 지점명, 지점주소, 지점의 나머지주소, 전화번호, 판매하는제품, 지점의 오픈날짜, 지점사진경로
				//store_no, store_owner, store_name, store_addr, store_addr2, store_tel, store_product, store_openday, store_photo
				System.out.println("insert into storeinfo "
						+ " (store_no, store_owner, store_name, store_addr, store_addr2, store_tel, store_product, store_openday, store_photo, store_admin) "
						+ " values " + " (storeinfo_seq.nextval, '" + ownid + "', '"
						+ sname + "', '" + addr + "', 'ABC빌딩 F층', '" + tel + "', '" + prod + "', '" + open + "', '"
						+ photo + "', '"+adminid+"');");
			}
		}//for
		System.out.println("commit;");
		System.out.print("\n\n\n\n\n");
	}//storeinfo
	
	public void itemtypeinfo(){
		System.out.println("--insert itemtypeinfo========================================================================================");
		
		for (int i = 1; i < 10; i++) {
			String itemtype = "itemtype"+i;
			//아이템타잎(카테고리)넘버, 아이템타잎(카테고리)
			//itemType_no, itemType
			System.out.println(
					"insert into itemtypeinfo (itemType_no, itemType) values (itemtypeinfo_seq.nextval, '"+itemtype+"');");
		}//for
		System.out.println("commit;");
		System.out.print("\n\n\n\n\n");
	}//itemtypeinfo
	
	public void iteminfo(){
		System.out.println("--insert iteminfo========================================================================================");
		for (int i = 1; i < 257; i++) {
			String item = "item"+i;
			int masterPrice = (r.nextInt(9)+1) * 1000;
			master_Price[(i-1)] = masterPrice;
			int userPrice = masterPrice + 2000;
			int typeNo = (i%9)+1;
			String ele="";
			for (int j = 0; j < 64; j++) {
				ele += Integer.toHexString(r.nextInt(16));
			}
			
			String photo = "/img/item/" + item + ".jpg";
			
			//아이템번호, 아이템이름, 아이템소비자가격, 입고단가, 아이템의 타잎, 아이템을 구성하는 요소
			//item_no, item_name, item_userPrice, item_masterPrice, itemType_no, item_element , item_photo
			System.out.println("insert into iteminfo "
					+ " (item_no, item_name, item_userPrice, item_masterPrice, itemType_no, item_element, item_photo) " + " values "
					+ " (iteminfo_seq.nextval, '"+item+"', '"+userPrice+"', '"+masterPrice+"', '"+typeNo+"', '"+ele+"', '"+photo+"');");
		}//for
		System.out.println("commit;");
		System.out.print("\n\n\n\n\n");
		
	}//iteminfo
	
	public void boardinfo(){
		System.out.println("--insert boardinfo========================================================================================");
		
		for(int i=1; i<257; i++){
			
			String id = "member"+(r.nextInt(999)+1);
			String title = "게시글 ["+i+"] 번입니다";
			String text = "["+i+"] 번 게시글의 본문입니다";
		//게시글번호, 게시글 작성자아이디, 제목, 게시글본문, 최초작성날짜와 시각, 마지막수정날짜와 시각
		//board_no, member_id, board_title, board_text, board_date, board_lastupdate
			System.out.println("insert into boardinfo "
					+ " (board_no, member_id, board_title, board_text, board_date, board_lastupdate) " + " values "
					+ " (boardinfo_seq.nextval, '"+id+"', '"+title+"', '"+text+"', sysdate-"+(300-i)+", sysdate-"+(290-i)+");");
		}
		System.out.println("commit;");
		System.out.print("\n\n\n\n\n");
	}//boardinfo
	
	public void replyinfo(){
		System.out.println("--insert replyinfo========================================================================================");
		
		for (int i = 1; i < 1025; i++) {
			int no = (i%256)+1;
			String id = "member"+(r.nextInt(998)+1);
			int x;
			if(i<257){
				x=1;
			}else if(i<513){
				x=2;
			}else if(i<769){
				x=3;
			}else{
				x=4;
			}
			
			String text = "["+no + "] 번 게시글에 대한 댓글 "+x+"입니다";
			
			//게시글번호, 댓글을 작성한 유저의 아이디, 댓글을 단 날짜시각, 댓글내용, 싫어요 횟수
			//board_no, reply_id, reply_date, reply_text, reply_dislike
			System.out.println("insert into replyinfo "
					+ " (board_no, reply_id, reply_date, reply_text, reply_dislike) " + " values "
					+ " ("+no+", '" + id + "', sysdate, '" + text + "', 0);");
		}//for
		System.out.println("commit;");
		System.out.print("\n\n\n\n\n");
	}//replyinfo
	
	public void orderANDputANDstockinfo(){
		System.out.println("--insert orderinfo, putinfo, stockinfo========================================================================================");
		
		//가상 데이터의 지점수 : 81개
		for (int i = 0; i < store_item.length; i++) {//지점수
			for (int j = 0; j < 64; j++) {
				String item = hex2bin(store_item[i].substring(j, j+1));
				for (int k = 0; k < 4; k++) {
					if (item.substring(k, k+1).equals("1")) {
						int itemno = 4*j + k + 1;
						
						int amount = (r.nextInt(9) + 1)*50;
						
						//수주(발주)번호 , 지점번호, 아이템번호, 수주(발주)수량, 수주(발주)날짜와 시각
						//order_no, store_no, item_no, order_amount, order_date, order_handle
						System.out.println("insert into orderinfo "
								+ " (order_no, store_no, item_no, order_amount, order_date, order_handle) " + " values "
								+ " (orderinfo_seq.nextval, " + (i+1) + ", "+itemno+", " + amount + ", sysdate-1, '처리됨');");
						
						
						//입고번호, 지점번호, 아이템번호, 입고수량, 입고단가, 입고일, 유통기한
						//put_no, store_no, item_no, put_amount, put_price, put_date, put_expiration
						System.out.println("insert into putinfo "
								+ " (put_no, store_no, item_no, put_amount, put_price, put_date, put_expiration) " + " values "
								+ " (putinfo_seq.nextval, "+(i+1)+", " + itemno + ", "+(amount-10)+", " + master_Price[itemno-1] + ", sysdate, to_char(sysdate+30, 'yyyy-mm-dd-hh'));");
						
						
						//지점번호, 아이템번호, 재고갯수
						//store_no, item_no, stock_amount
						System.out.println("insert into stockinfo " + " (store_no, item_no, stock_amount) " + " values "
								+ " (" + (i+1) + ", " + itemno + ", " + (amount-20) + ");");
					}
				}
			} //for
		}
		System.out.println("commit;");
		System.out.print("\n\n\n\n\n");
	}//stockinfo
	
	public String hex2bin(String hex){
		String bin="";
		String[] hex2bin = {"0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"};
		int hex2int = Integer.parseInt(hex, 16);
		bin = hex2bin[hex2int];
		return bin;
	}
	
	
	
	public static void main(String[] args) {
		CreateSqlStatement selfclass = new CreateSqlStatement();
		
		selfclass.memberinfo();
		selfclass.storeinfo();
		selfclass.itemtypeinfo();
		selfclass.iteminfo();
		selfclass.boardinfo();
		selfclass.replyinfo();
		selfclass.orderANDputANDstockinfo();
		
		
		
	}//main
}//calss
