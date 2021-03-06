package kg.air.cnc.dao.blacklist;

import kg.air.cnc.vo.BlackUserVO;

import java.util.ArrayList;
import java.util.Date;


public interface BlackListDAO {

    ArrayList<BlackUserVO>getBlackList();

    BlackUserVO getBlackSearchId(String blackSearchEmail);

    void deleteBlackList(String blackEmail);

    int [] getBlackListCount();

}
