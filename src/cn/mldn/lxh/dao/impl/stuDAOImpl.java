package cn.mldn.lxh.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.mldn.lxh.dao.IStuDAO;
import cn.mldn.lxh.vo.Stu;

/**
 * DAO����ʵ����ʵ����
 * 
 * @author shell
 *
 */
public class stuDAOImpl implements IStuDAO {
	private Connection conn=null;
	private PreparedStatement ps=null;
	public stuDAOImpl(Connection conn){
		this.conn=conn;
	}

	@Override
	public boolean doCreate(Stu stu) throws Exception {
		boolean flag=false;
		String sql="insert into stu(stuno,stuname,Stuidentity,hiredate,score,sphoto) values(?,?,?,?,?,?)";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, stu.getStuno());
		ps.setString(2, stu.getStuname());
		ps.setString(3, stu.getStuidentity());
		ps.setDate(4, new java.sql.Date(stu.getHiredate().getTime()));
		ps.setFloat(5, stu.getScore());
		ps.setString(6,stu.getSphoto());

		if(this.ps.executeUpdate()>0){
			flag=true;
		}
		this.ps.close();
		return flag;
	}

	@Override
	public List<Stu> findAll() throws Exception {
		List<Stu> list=new ArrayList<Stu>();
		String sql="select * from stu";
		ps=conn.prepareStatement(sql);
		ResultSet rs =ps.executeQuery();
		while(rs.next()){
			Stu stu=new Stu();
			stu.setStuno(rs.getInt(1));
			stu.setStuname(rs.getString(2));
			stu.setStuidentity(rs.getString(3));
			stu.setHiredate(rs.getDate(4));
			stu.setScore(rs.getFloat(5));
			stu.setSphoto(rs.getString(6));
			list.add(stu);
		}
		this.ps.close();
		return list;
	}

	@Override
	public Stu findByid(int stuno) throws Exception {
		Stu stu=null;
		String sql="select * from stu where stuno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, stuno);
		ResultSet rs=this.ps.executeQuery();
		while(rs.next()){
			stu=new Stu();
			stu.setStuno(rs.getInt(1));
			stu.setStuname(rs.getString(2));
			stu.setStuidentity(rs.getString(3));
			stu.setHiredate(rs.getDate(4));
			stu.setScore(rs.getFloat(5));
			stu.setSphoto(rs.getString(6));
		}
		this.ps.close();
		return stu;
	}

	@Override
	public boolean doDeleteById(int stuno) throws Exception {
		boolean flag=false;
		String sql="delete from stu where stuno=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, stuno);
		if(ps.executeUpdate()>0){
			flag=true;
		}
		this.ps.close();
		return flag;
	}

	@Override
	public boolean doUpdate(Stu stu) throws Exception {
		boolean flag=false;
		String sql="update stu set stuno=?, stuname=?,  Stuidentity=?, hiredate=?, score=? ,sphoto=? where stuno=?;";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, stu.getStuno());
		ps.setString(2, stu.getStuname());
		ps.setString(3, stu.getStuidentity());
		ps.setDate(4, new java.sql.Date(stu.getHiredate().getTime()));
		ps.setFloat(5, stu.getScore());
		ps.setString(6, stu.getSphoto());
		ps.setInt(7, stu.getStuno());
		if(ps.executeUpdate()>0){
			flag=true;
		}
		this.ps.close();
		return flag;
	}

}
