package com.minhthuan.project.book.DAO;

import com.minhthuan.project.book.IDAO.BookIDAO;
import com.minhthuan.project.book.mapping.BookMapper;
import com.minhthuan.project.book.model.BookModel;
import java.util.List;

public class BookDAO extends AbstractDAO<BookModel> implements BookIDAO{

    @Override
    public List<BookModel> findAllBook() {
        String sql = "select * from book";
        return find(sql, new BookMapper());
    }

    @Override
    public List<BookModel> findByCateId(Long id) {
        String sql = "select * from book where cateID = ?";
        return find(sql, new BookMapper(), id);
    }

    @Override
    public Long addBook(BookModel book) {
        String sql = "insert into book(name, price, author, cateID, image) values(?, ?, ?, ?, ?)";
        return insert(sql, book.getName(), book.getPrice(), book.getAuthor(), book.getCateID(), book.getImage());
    }

    @Override
    public void editBook(BookModel book) {
        String sql = "update book set name=?, price=?, author=?, cateID=?, image=? where id=?";
        update(sql, book.getName(), book.getPrice(), book.getAuthor(), book.getCateID(), book.getImage(), book.getId());
    }

    @Override
    public void deleteBook(Long id) {
        String sql = "delete from book where id=?";
        update(sql, id);
    }

    @Override
    public List<BookModel> findByPage(Long id, int page) {
        int quantity = ((page - 1) * 4);
        String sql = "select * from book where cateID=? limit ?, 4";
        String sqlVer2 = "select * from book limit ?, 4";
        if (id == 0)
            return find(sqlVer2, new BookMapper(), quantity);
        return find(sql, new BookMapper(), id, quantity);
    }

    
}
