package com.minhthuan.project.book.IDAO;

import com.minhthuan.project.book.model.AccountModel;
import java.util.List;

public interface AccountIDAO {
    List<AccountModel> findAllAccount();
    Long insertAccount(AccountModel acc);
}
