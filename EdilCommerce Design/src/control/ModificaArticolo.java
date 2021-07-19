package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.ArticoloBean;
import model.ArticoloModelDS;
import utils.Utility;

@WebServlet("/ModificaArticolo")
public class ModificaArticolo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		Collection<ArticoloBean> collection = new LinkedList<ArticoloBean>();
		
		ArticoloModelDS modelA = new ArticoloModelDS(ds);
		
		ArticoloBean aBean = new ArticoloBean();
		
		String op = request.getParameter("op");
		String codice = request.getParameter("codice");
		
		if(op != null) {
			if(Integer.parseInt(op) == 1) {
				try {
					aBean = modelA.doRetriveByKey(codice);
				} catch (SQLException e) {
					Utility.print(e);
					request.setAttribute("error", e.getMessage());
				}
				
				StringBuffer buffer = new StringBuffer();
				response.setContentType("text/xml");
				
				buffer.append("<form action=" + response.encodeURL("/EdilCommerce_Design/ModificaArticolo") + ">\r\n"
						+ "										<label for=\"nome\">Nome dell'articolo</label>\r\n"
						+ "										<input type=\"text\" name=\"nome\" maxlength=\"50\" required value=" + aBean.getNome() + ">\r\n"
						+ "										\r\n"
						+ "										<label for=\"codice\">Codice</label>\r\n"
						+ "										<input type=\"text\" name=\"codice\" maxlength=\"5\" required value=" + aBean.getCodiceArticolo() + ">\r\n"
						+ "										\r\n"
						+ "										<label for=\"categorie\">Categoria</label>\r\n"
						+ "										<select name=\"categorie\" id=\"categorie\" required>\r\n");
						buffer.append("										  <option value=\"Arredamento interni\">Arredamento interni</option>\r\n"
						+ "										  <option value=\"Arredamento esterni\">Arredamento esterni</option>\r\n"
						+ "										  <option value=\"Rivestimenti\">Rivestimenti</option>\r\n"
						+ "										  <option value=\"Vernici\">Vernici</option>\r\n"
						+ "										  <option value=\"Ferramenta\">Ferramenta</option>\r\n"
						+ "										  <option value=\"Utensileria\">Utensileria</option>\r\n"
						+ "										  <option value=\"Materiali\">Materiali</option>\r\n"
						+ "										  <option value=\"Copertura\">Copertura</option>\r\n"
						+ "										  <option value=\"Struttura\">Struttura</option>\r\n"
						+ "										</select>\r\n"
						+ "										\r\n");
						buffer.append("										<label for=\"immagine\">Foto</label>\r\n"
						+ "										<input type=\"text\" name=\"immagine\" required>\r\n"
						+ "										\r\n"
						+ "										<label for=\"testo\">Descrizione</label>\r\n"
						+ "										<textarea name=\"testo\" cols=\"40\" rows=\"5\" maxlength=\"1000\" required></textarea>\r\n"
						+ "										\r\n"
						+ "										<label for=\"costo\">Costo (&euro;)</label>\r\n"
						+ "										<input type=\"number\" name=\"costo\" min=\"0.01\" required>\r\n"
						+ "										\r\n"
						+ "										<br><br><input type=\"submit\" value=\"Aggiungi\">&nbsp;<input type=\"reset\">\r\n"
						+ "									</form>");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
