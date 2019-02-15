package com.example.studyvue.domain;

/**
 * @description:
 * @author: Mr.Joe
 * @create:
 */
public class Book {
    private String bookName;
    private Double bookPrice;
    private String author;
    private String publishHouse;

    public String getBookName() {
        return bookName;
    }

    public Book setBookName(String bookName) {
        this.bookName = bookName;
        return this;
    }

    public Double getBookPrice() {
        return bookPrice;
    }

    public Book setBookPrice(Double bookPrice) {
        this.bookPrice = bookPrice;
        return this;
    }

    public String getAuthor() {
        return author;
    }

    public Book setAuthor(String author) {
        this.author = author;
        return this;
    }

    public String getPublishHouse() {
        return publishHouse;
    }

    public Book setPublishHouse(String publishHouse) {
        this.publishHouse = publishHouse;
        return this;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookName='" + bookName + '\'' +
                ", bookPrice=" + bookPrice +
                ", author='" + author + '\'' +
                ", publishHouse='" + publishHouse + '\'' +
                '}';
    }
}
