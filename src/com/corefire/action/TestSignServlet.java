package com.corefire.action;

import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.SortedMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.corefire.config.CorefireConfig;
import com.corefire.util.MD5;
import com.corefire.util.SignUtils;
import com.corefire.util.XmlUtils;

/**
 * <一句话功能简述>
 * <功能详细描述>测试支付
 * 
 * @author  Administrator
 * @version  [版本号, 2014-8-28]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
public class TestSignServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
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
        
        map.put("mch_id", CorefireConfig.mch_id);
        map.put("appid", CorefireConfig.appid);
       // map.put("nonce_str", String.valueOf(new Date().getTime()));
            
       	Map<String,String> params = SignUtils.paraFilter(map);
       	StringBuilder buf = new StringBuilder((params.size() +1) * 10);
       	SignUtils.buildPayParams(buf,params,false);
       	String preStr = buf.toString();
       	preStr = preStr + "&key=" + CorefireConfig.key;
       	System.out.println("preStr:"+preStr);
       	String sign = MD5.sign(preStr, "&key=" + CorefireConfig.key, "utf-8").toUpperCase();
            
       	map.put("sign", sign);
            
       	String reqUrl = CorefireConfig.micropay_req_url;
       	System.out.println("reqUrl：" + reqUrl);
            
       	System.out.println("reqParams:" + XmlUtils.parseXML(map));
       	req.setAttribute("preStr",preStr);
       	req.setAttribute("reqParams",XmlUtils.parseXML(map));
       	req.setAttribute("sign",sign);
       	req.getRequestDispatcher("index-sign-result.jsp").forward(req, resp);
    }
}
