package com.minhthuan.project.book.IService;

import com.minhthuan.project.book.model.AccountModel;
import java.util.List;


public interface AccountIService {
    List<AccountModel> findAllAcount();
    Long insertAccount(AccountModel acc);
}
