package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import utils.Utility;

public class RecensisceModelDS implements ModelRelationInterface<RecensisceBean> {
	private DataSource ds = null;
	
	public RecensisceModelDS(DataSource ds) {
		this.ds = ds;
	}
	
	@Override
	public RecensisceBean doRetriveByKey(String code1, String code2) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String selectCodeSQL = "SELECT * FROM recensisce WHERE username=? AND codiceArticolo=?";
		
		RecensisceBean bean = new RecensisceBean();
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(selectCodeSQL);
			
			ps.setString(1, code1);
			ps.setString(2, code2);
			
			Utility.print("doRetriveByKey: " + ps.toString());
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bean.setCodiceArticolo(rs.getString("codiceArticolo"));
				bean.setUsername(rs.getString("username"));
				bean.setDate(rs.getDate("data"));
				bean.setTesto(rs.getString("testo"));
				bean.setValore(rs.getInt("valore"));
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
	public Collection<RecensisceBean> doRetriveByOneKey(String code) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String selectCodeSQL = "SELECT * FROM recensisce WHERE username=?";
		
		
		Collection<RecensisceBean> collection = new LinkedList<RecensisceBean>();
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(selectCodeSQL);
			
			ps.setString(1, code);
			
			Utility.print("doRetriveByOneKey: " + ps.toString());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				RecensisceBean bean = new RecensisceBean();
				bean.setCodiceArticolo(rs.getString("codiceArticolo"));
				bean.setUsername(rs.getString("username"));
				bean.setDate(rs.getDate("data"));
				bean.setTesto(rs.getString("testo"));
				bean.setValore(rs.getInt("valore"));
				collection.add(bean);
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
		return collection;
	}
	
	public Collection<RecensisceBean> doRetriveByCodiceArticolo(String code) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String selectCodeSQL = "SELECT * FROM recensisce WHERE codiceArticolo=?";
		
		
		Collection<RecensisceBean> collection = new LinkedList<RecensisceBean>();
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(selectCodeSQL);
			
			ps.setString(1, code);
			
			Utility.print("doRetriveByCodiceArticolo: " + ps.toString());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				RecensisceBean bean = new RecensisceBean();
				bean.setCodiceArticolo(rs.getString("codiceArticolo"));
				bean.setUsername(rs.getString("username"));
				bean.setDate(rs.getDate("data"));
				bean.setTesto(rs.getString("testo"));
				bean.setValore(rs.getInt("valore"));
				collection.add(bean);
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
		return collection;
	}

	@Override
	public Collection<RecensisceBean> doRetriveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(RecensisceBean item) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		String InsertSQL = "INSERT INTO recensisce VALUES (?,?,?,?,?)";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(InsertSQL);
			
			ps.setString(1, item.getCodiceArticolo());
			ps.setString(2, item.getUsername());
			ps.setDate(3, item.getDate());
			ps.setInt(4, item.getValore());
			ps.setString(5, item.getTesto());
			
			Utility.print("doSave: " + ps.toString());
			
			ps.executeUpdate();

		} finally {
			try {
				if(ps != null)
					ps.close();
			} finally {
				if(con != null)
					con.close();
			}
		}		
	}

	@Override
	public void doUpdate(RecensisceBean item) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		String UpdateSQL = "UPDATE recensisce SET codiceArticolo=?, data=?, valore=?, testo=? WHERE username=?";
		
			try {
				con = ds.getConnection();
				ps = con.prepareStatement(UpdateSQL);

				ps.setString(1, item.getCodiceArticolo());
				ps.setDate(2, item.getDate());
				ps.setInt(3, item.getValore());
				ps.setString(4, item.getTesto());
				Utility.print("doUpdate: " + ps.toString());

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
	public void doDelete(RecensisceBean item) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		String DeleteSQL = "DELETE FROM recensisce WHERE username=? AND codiceArticolo=?";
		
			try {
				con = ds.getConnection();
				ps = con.prepareStatement(DeleteSQL);

				ps.setString(1, item.getUsername());
				ps.setString(2, item.getCodiceArticolo());
				Utility.print("doDelete: " + ps.toString());

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

}
