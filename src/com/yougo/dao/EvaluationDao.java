package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Evaluation;

/**
 * 评论接口
 * @author Alpha
 * 
 */
public interface EvaluationDao {
	
	public int addEvaluation(Evaluation evaluation);

	public int evaluationNum(String sql);

	public int updateEvaluation(Evaluation evaluation);

	public int deleteEvaluation(Short id);

	public Collection<Evaluation> getEvaluation(String str);

	public Evaluation findEvaluation(Short id);
}
