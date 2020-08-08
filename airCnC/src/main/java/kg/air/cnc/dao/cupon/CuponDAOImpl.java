package kg.air.cnc.dao.cupon;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import kg.air.cnc.vo.CuponVO;

//@Repository
public class CuponDAOImpl {
	
	//@Autowired
	private SqlSessionTemplate mybatis;

	public void makeCupon() {
		mybatis.insert("cuponDAO.makeCupon");
	}

	public void useCupon(String cuponNumber) {
		mybatis.delete("cuponDAO.makeCupon", cuponNumber);
	}

	public int checkNumber(String cuponNumber) {
		return mybatis.selectOne("cuponDAO.checkNumber", cuponNumber);
	}
	
	public List<CuponVO> getCuponList() {
		return mybatis.selectList("cuponDAO.getCuponList");
	}
	
	public void deleteCupon() {
		mybatis.delete("cuponDAO.deleteCupon");
	}
}
