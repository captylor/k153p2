function sendId(){
	//아이디 입력 여부 검사
	//아이디 입력여부 검사
	if(document.aaa.id.value=="")
	{
	 alert("아이디를 입력하지 않았습니다.")
	 document.aaa.id.focus()
	 return
	}
	//아이디 유효성 검사 (영문소문자, 숫자만 허용)
	for (i=0; i<document.aaa.id.value.length; i++)
	{
	 ch=document.aaa.id.value.charAt(i)
	  if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z'))
	  {
	  alert ("아이디는 소문자, 숫자만 입력가능합니다.")
	  document.aaa.id.focus()
	  document.aaa.id.select()
	  return
	  }
	}
	//아이디에 공백 사용하지 않기
	if (document.aaa.id.value.indexOf(" ")>=0)
	{
	 alert("아이디에 공백을 사용할 수 없습니다.")
	 document.aaa.id.focus()
	 document.aaa.id.select()
	 return
	}
	//아이디 길이 체크 (6~12자)
	if (document.f.id.value.length<6 || document.f.id.value.length>12)
	{
	 alert ("아이디를 6~12자까지 입력해주세요.")
	 document.f.id.focus()
	 document.f.id.select()
	 return
	}
}