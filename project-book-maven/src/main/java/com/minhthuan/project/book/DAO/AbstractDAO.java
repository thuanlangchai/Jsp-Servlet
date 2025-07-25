package com.minhthuan.project.book.DAO;

import com.minhthuan.project.book.IDAO.Generic;
import com.minhthuan.project.book.mapping.ObjectMapper;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AbstractDAO<T> implements Generic<T> {

    Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "jdbc:mysql://localhost:3306/project_book";
            String user = "root";
            String pass = "langchai297";
            return DriverManager.getConnection(sql, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AbstractDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    @Override
    public List<T> find(String sql, ObjectMapper<T> mapper, Object... parameter) {
        List<T> arrT = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            stm = conn.prepareStatement(sql);
            setParameter(stm, parameter);
            rs = stm.executeQuery();
            while (rs.next()) {
                arrT.add(mapper.mapping(rs));
            }
            return arrT;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }

    private void setParameter(PreparedStatement stm, Object... parameter) {
        try {
            for (int i = 0; i < parameter.length; i++) {
                if (parameter[i] instanceof String) {
                    stm.setString(i + 1, (String) parameter[i]);
                }
                if (parameter[i] instanceof Long) {
                    stm.setLong(i + 1, (Long) parameter[i]);
                }
                if (parameter[i] instanceof Float) {
                    stm.setFloat(i + 1, (Float) parameter[i]);
                }
                if (parameter[i] instanceof Integer) {
                    stm.setInt(i + 1, (Integer) parameter[i]);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    @Override
    public Long insert(String sql, Object... parameter) {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            conn.setAutoCommit(false);
            stm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            setParameter(stm, parameter);
            stm.executeUpdate();
            rs = stm.getGeneratedKeys();
            if (rs.next()) {
                Long id = rs.getLong(1);
                conn.commit();
                return id;
            }
            return null;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public void update(String sql, Object... parameter) {
        try {
            Connection conn = getConnection();
            PreparedStatement stm = conn.prepareStatement(sql);
            setParameter(stm, parameter);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }


}
