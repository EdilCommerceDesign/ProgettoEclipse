package utils;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

@WebListener
public class MainContext implements ServletContextListener {
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		utils.Utility.print("Startup web application");

		ServletContext context = sce.getServletContext();

		DataSource ds = null;
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/edil_commerce_design");
			try { 
				Connection con = null;
				try {
					con = ds.getConnection();

					DatabaseMetaData metaData = con.getMetaData();

					utils.Utility.print("DBMS name: " + metaData.getDatabaseProductName());
					utils.Utility.print("DBMS version: " + metaData.getDatabaseProductVersion());
				} finally {
					if (con != null)
						con.close();
				}
			} catch (SQLException e) {
				utils.Utility.print(e);//Se da eccezione serve caricare il driver. Importare il jar file nella cartella lib, andare in propireties del progetto, Proprieties/Java Build Path/ Classpath/ add External JARs e si aggiunge il file jar
			}
		} catch (NamingException e) {
			utils.Utility.print(e);
		}
		context.setAttribute("DataSource", ds);
		utils.Utility.print("DataSource creation: " + ds.toString());
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		ServletContextListener.super.contextDestroyed(sce);
	}
}
