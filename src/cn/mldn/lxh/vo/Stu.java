package cn.mldn.lxh.vo;

/**
 * DAOģʽ������һ�����ȴ�����Ӧ��VO��
 */
import java.util.Date;

public class Stu {
	private int stuno;  //private˽�еģ�ʹempno����ֻ����Emp�ڲ����ʣ������಻�ܷ��ʣ������ܿ�����ʡ�  ���ڱ�protected���εģ�ֻ�ܱ��౾��ķ�����������ʣ���ʹ�����ڲ�ͬ�İ���Ҳ���Է��ʡ�
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
