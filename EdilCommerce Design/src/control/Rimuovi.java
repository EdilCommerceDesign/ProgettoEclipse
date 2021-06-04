package control;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Iterator;
import java.util.List;

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

@WebServlet("/Rimuovi")
public class Rimuovi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		ArticoloModelDS model = new ArticoloModelDS(ds);
		
		int quantità = 0;
		String codice = (String) request.getParameter("codice");
		Carrello<ArticoloBean> carrello = (Carrello<ArticoloBean>) getServletContext().getAttribute("Carrello");
		ArticoloBean bean = new ArticoloBean();
		
		try {
			bean = model.doRetriveByKey(codice);
		} catch(SQLException e) {
			Utility.print(e);
			request.setAttribute("error", e.getMessage());
		}
		
		carrello.deleteItem(bean);
		getServletContext().setAttribute("Carrello", carrello);
		
		response.setContentType("text/xml");
		
		StringBuffer buffer = new StringBuffer();
		
		List<ArticoloBean> articoli = carrello.getItems();
		List<Integer> artQuantità = carrello.getQuantità();
		Iterator<ArticoloBean> it1 = articoli.iterator();
		Iterator<Integer> it2 = artQuantità.iterator();
		
		Integer q = 0;
		DecimalFormat df=new DecimalFormat("#.00");
			
		while(it1.hasNext() && it2.hasNext()){
			bean=it1.next();
			q=it2.next();
			buffer.append("<tr><td><a href=\"/EdilCommerce_Design/articolo.jsp?articolo=" + bean.getCodiceArticolo() + "\"><img alt=\"" + bean.getNome() + "\" src=\"" + bean.getImmagine() + "\"></a></td>");
			buffer.append("<td><h4><a href=\"/EdilCommerce_Design/articolo.jsp?articolo=" + bean.getCodiceArticolo() + "\">" + bean.getNome() + "</a></h4>");
			buffer.append("<h5>" + df.format(bean.getCosto()) + "&euro;</h5>");
			buffer.append("<label>Quantità</label><input type=\"number\" value=\"" + q + "\"></td>");
			buffer.append("<td><button onclick='deleteItem(\"" + bean.getCodiceArticolo() + "\", \"carrello\")'>X</button></td></tr>");		
		}
		
		response.getWriter().write(buffer.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
