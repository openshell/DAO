package cn.mldn.lxh.dbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	private final static String DBDRIVER = "com.mysql.jdbc.Driver"; // ������ݿ����ַ�
	private final static String DBURL = "jdbc:mysql://localhost:3306/blog"; // ������������ַ�
	private final static String DBUSER = "root"; // ������ݿ��ʺ�
	private final static String DBPASSWORD = "123456"; // �����������
	private Connection conn = null; // ��ʼ��һ����ݿ�����

	public DatabaseConnection() throws Exception {
		try {
			Class.forName(DBDRIVER); // ������
			this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD); // ������ݿ�����
		} catch (Exception e) {
			throw e;
		}
	}

	public Connection getConnection() {
		return this.conn; // ������ݿ�����
	}

	public void Close() throws Exception {
		if (this.conn != null) {
			try {
				this.conn.close();
			} catch (Exception e) {

				throw e; // ֱ���׳��쳣
			}
		}
	}
}
