package com.easywork.mystery.controller;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.easycore.utils.BaseController;

@Controller
@RequestMapping("/MQ")
public class MQController extends BaseController {
    @Autowired
    @Qualifier("jmsQueueTemplate")
    JmsTemplate jmsTpl;

    @RequestMapping("/send")
    public void send(String task, HttpServletResponse resp) {
        System.out.println("task=" + task);
        // 发送到队列
        MessageCreator crt = new MessageCreator() {
            public Message createMessage(Session arg0) throws JMSException {
                TextMessage txtMsg = arg0.createTextMessage(task);
                return txtMsg;
            }
        };
        jmsTpl.send("tc31", crt);
        super.print(resp, "success");
    }

    @RequestMapping("/receive")
    public void receive(HttpServletResponse resp) throws JMSException {
        TextMessage msg = (TextMessage) jmsTpl.receive("tc31");
        super.print(resp, msg.getText());
    }
}
