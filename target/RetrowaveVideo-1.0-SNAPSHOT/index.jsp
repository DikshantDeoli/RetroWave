<%@page import="com.mycompany.retrowavevideo.helper.Helper"%>
<%@page import="com.mycompany.retrowavevideo.entities.Category"%>
<%@page import="com.mycompany.retrowavevideo.dao.CategoryDao"%>
<%@page import="com.mycompany.retrowavevideo.entities.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.retrowavevideo.dao.MovieDao"%>
<%@page import="com.mycompany.retrowavevideo.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retrowave Movie Rental</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            <%
            String cat = request.getParameter("category");
            
            
            MovieDao dao = new MovieDao(FactoryProvider.getFactory());
            List<Movie> list=null;
            
            if(cat==null || cat.trim()=="all"){
            
             list=dao.getAllMovies();
                }else {
                int cid=Integer.parseInt(cat.trim());
                list=dao.getAllMoviesById(cid);
                }
            
            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist = cdao.getCategories();
            %>
            <div class="col-md-2">
                
                <div class="list-group mt-4">
                <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                All Movies
                </a>
                
                
                <%
                for(Category c:clist)
                {
                %>
                
                <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
                
                
                <%
                }
                %>
            </div>
            </div>
            <div class="col-md-10">
                
                <div class="row mt-4">
                    <div class="col-md-12">
                        
                        <div class="card-columns">
                            
                            <%
                    for(Movie movie:list)
                    {
                    %>
                            
                    <div class="card">
                        <div class="container text-center">
                        <img class="card-img-top" src="img/movies/<%= movie.getmPhoto() %>" style="max-height: 250px;max-width:100%;width: auto " alt="movieImage">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><%= movie.getmName() %></h5>
                            
                            <p class="card-text">
                                
                            <%= Helper.get30Words(movie.getmDesc())%>
                            <small class="form-text text-muted">Category : <%= movie.getCategory().getCategoryTitle() %></small>
                            <p>Release Year : <%= movie.getMyear() %></p>
                            <p>IMDB Rating : <%= movie.getMrating() %></p>
                            </p>
                        </div>
                            <div class="card-footer">
                                <button class="btn btn-primary" onclick="add_to_cart(<%= movie.getiId()%>,'<%= movie.getmName() %>',<%= movie.getMprice()%>)">Add to Cart</button>
                                <button class="btn btn-danger">Rental Price : &#8377; <%= movie.getPriceAfterApplyingDiscount() %>/- </button>
                                <span style="text-decoration: line-through">&#8377; <%= movie.getMprice()%></span>
                                <span class="badge badge-success"><%= movie.getmDiscount() %>% off</span>
                            </div>
                    </div>
                            
                            <%
                }
                

                %>
                            
                        </div>
                        
                        
                    </div>
                </div>
                
                
            </div>
        </div>
            
        </div>
                 <%@include file="components/common_modals.jsp" %>


    </body>
</html>
