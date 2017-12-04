<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>芯火微信支付撤销订单测试页面</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="css/index.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
			function doSubmit(){
				
				var out_trade_no = $.trim($('input[name=out_trade_no]').val());
				var transaction_id = $.trim($('input[name=transaction_id]').val());
				var pass_trade_no = $.trim($('input[name=pass_trade_no]').val());
				if(out_trade_no == '' && transaction_id == ''&& pass_trade_no == ''){
					alert('商户订单号、通道订单号和微信订单号至少填一个');
					return false;
				}
				$("form").submit();
			}
			$(function(){
				$('.hideClass').hide();
			});
		</script>
	</head>
<body text=#000000 bgColor="#ffffff" leftMargin=0  topMargin=4>
	<div id="main">
        <div class="cashier-nav">
            <ol>
				<li class="current">微信支付撤销订单(只能撤销刷卡支付订单)</li> 
            </ol>
        </div>
        <form action="testReverse" method="post">
            <div id="body" style="clear:left">
                <dl class="content">
                    
					<dt class="hideClass">版本号：</dt>
					<dd class="hideClass">
						<span class="null-star"></span>
						<input size="30" name="version" value="1.0.4" readonly="readonly" maxlength="8"  placeholder="长度8"/>
						<span>(长度8)</span>
						<span></span>
					</dd>
					
                    <dt>商户订单号：</dt>
                    <dd>
                        <span class="null-star"></span>
                        <input name="out_trade_no" value="" maxlength="32" size="30"  placeholder="长度32"/>
                        <span>(长度32)</span>
                        <span></span>
                    </dd>
                    <dt>通道订单号：</dt>
                    <dd>
                        <span class="null-star"></span>
                        <input name="pass_trade_no" value="" maxlength="32" size="30"  placeholder="长度32"/>
                        <span>(长度32)</span>
                        <span></span>
                    </dd>
                    <dt>微信订单号：</dt>
                    <dd>
                        <span class="null-star"></span>
                        <input name="transaction_id" value="" maxlength="32" size="30"  placeholder="长度32"/>
                        <span>(长度32)</span>
                        <span></span>
                    </dd>
                    
                    <dt></dt>
                    <dd>
                        <span class="new-btn-login-sp">
                            <button class="new-btn-login" type="button" onclick="doSubmit()" style="text-align:center;">确 认</button>
                        </span>
                    </dd>
                </dl>
            </div>
		</form>
        <div id="foot">
			<ul class="foot-ul">
				<li><font class="note-help">商户订单号、通道订单号和微信订单号至少填一个。 </font></li>
			</ul>
		</div>
	</div>
</body>
</html>