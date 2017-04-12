package com.pan.controller.colcount;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pan.constant.UserConstant;
import com.pan.domain.Colcount;
import com.pan.domain.User;
import com.pan.service.ColcountService;
/**
 * 
 * <p>Title: ColcountController</p>
 * <p>Description: 学院账号controller </p>
 */
@Controller
@RequestMapping("/colcount")
public class ColcountController{
	//日志文件导入
	private static Logger logger = Logger.getLogger(ColcountController.class);
	
	@Autowired
	private ColcountService colcountService;
	
	/**学院账号登录*/
	@SuppressWarnings("unused")
	@RequestMapping("/login")
	private String ColcountLogin(User user,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		Colcount colcount = colcountService.getColcountByUsername(user.getUsername());
		//如果并没有登录
		if(colcount == null || !colcount.getPassword().equals(user.getPassword())){
			//如果用户名密码有误，或者密码为空(前端直接过滤)
			model.addAttribute("status","fail");
			model.addAttribute("message", "用户名/密码错误");
			//跳转登录界面
			return "login";
		}
		
		//到这里说明用户密码正确
		//密码正确就将当前登录用户放进session中
		session.setAttribute(UserConstant.SESSION_USER, colcount);
		session.setAttribute(UserConstant.SESSION_USER_TYPE, user.getIdentity());
		logger.info(user.getIdentity() + "用户: " + colcount.getUsername() + "登录系统");
		//设置状态与信息
		model.addAttribute("status","success");
		model.addAttribute("message", "登录成功");
		//跳转学院账号用户管理页面
		return "academymanager";
	}
}