package com.example.demo1.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description:
 * @author: Mr.Joe
 * @create:
 */
@RestController
@RequestMapping("/demo")
public class HomeController {
    @RequestMapping("/haha")
    public void print() {
        System.out.println("ddddddd");
    }
}
