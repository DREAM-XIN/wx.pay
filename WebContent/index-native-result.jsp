<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312" />
<title>微信支付</title>
<meta name="description" content="微信支付" />
<meta name="keywords" content="微信支付" />
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
<link href="css/style.css" type="text/css" rel="stylesheet" />

	<script type="text/javascript">
	   var timer;
		$(function(){
			var handler = function(){
				var out_trade_no = $('input[name=out_trade_no]').val();
				$.post("testPayResultQuery?out_trade_no="+out_trade_no,null,function(msg){
					//alert(msg);
					if(msg == '1'){
// 						alert("支付成功");
						document.location.href="pay_success.jsp";
						clearInterval(timer);
					}
				});
			}
			timer = setInterval(handler , 5000);
		});
	</script>
<style>
.tt{text-align:center;width:100%;height:40px;line-height:40px;background:#ccc;color:#000000;font-size:14px;}
li{
height:50px;line-height:50px;font-size:14px;color:#000000;list-style-type:none;
}
</style>
</head>
<body>
<div style="margin:5px 10px;border:solid 1px #ccc;height:">
	<div class="tt">订单提交成功，请您尽快完成付款，否则订单会自动取消</div>
	<div style="margin-left:50px;text-align:center;">
	<ul>
	<li>订单号:${out_trade_no}</li>
	<li>商品名称:${body}</li>
	<li>订单金额:${total_fee/100}元</li>
	</ul></div>
	<div style="text-align:center;"><img width="288" height="288" src="http://pan.baidu.com/share/qrcode?w=150&h=150&url=${code_url}"/></div>
	<br><br>
</div>

</body>
</html>
