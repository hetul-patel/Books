/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author hetulpatel
 */
public class BookDisplayHelper {
    
    static ArrayList<String[]> Books = null;
    
    static final int column = 12;
    
    
    
    public void BookDisplayHelper() {
        
         
        
    }
    
    public static ArrayList<String[]> latestBooks() throws SQLException{
        
        
        Books = new ArrayList<>();
        sqlDB.connect();
        
        ResultSet res= sqlDB.fetchLatestBooks();
        
        while(res.next()){
            
            String[] row=new String[column];
            
            for(int i=1;i<=column;i++ ){
                row[i-1]=res.getString(i);
            }
            
            Books.add(row);
            
        }
        
        sqlDB.connclose();
        
        return Books;
        
    }
    
    public static ArrayList<String[]> musthaveBooks() throws SQLException{
        
        
        Books = new ArrayList<>();
        sqlDB.connect();
        
        ResultSet res= sqlDB.fetchMustHave();
        
        while(res.next()){
            
            String[] row=new String[column];
            
            for(int i=1;i<=column;i++ ){
                row[i-1]=res.getString(i);
            }
            
            Books.add(row);
            
        }
        
        sqlDB.connclose();
        
        return Books;
        
    }
    
    
    public static ArrayList<String[]> bestSellerBooks() throws SQLException{
        
        
        Books = new ArrayList<>();
        sqlDB.connect();
        
        ResultSet res= sqlDB.fetchBestSeller();
        
        while(res.next()){
            
            String[] row=new String[column];
            
            for(int i=1;i<=column;i++ ){
                row[i-1]=res.getString(i);
            }
            
            Books.add(row);
            
        }
        
        sqlDB.connclose();
        
        return Books;
        
    }
    
    public static ArrayList<String[]> onSaleBooks() throws SQLException{
        
        
        Books = new ArrayList<>();
        sqlDB.connect();
        
        ResultSet res= sqlDB.fetchOnSale();
        
        while(res.next()){
            
            String[] row=new String[column];
            
            for(int i=1;i<=column;i++ ){
                row[i-1]=res.getString(i);
            }
            
            Books.add(row);
            
        }
        
        sqlDB.connclose();
        
        return Books;
        
    }

    public static String[] book_Detail(String Book_ID) throws SQLException{

        String[] row=new String[column];

        sqlDB.connect();

        ResultSet res= sqlDB.fetchBookDetails(Book_ID);

        while(res.next()){



            for(int i=1;i<=column;i++ ){
                row[i-1]=res.getString(i);
            }

        }

        sqlDB.connclose();

        return row;

    }

    public static ArrayList<String[]> chaptersOfBook(String Book_ID) throws SQLException{


        Books = new ArrayList<>();
        sqlDB.connect();

        ResultSet res= sqlDB.fetchChapters(Book_ID);

        while(res.next()){

            String[] row=new String[6];

            for(int i=1;i<=6;i++ ){
                row[i-1]=res.getString(i);
            }

            Books.add(row);

        }

        sqlDB.connclose();

        return Books;

    }
    
    public static ArrayList<String[]> userpurchasedbookslist(String USER_ID) throws SQLException{


        Books = new ArrayList<>();
        
        
        sqlDB.connect();

        ResultSet res= sqlDB.Userpurchasedbooks(USER_ID);

        while(res.next()){

            String[] row=new String[9];
            
            for(int i=1;i<=9;i++ ){
           
                row[i-1]=res.getString(i);
            }
            
            

            Books.add(row);

        }

        sqlDB.connclose();

        return Books;

    }
    
    public static ArrayList<String[]> userbookcart(String USER_ID) throws SQLException{


        Books = new ArrayList<>();
        
        
        sqlDB.connect();

        ResultSet res= sqlDB.Userbookscart(USER_ID);

        while(res.next()){

            String[] row=new String[9];
            
            for(int i=1;i<=9;i++ ){
           
                row[i-1]=res.getString(i);
            }
            
            

            Books.add(row);

        }

        sqlDB.connclose();

        return Books;

    }
    
   
    
    public static void RemoveBookFromCart(String userid, String bookid) throws SQLException{
        sqlDB.connect();
        sqlDB.removeBookfromUserCart(userid, bookid);
         System.out.print("REMOVED");
        sqlDB.connclose();
        
    }
    
    public static void InsertintoBookCart(String userid, String bookid, String chapter_id) throws SQLException{
        sqlDB.connect();
        sqlDB.insertintobookcart(userid, bookid,chapter_id);
        System.out.print("ADDED TO CART");
        sqlDB.connclose();  
    }
    
    public static void MoveFromCartToShelf(String userid) throws SQLException{
        sqlDB.connect();
        sqlDB.movefromcarttomybooks(userid);
        System.out.print("ADDED TO SHELF");
        sqlDB.connclose();  
    }
    
    public static String CheckUser(String username,String password) throws SQLException{
        sqlDB.connect();
        String status = sqlDB.validateUser(username,password);
        sqlDB.connclose();  
        return status;
    }
    
    
    
    
    
    
    
}
