package notice.controller.customer;

import java.io.PrintWriter;

import javax.servlet.http.*;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeDelProcController implements Controller {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("NoticeRegprocController pass");

		String seq=request.getParameter("c");
		
		NoticeDao dao=new NoticeDao();
		int af=dao.delete(seq);
		
		PrintWriter out=response.getWriter();
		if(af>0){
			//af에 1이 들어오면 실행 잘된거
			response.sendRedirect("notice.jsp");
		}else{//0이면 삭제 실행되지 않음
			out.write("삭제오류");
		}
		
	}
}
