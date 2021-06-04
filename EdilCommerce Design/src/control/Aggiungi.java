package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.ArticoloBean;
import model.ArticoloModelDS;
import model.Carrello;
import utils.Utility;

/**
 * Servlet implementation class Aggiungi
 */
@WebServlet("/Aggiungi")
public class Aggiungi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		ArticoloModelDS model = new ArticoloModelDS(ds);
		
		int quantità = Integer.parseInt((String) request.getParameter("quantità"));
		String codice = (String) request.getParameter("codice");
		Carrello<ArticoloBean> carrello = (Carrello<ArticoloBean>) getServletContext().getAttribute("Carrello");
		ArticoloBean bean = new ArticoloBean();
		
		try {
			bean = model.doRetriveByKey(codice);
			
		} catch(SQLException e) {
			Utility.print(e);
			request.setAttribute("error", e.getMessage());
		}
		
		carrello.addItem(bean, quantità);
		
		getServletContext().setAttribute("Carrello", carrello);
		response.sendRedirect("carrello.jsp?messaggio=" + "Articolo " + bean.getNome() + " aggiunto al carrello");
		return;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
