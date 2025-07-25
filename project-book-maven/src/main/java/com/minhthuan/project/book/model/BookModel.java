package com.minhthuan.project.book.model;


public class BookModel {
    private Long id, cateID;
    private String name, author, image;

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    private float price;

    public BookModel() {
    }

    public BookModel(Long cateID, String name, String author, String image, float price) {
        this.cateID = cateID;
        this.name = name;
        this.author = author;
        this.image = image;
        this.price = price;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BookModel(Long id, Long cateID, String name, String author, String image, float price) {
        this.id = id;
        this.cateID = cateID;
        this.name = name;
        this.author = author;
        this.image = image;
        this.price = price;
    }

    public Long getCateID() {
        return cateID;
    }

    public void setCateID(Long cateID) {
        this.cateID = cateID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
}
