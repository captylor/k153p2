<%@page import="com.kosta.k153p2.login.dto.MemberInfo"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.kosta.k153p2.admin.dto.StoreInfo"%>
<%@page import="com.kosta.k153p2.admin.dao.StoreInfoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- admin_Manager_Registration.jsp에서 받은 값으로 db에 저장  매장 등록--%>
<%
	request.setCharacterEncoding("UTF-8");
	MemberInfo info = (MemberInfo) session.getAttribute("loginInfo");

	String data[] = URLDecoder.decode(request.getParameter("data"), "UTF-8").split("&");//직렬화에 따른 한글 깨짐 방지
	String store_name[] = data[0].split("=");//0=변수 1=변수 값
	String store_addr2[] = data[1].split("=");
	String store_tel[] = data[2].split("=");

	String arritemlist[] = data[3].split("=");
	String itemlist[] = arritemlist[1].split("%");

	System.out.println("store_name :" + store_name[1] + " itemlist 사이즈 : " + itemlist.length);

	StoreInfoDao dao = new StoreInfoDao();
	StoreInfo store = new StoreInfo(store_name[1], store_addr2[1], store_tel[1], arritemlist[1]);
	store.setStore_owner(info.getMember_id());

	System.out.println("뭐여 가지고 있는 지점 갯수 : " + dao.sel_count_owner(info.getMember_id()));
	if (dao.sel_count_owner(info.getMember_id()) <= 0) {//지장장이 가지고 있는 지점의 갯수를 1개로 제한 이유... 2개면 관리부분 쓰기 귀찮음.
		boolean result = dao.insert(store);
		if (result) {
			for (int i = 0; i < itemlist.length; i++) {
				System.out.println(i + "번째 아이템 : " + itemlist[i]);
				dao.insert_init_stock(dao.sel_STOREINFO_SEQ(), Integer.parseInt( itemlist[i]));
			}
			out.print("success");
		} else {
			out.print("fail");
		}
	} else {
		out.print("지점장은 1개의 지점만 가질수 있습니다");
	}

	out.flush();//버퍼를 모두 지운다
%>
