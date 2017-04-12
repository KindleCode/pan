package com.pan.controller.teacount;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pan.constant.UserConstant;
import com.pan.domain.Result;
import com.pan.domain.Teacount;
import com.pan.domain.User;
import com.pan.service.TeacountService;
import com.pan.utils.RandomNumber;

@Controller
@RequestMapping("/teacount/")
public class TeacountController {
	private static Logger logger = Logger.getLogger(TeacountController.class);
	
	@Autowired 
	private TeacountService teacountService;	

	/**教师用户登录*/
	@SuppressWarnings("unused")
	@RequestMapping("login")
	public String teacountLogin(User user,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
	    Teacount teacount = teacountService.getTeacountByUsername(user.getUsername());
		if(teacount == null || !teacount.getPassword().equals(user.getPassword())){
			//如果用户名密码有误，或者密码为空(前端直接过滤)
			model.addAttribute("status","fail");
			model.addAttribute("message", "用户名/密码错误");
			//跳转登录界面
			return "login";
		}
		
		//到这里说明用户密码正确,
		//密码正确就将当前登录用户放进session中
		session.setAttribute(UserConstant.SESSION_USER, teacount);
		session.setAttribute(UserConstant.SESSION_USER_TYPE, user.getIdentity());
		logger.info(user.getIdentity() + "用户: " + teacount.getUsername() + "登录系统");
		//设置状态与信息
		model.addAttribute("status","success");
		model.addAttribute("message", "登录成功");
		model.addAttribute("username",teacount.getUsername());
		return "index";
	}
	
	/**用户登录时忘记密码，邮箱直接发回去随机，登录之后才能进行随意的修改*/
	@RequestMapping("login/checkReset")
	@ResponseBody
	public Result checkReset(String checkusername){
		//进行邮箱与用户名的验证
		/**Teacount teacount = teacountService.getTeacountByUsername(checkusername);
		if(teacount == null || !teacount.getMail().equals(checkmail.trim()))
			//返回没有成功的结果对象
			return Result.resultError("填写有误!");
		*/
		//随机生成一组六位数字，并将密码
		String newPass = RandomNumber.getRandomPass();
		//发送至邮箱(消息队列)
		
		//数据库进行密码的修改操作
		teacountService.updatePassword(new Teacount(checkusername,newPass));
		logger.info(checkusername + " 密码修改成功！【" + newPass + "】");
		//如果用户名邮箱正确，则发送邮箱，随机生成一组六位的数字，并将用户名的密码进行修改
		return Result.resultOk("密码修改成功!");
	}
	
	@RequestMapping("login/test")
	@ResponseBody
	public Result test(String checkmail,String checkusername){
		//进行邮箱与用户名的存在与否的验证
		Teacount teacount = teacountService.getTeacountByUsername(checkusername);
		if(teacount == null || !teacount.getMail().equals(checkmail.trim()))
			return Result.resultError("填写有误!");
		
		logger.info(checkusername + " 密码修改尝试验证【成功！】");
		return Result.resultOk("验证成功!");
}
}








