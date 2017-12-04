package com.corefire.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.corefire.config.CorefireConfig;
import com.corefire.util.SignUtils;
import com.corefire.util.XmlUtils;

/**
 * <一句话功能简述>
 * <功能详细描述>通知
 * 
 * @author  Administrator
 * @version  [版本号, 2014-8-28]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
public class TestPayResultSerlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("utf-8");
            resp.setCharacterEncoding("utf-8");
            resp.setHeader("Content-type", "text/html;charset=UTF-8");
            String resString = XmlUtils.parseRequst(req);
            System.out.println("通知内容：" + resString);
            
            String respString = "fail";
            Map<String,String> returnMap = new HashMap<String, String>();
            
            returnMap.put("return_code", "FAIL");
            
            if(resString != null && !"".equals(resString)){
                Map<String,String> map = XmlUtils.toMap(resString.getBytes(), "utf-8");
                String res = XmlUtils.toXml(map);
                System.out.println("通知结果：" + res);
                if(map.containsKey("sign")){
                    if(!SignUtils.checkParam(map, CorefireConfig.key)){
                        res = "验证签名不通过";
                        
                        returnMap.put("return_msg", res);
                    }else{
                    	if("SUCCESS".equals(map.get("return_code")) && "SUCCESS".equals(map.get("result_code"))){
                			
                		}
                    	returnMap.put("return_code", "SUCCESS");
                        returnMap.put("return_msg", "");
                    }
                }
            }
            resp.getWriter().write(XmlUtils.toXml(returnMap));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
