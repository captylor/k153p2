<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Happy Cafe</title>
<script src='/k153p2/js/jquery-3.2.1.min.js'></script>
<script type="text/javascript">
var t = 0;

function moveit() {
    t += 0.05;

    var r = 100;         // radius
    var xcenter = 370;   // center X position
    var ycenter = 250;   // center Y position
	
    var newLeft;
    var newTop;
    
	    if(t<4.5){
		    newLeft = Math.floor(xcenter + (r * Math.cos(t)));
		    newTop = Math.floor(ycenter + (r * Math.sin(t)));
	    }else if(t<9){
	    	newLeft = Math.floor(xcenter + (r * Math.cos(t)));
		    newTop = Math.floor(ycenter - (r * Math.sin(t)));
		    
	    }else{
	    	newLeft = Math.floor(xcenter + (100/(t-9)/(t-9) * r * Math.cos(t)));
		    newTop = Math.floor(ycenter - (100/(t-9)/(t-9) * r * Math.sin(t)));
	    }
 
     $('img').animate({
        top: newTop,
        left: newLeft,
    }, 1, function() {
        moveit();
    });
}

$(document).ready(function() {
    moveit();
});
</script>

</head>
<body>
<center>
<a href='/k153p2/main.do'><img src='/k153p2/img/bg.png' style="position: absolute;height: 200px; width: auto;"></a>
</center>
</body>
</html>