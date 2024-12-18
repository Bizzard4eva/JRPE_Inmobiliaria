package Interfaces;

import javax.servlet.http.HttpServletRequest;

public interface SessionInterface {
	public void saveSessionString(HttpServletRequest request, String key, String value);
	public void saveSessionTimeOut(HttpServletRequest request, int time);
	public void invalidateSession(HttpServletRequest request);
}
