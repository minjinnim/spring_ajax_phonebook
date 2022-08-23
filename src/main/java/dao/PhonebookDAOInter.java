package dao;

import java.util.List;

import vo.PhonebookVO;

public interface PhonebookDAOInter {
	public int insert(PhonebookVO pb);
	public List<PhonebookVO> getList();
	public PhonebookVO findOne(int idx);
	public List<PhonebookVO> findOne(String _name);
	public int update(PhonebookVO pb);
	public int delete(int idx);
}
