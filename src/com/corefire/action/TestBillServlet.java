package com.corefire.action;


import com.corefire.config.CorefireConfig;
import com.corefire.util.CorefireHttpPost;
import com.corefire.util.MD5;
import com.corefire.util.SignUtils;
import com.corefire.util.XmlUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.SortedMap;

/**
 * <一句话功能简述>
 * <功能详细描述>对账单
 * 
 * @author  Administrator
 * @version  [版本号, 2014-8-28]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
public class TestBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static Map<String,String> orderResult;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        @SuppressWarnings("unchecked")
		SortedMap<String,String> map = XmlUtils.getParameterMap(req);
        System.out.println(XmlUtils.toXml(map));
        map.put("mch_id", CorefireConfig.mch_id);
        map.put("appid", CorefireConfig.appid);
        String key = CorefireConfig.key;
        String res ;
        String reqUrl = CorefireConfig.bill_req_url;
        map.put("nonce_str", String.valueOf(System.currentTimeMillis()));
        Map<String,String> params = SignUtils.paraFilter(map);
        StringBuilder buf = new StringBuilder((params.size() +1) * 10);
        SignUtils.buildPayParams(buf,params,false);
        String preStr = buf.toString();
        String sign = MD5.sign(preStr, "&key=" + key, "utf-8").toUpperCase() ;
        map.put("sign", sign);
        
        System.out.println("reqUrl:" + reqUrl);
        req.setAttribute("req_message", XmlUtils.parseXML(map));
        try {
        	res = CorefireHttpPost.connect(reqUrl, map);
        	System.out.println("返回数据："+res);
        	String result = null;
        	if(res.startsWith("<xml")){
        		Map<String,String> resultMap = XmlUtils.xml2map(res, "xml");
                System.out.println("请求返回数据：" + res);
                req.setAttribute("res_message", XmlUtils.parseXML(resultMap));
                
                result = "通信状态:" + resultMap.get("return_code");
                if("FAIL".equals(resultMap.get("return_code"))){
    				result = result + "<br>" + "错误描述:" + resultMap.get("return_msg");
        		}else if("SUCCESS".equals(resultMap.get("return_code"))){
    	            if(resultMap.containsKey("sign")){
    	            	if(!SignUtils.checkParam(resultMap, CorefireConfig.key)){
    	            		result = result + "<br>错误描述:" + "验证签名不通过";
    	            	}else{
    	            		result = result + "<br>" + "业务状态:" + resultMap.get("result_code");
    	            		if("FAIL".equals(resultMap.get("result_code"))){
    	            			result = result + "<br>" + "错误代码:" + resultMap.get("err_code");
    	            			result = result + "<br>" + "错误描述:" + resultMap.get("err_code_des");
    	               		}
    	            	}
    	            } else{
    	            	result = result + "<br>错误描述:" + "没有签名信息";
    	            }
        		}
                req.setAttribute("result", result); 
            }else{
            	result = "成功下载账单";
            	req.setAttribute("result", result); 
            	req.setAttribute("res_message", res);
            }
			
            
        } catch (Exception e1) {
        	e1.printStackTrace();
        }
        req.getRequestDispatcher("index-result.jsp").forward(req, resp);
    }
}
