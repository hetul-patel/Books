<%@ page import="helper.BookDisplayHelper" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: hetulpatel
  Date: 09/04/17
  Time: 12:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! String book_ID="";%>
<%! String[] book_Details=null;%>
<%!ArrayList<String[]> chapters = new ArrayList<>(),latestBooks = new ArrayList<>();%>
<% book_ID=(String)request.getParameter("book_ID");
    book_Details = BookDisplayHelper.book_Detail(book_ID);%>
<%response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>

<%!String userid=""; int check=0;%>
  <%
    
     if(session.isNew()){
         session.setAttribute("userid","");
     }
    
     
    
    if((String)session.getAttribute("userid")!=""){
        userid=(String)session.getAttribute("userid");
        check=1;}
    else{
        check=0;
    }
    
  %>



<!doctype html>
<html lang="en" class="no-js">
<head>
    <title><%=book_Details[2]%></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- Icons -->
    <link rel="shortcut icon" href="images/favicon.png">
    <link href='css/fonts/lato.css' rel='stylesheet' type='text/css'>
    <link href="css/fonts/awesome.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" type="text/css" href="css/magnific-popup.css" media="screen">
    <link rel="stylesheet" type="text/css" href="css/owl.carousel.css" media="screen">
    <link rel="stylesheet" type="text/css" href="css/owl.theme.css" media="screen">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css" media="screen">
    <link rel="stylesheet" type="text/css" href="css/animate.css" media="screen">
    <link rel="stylesheet" type="text/css" href="css/style.css" media="screen">
    <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery.migrate.js"></script>
  <script type="text/javascript" src="js/owl.carousel.min.js"></script>
  <script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
  <script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
  <script type="text/javascript" src="js/jquery.appear.js"></script>
  <script type="text/javascript" src="js/jquery.countTo.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/jquery.imagesloaded.min.js"></script>
  <script type="text/javascript" src="js/jquery.isotope.min.js"></script>
  <script type="text/javascript" src="js/retina-1.1.0.min.js"></script>
  <script type="text/javascript" src="js/plugins-scroll.js"></script>
  <script type="text/javascript" src="js/smooth-scroll.js"></script>
  <script type="text/javascript" src="js/waypoint.min.js"></script>
  <!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
  <script type="text/javascript" src="js/jquery.themepunch.tools.min.js"></script>
  <script type="text/javascript" src="js/jquery.themepunch.revolution.min.js"></script>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
  <script type="text/javascript" src="js/gmap3.min.js"></script>
  <script type="text/javascript" src="js/script.js"></script>
  
  <script>

                // Instantiate your javascript function
                ajaxloginjs = null;

                // Begin jQuery
                $(document).ready(function() {

                                // Your jQuery function
                                function ajaxlogin(username,password) {

                                        var dataString = "username=" + username +"&password="+password;

                                         $.ajax({
                                            url: "http://localhost:8080/Pages6/loginservlet",
                                            type: "get",
                                            data: dataString,
                                            success: function(d) {
                                                 
                                                     console.log(d+"HELLO");
                                                     if(d==='no'){
                                                        document.getElementById("errorprint").innerHTML="<span style=\"color:red\">INVALID CREDENTIALS</span>";     
                                                     }else{
                                                        document.getElementById("errorprint").innerHTML="<span style=\"color:green\">LOGIN SUCCESSFUL</span>";
                                                        window.location.href="index.jsp";
                                                     }
                                                     
                                                 
                                            }
                                    });
                                                // some code
                                }
                                // Point the javascript function to the jQuery function
                                ajaxloginjs = ajaxlogin;
                                    
                                function ajaxsignup(Rfname,Rlname,Rusername,Remail,Rpassword) {

                                        var dataString = "fname=" + Rfname +"&lname="+Rlname +"&username="+Rusername +"&email="+Remail +"&password="+Rpassword;
                                            console.log("HELLO FROM JQUERY");
                                         $.ajax({
                                            url: "http://localhost:8080/Pages6/UserRegisterationServlet",
                                            type: "get",
                                            data: dataString,
                                            success: function(d) {
                                                 
                                                     console.log(d+"HELLO");
                                                     if(d==='no'){
                                                        document.getElementById("errorprintsignup").innerHTML="<span style=\"color:red\">Please Try Again Later.</span>";     
                                                     }else{
                                                        document.getElementById("errorprintsignup").innerHTML="<span style=\"color:green\">Welcome</span>";
                                                        window.location.href="index.jsp";
                                                     }
                                                     
                                                 
                                            }
                                    });
                                                // some code
                                }
                                ajaxsignupjs = ajaxsignup;
                });

		</script>


    <style>
        .wrapper {
            margin: 0 auto;
            padding: 40px;
            max-width: 800px;
        }

        .table {
            width: 100%;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
            display: table;
        }

        .rowme {
            display: table-row;
            background: #f6f6f6;
        }
        .rowme:nth-of-type(odd) {
            background: #e9e9e9;
        }
        .rowme.header {
            font-weight: 900;
            color: #ffffff;
            background: #46cdc5;
        }

        .cell {
            padding: 6px 12px;
            display: table-cell;
        }


    </style>
