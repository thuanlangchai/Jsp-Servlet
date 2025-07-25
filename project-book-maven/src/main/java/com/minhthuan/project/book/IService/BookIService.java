package com.minhthuan.project.book.IService;

import com.minhthuan.project.book.model.BookModel;
import java.util.List;


public interface BookIService {
    List<BookModel> findAllBook();
    List<BookModel> findByCateId(Long id);
    List<BookModel> findByPage(Long id, int page);
    Long addBook(BookModel book);
    void editBook(BookModel book);
    void deleteBook(Long id);
}
