<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<br /><br /><br /><br /><br />
<center>
지점장 인증 페이지 입니다
<hr width="40%" align="center">
<br /><br />
<div id='certifydiv1'>
<input type='password' id='cerpass1' size="6" maxlength="6">
 - <input type='password' id='cerpass2' size="6" maxlength="6">
 - <input type='password' id='cerpass3' size="6" maxlength="6">
 - <input type='password' id='cerpass4' size="6" maxlength="6">
 <br/><br/><br/>
 <button id="certify">인증</button>
 </div>
 <br/><br/>
 <div id='certifydiv2' style='display: none'><font color='green'>인증성공!! 등급이 Master : 지점장으로 수정 되었습니다</font></div>
 <div id='certifydiv3' style='display: none'><font color='green'>인증성공!! 등급이 Admin : 관리자로 수정 되었습니다</font></div>
 <div id='certifydiv4' style='display: none'><font color='red'>인증실패!! 다음 기회에 ...</font></div>
</center>