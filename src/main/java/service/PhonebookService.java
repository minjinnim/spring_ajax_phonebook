package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PhonebookDAOInter;
import vo.PhonebookVO;

@Service
public class PhonebookService implements PhonebookServiceInter {
	@Autowired
	PhonebookDAOInter dao;
	
	@Override
	public List<PhonebookVO> getList() {
		return dao.getList();
	}

	@Override
	public List<PhonebookVO> find(String search) {
		return dao.findOne(search);
	}

	@Override
	public int insert(PhonebookVO pb) {
		return dao.insert(pb);
	}

	@Override
	public PhonebookVO findOne(int idx) {
		PhonebookVO vo=dao.findOne(idx);
		return vo;
	}

	@Override
	public int update(PhonebookVO pb) {
		return dao.update(pb);
	}

	@Override
	public int delete(int idx) {
		return dao.delete(idx);
	}
	
}
