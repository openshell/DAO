package cn.mldn.lxh.vo;

/**
 * DAO模式开发第一步，先创建对应的VO类
 */
import java.util.Date;

public class Stu {
	private int stuno;  //private私有的，使empno属性只能在Emp内部访问，其子类不能访问，更不能跨包访问。  对于被protected修饰的，只能被类本身的方法及子类访问，即使子类在不同的包中也可以访问。
	private String stuname;
	private String stuidentity;
	private Date hiredate;
	private float score;
	private String sphoto;


	public String getSphoto() {
		return sphoto;
	}

	public void setSphoto(String sphoto) {
		this.sphoto = sphoto;
	}

	public int getStuno() {
		return stuno;
	}

	public void setStuno(int stuno) {
		this.stuno = stuno;
	}

	public String getStuname() {
		return stuname;
	}

	public void setStuname(String stuname) {
		this.stuname = stuname;
	}

	public String getStuidentity() {
		return stuidentity;
	}

	public void setStuidentity(String stuidentity) {
		this.stuidentity = stuidentity;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public Stu() {

	}

}
