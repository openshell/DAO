package cn.mldn.lxh.factory;

import cn.mldn.lxh.dao.IStuDAO;
import cn.mldn.lxh.dao.proxy.stuDAOProxy;

public class DAOFactory {
	public static IStuDAO getIStuDAOInstance() throws Exception{
		return new stuDAOProxy();						//取得代理类的实例（代理内中用真实类（EmpDAOImpl）实现了IEmpDAO接口）
	}

}
