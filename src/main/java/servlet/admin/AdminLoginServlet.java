package servlet.admin;

import dto.AdminDTO;
import service.AdminService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("admin/admin_login")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    把管理员信息存到实体模型中
        AdminDTO adt=new AdminDTO();
        adt.setAnme(request.getParameter("aname"));
        adt.setApwd(request.getParameter("apwd"));
//        业务层
        AdminService as=new AdminService();
//        登录成功
        if(as.adminLogin(adt)){
//         登录信息存储到session中
            HttpSession session=request.getSession(true);
            session.setAttribute("admin",adt);
//            获得商品类型
            List<Map<String,Object>> list=as.getGoodsType();
            session.setAttribute("goodsType",list);
//            跳转到后台页面
            RequestDispatcher rds=request.getRequestDispatcher("admin/main.jsp");
            rds.forward(request,response);
        }else{
            response.sendRedirect("admin/loginerror.jsp");
        }
    }
}
