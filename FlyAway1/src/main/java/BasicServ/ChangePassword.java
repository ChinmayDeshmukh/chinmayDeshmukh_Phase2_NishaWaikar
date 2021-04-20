
package BasicServ;









import javax.servlet.http.*;


import java.io.*;







public class ChangePassword extends HttpServlet {







   @Override


   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {


       PrintWriter out = resp.getWriter();


       String pass = req.getParameter("passwordEntered");


       if (!login.isLoggedIn){


           out.println("You must login first");


       }


       else if (pass.equals("")){


           out.println("Password can't be empty");


       }


       else if (login.isLoggedIn && !pass.equals("")){


           login.password = pass;


           out.println("Password changed. New Password is "+login.password);


       }


       else {


           out.println("Sorry, Something went wrong");


       }


       out.close();


   }


}

