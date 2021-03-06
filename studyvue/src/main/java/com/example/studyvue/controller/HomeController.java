package com.example.studyvue.controller;

import com.example.studyvue.config.User;
import com.example.studyvue.domain.Book;
import com.example.studyvue.ws.WebSocketServer;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * @description:
 * @author: Mr.Joe
 * @create:
 */
@Controller
@RequestMapping("/home")
public class HomeController {
    @Autowired
    private User user;

    @RequestMapping("/openWork/{view}")
    public String openWork(@PathVariable("view") String view) {
        return "demo/" + view;
    }

    @GetMapping("/properties-demo")
    public String user() {
        return user.toString();
    }

    @GetMapping("book")
    @ResponseBody
    public ModelAndView getBook() {
        List<Book> bookList = new ArrayList<>();
        Book book1 = new Book();
        book1.setAuthor("罗贯中");
        book1.setBookName("三国演义");
        book1.setBookPrice(58.00);
        book1.setPublishHouse("人民出版社");
        Book book2 = new Book();
        book2.setAuthor("吴承恩");
        book2.setBookName("西游记");
        book2.setBookPrice(66.00);
        book2.setPublishHouse("凤凰出版集团");
        Book book3 = new Book();
        book3.setAuthor("Leibniz");
        book3.setBookName("复变函数与泛函分析");
        book3.setBookPrice(42.00);
        book3.setPublishHouse("复旦大学出版社");
        bookList.add(book1);
        bookList.add(book2);
        bookList.add(book3);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("bookList", bookList);
        modelAndView.setViewName("demo/books");
        return modelAndView;
    }

    @PostMapping("/upload")
    public String upload(MultipartFile multipartFile, HttpServletRequest request) {
        //String path = request.getSession()
        return null;
    }

    @RequestMapping("/websocket-demo")
    public String pull() {
        return "/demo/push1";
    }

    @RequestMapping("/test")
    public String test() {
        WebSocketServer.sendInfo("hahahh");
        return "demo/success";
    }
}
