package cn.mldn.lxh.dao.proxy;

import java.util.List;

import cn.mldn.lxh.dao.IStuDAO;
import cn.mldn.lxh.dao.impl.stuDAOImpl;
import cn.mldn.lxh.dbc.DatabaseConnection;
import cn.mldn.lxh.vo.Stu;

/**
 * 
 *代理类
 * @author shell
 *
 */

public class stuDAOProxy implements IStuDAO{
	private DatabaseConnection dbc=null;
	private IStuDAO DAO=null;
	
	public stuDAOProxy(){
		try {
			this.dbc=new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		this.DAO=new stuDAOImpl(this.dbc.getConnection());
	}
	@Override
	public boolean doCreate(Stu stu) throws Exception {
		Boolean flag=false;
		if((this.DAO.findByid(stu.getStuno())==null)){
			if(this.DAO.doCreate(stu)){
			flag=true;
		}
		}
		return flag;
	}

	@Override
	public List<Stu> findAll() throws Exception {
		List<Stu> stu=this.DAO.findAll();
		return stu;
	}

	@Override
	public Stu findByid(int stuno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean doDeleteById(int stuno) throws Exception {
		this.DAO.doDeleteById(stuno);
		return false;
	}
	@Override
	public boolean doUpdate(Stu stu) throws Exception {
		
			return this.DAO.doUpdate(stu);
	}

}
