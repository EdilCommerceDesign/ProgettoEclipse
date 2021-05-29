package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import utils.Utility;

public class ArticoloModelDS implements ModelInterface<ArticoloBean> {
	
	private DataSource ds = null;
	
	public ArticoloModelDS(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public ArticoloBean doRetriveByKey(String code) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String selectCodeSQL = "SELECT * FROM articolo WHERE username=?";
		
		ArticoloBean bean = new ArticoloBean();
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(selectCodeSQL);
			
			ps.setString(1, code);
			
			Utility.print("doRetriveByKey: " + ps.toString());
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bean.setCodiceArticolo(rs.getString("codiceArticolo"));
				bean.setNome(rs.getString("nome"));
				bean.setImmagine(rs.getString("immagine"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCosto(rs.getDouble("costo"));
				bean.setNomeCategoria(rs.getString("nomeCategoria"));
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
	public ArticoloBean doRetriveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<ArticoloBean> doRetriveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(ArticoloBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(ArticoloBean item, String code) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(ArticoloBean item) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	public Collection<ArticoloBean> doRetriveByCategory(String code) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Collection<ArticoloBean> collection = new LinkedList<ArticoloBean>();
		
		String selectCodeSQL = "SELECT * FROM articolo WHERE nomeCategoria=?";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(selectCodeSQL);
			
			ps.setString(1, code);
			
			Utility.print("doRetriveByCategory: " + ps.toString());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ArticoloBean bean = new ArticoloBean();
				
				bean.setCodiceArticolo(rs.getString("codiceArticolo"));
				bean.setNome(rs.getString("nome"));
				bean.setImmagine(rs.getString("immagine"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCosto(rs.getDouble("costo"));
				bean.setNomeCategoria(rs.getString("nomeCategoria"));
				
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

}