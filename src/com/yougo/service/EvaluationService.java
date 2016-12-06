package com.yougo.service;

import java.util.Collection;

import com.yougo.bean.Evaluation;

public interface EvaluationService {
	public int addEvaluation(Evaluation evaluation);

	public int evaluationNum(String sql);

	//
	public int updateEvaluation(Evaluation evaluation);

	//
	public int deleteEvaluation(Short id);

	//
	public Collection<Evaluation> getEvaluation(String str);

	//
	public Evaluation findEvaluation(Short id);
}
