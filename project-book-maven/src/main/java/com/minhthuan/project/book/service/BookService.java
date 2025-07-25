package com.minhthuan.project.book.service;

import com.minhthuan.project.book.IDAO.BookIDAO;
import com.minhthuan.project.book.IService.BookIService;
import com.minhthuan.project.book.model.BookModel;
import jakarta.inject.Inject;
import java.util.List;


public class BookService implements BookIService{
    @Inject
    private BookIDAO bookDAO;
    @Override
    
    public List<BookModel> findAllBook() {
        return bookDAO.findAllBook();
    }

    @Override
    public List<BookModel> findByCateId(Long id) {
        return bookDAO.findByCateId(id);
    }

    @Override
    public Long addBook(BookModel book) {
        return bookDAO.addBook(book);
    }

    @Override
    public void editBook(BookModel book) {
        bookDAO.editBook(book);
    }

    @Override
    public void deleteBook(Long id) {
        bookDAO.deleteBook(id);
    }

    @Override
    public List<BookModel> findByPage(Long id, int page) {
        return bookDAO.findByPage(id, page);
    }

    
}
