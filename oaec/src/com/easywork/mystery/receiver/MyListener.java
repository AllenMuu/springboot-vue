package com.easywork.mystery.receiver;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.springframework.stereotype.Component;

@Component
public class MyListener implements MessageListener {

	@Override
	public void onMessage(Message arg0) {
		try {
			System.out.println("接收新任务:" + ((TextMessage) arg0).getText().trim());
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
