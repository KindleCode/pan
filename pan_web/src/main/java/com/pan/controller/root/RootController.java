package com.pan.controller.root;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pan.constant.FolderConstant;
import com.pan.constant.UserConstant;
import com.pan.domain.Colcount;
import com.pan.domain.College;
import com.pan.domain.Result;
import com.pan.domain.Root;
import com.pan.domain.User;
import com.pan.service.ColcountService;
import com.pan.service.CollegeService;
import com.pan.service.RootService;
import com.pan.utils.FolderUtil;
import com.pan.utils.RandomUtil;
import com.sun.tools.javac.util.List;
@SuppressWarnings({ "unchecked", "rawtypes","unused" })
@Controller
@RequestMapping(value = "/root")
public class RootController {
	private static Logger logger = Logger.getLogger(RootController.class);
	
	@Autowired
	private RootService rootService;
	
	@Autowired
	private ColcountService colcountService;
	
	@Autowired
	private CollegeService collegeService;
	

	//Root用户登录
	@RequestMapping("/login")
	public String rootLogin(User user,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		//根据用户名查询用户信息
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
		return "rootmanager";
	}
	
	/**新增学院账号*/
	@RequestMapping("createColcount")
	@ResponseBody
	public Result createColcount(Colcount colcount){
		//生成学院账号的唯一主键
		colcount.setId(RandomUtil.getUUID());
		//获取当前学院对象
		College college = collegeService.getCollege(new College(colcount.getColId()));
		//创建学院对应的学院账号文件夹
		String folder = FolderUtil.createFolder(FolderConstant.ROOT_FOLDER,RandomUtil.getFolderName(100));
		colcount.setFolder(folder);
		//保存colcount对象
		colcountService.insertColcount(colcount);
		return Result.resultOk("用户创建成功!"); 
	}
	
	/**判断此学院账号是否存在*/
	@RequestMapping("isExist")
	@ResponseBody
	private Result isExist(String username){
		//根据用户名查询
		Colcount colcount = colcountService.getColcountByUsername(username);
		if(colcount == null)
			return Result.resultOk("该用户名可以使用!");
		return Result.resultError("该用户名已经存在!"); 
	}
	
	/**删除学院账号*/
	@RequestMapping("delete")
	public Result deleteColcount(Colcount colcount){
		colcountService.deleteColcount(colcount);
		return Result.resultOk("用户删除成功!");
	}
	
	/**查询所有的学院对象*/
	@RequestMapping("getAllCollege")
	@ResponseBody
	public Result<List<College>> getAllCollege(){
		Result ok = Result.resultOk("查询成功");
		ok.setData(collegeService.getAllCollege("1"));
		return ok;
	}
	
	
}



