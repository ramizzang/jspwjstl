package notice.controller.customer;

import javax.servlet.http.*;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeEditController implements Controller {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("NoticeEditController pass");

		String seq = request.getParameter("c");
		NoticeDao dao = new NoticeDao();
		Notice n = dao.getNotice(seq);

		// request에 notice n을 담기
		request.setAttribute("n", n);
		
		
		
		//담고 noticedetail.jsp로 이동하면서 forward해라
		request.getRequestDispatcher("noticeEdit.jsp").forward(request, response);

	}
}
