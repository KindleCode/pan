package com.pan.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pan.constant.UserConstant;
import com.pan.domain.User;
import com.pan.interceptor.LoginInterceptor;

@Controller
public class LoginController{
	//日志文件初始化
	private static Logger logger = Logger.getLogger(LoginInterceptor.class);
	
	//此方法用户转发用户登录
	@RequestMapping("/login")
	public String userLogin(User user,HttpServletRequest request,Model model/*RedirectAttributes attributes*/){
		//将重定向之前的数据放进重定向数据中心
		//attributes.addFlashAttribute(UserConstant.SESSION_USER, user);
		//attributes.addFlashAttribute("username",user.getUsername());
		request.getSession().setAttribute(UserConstant.REDIRECT_USER,user);
		if(UserConstant.ROOT.equals(user.getIdentity())){
			//root用户登录
			logger.info("root用户 :" + user.getUsername() + "登录页面跳转。。");
			return "redirect:/root/login";
		}else if (UserConstant.COLLEGE.equals(user.getIdentity())){
			//学院账号登录
			logger.info("学院用户: " + user.getUsername() + "登录界面跳转 。。");
			return "redirect:/colcount/login";
		}else if(UserConstant.TEACHER.equals(user.getIdentity())){
			//老师账号登录
			logger.info("教室用户: " + user.getUsername() + "登录界面跳转。。");
			return "redirect:/teacount/login";
		}else {
			model.addAttribute("testid", "abc");
			return "login";
		}
	}
}
