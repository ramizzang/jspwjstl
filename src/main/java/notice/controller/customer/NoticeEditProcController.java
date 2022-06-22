package notice.controller.customer;

import javax.servlet.http.*;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeEditProcController implements Controller {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("NoticeEditController pass");

		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String seq = request.getParameter("c");
		
		//notice에 값 보내주기
		Notice n=new Notice();
		n.setTitle(title);
		n.setContent(content);
		n.setSeq(seq);
		
		NoticeDao dao=new NoticeDao();
		int cnt=dao.update(n);
		
		//notice값을 다시 가져오기		
		n=dao.getNotice(seq);
		
		//request에 notice n을 담아주기
		request.setAttribute("n", n);
		
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
	}
}
