package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import model.ArticoloBean;
import model.Carrello;
import model.ComponeBean;
import model.ComponeModelDS;
import model.InfoFatturazioneBean;
import model.OrdineBean;
import model.OrdineModelDS;
import model.PagamentoBean;
import model.UserBean;
import utils.Utility;

@WebServlet("/ComputaOrdine")
public class ComputaOrdine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		
		OrdineBean oBean = new OrdineBean();
		InfoFatturazioneBean ifBean = new InfoFatturazioneBean();
		PagamentoBean pBean = new PagamentoBean();
		
		HttpSession session =  request.getSession(false);
		if(session != null) {
			OrdineModelDS oModel = new OrdineModelDS(ds);
			Carrello<ArticoloBean> carrello = (Carrello<ArticoloBean>) session.getAttribute("Carrello");
			
			oBean.setUsername(((UserBean)session.getAttribute("loggedUser")).getUsername());
			try {
				oModel.doSave(oBean);
				
				LinkedList<OrdineBean> col = (LinkedList<OrdineBean>) oModel.doRetriveAll("");
				oBean = col.getLast();
				
				ComponeModelDS cModel = new ComponeModelDS(ds);
				
				List<ArticoloBean> items = carrello.getItems();
				List<Integer> quantità = carrello.getQuantità();
				Iterator<ArticoloBean> it1 = items.iterator();
				Iterator<Integer> it2 = quantità.iterator();
				
				while(it1.hasNext() && it2.hasNext()) {
					ComponeBean cBean = new ComponeBean();
					cBean.setNumeroOrdine(oBean.getNumeroOrdine());
					cBean.setCodiceArticolo(it1.next().getCodiceArticolo());
					cBean.setQuantità(it2.next());
					cModel.doSave(cBean);
				}
				
				//Fare PagamentoModelDS InfoModelDS CartaModelDS ContrassegnoModelDS poi continuare con l'inserimento da pagamento in poi
				
			} catch (SQLException e) {
				Utility.print(e);
				request.setAttribute("error", e.getMessage());
			}
			
		} 
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
