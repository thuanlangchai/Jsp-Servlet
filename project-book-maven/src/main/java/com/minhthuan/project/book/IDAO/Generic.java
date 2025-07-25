package com.minhthuan.project.book.IDAO;

import com.minhthuan.project.book.mapping.ObjectMapper;
import java.util.List;

public interface Generic<T> {
    List<T> find(String sql, ObjectMapper<T> mapper, Object... parameter);
    Long insert(String sql, Object...parameter);
    void update(String sql, Object... parameter);    
}
