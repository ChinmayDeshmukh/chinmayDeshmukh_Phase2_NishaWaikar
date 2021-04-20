<%@page import="java.sql.*"%>
<%@page import="BasicServ.login"%>

<%
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://flyawaydb.cyp0rsmjgi5q.ap-south-1.rds.amazonaws.com:3306/";
    String dbName = "flyaway";
    String userId = "root";
    String password = "rootpassword";
//    String driverName = "com.mysql.jdbc.Driver";
//    String connectionUrl = "jdbc:mysql://remotemysql.com/";
//    String dbName = "XxYrWXRjWf";
//    String userId = "XxYrWXRjWf";
//    String password = "CcEE3g9IWg";
    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FlyAway Airlines</title>
    <link rel = "shortcut icon" type = "image/jpg" href = "pic/PlaneIamge2.jpg" >
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
        body, html {
            height: 100%;
            line-height: 2.0;
        }
        .bgimg-1 {
        }
        .w3-bar .w3-button {
            padding: 16px;
        }
    </style>
</head>

<body>
<div class="w3-bar w3-white w3-card" id="myNavbar">
    <a href="index.jsp" class="w3-bar-item w3-button w3-wide"><img src="img/favicon.png" class="img-fluid" alt="image" width="18%">  FlyAway</a>
    <div class="w3-right w3-hide-small">
        <a href="login.jsp" class="w3-bar-item w3-button"><i class="fa fa-gear"></i> Admin Login</a>
    </div>
</div>
<%
    if (login.isLoggedIn) {
%>
<div class="container">
    <h2 align="center"><b>Dashboard</b></h2>
    <br>
    <div class="row">
        <div class="col-lg-4 col-md-7 col-sm-6 mb-4">
            <form method="post" action="ChangePassword.jsp">
                <button type="submit" class="btn btn-success mb-2 btn-block">Change Password</button>
            </form>&ensp;
        </div>
       
        <div class="col-lg-4 col-md-8 col-sm-6 mb-4">
            <form method="post" action="login.jsp">
                <button type="submit" class="btn mb-2 btn-danger btn-block">Logout</button>
            </form>
        </div>
        <br>
    </div>
</div>

<section class="container-fluid">
    <section class="row justify-content-center">
        <section>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th scope="col">Flight ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Source</th>
                    <th scope="col">Destination</th>
                    <th scope="col">Day</th>
                    <th scope="col">Ticket Price</th>
                </tr>
                </thead>
                <tbody>
                <p style="text-align:center">
                </p>
                <%
                    try{
                        connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                        statement=connection.createStatement();
                        String sql ="SELECT * FROM flight";
                        resultSet = statement.executeQuery(sql);
                        while(resultSet.next()){
                %>
              <tr>
                    <td><%=resultSet.getString("flight_id") %></td>
                    <td><%=resultSet.getString("name") %></td>
                    <td><%=resultSet.getString("source") %></td>
                    <td><%=resultSet.getString("destination") %></td>
                    <td><%=resultSet.getString("days") %></td>
                    <td><%=resultSet.getString("ticket_price") %></td>
                </tr>
                <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    else {
                        out.print("You must Login first");
                    }
                %>
                </tbody>
            </table>
        </section>
    </section>
</section>
<div class="footer" align="center">
</div>
</body>
</html>