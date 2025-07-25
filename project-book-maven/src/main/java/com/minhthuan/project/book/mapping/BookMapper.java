package com.minhthuan.project.book.mapping;

import com.minhthuan.project.book.model.BookModel;
import java.sql.ResultSet;
import java.sql.SQLException;


public class BookMapper implements ObjectMapper<BookModel>{

    @Override
    public BookModel mapping(ResultSet rs) {
        BookModel book = new BookModel();
        try {
            book.setId(rs.getLong("id"));
            book.setName(rs.getString("name"));
            book.setPrice(rs.getFloat("price"));
            book.setAuthor(rs.getString("author"));
            book.setCateID(rs.getLong("cateID"));
            book.setImage(rs.getString("image"));
            return book;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }


    
}
