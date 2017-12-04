<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
	<title>芯火签名测试页面</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/index.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>

<style>
.tt{text-align:center;width:100%;height:40px;line-height:40px;background:#ccc;color:#000000;font-size:14px;}
.tc{width:100%;color:#000000;font-size:12px;height:80px;}
.tb{width:100%;color:#000000;font-size:12px;overflow-x:hidden;overflow-y:auto;}
</style>
</head>
<body>
<div style="margin:5px 10px;border:solid 1px #ccc;">
	<div class="tt">排序后的签名串</div>
	<div class="tc">${preStr}</div>
</div>
<div style="margin:5px 10px;border:solid 1px #ccc;">
	<div class="tt">得到的sign值</div>
	<div class="tc">${sign}</div>
</div>
<div style="margin:5px 10px;border:solid 1px #ccc;">
	<div class="tt">提交参数XML格式化</div>
	<textarea readonly="true" class="tb" style="height:180px;">${reqParams}</textarea>
</div>

</body>
</html>
