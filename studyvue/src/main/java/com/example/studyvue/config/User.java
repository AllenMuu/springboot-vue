package com.example.studyvue.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @description:
 * @author: Mr.Joe
 * @create:
 */
@Component
@ConfigurationProperties(prefix = "name")
public class User {
    private String haha;
    private String hehe;
    private String add;
    private String hihi;

    public String getHaha() {
        return haha;
    }

    public User setHaha(String haha) {
        this.haha = haha;
        return this;
    }

    public String getHehe() {
        return hehe;
    }

    public User setHehe(String hehe) {
        this.hehe = hehe;
        return this;
    }

    public String getAdd() {
        return add;
    }

    public User setAdd(String add) {
        this.add = add;
        return this;
    }

    public String getHihi() {
        return hihi;
    }

    public User setHihi(String hihi) {
        this.hihi = hihi;
        return this;
    }

    @Override
    public String toString() {
        return "User{" +
                "haha='" + haha + '\'' +
                ", hehe='" + hehe + '\'' +
                ", add='" + add + '\'' +
                ", hihi='" + hihi + '\'' +
                '}';
    }
}
