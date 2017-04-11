package com.pan.utils;

import java.util.Random;

/**用来随机数*/
public class RandomNumber {
	
	public static final String ALLSTR = "q,w,e,r,1,t,2,y,u,i,o,3,p,l,4,k,j,h,g,f,d,s,a,z,x,c,v,"
									  + "b,n,m,Q,5,W,E,R,T,Y,U,6,I,O,P,L,K,J,7,H,G,F,D,8,S,A,Z,X,9,C,V,B,N,M";
	public static String[] all= null;
	static {
		synchronized (RandomNumber.class) {
			all = ALLSTR.split(",");
		}
	}
	public static String getRandomPass(){
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for(int i = 0;i < 6;i ++){
			sb.append(all[random.nextInt(57)]);
		}
		return sb.toString();
	}
}
