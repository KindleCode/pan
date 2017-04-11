package com.pan.mqListener;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.apache.log4j.Logger;

import com.pan.controller.colcount.ColcountController;

public class ChangePasswordListener implements MessageListener {
	private static Logger logger = Logger.getLogger(ColcountController.class);

	@Override
	public void onMessage(Message message) {
		TextMessage textMessage = (TextMessage) message;
		//取消息内容
		String text = "";
		try {
			text = textMessage.getText();
			System.out.println(text);
		} catch (JMSException e) {
			logger.info("【修改密码邮件发送失败】");
			e.printStackTrace();
		}
	}

}
