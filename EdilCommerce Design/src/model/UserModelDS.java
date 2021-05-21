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
				bean.setUsername(rs.getString("username"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setEmail(rs.getString("email"));
				bean.setTelefono(rs.getString("telefono"));
				bean.setIndirizzo(rs.getString("indirizzo"));
				bean.setUserPassword(rs.getString("userPassword"));
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
		Connection con = null;
		PreparedStatement ps = null;
		
		String InsertSQL = "INSERT INTO user VALUES (?,?,?,?,?,?,?)";
		
			try {
				con = ds.getConnection();
				ps = con.prepareStatement(InsertSQL);

				ps.setString(1, item.getUsername());
				ps.setString(2, item.getNome());
				ps.setString(3, item.getCognome());
				ps.setString(4, item.getEmail());
				ps.setString(5, item.getTelefono());
				ps.setString(6, item.getIndirizzo());
				ps.setString(7, item.getUserPassword());

				Utility.print("doSave: " + ps.toString());

				ps.executeUpdate();

			} finally {
				try {
					if (ps != null)
						ps.close();
				} finally {
					if (con != null)
						con.close();
				}
			}
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
