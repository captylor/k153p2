function side_load(pageName) { //요청
	sendRequest(pageName, null, side_loaded, 'POST');
//document.getElementById("sidebar").innerHTML = "aaaa"; //왜 이 부분이 들어가냐 사이드 바 메뉴가 나오는??/
}
function side_loaded() { //콜백
	//데이터요청한 후 할일
	if (xhr.readyState == 4 && xhr.status == 200) {
		var str = xhr.responseText; //str: String ==> "Hello,Ajax~!!" 
		console.log(str);
		var content = document.getElementById('sidebar');
		console.log(typeof (content));
		content.innerHTML = str;
	}
}	

