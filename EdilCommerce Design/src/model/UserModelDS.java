package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import javax.sql.DataSource;

import utils.Utility;

public class UserModelDS implements ModelInterface<UserBean> {
	
	private DataSource ds = null;
	
	public UserModelDS(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public UserBean doRetriveByKey(String code) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String selectCodeSQL = "SELECT * FROM user WHERE username=?";
		
		UserBean bean = new UserBean();
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(selectCodeSQL);
			
			ps.setString(1, code);
			
			Utility.print("doRetriveByKey: " + ps.toString());
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bean.setUsername("username");
				bean.setNome("nome");
				bean.setCognome("cognome");
				bean.setEmail("email");
				bean.setTelefono("Telefono");
				bean.setIndirizzo("indirizzo");
				bean.setUserPassword("userPassword");
			}
		} finally {
			try {
				if(ps != null)
					ps.close();
			} finally {
				if(con != null)
					con.close();
				if (rs != null)
					rs.close();
			}
		}
		
		return bean;
	}

	@Override
	public Collection<UserBean> doRetriveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(UserBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(UserBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(UserBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserBean doRetriveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
