package notice.controller.customer;

import javax.servlet.http.*;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeDetailController implements Controller { // 인터페이스 상속받아 메서드 정의

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeDetailController pass");

		String seq = request.getParameter("c");
		NoticeDao dao = new NoticeDao();
		Notice n = dao.getNotice(seq);
		
		request.setAttribute("n", n);
		
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);

	}
	
	/*
	 * public void execute(HttpServletRequest request, HttpServletResponse response)
	 * throws Exception {
	 * 
	 * System.out.println("NoticeDetailController pass");
	 * 
	 * String seq = request.getParameter("c"); 
	 * NoticeDao dao = new NoticeDao();
	 * Notice n = dao.getNotice(seq);
	 * 
	 * // request에 notice n을 담기 
	 * request.setAttribute("n", n);
	 * 
	 * 
	 * 
	 * //담고 noticedetail.jsp로 이동하면서 forward해라
	 * request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
	 * 
	 * }
	 */
	
}
