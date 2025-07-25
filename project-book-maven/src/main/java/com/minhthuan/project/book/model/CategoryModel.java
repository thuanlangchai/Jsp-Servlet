package com.minhthuan.project.book.model;

public class CategoryModel {

    private Long id;

    public CategoryModel(Long id, String name, String content) {
        this.id = id;
        this.name = name;
        this.content = content;
    }
    private String name, content;

    public CategoryModel(String name, String content) {
        this.name = name;
        this.content = content;
    }

    public CategoryModel() {
    }

    public long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
