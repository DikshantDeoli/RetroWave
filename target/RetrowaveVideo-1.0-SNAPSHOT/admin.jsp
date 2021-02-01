
<%@page import="com.mycompany.retrowavevideo.entities.Movie"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.retrowavevideo.helper.FactoryProvider"%>
<%@page import="com.mycompany.retrowavevideo.entities.Category"%>
<%@page import="com.mycompany.retrowavevideo.entities.User"%>
<%@page import="com.mycompany.retrowavevideo.dao.CategoryDao"%>
<%@page import="com.mycompany.retrowavevideo.dao.MovieDao"%>
<%@page import="com.mycompany.retrowavevideo.dao.UserDao"%>
<%
    User user = (User) session.getAttribute("current-user");
    if(user==null){
    session.setAttribute("message","You are not Logged in !! Login First");
    response.sendRedirect("login.jsp");
    return;
    }else{
        if(user.getUserType().equals("normal")){
        session.setAttribute("message","You are not Admin");
        response.sendRedirect("login.jsp");
        return;
    }
    }
    
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <style>
        .admin .card{
    
    background: #eceff1;
}
.admin .card:hover{
    background: #cfd8dc;
    transition: 0.5s;
    cursor: pointer;
}

    </style>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
             <%
              CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
              List<Category> list = cdao.getCategories();
              UserDao udao = new UserDao(FactoryProvider.getFactory());
              List<User> ulist = udao.getUser();
              MovieDao mdao = new MovieDao(FactoryProvider.getFactory());
              List<Movie> mlist = mdao.getAllMovies();
              %>
            <div class="row mt-3">
                <!--first card-->
                <div class="col-md-4" data-toggle="tooltip" data-placement="left" title="Number of User">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid rounded-circle" src="img/user.png" alt="user_icon">
                            </div>
                            <h5><%= ulist.size()%></h5>
                            <h2>Users</h2>
                        </div>
                    </div>
                </div>
               
                <!--second card-->
                <div class="col-md-4" data-toggle="tooltip" data-placement="top" title="Number of Categories Available">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid rounded-circle" src="img/categories.png" alt="category_icon">
                            </div>
                            <h5><%= list.size()%></h5>
                            <h2>Categories</h2>
                        </div>
                    </div>
                </div>
                <!--third card-->
                <div class="col-md-4"  data-toggle="tooltip" data-placement="right" title="Movie Available">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid rounded-circle" src="img/movie.png" alt="movie_icon">
                            </div>
                            <h5><%= mlist.size()%></h5>
                            <h2>Movies</h2>
                        </div>
                    </div>
                    
                </div>
                
            </div>
            
                <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid rounded-circle" src="img/add-category.png" alt="category_icon">
                            </div>
                            
                            <h2>Add Category</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-movie-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid rounded-circle" src="img/add-movie.png" alt="addmovie_icon">
                            </div>
                            
                            <h2>Add Movie</h2>
                        </div>
                    </div>
                </div>
            </div>
            
                
            
            
            
        </div>
       <!--add category modal-->
     
<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         
          <form action="ProductOperationServlet" method="post">
              <input type="hidden" name="operation" value="addcategory">
              <div class="form-group">
                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title " required/>
              </div>
              
              <div class="form-group">
                  <textarea style="height:250px;" class="form-control" name="catDescription" placeholder="Enter Category Description" required></textarea>
              </div>
              <div class="container text-center">
                  <button class="btn btn-primary">Add Category</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
          </form>
          
      </div>
    </div>
  </div>
</div>


<!--add Movie modal-->
     
<!-- Modal -->
<div class="modal fade" id="add-movie-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Movie Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
              <input type="hidden" name="operation" value="addmovie"/>
              <div class="form-group">
                <input type="text" class="form-control" name="movName" placeholder="Movie Title " required/>
              </div>
              
              <div class="form-group">
                  <textarea style="height:150px;" class="form-control" name="movDescription" placeholder="Description" required></textarea>
              </div>
              
             
              <div class="form-group">
              <select name="catId" class="form-control" required>
                  <% 
                    for(Category c : list){
                  %>
                      
              <option value="<%= c.getCategoryId() %>"> <%= c.getCategoryTitle() %></option>
              <%} %>
                </select>
              </div>
              <div class="form-group">
                <input type="number" class="form-control" name="movYear" placeholder="Release Year" required/>
              </div>
              
              <div class="form-group">
                <input type="number" step=0.01 class="form-control" name="movRating" placeholder="IMDB Rating" required/>
              </div>
              
              <div class="form-group">
                <label for="movPic">Choose Movie Poster Image</label>
                <input name="movPic" type="file" class="form-control-file" id="exampleFormControlFile1" required>
              </div>
              
              <div class="form-group">
                <input type="number" class="form-control" name="movPrice" placeholder="Movie Price" required/>
              </div>
              
              <div class="form-group">
                <input type="number" class="form-control" name="movQuantity" placeholder="Quantity" required/>
              </div>
              
              <div class="form-group">
                <input type="number" class="form-control" name="movDiscount" placeholder="Discount" required/>
              </div>
              
              
              
              
              
              <div class="container text-center">
                  <button class="btn btn-primary">Add Category</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
          </form>
          
      </div>
    </div>
  </div>
</div>
         <%@include file="components/common_modals.jsp" %>


        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
    </body>
</html>
