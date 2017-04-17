package com.pan.utils;

import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * 工具类
 * <p>Title: UUID</p>
 * <p>Description: </p>
 * @version 1.0
 */
public class RandomUtil {
	
	public static final String ALLSTR = "q,w,e,r,1,t,2,y,u,i,o,3,p,l,4,k,j,h,g,f,d,s,a,z,x,c,v,"
			  + "b,n,m,Q,5,W,E,R,T,Y,U,6,I,O,P,L,K,J,7,H,G,F,D,8,S,A,Z,X,9,C,V,B,N,M";
	public static String[] all= null;
	static {
			synchronized (RandomUtil.class) {
			all = ALLSTR.split(",");
		}
	}
	/**生成随机的六位密码*/
	public static String getRandomPass(){
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for(int i = 0;i < 6;i ++){
			sb.append(all[random.nextInt(57)]);
		}
		return sb.toString();
	}
	
	/**根据数字返回0到指定的随机数*/
	public static String getRandom(int end){
		Random random = new Random();
		return String.valueOf(random.nextInt(end + 1));
	}

	/**生成唯一主键*/
	public static String getUUID(){
		return UUID.randomUUID().toString();
	}
	
	public static String getFolderName(int end){
		Random random = new Random();
		//获取当前毫秒值
		StringBuilder time = new StringBuilder(String.valueOf(new Date().getTime())).append("_");
		//添加1-100的随机数
		time.append(getRandom(end)).append(all[random.nextInt(57)]);
		return time.toString();
	}
	
}
