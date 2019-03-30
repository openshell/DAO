package cn.mldn.lxh.dao;

import java.util.List;

import cn.mldn.lxh.vo.Stu;

/**
 * �������ݲ�����׼���ӿڣ�
 * ��DAO�Ĳ�����׼�ж�����doCreate(),findAll(),findById(),doDeleteById()�ĸ���������
 * @author shell
 *
 */
public interface IStuDAO {
	/**
	 * 
	 * 
	 * @param emp
	 * @return
	 * @throws Exception
	 */
	public boolean doCreate(Stu stu) throws Exception;
	/**
	 * 
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Stu> findAll() throws Exception;
	/**
	 * 
	 * 
	 * @return
	 * @throws Exception
	 */
	public Stu findByid(int stuno) throws Exception;
	
	/**
	 * 
	 * 
	 * @param empno
	 * @return
	 * @throws Exception
	 */
	public boolean doDeleteById(int stuno) throws Exception;
	
	/**
	 * 
	 * 
	 * @param emp
	 * @return
	 * @throws Exception
	 */
	public boolean doUpdate(Stu stu) throws Exception;

}
