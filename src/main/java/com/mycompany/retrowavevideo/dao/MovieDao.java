
package com.mycompany.retrowavevideo.dao;
import com.mycompany.retrowavevideo.entities.Movie;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class MovieDao {
    private SessionFactory factory;

    public MovieDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public boolean saveMovie(Movie movie){
        boolean f = false;
        try{
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            
            session.save(movie);
            
            tx.commit();
            session.close();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
            f=false;
        }
        return f;
    }
    
    public List<Movie> getAllMovies(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Movie");
        List<Movie> list = query.list();
        return list;
    }
    //get movies by category
    public List<Movie> getAllMoviesById(int cid){
        Session s = this.factory.openSession();
        Query query;
        query = s.createQuery("from Movie as m where m.category.categoryId =: id");
        query.setParameter("id", cid);
        List<Movie> list = query.list();
        return list;
    }
}
