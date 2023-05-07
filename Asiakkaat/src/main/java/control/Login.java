package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.Dao;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    public Login() {
        System.out.println("Login.Login()");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Login.doGet()");
		String logout = request.getParameter("logout");
		if(logout!=null) {
			HttpSession session = request.getSession(true);
			session.invalidate();
			response.sendRedirect("index.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Login.doPost()");
		String uid = request.getParameter("uid");
		System.out.println("uid=" + uid);
		String pwd = request.getParameter("pwd");
		System.out.println("pwd=" + pwd);
		String hashedPwd = request.getParameter("hashedPwd");
		System.out.println("hashedPwd=" +hashedPwd);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		Dao dao = new Dao();
		String nimi=dao.findUser(uid, hashedPwd);
		if(nimi!=null) {
			HttpSession session = request.getSession(true);
			session.setAttribute("kayttaja", nimi);
			out.print("listaaAsiakkaat.jsp");
		}else {
			out.print("index.jsp?unknown=1");
		}		
	}
}