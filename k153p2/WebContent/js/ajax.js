
var xhr=null;

function setXMLHttpRequest() { //XMLHttpRequest객체생성함수
	if (window.ActiveXObject) {//현재 브라우저가 ActiveXObject를 지원한다면(IE라면)
		try {
			xhr= new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e) {
			try {
				xhr= new ActiveXObject("Microsoft.XMLHTTP");
			} catch(e1) { return null; }
		}
	} else if (window.XMLHttpRequest) {
		//현재 브라우저가 XMLHttpRequest를 지원한다면 (크롬,사파리,오페라,IE버전11 이상)
		xhr=new XMLHttpRequest();
	}
}//setXMLHttpRequest

/*
    <XMLHttpRequest객체> 
     ---> xhr
     
     속성)
     xhr.readyState : 0~4, 서버에게 URL요청부터 응답까지를 정수로 표현
         0(아무일없음), 1(open호출), 2(send호출), 3(데이터를 받는중), 4(데이터를 다 받음)
     xhr.status : 서버의 상태를 숫자 코드로 표현 
              200(OK), 404(페이지없음), 500(서버실행중 에러)
     xhr.onreadystatechange : readyState의 정수값이 변할 때를 표현하는 이벤트 속성
              사용예)  xhr.onreadystatechange=콜백함수명;
     xhr.responseText : 응답데이터를 텍스트로 얻기(리턴 String)
          var str =  xhr.responseText;//"홍길동,길라임,김주원"
                var array = str.split(",");
                
     xhr.responseXML  : 응답데이터를 XML객체로 얻기(리턴 Document)
          var doc = xhr.responseXML;
               
     메소드)
    
     xhr.open('HTTP요청방식(POST,GET)','요청URL',비동기); 
     xhr.send('전달할 파라미터');
     
     사용예1)
     xhr.open('GET','hello.jsp',true);   
       xhr.send(null); ----> 전달할 파라미터 없음을 의미  
     xhr.open('GET','hello2.jsp?username=gildong',true);
       xhr.send(null);
       
     사용예2)
     xhr.open('POST','hello2.jsp');
     xhr.send('username=gildong');
 */


function sendRequest(url, params, callback, method) {//사용자 정의 함수
	setXMLHttpRequest();
	var httpMethod = method ? method : 'GET';
	if (httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';
	}
	var httpParams = (params == null || params == '') ? null : params;
	var httpUrl = url;
	if (httpMethod == 'GET' && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}
	xhr.open(httpMethod, httpUrl, true);
	xhr.setRequestHeader(
		'Content-Type', 'application/x-www-form-urlencoded');
        //웹서버에 전송할 컨텐트타입지정
	xhr.onreadystatechange = callback; //호출될 콜백함수 지정
	xhr.send(httpMethod == 'POST' ? httpParams : null);
        //HTTP요청방식이 POST이면 send()함수를 통해 파라미터 전송
}//sendRequest
