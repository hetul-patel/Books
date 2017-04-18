<%--
  Created by IntelliJ IDEA.
  User: hetulpatel
  Date: 07/04/17
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="helper.*"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.ArrayList"%>


<%!ArrayList<String[]> latestBooks = new ArrayList<>(),
  musthaveBooks = new ArrayList<>(),
  shoppingCart = new ArrayList<>(),
  bestSellersBooks = new ArrayList<>(),
  onsaleBooks = new ArrayList<>();%>
  
<%response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
  
  <%! String userid=""; int check=0;%>
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
  <title>BookKart</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="author" content="HRProDesign">
  <!-- Icons -->
  <link rel="shortcut icon" href="images/favicon.png">
  <link href="css/fonts/lato.css" rel="stylesheet" type="text/css">
  <link href="css/fonts/awesome.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/owl.carousel.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/owl.theme.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/magnific-popup.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/font-awesome.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/animate.css" media="screen">
  <!-- REVOLUTION BANNER CSS SETTINGS -->
  <link rel="stylesheet" type="text/css" href="css/settings.css" media="screen"/>
  <link rel="stylesheet" type="text/css" href="css/style.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/normalize.css" />
  <link rel="stylesheet" type="text/css" href="css/bookblock.css" />
  <link rel="stylesheet" type="text/css" href="css/component.css" />
  <script src="js/modernizr.custom.js"></script>
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
  <!-- Revolution slider -->
  <script type="text/javascript">
      jQuery(document).ready(function() {
          jQuery('.tp-banner').show().revolution({
              dottedOverlay:"none",
              delay:10000,
              startwidth:960,
              startheight:680,
              hideThumbs:200,
              thumbWidth:100,
              thumbHeight:50,
              thumbAmount:5,
              navigationType:"bullet",
              touchenabled:"on",
              onHoverStop:"off",
              swipe_velocity: 0.7,
              swipe_min_touches: 1,
              swipe_max_touches: 1,
              drag_block_vertical: false,
              parallax:"mouse",
              parallaxBgFreeze:"on",
              parallaxLevels:[7,4,3,2,5,4,3,2,1,0],
              keyboardNavigation:"off",
              navigationHAlign:"center",
              navigationVAlign:"bottom",
              navigationHOffset:0,
              navigationVOffset:120,
              soloArrowLeftHOffset:250,
              soloArrowRightHOffset:250,
              shadow:0,
              fullWidth:"off",
              spinner:"spinner4",
              stopLoop:"off",
              stopAfterLoops:-1,
              stopAtSlide:-1,
              shuffle:"off",
              autoHeight:"off",
              forceFullWidth:"off",
              hideThumbsOnMobile:"off",
              hideNavDelayOnMobile:1500,
              hideBulletsOnMobile:"off",
              hideArrowsOnMobile:"off",
              hideThumbsUnderResolution:0,
              hideSliderAtLimit:0,
              hideCaptionAtLimit:0,
              hideAllCaptionAtLilmit:0,
              startWithSlide:0,
              fullScreenOffsetContainer: ".header"
          });
      });	//ready
  </script>
  
  <script>

                // Instantiate your javascript function
                ajaxloginjs = null;
                ajaxsignupjs = null;

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

        <%
              try {
                latestBooks = BookDisplayHelper.bestSellerBooks();
              }
              catch (SQLException e)
              {
                  System.out.print("Error");
              }
                    for(int i=0;i<latestBooks.size();i++){

                    String[] outs = latestBooks.get(i);

        %>

        .no-csstransforms3d .book[data-book="<%=outs[0]%>"],
        .no-js .book[data-book="<%=outs[0]%>"],
        .book[data-book="<%=outs[0]%>"] .front {
          background: url("Pages6/img/<%=outs[1]%>.svg");
          background: -webkit-linear-gradient(left, rgba(0, 0, 0, 0.1) 0%, rgba(211, 211, 211, 0.1) 5%, rgba(255, 255, 255, 0.15) 5%, rgba(255, 255, 255, 0.1) 9%, rgba(0, 0, 0, 0.01) 100%), url("/img/<%=outs[1]%>.svg"), #009bdb;
          background: linear-gradient(to right, rgba(0, 0, 0, 0.1) 0%, rgba(211, 211, 211, 0.1) 5%, rgba(255, 255, 255, 0.15) 5%, rgba(255, 255, 255, 0.1) 9%, rgba(0, 0, 0, 0.01) 100%), url("/img/<%=outs[1]%>.svg"), #009bdb;
        }

        .book[data-book="<%=outs[0]%>"] .inner { border-color: #009bdb }

        .book[data-book="<%=outs[0]%>"] .cover::before {
          background: url("Pages6/img/S<%=outs[0]%>.svg");
          background: -webkit-linear-gradient(left, transparent 0%, rgba(0, 0, 0, 0.01) 1%, rgba(0, 0, 0, 0.1) 50%, transparent 100%), url("Pages6/img/S<%=outs[0]%>.svg"), #009bdb;
          background: linear-gradient(to right, transparent 0%, rgba(0, 0, 0, 0.01) 1%, rgba(0, 0, 0, 0.1) 50%, transparent 100%), url("Pages6/img/S<%=outs[0]%>.svg"), #009bdb;
        }



        /* border around bookblock same as book cover color*/

        #<%=outs[0]%> { border-color: #009bdb }

        <%}%>


        <%
                try {
                  latestBooks = BookDisplayHelper.musthaveBooks();
                }
                catch (SQLException e)
                {
                    System.out.print("Error");
                }
                      for(int i=0;i<latestBooks.size();i++){

                      String[] outs = latestBooks.get(i);

          %>

        .no-csstransforms3d .book[data-book="<%=outs[0]%>"],
        .no-js .book[data-book="<%=outs[0]%>"],
        .book[data-book="<%=outs[0]%>"] .front {
          background: url("/img/<%=outs[1]%>.svg");
          background: -webkit-linear-gradient(left, rgba(0, 0, 0, 0.1) 0%, rgba(211, 211, 211, 0.1) 5%, rgba(255, 255, 255, 0.15) 5%, rgba(255, 255, 255, 0.1) 9%, rgba(0, 0, 0, 0.01) 100%), url(/img/<%=outs[1]%>.svg), #009bdb;
          background: linear-gradient(to right, rgba(0, 0, 0, 0.1) 0%, rgba(211, 211, 211, 0.1) 5%, rgba(255, 255, 255, 0.15) 5%, rgba(255, 255, 255, 0.1) 9%, rgba(0, 0, 0, 0.01) 100%), url(/img/<%=outs[1]%>.svg), #009bdb;
        }

        .book[data-book="<%=outs[0]%>"] .inner { border-color: #009bdb }

        .book[data-book="<%=outs[0]%>"] .cover::before {
          background: url(/img/S<%=outs[0]%>.svg);
          background: -webkit-linear-gradient(left, transparent 0%, rgba(0, 0, 0, 0.01) 1%, rgba(0, 0, 0, 0.1) 50%, transparent 100%), url(/img/S<%=outs[0]%>.svg), #009bdb;
          background: linear-gradient(to right, transparent 0%, rgba(0, 0, 0, 0.01) 1%, rgba(0, 0, 0, 0.1) 50%, transparent 100%), url(/img/S<%=outs[0]%>.svg), #009bdb;
        }



        /* border around bookblock same as book cover color*/

        #<%=outs[0]%> { border-color: #009bdb }

        <%}%>
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
            <li><a class="active" href="#home-section">Home</a></li>
            <li><a href="#shop-section">Books</a></li>
            <li><a href="#shop-section2">Must Have</a></li>
            <li><a href="#shop-section3">Offers</a></li>
            
            <li><a href="#contact-section">Contact</a></li>
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

 
  
  <!-- home-section -->
  <section id="home-section" class="slider1">
    <!--THEMEPUNCH BANNER-->
    <div class="tp-banner-container">
      <div class="tp-banner" >
        <ul>	<!-- SLIDE  -->
          <li data-transition="fade" data-slotamount="7" data-masterspeed="500" data-saveperformance="on"  data-title="Intro Slide">
            <!-- MAIN IMAGE -->
            <img src="images/slide/1.jpg"  alt="slidebg1" data-lazyload="images/slide/1.jpg" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
            <!-- LAYERS -->
            <!-- LAYER 1 -->
            <div class="tp-caption small_text lft tp-resizeme rs-parallaxlevel-0"
                 data-x="325"
                 data-y="240"
                 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                 data-speed="500"
                 data-start="1200"
                 data-easing="Power3.easeInOut"
                 data-splitin="none"
                 data-splitout="none"
                 data-elementdelay="0.05"
                 data-endelementdelay="0.1"
                 style="z-index: 7; max-width: auto; max-height: auto; white-space: nowrap;"></div>
            <!-- LAYER 2 -->
            <div class="tp-caption finewide_medium_white customin tp-resizeme rs-parallaxlevel-0"
                 data-x="255"
                 data-y="282"
                 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                 data-speed="500"
                 data-start="1800"
                 data-easing="Power3.easeInOut"
                 data-splitin="none"
                 data-splitout="none"
                 data-elementdelay="0.1"
                 data-endelementdelay="0.1"
                 style="z-index: 8; max-width: auto; max-height: auto; white-space: nowrap;">BOOK<span>KART</span><br>
            </div>
            <!-- LAYER 3 -->
            <div class="tp-caption small_text lfr tp-resizeme rs-parallaxlevel-0"
                 data-x="254"
                 data-y="368"
                 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                 data-speed="500"
                 data-start="2200"
                 data-easing="Power3.easeInOut"
                 data-splitin="none"
                 data-splitout="none"
                 data-elementdelay="0.05"
                 data-endelementdelay="0.1"
                 style="z-index: 7; max-width: auto; max-height: auto; white-space: nowrap;">NOW JUST PAY FOR WHAT YOU WANT TO READ
            </div>
            <!-- LAYER 4 -->
            <div class="tp-caption lfb tp-resizeme rs-parallaxlevel-0"
                 data-x="410"
                 data-y="430"
                 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                 data-speed="500"
                 data-start="2600"
                 data-easing="Power3.easeInOut"
                 data-splitin="none"
                 data-splitout="none"
                 data-elementdelay="0.1"
                 data-endelementdelay="0.1"
                 data-linktoslide="next"
                 style="z-index: 10; max-width: auto; max-height: auto; white-space: nowrap;"><a href="#shop-section" class="trans-btn">Shop Now</a>
            </div>
          </li>
          <!-- SLIDE  -->
          <li data-transition="fade" data-slotamount="7" data-masterspeed="2000" data-saveperformance="on"  data-title="Ken Burns Slide">
            <!-- MAIN IMAGE -->
            <img src="images/dummy.png"  alt="2" data-lazyload="images/slide/2.jpg" data-bgposition="right top" data-kenburns="on" data-duration="12000" data-ease="Power0.easeInOut" data-bgfit="115" data-bgfitend="100" data-bgpositionend="center bottom">
            <!-- LAYERS -->
            <!-- LAYER 1 -->
            <div class="tp-caption small_text lft tp-resizeme rs-parallaxlevel-0"
                 data-x="0"
                 data-y="190"
                 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                 data-speed="500"
                 data-start="1200"
                 data-easing="Power3.easeInOut"
                 data-splitin="none"
                 data-splitout="none"
                 data-elementdelay="0.05"
                 data-endelementdelay="0.1"
                 style="z-index: 7; max-width: auto; max-height: auto; white-space: nowrap;"><span>BROWSE AMONG MORE THAN 2000 BOOK</span>
            </div>
            <!-- LAYER 2 -->
            <div class="tp-caption finewide_medium_white customin tp-resizeme rs-parallaxlevel-0 padd-lf-none black-style"
                 data-x="0"
                 data-y="232"
                 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                 data-speed="500"
                 data-start="1800"
                 data-easing="Power3.easeInOut"
                 data-splitin="none"
                 data-splitout="none"
                 data-elementdelay="0.1"
                 data-endelementdelay="0.1"
                 style="z-index: 8; color: white;max-width: auto; max-height: auto; white-space: nowrap;">THE <span>NEW</span> WAY <br> OF <span>SHOPPING BOOKS</span><br>
            </div>
            <!-- LAYER 3 -->
            <div class="tp-caption small_text lfr tp-resizeme rs-parallaxlevel-0"
                 data-x="0"
                 data-y="376"
                 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                 data-speed="500"
                 data-start="2200"
                 data-easing="Power3.easeInOut"
                 data-splitin="none"
                 data-splitout="none"
                 data-elementdelay="0.05"
                 data-endelementdelay="0.1"
                 style="z-index: 7; max-width: auto; max-height: auto; white-space: nowrap;"><span>Great Deals</span>
            </div>
            <!-- LAYER 4 -->
            <div class="tp-caption lfb tp-resizeme rs-parallaxlevel-0"
                 data-x="0"
                 data-y="430"
                 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                 data-speed="500"
                 data-start="2600"
                 data-easing="Power3.easeInOut"
                 data-splitin="none"
                 data-splitout="none"
                 data-elementdelay="0.1"
                 data-endelementdelay="0.1"
                 data-linktoslide="next"
                 style="z-index: 10; max-width: auto; max-height: auto; white-space: nowrap;"><a href="#shop-section" class="trans-btn">Shop Now</a>
            </div>
          </li>
          <!-- SLIDE  -->
          <li data-transition="fade" data-slotamount="7" data-masterspeed="1000" data-saveperformance="on"  data-title="Parallax 3D">
            <!-- MAIN IMAGE -->
            <img src="images/slide/3.jpg"  alt="3dbg" data-lazyload="images/slide/3.jpg" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
            <!-- LAYERS -->
            <!-- LAYER 1 -->
            <div class="tp-caption small_text lft tp-resizeme rs-parallaxlevel-0"
                 data-x="0"
                 data-y="190"
                 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                 data-speed="500"
                 data-start="1200"
                 data-easing="Power3.easeInOut"
                 data-splitin="none"
                 data-splitout="none"
                 data-elementdelay="0.05"
                 data-endelementdelay="0.1"
                 style="z-index: 7; max-width: auto; max-height: auto; white-space: nowrap;">The first of its kind
            </div>
            <!-- LAYER 2 -->
            <div class="tp-caption finewide_medium_white customin tp-resizeme rs-parallaxlevel-0 padd-lf-none"
                 data-x="0"
                 data-y="232"
                 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                 data-speed="500"
                 data-start="1800"
                 data-easing="Power3.easeInOut"
                 data-splitin="none"
                 data-splitout="none"
                 data-elementdelay="0.1"
                 data-endelementdelay="0.1"
                 style="z-index: 8; max-width: auto; max-height: auto; white-space: nowrap;"><span>JUST BUY</span> <br>THE CHAPTERS<br> NOT <span>ENTIRE BOOK</span><br>
            </div>
            <!-- LAYER 4 -->
            <div class="tp-caption lfb tp-resizeme rs-parallaxlevel-0"
                 data-x="0"
                 data-y="450"
                 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                 data-speed="500"
                 data-start="2200"
                 data-easing="Power3.easeInOut"
                 data-splitin="none"
                 data-splitout="none"
                 data-elementdelay="0.1"
                 data-endelementdelay="0.1"
                 data-linktoslide="next"
                 style="z-index: 10; max-width: auto; max-height: auto; white-space: nowrap;"><a href="#shop-section" class="trans-btn">Shop Now</a>
            </div>
          </li>
        </ul>
        <div class="tp-bannertimer"></div>
      </div>
    </div>
  </section>
  <!-- product-marketing-section-->
  <div id="product-marketing-section">
    <div class="marketing-box">
      <div class="product">
          <img alt="" src="images/bg/back.png">
        <div class="hover-mark">
          <h2>AMAZING CLIENTS SUPPORT</h2>
          <h2><span>Let us guide you</span></h2>
          
          <h1 class="offer"><span>100%</span></h1>
        </div>
      </div>
      <div class="product">
        <img alt="" src="images/bg/back.jpg">
        <div class="hover-mark">
          <h1 class="offer"><span>100%</span></h1>
          <h2>SATISFACTION GUARANTEED</h2>
          
        </div>
      </div>
      <div class="product">
        <img alt="" src="images/bg/back.jpg">
        <div class="hover-mark">
          <h2>Great daily deals</h2>
          <h1 class="offer">best <span>Offers</span></h1>
          
        </div>
      </div>
      <div class="product">
        <img alt="" src="images/bg/back.jpg">
        <div class="hover-mark">
          <h2>JUST PAY AND DOWNLOAD</h2>
          <h2><span>Anytime and Anywhere</span></h2>
          
          
        </div>
      </div>
    </div>
  </div>
  <!-- shop-section-->
  <div id="shop-section">
    <div id="scroll-wrap" class="container">
      <div class="title-section">
        <h1>Latest books</h1>
        <span></span>
      </div>
      <div class="title-line">
        <h1>Shelf<a href="#">View All</a></h1>
      </div>
      <div id="bookshelf" class="bookshelf products-box">

<%
  try {
    latestBooks = BookDisplayHelper.latestBooks();
  }
  catch (SQLException e)
  {
      System.out.print("Error");
  }
        for(int i=0;i<latestBooks.size();i++){

        String[] outs = latestBooks.get(i);

%>


        <!--LOOP 1-->


        <!-- Book Item-->
        <figure class="product-post">
          <!--<div class="book" data-book="<%=outs[0]%>"></div>-->
            <img style="height: auto; width: 200px;" src="img/<%=outs[1]%>.svg" alt="<%=outs[2]%>">
          <!--<div class="buttons"><a href="#">Look inside</a><a href="#">Details</a></div>-->
          <figcaption><h2 class="text-ellipsis"><a href="Book_Details.jsp?book_ID=<%=outs[0]%>"><%=outs[2]%></a><span><i class="fa fa-user"></i> <%=outs[3]%></span></h2></figcaption>

          <p class="rate">
              <% for(int j = 1 ; j<=5;j++){
                  if(j<=Integer.parseInt(outs[4])){%>
              <i class="fa fa-star"></i>
              <%}else {%>
              <i class="fa fa-star-o"></i>
              <%}
              }%>
          </p>

          <span>&#8377; <%=outs[5]%></span>
          <div class="product-links">
            <a class="add-cart-btn" href="Book_Details.jsp?book_ID=<%=outs[0]%>#chapters"><i class="fa fa-shopping-cart"></i><span>Buy Chapters</span></a>
         
            <a href="Book_Details.jsp?book_ID=<%=outs[0]%>"><i class="fa fa-align-justify"></i></a>
          </div>
          
        </figure>
        <!--End Book Item-->

<%}%>
        <!-- LOOP 1 ENDS-->



      </div>
    </div>
  </div>
  <!-- shop-section -->







  

  <!-- subscribe-section  
  <section id="subscribe-section">
    <div class="container">
      <div class="subscribe-box">
        <h2>SUBSCRIBE TO OUR NEWSLETTER AND GET A &#8377;1000 VOUCHER</h2>
        <form class="subscribe-form">
          <input type="text" name="subscribe" id="subscribe" placeholder="enter your email address"/>
          <input type="submit" id="subscribe-submit" value="Subscribe"/>
        </form>
      </div>
    </div>
  </section>-->




  <section id="category-section">
			<div class="container">
				<div class="title-section white">
					<h1>Book Categories</h1>
					<span></span>
				</div>
				<div class="category-box">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<div class="cat-post">
								<img src="images/bg/children.jpg" alt="">
								<div class="cat-hover">
									<a href="#">Children <br> <span>29 Items</span></a>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="cat-post">
								<img src="images/bg/education.jpg" alt="">
								<div class="cat-hover">
									<a href="#">Education <br> <span>80 Items</span></a>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="cat-post">
								<img src="images/bg/sport.jpg" alt="">
								<div class="cat-hover">
									<a href="#">Sport <br> <span>65 Items</span></a>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="cat-post">
								<img src="images/bg/religion.jpg" alt="">
								<div class="cat-hover">
									<a href="#">Religion <br> <span>44 Items</span></a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>


  <!-- shop-section2 -->
  <section id="shop-section2">
    <div class="container">
      <div class="title-section">
        <h1>MUST HAVE</h1>
        <span></span>
      </div>
      <div id="bookshelf" class="bookshelf products-box">


        <!--LOOP 4-->

<%
  try {
    musthaveBooks = BookDisplayHelper.musthaveBooks();
  }
  catch (SQLException e)
  {
    System.out.print("Error");
  }
  for(int i=0;i<musthaveBooks.size();i++){

    String[] outs = musthaveBooks.get(i);

%>



        <!-- Book Item-->
        <figure class="product-post">
          <!--<div class="book" data-book="<%=outs[0]%>"></div>-->
            <img style="height: auto; width: 200px;" src="img/<%=outs[1]%>.svg" alt="<%=outs[2]%>">
          <!--<div class="buttons"><a href="#">Look inside</a><a href="#">Details</a></div>-->
          <figcaption><h2 class="text-ellipsis"><a href="Book_Details.jsp?book_ID=<%=outs[0]%>"><%=outs[2]%></a><span><i class="fa fa-user"></i> <%=outs[3]%></span></h2></figcaption>

          <p class="rate">
              <% for(int j = 1 ; j<=5;j++){
                  if(j<=Integer.parseInt(outs[4])){%>
              <i class="fa fa-star"></i>
              <%}else {%>
              <i class="fa fa-star-o"></i>
              <%}
              }%>
          </p>

          <span>&#8377; <%=outs[5]%></span>
          <div class="product-links">
           <a class="add-cart-btn" href="Book_Details.jsp?book_ID=<%=outs[0]%>#chapters"><i class="fa fa-shopping-cart"></i><span>Buy Chapters</span></a>
         
            <a href="Book_Details.jsp?book_ID=<%=outs[0]%>"><i class="fa fa-align-justify"></i></a>
          </div>
          
        </figure>
        <!--End Book Item-->

<%}%>

        <!--LOOP 4 ENDS-->

<section id="shop-section3">
      </div>
      <!-- Nav tabs -->
      <div class="tab-product-box">
        <div class="tab-posts-box">
          <ul class="nav nav-tabs" id="myTab">
            <li class="active">
              <a href="#option1" data-toggle="tab">BEST SELLERS</a>
            </li>
            <li>
              <a href="#option2" data-toggle="tab">ON-SALE</a>
            </li>
          </ul>

          <div class="tab-content">
            <div class="tab-pane active" id="option1">
              <div class="row">

                <!--LOOP 5 Best Sellers -->



                <%
                  try {
                    bestSellersBooks = BookDisplayHelper.bestSellerBooks();
                  }
                  catch (SQLException e)
                  {
                    System.out.print("Error");
                  }

                  for(int i=0;i<bestSellersBooks.size();i++){


                    String[] outs = bestSellersBooks.get(i);

                    if(i%2==0){

                %>
                <div class="col-md-4">
                  <ul class="product-list">
                    <li>
                      <img style="height: auto; width: 120px;" src="img/<%=outs[1]%>.svg" alt="<%=outs[2]%>">
                      <div class="product-list-content">
                        <h2><a href="Book_Details.jsp?book_ID=<%=outs[0]%>"> <%=outs[2]%></a></h2>
                        <p>
                          <% for(int j = 1 ; j<=5;j++){
                            if(j<=Integer.parseInt(outs[4])){%>
                          <i class="fa fa-star"></i>
                          <%}else {%>
                          <i class="fa fa-star-o"></i>
                          <%}
                          }%>
                        </p>
                        <span class="price">&#8377; <%=outs[5]%></span>
                        <p><%=outs[10]%></p>
                      </div>
                    </li>

                    <%} else{%>

                    <li>
                      <img style="height: auto; width: 120px;" src="img/<%=outs[1]%>.svg" alt="<%=outs[2]%>">
                      <div class="product-list-content">
                        <h2><a href="Book_Details.jsp?book_ID=<%=outs[0]%>"> <%=outs[2]%></a></h2>
                        <p>
                          <% for(int j = 1 ; j<=5;j++){
                            if(j<=Integer.parseInt(outs[4])){%>
                          <i class="fa fa-star"></i>
                          <%}else {%>
                          <i class="fa fa-star-o"></i>
                          <%}
                          }%>
                        </p>
                        <span class="price">&#8377; <%=outs[5]%></span>
                        <p><%=outs[10]%></p>
                      </div>
                    </li>

                    <%} if(i%2!=0 || i==bestSellersBooks.size()-1){%>
                  </ul>
                </div>
                <%}
                }%>

                <!--LOOP 5 ENDS -->

              </div>
            </div>



            <div class="tab-pane" id="option2">
              <div class="row">

                <!-- LOOP 6 On Sale Books -->



  <%
      try {
          onsaleBooks = BookDisplayHelper.onSaleBooks();
      }
      catch (SQLException e)
      {
          System.out.print("Error");
      }

      for(int i=0;i<onsaleBooks.size();i++){


          String[] outs = onsaleBooks.get(i);

          if(i%2==0){

  %>
                <div class="col-md-4">
                  <ul class="product-list">
                    <li>
                      <img style="height: auto; width: 120px;" src="img/<%=outs[1]%>.svg" alt="<%=outs[2]%>">
                      <div class="product-list-content">
                        <h2><a href="Book_Details.jsp?book_ID=<%=outs[0]%>"> <%=outs[2]%></a></h2>
                        <p>
                            <% for(int j = 1 ; j<=5;j++){
                                if(j<=Integer.parseInt(outs[4])){%>
                            <i class="fa fa-star"></i>
                            <%}else {%>
                            <i class="fa fa-star-o"></i>
                            <%}
                            }%>
                        </p>

                        <span class="old-price"><del>&#8377; <%=outs[5]%> </del></span>
                        <span class="price">&#8377;<%=outs[6]%></span>

                        <p><%=outs[10]%></p>
                      </div>
                    </li>

  <%} else{%>

                    <li>
                      <img style="height: auto; width: 120px;" src="img/<%=outs[1]%>.svg" alt="<%=outs[2]%>">
                      <div class="product-list-content">
                        <h2><a href="Book_Details.jsp?book_ID=<%=outs[0]%>"> <%=outs[2]%></a></h2>
                        <p>
                          <% for(int j = 1 ; j<=5;j++){
                            if(j<=Integer.parseInt(outs[4])){%>
                          <i class="fa fa-star"></i>
                          <%}else {%>
                          <i class="fa fa-star-o"></i>
                          <%}
                          }%>
                        </p>
                        <span class="old-price"><del>&#8377; <%=outs[5]%> </del></span>
                        <span class="price">&#8377;<%=outs[6]%></span>
                        <p><%=outs[10]%></p>
                      </div>
                    </li>

  <%} if(i%2!=0 || i==onsaleBooks.size()-1){%>
                  </ul>
                </div>
  <%}
      }%>
      
      
                    <!-- LOOP 6 ENDS -->





              </div>
            </div>

          </div>
        </div>
      </div>

    </div>
  </section>
  <!-- services-section -->
  <section id="services-section">
    <div class="container">
      <div class="services-box">
        <div class="row">
          <div class="col-md-3">
            <div class="services-post">
              <a href="#"><i class="fa fa-globe"></i></a>
              <h2>Worldwide <br> Access</h2>
              <p>Download any e-book you may like.</p>
            </div>
          </div>
          <div class="col-md-3">
            <div class="services-post">
              <a href="#"><i class="fa fa-clock-o"></i></a>
              <h2>24/7 <br> Services</h2>
              <p>Open always in your service.</p>
            </div>
          </div>
          <div class="col-md-3">
            <div class="services-post">
              <a href="#"><i class="fa fa-truck"></i></a>
              <h2>Express <br> Delivery</h2>
              <p>Pay and download any e-book from your shelf.</p>
            </div>
          </div>
          <div class="col-md-3">
            <div class="services-post">
              <a href="#"><i class="fa fa-heart"></i></a>
              <h2>Lovely <br> Store</h2>
              <p>Just buy the chapters you want to read. Nothing more.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
    </div>

  <!-- contact-section -->
  <section id="contact-section">
    <div class="contact-info">
      <div class="container">
        <div class="title-section white">
          <h1>Contact us</h1>
          <span></span>
        </div>
        <div class="contact-info-box">
          <div class="row">
            <div class="col-md-4">
              <span><i class="fa fa-map-marker"></i></span>
              <h2>Office</h2>
              <p>B206, NIRMA UNIVERSITY <br> Chharodi, Ahemadabad</p>
            </div>
            <div class="col-md-4">
              <span><i class="fa fa-phone"></i></span>
              <h2>Call Us</h2>
              <p> Phone: +919408505502 <br> or +919724242632</p>
            </div>
            <div class="col-md-4">
              <span><i class="fa fa-envelope"></i></span>
              <h2>Email Us</h2>
              <p> 14bce034@nirmauni.ac.in <br> 14bce036@nirmauni.ac.in <br> 14bce011@nirmauni.ac.in</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="contact-form">
      <div class="container">
        <form id="contact-form">
          <h2>GET IN TOUCH</h2>
          <div class="row">
            <div class="col-md-4">
              <input name="name" id="name" type="text" placeholder="Name(Required)">
            </div>
            <div class="col-md-4">
              <input name="mail" id="mail" type="text" placeholder="Email(Required)">
            </div>
            <div class="col-md-4">
              <input name="website" id="website" type="text" placeholder="Website">
            </div>
          </div>
          <textarea name="comment" id="comment" placeholder="Your Message(Required)"></textarea>
          <div class="submit-area">
            <input type="submit" id="submit_contact" value="Send Message">
            <div id="msg" class="message"></div>
          </div>
        </form>
      </div>
    </div>
  </section>
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
<script src="js/bookblock.min.js"></script>
<script src="js/classie.js"></script>
<script src="js/bookshelf.js"></script>
</body>
</html>
