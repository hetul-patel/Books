<%-- 
    Document   : mybooks
    Created on : Apr 15, 2017, 4:24:06 PM
    Author     : hetulpatel
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="helper.BookDisplayHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<%!String user_id="";%>
<%user_id=(String)session.getAttribute("userid");
        if(user_id==""){
            response.sendRedirect("index.jsp");
        }
%>
<%!ArrayList<String[]> latestBooks = new ArrayList<>();%>


<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<title>BookKart</title>
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
</head>
<body>
	<!-- Container -->
	<div id="container">
            <header class="clearfix">
             <!-- page-banner-section -->
                <section class="page-banner-section shop-banner">
                        <div class="container">
                                <div class="row">
                                        <div class="col-md-6">
                                                <h2><span>MY</span> BOOKS</h2>
                                        </div>
                                        <div class="col-md-6">
                                                <ul class="page-pagin">
                                                        <li><a href="index.jsp">Home</a></li>
                                                        <li><a href="mybooks.jsp">MY BOOKS</a></li>

                                                </ul>
                                        </div>
                                </div>
                        </div>
                </section>   
            </header>
		
		<!-- content -->
		<div id="content">
			

			<!-- shopping-cart-section  -->
		<section class="shopping-cart-section">
			<div class="container">
				<form class="checking-form">
					<div class="table-responsive">
						<table class="table">
							
								<!-- table row-->
                                                    <% latestBooks = BookDisplayHelper.userpurchasedbookslist(user_id);
                                                    
                                                    

                                                    if(latestBooks.size()!=0){
                                                        
                                                        %>
                                                    <thead>
								<tr>
									<th>No.</th>
									<th></th>
									<th>Book Details</th>
									<th>Chapters</th>
									<th>Price</th>
									<th>Download</th>
								</tr>
                                                    </thead>
                                                    
                                                    <%
                                                        for(int i=0;i<latestBooks.size();i++){

                                                            String[] outs = latestBooks.get(i);

                                                            System.out.println(outs[0] + ":" + outs[7]);

                                                            int m=0;
                                                            Integer[] intstart=new Integer[outs[6].split(",").length];
                                                            for (String str : outs[6].split(","))
                                                                intstart[m++] = Integer.parseInt(str);

                                                            m=0;
                                                            Integer[] intend=new Integer[outs[7].split(",").length];
                                                            for (String str : outs[7].split(","))
                                                                intend[m++] = Integer.parseInt(str);

                                                            List<Integer> start = new ArrayList<>(Arrays.asList(intstart));
                                                            List<Integer> end = new ArrayList<>(Arrays.asList(intend));
                                                            //List<Integer> end = new ArrayList<Integer>(Arrays.asList(out[7].split(",")));
                                                            Collections.sort(start);
                                                            Collections.sort(end);




                                                            String pages = "";
                                                            for(int k=0; k<Integer.parseInt(outs[4]); k++){
                                                                if(k!=(Integer.parseInt(outs[4])-1))
                                                                    pages+=start.get(k)+"_"+end.get(k)+",";
                                                                else
                                                                    pages+=start.get(k)+"_"+end.get(k);

                                                            }

                                                            //System.out.println("Pages: "+pages);

                                                      %>
                                                     
							<tr>
								<td><a class="remove-item"><%=i+1%>.</i></a></td>
								<td><img src="img/C<%=outs[0]%>.svg" alt=""></td>
								<td>
                                                                    <h2><a href="#"><b><%=outs[1]%></b></a></h2>
									<h5><%=outs[2]%></h5>
                                                                        
									<span class="rate">
                                                                            <% for(int j = 1 ; j<=5;j++){
                                                                                if(j<=Integer.parseInt(outs[3])){%>
                                                                            <i class="fa fa-star"></i>
                                                                            <%}else {%>
                                                                            <i class="fa fa-star-o"></i>
                                                                            <%}
                                                                            }%>
                                                                        </span>
                                                                        
								</td>

								<td><span class="price"><%=outs[5]%></span></td>

                                                                <td><span class="price">&#8377;<%=outs[8]%></span></td>

								<td><a href ="ServletEbookDelivery?bookid=<%=outs[0]%>&pages=<%=pages%>" style="text-decoration:null">Download</td>
							</tr>
                                                        <%}%>
                            <!-- table row-->
						
                                                    <% } 
                                                    else{%>
                                                        <div style="text-align: center"><img height="100px" width="100px" src="images/bag.svg"/><div><br>
                                                                <div style="text-align:center; color: #999999 ; font-size: 17px; font-family: 'Lato', sans-serif;">NO BOOKS IN YOUR SHELF</div>
                                                                <div style="text-align:center; color: #999999 ; font-size: 15px; font-family: 'Lato', sans-serif;"><a href="index.jsp">BUY BOOKS</a></div><br><br>
                                                    <%}%>
                                                    
                                                    </table>
					</div>
                                </form>
                        </div>
                    </section>

                </div>
            <br><br><br>
		<!-- footer -->
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
