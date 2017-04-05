package com.pan.test;

import com.pan.domain.Colcount;
import com.pan.domain.Teacount;
import com.pan.domain.User;
/**
 * 
 * <p>Title: ObjectInstanceofTest</p>
 * <p>Description: </p>
 *  此处User是其他几个类的父类
 */
public class ObjectInstanceofTest {
	public static void main(String[] args) {
		
		User u1 = new User();
		User u2 = new User();
		Colcount colcount = new Colcount();
		Teacount teacount = new Teacount();
		//System.out.println( u1 instanceof User);      // true
		//System.out.println(u1 instanceof Colcount);   // false
		//System.err.println(colcount instanceof User); // true
	}
}
