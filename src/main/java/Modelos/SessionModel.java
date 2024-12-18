package Modelos;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import Interfaces.SessionInterface;

public class SessionModel implements SessionInterface {

	@Override
	public void saveSessionString(HttpServletRequest request, String key, String value) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute(key, value);
	}

	@Override
	public void saveSessionTimeOut(HttpServletRequest request, int time) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(time);

	}

	@Override
	public void invalidateSession(HttpServletRequest request) {
		// TODO Auto-generated method stub
		request.getSession().invalidate();
	}

}
