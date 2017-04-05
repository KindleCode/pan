package com.pan.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.pan.constant.UserConstant;
import com.pan.domain.User;

public class LoginInterceptor implements HandlerInterceptor{
	private static Logger logger = Logger.getLogger(LoginInterceptor.class);  
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView model)
			throws Exception {
		
	} 
	//拦截用户没有登录的情况，跳转登录界面
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		//如果是直接跳转登录界面的直接放行
		if(request.getRequestURI().contains("login"))
			 return true;
		//获取session中存储的当前登录对象
		String userType = (String)request.getSession().getAttribute(UserConstant.SESSION_USER_TYPE);
		//如果用户没有登录，直接跳转登录界面
		if(userType == null || "".equals(userType)){	
			//跳转路径
			request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
			//日志填写
			logger.info("用户 "+ request.getRemoteAddr() +" 没有登录");
			//拦截器不放行
			return false;
		}
		//返回值确定是否继续执行(true表示继续执行)
		return true;
	}

}
