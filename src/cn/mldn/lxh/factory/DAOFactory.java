package cn.mldn.lxh.factory;

import cn.mldn.lxh.dao.IStuDAO;
import cn.mldn.lxh.dao.proxy.stuDAOProxy;

public class DAOFactory {
	public static IStuDAO getIStuDAOInstance() throws Exception{
		return new stuDAOProxy();						//ȡ�ô������ʵ����������������ʵ�ࣨEmpDAOImpl��ʵ����IEmpDAO�ӿڣ�
	}

}
