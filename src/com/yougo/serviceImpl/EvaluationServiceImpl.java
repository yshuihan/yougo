package com.yougo.serviceImpl;

import java.util.Collection;

import com.yougo.bean.Evaluation;
import com.yougo.dao.EvaluationDao;
import com.yougo.daoImpl.EvaluationDaoImpl;
import com.yougo.service.EvaluationService;

public class EvaluationServiceImpl implements EvaluationService {

	private EvaluationDao evaluationDao;
	
	public EvaluationServiceImpl() {
		evaluationDao=new EvaluationDaoImpl();
	}

	public EvaluationDao getEvaluationDao() {
		return evaluationDao;
	}

	public void setEvaluationDao(EvaluationDao evaluationDao) {
		this.evaluationDao = evaluationDao;
	}

	@Override
	public int addEvaluation(Evaluation evaluation) {
		return evaluationDao.addEvaluation(evaluation);
	}

	@Override
	public int evaluationNum(String sql) {
		return evaluationDao.evaluationNum(sql);
	}

	@Override
	public int updateEvaluation(Evaluation evaluation) {
		return evaluationDao.updateEvaluation(evaluation);
	}

	@Override
	public int deleteEvaluation(Short id) {
		return evaluationDao.deleteEvaluation(id);
	}

	@Override
	public Collection<Evaluation> getEvaluation(String str) {
		return evaluationDao.getEvaluation(str);
	}

	@Override
	public Evaluation findEvaluation(Short id) {
		return evaluationDao.findEvaluation(id);
	}

}
