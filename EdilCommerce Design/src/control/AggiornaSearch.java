package control;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.ArticoloBean;
import model.ArticoloModelDS;
import model.CategoriaBean;
import model.CategoriaModelDS;
import utils.Utility;

/**
 * Servlet implementation class AggiornaSearch
 */
@WebServlet("/AggiornaSearch")
public class AggiornaSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		Collection<ArticoloBean> collection = new LinkedList<ArticoloBean>();
		
		CategoriaModelDS modelC = new CategoriaModelDS(ds);
		ArticoloModelDS modelA = new ArticoloModelDS(ds);
		
		String criterio = request.getParameter("criterioRicerca");
		String ordine = request.getParameter("ordine");
		String prezzo = request.getParameter("prezzo");
		//String mediaRecensioni = request.getParameter("mediaRecensioni");
		if(criterio== null) {
			response.sendRedirect(response.encodeRedirectURL("/EdilCommerce_Design/"));
		}else if(criterio.isBlank()) {
			response.sendRedirect(response.encodeRedirectURL("/EdilCommerce_Design/"));
		}
		boolean isCategory= false;
		
		Collection<CategoriaBean> collectionC = new LinkedList<CategoriaBean>();
		try{
			collectionC = modelC.doRetriveAll("");
			Iterator<CategoriaBean> it = collectionC.iterator();
			while(it.hasNext() && !isCategory) {
				if(it.next().getNome().equals(criterio)) {
					isCategory = true;
				}
			}
			
			if(isCategory==true) {
				collection=modelA.doRetriveByCategory(criterio, prezzo, ordine);
			}else {
				collection=modelA.doSearchByNome(criterio, prezzo, ordine);
			}
			
		} catch (SQLException e) {
			Utility.print(e);
			request.setAttribute("error", e.getMessage());
		}
		
		StringBuffer buffer = new StringBuffer();
		response.setContentType("text/xml");
		
		
			if(collection == null) {
				buffer.append("		<h3>Nessun articolo trovato</h3>\n");
				
			} else if(collection.isEmpty()){
				buffer.append("		<h3>Nessun articolo trovato</h3>\n");
			} else {
				buffer.append( "		<div class=\"standard-table-size\">"
						+ "		<table>\r\n");
				Iterator<ArticoloBean> it = collection.iterator();
				ArticoloBean bean = new ArticoloBean();
				DecimalFormat df=new DecimalFormat("#0.00");
				int pag = 1, count=0;
				while(it.hasNext()) {
					if(count==7) {
						count=0;
						pag++;
					}
				bean=it.next();
				count++;
				buffer.append("		<tr class=\"pagina" + pag +" pagina\"onclick=\"document.location = '" + response.encodeURL("/EdilCommerce_Design/articolo.jsp?articolo=" + bean.getCodiceArticolo()) + "';\"><td><img alt=\"" + bean.getNome() + "\" src=\"" + bean.getImmagine() + "\"></td>\n"
				+ "		<td><h4>" + bean.getNome() + "</h4>\n");
				/*+"	<span class=\"float-left\">\r\n");
				int i;
				for(i=1; i<6; i++) { 
					buffer.append("<span class=\"fa fa-star") ;
					if(bean.getMediaRecensioni()>=i)
						buffer.append("checked");
					else buffer.append("");
					buffer.append("></span>");
				}
				
				
				buffer.append("		</span>\r\n");*/
				buffer.append( "		<h5>" + df.format(bean.getCosto()) + "&euro;</h5></td></tr>\n");
				}
				buffer.append("		</table>"
						+ "		</div>"
						+ "		<br>\r\n"
						+ "		<div class=\"paginazione\">\r\n"
						+ "		<a href=\"#holder\" onclick=\"prevPag()\">&lt;</a>\r\n");
				int i;
				for(i=0; i<pag; i++) {
					buffer.append("		<a class=\"pagButton"+ (i==0?" current":"") + "\"href=\"#holder\" onclick=\"cambiaPag('" + (i+1) + "')\">" +  (i+1) + "</a>\n");
				}
				buffer.append("		<a href=\"#holder\" onclick=\"succPag()\">&gt;</a>\r\n"
						+ "		</div>\r\n");
				
			}
			response.getWriter().write(buffer.toString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
