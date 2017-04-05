package com.pan.controller.root;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pan.constant.UserConstant;
import com.pan.controller.BaseController;
import com.pan.domain.Root;
import com.pan.domain.User;
import com.pan.service.RootService;

@Controller
@RequestMapping(value = "/root")
public class RootController extends BaseController{
	private static Logger logger = Logger.getLogger(RootController.class);
	@Autowired
	private RootService rootService;

	//Root用户登录
	@SuppressWarnings("unused")
	@RequestMapping("/login")
	public String rootLogin(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute(UserConstant.REDIRECT_USER);
		//清除此对象
		session.removeAttribute(UserConstant.REDIRECT_USER);
		Root realRoot = rootService.getRootByUsername(user.getUsername());
		if(realRoot == null || !realRoot.getPassword().equals(user.getPassword())){
			//如果用户名密码有误，或者密码为空(前端直接过滤)
			model.addAttribute("status","fail");
			model.addAttribute("message", "用户名/密码错误");
			//跳转登录界面
			return "login";
		}
		
		//到这里说明用户密码正确
		//密码正确就将当前登录用户放进session中
		session.setAttribute(UserConstant.SESSION_USER, realRoot);
		session.setAttribute(UserConstant.SESSION_USER_TYPE, user.getIdentity());
		//用户登录日志记录
		logger.info(user.getIdentity() + "用户: " + realRoot.getUsername() + "登录系统");
		//设置状态与信息
		model.addAttribute("status","success");
		model.addAttribute("message", "登录成功");
		return "index";
	}
}






