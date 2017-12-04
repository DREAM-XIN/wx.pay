<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312" />
<title>微信支付</title>
<meta name="description" content="微信支付" />
<meta name="keywords" content="微信支付" />
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<style>
.tt{text-align:center;width:100%;height:40px;line-height:40px;background:#ccc;color:#000000;font-size:14px;}
.tc{width:100%;color:#000000;font-size:12px;height:80px;}
.tb{width:100%;color:#000000;font-size:12px;overflow-x:hidden;overflow-y:auto;}
</style>
</head>
<body>
<div style="margin:5px 10px;border:solid 1px #ccc;">
	<div class="tt">执行结果</div>
	<div class="tc">${result}</div>
</div>
<div style="margin:5px 10px;border:solid 1px #ccc;">
	<div class="tt">请求报文</div>
	<textarea class="tb" style="height:180px;">${req_message}</textarea>
</div>
<div style="margin:5px 10px;border:solid 1px #ccc;">
	<div class="tt">返回报文</div>
	<textarea class="tb" style="height:180px;">${res_message}</textarea>
</div>
</body>
</html>