</head>
<body>


<!-- Container -->
<div id="container">
    <!-- Header -->
    <header class="clearfix">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">BOOK<span>Kart</span></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right navigate-section">
            <li><a class="active" href="index.jsp#home-section">Home</a></li>
            <li><a href="index.jsp#shop-section">Books</a></li>
            <li><a href="index.jsp#shop-section2">Must Have</a></li>
            <li><a href="index.jsp#shop-section3">Offers</a></li>
            
            <li><a href="index.jsp#contact-section">Contact</a></li>
             <%if(check==1){%>
            <li><a href="mybooks.jsp">MY BOOKS</a></li>
            <%}%>
            
            <%if(check!=1){%>
            <li class="shopping-cart"><a href="#">Login</a>
              <div class="shopping-cart-drop">

                <!-- Login HERE-->

                <h3>Login</h3>
                <h3 id="errorprint" style="color:gray">Sign in if already registered.</h3>
                
                <ul>
                  <li>
                      <input id="username" style="padding: 16px" type="text" placeholder="Username"/>
                  </li>
                  <li>
                      <input id="password" style="padding: 16px" type="password" placeholder="Password"/>
                  </li>
                </ul>
                <div class="check-box-cont">
                 
                  <a href="javascript:logincheck()">Login</a>
                </div>
              </div>
            </li>
            <%}else{%>
            <li class="shopping-cart"><a href="logoutservlet">Logout</a>
            <%}%>
            
            
            <%if(check!=1){%>
            <li class="shopping-cart"><a href="#">Sign Up</a>
              <div class="shopping-cart-drop">

                <!-- Login HERE-->

                <h3>Register Now!</h3>
                <h3 id="errorprintsignup" style="color:gray">Enter Valid Details</h3>
                
                <ul>
                  <li>
                      <input id="Rfname" style="padding: 16px" type="text" placeholder="First Name"/>
                      <input id="Rlname" style="padding: 16px" type="text" placeholder="Last Name"/>
                  </li>
                  <li>
                      <input id="Rusername" style="padding: 16px" type="text" placeholder="User Name"/>
                  </li>
                  <li>
                      <input id="Remail" style="padding: 16px" type="text" placeholder="Email"/>
                  </li>
                 
                  <li>
                      <input id="Rpassword" style="padding: 16px" type="password" placeholder="Password"/>
                  </li>
                </ul>
                <div class="check-box-cont">
                 
                  <a href="javascript:registeruser()">Register</a>
                </div>
              </div>
            </li>
            <%}%>
            
            
            
            
            
            <%if(check==1){%>
            
            <li class="shopping-cart"><a href="#"><i class="fa fa-shopping-cart"></i>Cart</a>
              <div class="shopping-cart-drop">

                <!-- SHOPING CART HERE-->

                <h3>Shopping Cart</h3>
                
            <%  
                latestBooks = BookDisplayHelper.userbookcart(userid);

                if(latestBooks.size()!=0){ %>
               
                    <ul>
                        
                    <%for(int i=0;i<latestBooks.size();i++){

                    String[] outs = latestBooks.get(i);
                    %>
                    
                      <li>
                        <img src="img/C<%=outs[0]%>.svg" style="height: auto; width: auto;" alt="">
                        <h2><a href="mybookcart.jsp"><%=outs[1]%></a></h2>
                        <span>&#8377;<%=outs[8]%></span>
                      </li>
                      
                    <%}%>  
                      
                    </ul>
                    <div class="check-box-cont">
                      <a href="mybookcart.jsp"><i class="fa fa-shopping-cart"></i>View Cart</a>
                    </div>
              </div>
            </li>
            <%}else{%>
                <br>
                <div style="text-align: center"><img height="50px" width="50px" src="images/bag.svg"/><div><br>
                <div style="text-align:center; color: #999999 ; font-size: 10px; font-family: 'Lato', sans-serif;">YOUR CART IS EMPTY</div><br>
                

                    <%}
            }%>
            
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
  </header>
    <!-- content -->
    <div id="content">
        <!-- page-banner-section -->
        <section class="page-banner-section shop-banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h2><span>Book</span>Details</h2>
                    </div>
                    <div class="col-md-6">
                        <ul class="page-pagin">
                            <li><a href="index.jsp">Home</a></li>
                            <li><a>Book Details</a></li>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- single-product-section -->
        <div class="section-content single-product-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="product-gallery single2">
                            <div class="product-visibility">

                                <div class="image-holder">
                                    <img style="height: auto; width: 350px;" src="img/<%=book_Details[1]%>.svg" alt="<%=book_Details[2]%>">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="product-details">
                            <h1><%=book_Details[2]%></h1>
                            <p class="rate">
                                <% for(int j = 1 ; j<=5;j++){
                                    if(j<=Integer.parseInt(book_Details[4])){%>
                                <i class="fa fa-star"></i>
                                <%}else {%>
                                <i class="fa fa-star-o"></i>
                                <%}
                                }%>
                            </p>
                            <span class="price">&#8377; <%=book_Details[5]%></span>
                            <p><%=book_Details[10]%></p>
                           
                            <a href="#chapters">View All Chapters</a>

                            <div class="prod-list">

                                <!-- SOCIAL MEDIA-->

                                <div class="prod-list-item">
                                    <span>SHARE ON :</span>
                                    <ul class="product-social">
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                        <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                    </ul>
                                </div>



                                <!-- CATEGORY-->

                                <div class="prod-list-item">
                                    <span>CATEGORY :</span>
                                    <ul class="product-cat">
                                        <li><a href="#">Other,</a></li>
                                        <li><a href="#">Fashion</a></li>
                                    </ul>
                                </div>

                                <!-- TAGS -->

                                <div class="prod-list-item">
                                    <span>Tags :</span>
                                    <ul class="product-cat">
                                        <li><a href="#">Armchair,</a></li>
                                        <li><a href="#">Velvet</a></li>
                                    </ul>
                                </div>


                                <!-- AUTHOR-->
                                <div class="prod-list-item">
                                    <span>Author :</span>
                                    <ul class="product-cat">
                                        <li><a href="#"><%=book_Details[3]%></a></li>
                                    </ul>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
                <section id="chapters">
                    <div class="wrapper">

                        <div class="title-section">
                            <h1>List of chapters</h1>
                        </div>

                        <div class="table">

                            <div class="rowme header">
                                <div class="cell">
                                    Index
                                </div>
                                <div class="cell">
                                    Chapter Name
                                </div>
                                <div class="cell">
                                    Price
                                </div>
                                <div class="cell">
                                    Select
                                </div>
                            </div>

                        <%
                            try {
                                chapters = BookDisplayHelper.chaptersOfBook(book_ID);
                            }
                            catch (SQLException e)
                            {
                                System.out.print("Error");
                            }
                            for(int i=0;i<chapters.size();i++){

                                String[] outs = chapters.get(i);

                        %>

                            <div class="rowme">
                                <div class="cell">
                                    <%=outs[1]%>.
                                </div>
                                <div class="cell">
                                    <%=outs[2]%>
                                </div>
                                <div class="cell">
                                    &#8377; <%=outs[5]%>
                                </div>
                                <div class="cell">
                                    <input type="checkbox" onclick="totalIt()" name="chapter" value="<%=outs[5]%>" id="<%=outs[1]%>"/>
                                </div>
                            </div>

                        <%}%>


                        </div>
                        <div style="text-align:center">Number of chapters : <span id="ch_no"style="font-size:20px;color:#1abc9c">0</span> | Total Amount: <span id="ch_price" style="font-size:20px;color:#1abc9c">&#8377; 0</span></div>

                    </div>


                    <div class="product-details" style="text-align:center">
                        <a href="javascript:selectChapters('<%=book_ID%>');">ADD TO CART</a>
                    </div>








                    <div class="single-prod-tab-box tab-box2">
                        <ul class="nav nav-tabs" id="myTab">
                            <li class="active">
                                <a href="#option1" data-toggle="tab">DESCRIPTION</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="option1">
                                <p><%=book_Details[11]%></p>
                            </div>
                        </div>
                    </div>


            </div>
        </div>
    </div>
    <!-- footer  -->
    <footer>
        <div class="container">
            <h2>Social Media</h2>
            <ul class="social-list">
                <li><a class="facebook" ahref="facebook.com/ParthBhatt05"><i class="fa fa-facebook"></i></a></li>
                <li><a class="twitter" ahref="twitter.com/ParthBhatt05"><i class="fa fa-twitter"></i></a></li>
                <li><a class="instagram" ahref="instagram.com/parthnbhatt"><i class="fa fa-instagram"></i></a></li>
                <li><a class="rss" href="#"><i class="fa fa-rss"></i></a></li>
                <li><a class="google" href="#"><i class="fa fa-google-plus"></i></a></li>
                <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                <li><a class="pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
            </ul>
            <p class="copyright">
                &copy; Copyright 2016. BookKart. All rights reserved.
            </p>
        </div>
    </footer>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.migrate.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/jquery.imagesloaded.min.js"></script>
<script type="text/javascript" src="js/retina-1.1.0.min.js"></script>
<script type="text/javascript" src="js/plugins-scroll.js"></script>
<script type="text/javascript" src="js/waypoint.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>
