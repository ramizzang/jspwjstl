package notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception; //추상메소드 생성
}
