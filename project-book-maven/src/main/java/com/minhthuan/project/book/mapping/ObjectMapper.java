package com.minhthuan.project.book.mapping;

import java.sql.ResultSet;

public interface ObjectMapper<T> {
    T mapping(ResultSet rs);
}
