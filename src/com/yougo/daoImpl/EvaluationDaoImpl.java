package com.yougo.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.yougo.bean.Evaluation;
import com.yougo.dao.EvaluationDao;
import com.yougo.db.Conn;

/**
 * 
 * @author Alpha
 * 
 */
public class EvaluationDaoImpl implements EvaluationDao {

	Connection conn = null;
	PreparedStatement pre = null;
	ResultSet rs = null;

	@Override
	public int addEvaluation(Evaluation evaluation) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "insert into evaluation(proid,userid,content,star,createtime) values(?,?,?,?,?)";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, evaluation.getProid());
			pre.setShort(2, evaluation.getUserid());
			pre.setString(3, evaluation.getContent());
			pre.setShort(4, evaluation.getStar());
			Date now = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = df.format(now);
			pre.setString(5, date);
			i = pre.executeUpdate();

		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return i;
	}

	public int evaluationNum(String sql) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			rs = pre.executeQuery();
			// i = Integer.parseInt(rs.getFetchSize());
			while (rs.next()) {
				i++;
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return i;
	}

	@Override
	public int updateEvaluation(Evaluation evaluation) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update evaluation set proid=?,userid=?,content=?,star=?,createtime=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, evaluation.getProid());
			pre.setShort(2, evaluation.getUserid());
			pre.setString(3, evaluation.getContent());
			pre.setShort(4, evaluation.getStar());
			Date now = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = df.format(now);
			pre.setString(5, date);
			pre.setShort(6, evaluation.getId());
			i = pre.executeUpdate();

		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return i;
	}

	@Override
	public int deleteEvaluation(Short id) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "delete from evaluation where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, id);
			i = pre.executeUpdate();

		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return i;
	}

	@Override
	public Collection<Evaluation> getEvaluation(String str) {
		// TODO Auto-generated method stub
		Collection<Evaluation> groups = new ArrayList<Evaluation>();
		String sql = str;
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				Evaluation eval = new Evaluation();
				eval.setId(rs.getShort("evaluation.id"));
				eval.setProid(rs.getShort("evaluation.proid"));
				eval.setUserid(rs.getShort("evaluation.userid"));
				eval.setContent(rs.getString("evaluation.content"));
				eval.setStar(rs.getShort("evaluation.star"));
				eval.setCreatetime(rs.getString("evaluation.createtime"));
				groups.add(eval);
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return groups;
	}

	@Override
	public Evaluation findEvaluation(Short id) {
		// TODO Auto-generated method stub
		Evaluation eval = new Evaluation();
		String sql = "select * from evaluation where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, id);
			rs = pre.executeQuery();
			if (rs.next()) {
				eval.setId(rs.getShort("evaluation.id"));
				eval.setProid(rs.getShort("evaluation.proid"));
				eval.setUserid(rs.getShort("evaluation.userid"));
				eval.setContent(rs.getString("evaluation.content"));
				eval.setStar(rs.getShort("evaluation.star"));
				eval.setCreatetime(rs.getString("evaluation.createtime"));
			} else {
				eval = null;
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return eval;
	}

}
