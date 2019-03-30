package cn.mldn.lxh.dao.test;

import cn.mldn.lxh.factory.DAOFactory;
import cn.mldn.lxh.vo.Stu;

public class TestDAOInset {

	public static void main(String[] args) throws Exception {
		Stu stu=null;
		for(int i=0;i<5;i++){
			stu=new Stu();
			stu.setStuno(1000+i);
			stu.setStuname("李兴华"+i);
			stu.setStuidentity("程序猿"+i);
			stu.setHiredate(new java.util.Date());
			stu.setScore(500*i);
			DAOFactory.getIStuDAOInstance().doCreate(stu);
		}
		
	}

}
