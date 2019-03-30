package cn.mldn.lxh.dao;

import java.util.List;

import cn.mldn.lxh.vo.Stu;

/**
 * 定义数据操作标准（接口）
 * 在DAO的操作标准中定义了doCreate(),findAll(),findById(),doDeleteById()四个基本功能
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
