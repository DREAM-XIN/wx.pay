<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
	<title>芯火微信支付对账单测试页面</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/index.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('input[name=out_trade_no]').val(new Date().getTime());
			$('.hideClass').hide();
			
			$('input[name=time_start]').val(getCurrentDate()); 
		});
		function getCurrentDate(){
			var date = new Date();
			return date.getFullYear() + '' + formatString(date.getMonth() + 1) + formatString(date.getDay()) + formatString(date.getHours()) + formatString(date.getMinutes()) + formatString(date.getSeconds()); 
		}
		function formatString(value){
			if(parseInt(value) < 10){
				return  0 + '' + value; 
			}
			return value;
		}
		//验证ip
		function isIP(ip) {  
		    var reSpaceCheck = /^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;  
		    if (reSpaceCheck.test(ip)) {  
		        ip.match(reSpaceCheck);  
		        if (RegExp.$1<=255&&RegExp.$1>=0  
		          &&RegExp.$2<=255&&RegExp.$2>=0  
		          &&RegExp.$3<=255&&RegExp.$3>=0  
		          &&RegExp.$4<=255&&RegExp.$4>=0) {  
		            return true;   
		        } else {  
		            return false;  
		        }  
		    } else {  
		        return false;  
		    }  
		}  
		function doSubmit(){
			
			var bill_date = $.trim($('input[name=bill_date]').val());
			if(bill_date == ''){
				alert('账单日期不能为空');   
				return false; 
			}
			
			$('form').submit();
		}
	</script>
</head>
<body text=#000000 bgColor="#ffffff" leftMargin=0  topMargin=4>
	<div id="main">
        <div class="cashier-nav">
            <ol>
				<li class="current">对账单查询测试 </li> 
            </ol>
        </div>
        <form action="testBill" method="post">
            <div id="body" style="clear:left">
                <dl class="content">
                	<dt>账单日期：</dt>
                    <dd>
                        <span class="null-star"></span>
                        <input name="bill_date" value="" maxlength="8"  placeholder="长度8"/>
                        <span class="null-star">(格式20161111)*</span>
                        <span></span>
                    </dd>
                    <dt>账单类型：</dt>
                    <dd>
                        <span class="null-star"></span>
                        <select name="bill_type">
                        	<option value="ALL">全部订单</option>
                        	<option value="SUCCESS">成功支付的订单</option>
                        	<option value="REFUND">当日退款订单</option>
                        	<option value="REVOKED">已撤销的订单</option>
                        </select>
                        
                        <span></span>
                    </dd>
					
					<dt class="hideClass">版本号：</dt>
					<dd class="hideClass">
						<span class="null-star"></span>
						<input size="30" name="version" value="1.0.4"  maxlength="8"  placeholder="长度8"/>
						<span>(长度8)</span>
						<span></span>
					</dd>
                    <dt class="hideClass">终端设备号：</dt>
                    <dd class="hideClass">
                        <span class="null-star"></span>
                        <input name="device_info" value="WEB" maxlength="16"  placeholder="长度32"/>
                        <span class="null-star">(长度32)*</span>
                        <span></span>
                    </dd>
                    
                    <dd>
                        <span class="new-btn-login-sp">
                            <button class="new-btn-login" type="button" onclick="doSubmit()" style="text-align:center;">确 认</button>
                        </span>
                    </dd>
                </dl>
            </div>
		</form>
	</div>
</body>
</html>