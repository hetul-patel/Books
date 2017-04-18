/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

/**
 *
 * @author hetulpatel
 */
import java.sql.*;

/**
 *
 * @author c
 */
public class sqlDB {
    public static Connection conn; //Connection Object
    public static Statement st; //Statement Object
    public static CallableStatement cs;
    private static final String latestQuery = "SELECT * FROM Book_Details ORDER BY Date_B DESC LIMIT 9";
    private static final String musthaveQuery = "SELECT * FROM Book_Details WHERE Book_ID IN( SELECT Book_ID FROM Categories_Book_R WHERE C_ID=1)";
    private static final String bestsellerQuery = "SELECT * FROM Book_Details WHERE Book_ID IN ( SELECT Book_ID FROM Categories_Book_R WHERE C_ID=2)";
    private static final String onsaleQuery = "SELECT * FROM Book_Details WHERE Book_ID IN ( SELECT Book_ID FROM Categories_Book_R WHERE C_ID=3)";
    private static String bookdetailQuery = "";
    private static String userValidation = "";
    private static String chapterQuery = "";
    private static String userpurchasedbooks="";
    private static String userbookscart="";
    private static String removefromusercart="";
    private static String insertintobookcart="";
    private static String movequery="";
    


// Connect method establish the connection to the database
    public static void connect()
    {
    String url = "jdbc:mysql://localhost:3306/";
	String dbName = "pages";
	String driver = "com.mysql.jdbc.Driver";
	String userName = "root"; 
	String password = "";
        

        try {
            Class.forName(driver); //Register JDBC Driver
            //Class.forName(driver).newInstance(); //Register JDBC Driver
            conn = DriverManager.getConnection(url+dbName,userName,password); //create a connection object
            conn.setAutoCommit(true);
            
            System.out.println("Connection Established");
            st = conn.createStatement();
        }
        catch (Exception e) {
		  e.printStackTrace();
		  }
    }
    // Used to close the connection with database
    public static void connclose()
    {
        try{
        conn.close();
        }
        catch(Exception e)
        {  e.printStackTrace();
        }
    }
    
    public static int iud_data(String str) // Used for insert, update, delete query
    {   int r=0;
        try {
        r=st.executeUpdate(str);
         
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
        return r;
    }
    
   
    public static ResultSet fetchdata(String str) throws SQLException // Used for select query
    { 
        return st.executeQuery(str);
    }

    public static ResultSet fetchBookDetails(String Book_ID) throws SQLException // Used for select query
    {
        bookdetailQuery="SELECT * FROM Book_Details WHERE Book_ID="+"\'"+Book_ID+"\'";
        return st.executeQuery(bookdetailQuery);
    }

    public static ResultSet fetchChapters(String Book_ID) throws SQLException // Used for select query
    {
        chapterQuery="SELECT * FROM `Book_Chapter_Relation` WHERE Book_ID="+"\'"+Book_ID+"\'";
        return st.executeQuery(chapterQuery);
    }

    public static ResultSet fetchLatestBooks() throws SQLException // Used for select query
    { 
        
        return st.executeQuery(latestQuery);
    }  
    
    public static ResultSet fetchMustHave() throws SQLException // Used for select query
    { 
        
        return st.executeQuery(musthaveQuery);
    }
    
    public static ResultSet fetchBestSeller() throws SQLException // Used for select query
    { 
        
        return st.executeQuery(bestsellerQuery);
    }
    
    public static ResultSet fetchOnSale() throws SQLException // Used for select query
    {

        return st.executeQuery(onsaleQuery);
    }
    
    public static String validateUser(String uname, String pass) throws SQLException // Used for select query
    {
        userValidation = "SELECT user_id FROM UserDetails WHERE user_name=\'"+uname+"\' AND user_pass=\'"+pass+"\'";
        ResultSet res= st.executeQuery(userValidation);
        System.out.println("QUERYING : "+uname+pass);
        if(res.next()){
            return res.getString(1);
        }else{
            return null;
        }
       
    }
    
    public static ResultSet Userpurchasedbooks(String user_id) throws SQLException // Used for select query
    {
        userpurchasedbooks = "SELECT Book_Details.Book_ID,Book_Details.Title_B,Book_Details.Author_B,Book_Details.Rating_B, COUNT(UserPurchasedBook.Chapter_index) as 'TOTAL CHAPTERS', GROUP_CONCAT(UserPurchasedBook.Chapter_index SEPARATOR ', ') as 'Chapters', GROUP_CONCAT(Book_Chapter_Relation.Chapter_page_start SEPARATOR ',') as 'Starting', GROUP_CONCAT(Book_Chapter_Relation.Chapter_page_end SEPARATOR ',') as 'Ending', SUM(Book_Chapter_Relation.Chapter_price) as 'price' FROM `Book_Details`  JOIN `UserPurchasedBook` ON Book_Details.Book_ID = UserPurchasedBook.Book_ID JOIN `Book_Chapter_Relation` ON (UserPurchasedBook.Chapter_index=Book_Chapter_Relation.Chapter_index AND UserPurchasedBook.Book_ID=Book_Chapter_Relation.Book_ID) WHERE UserPurchasedBook.user_id=\'"+user_id+"\' GROUP BY Book_Details.Book_ID";
        ResultSet res= st.executeQuery(userpurchasedbooks);
        
        return res;
       
    }
    
    public static ResultSet Userbookscart(String user_id) throws SQLException // Used for select query
    {
        userbookscart = "SELECT Book_Details.Book_ID,Book_Details.Title_B,Book_Details.Author_B,Book_Details.Rating_B,COUNT(UserBookCart.Chapter_index) as 'TOTAL CHAPTERS',GROUP_CONCAT(UserBookCart.Chapter_index SEPARATOR ', ') as 'Chapters', GROUP_CONCAT(Book_Chapter_Relation.Chapter_page_start SEPARATOR ',') as 'Starting',  GROUP_CONCAT(Book_Chapter_Relation.Chapter_page_end SEPARATOR ',') as 'Ending',SUM(Book_Chapter_Relation.Chapter_price) as 'price'FROM `Book_Details`  JOIN `UserBookCart` ON Book_Details.Book_ID = UserBookCart.Book_ID JOIN `Book_Chapter_Relation` ON (UserBookCart.Chapter_index=Book_Chapter_Relation.Chapter_index AND UserBookCart.Book_ID=Book_Chapter_Relation.Book_ID) WHERE UserBookCart.user_id=\'"+user_id+"\' GROUP BY Book_Details.Book_ID";
        ResultSet res= st.executeQuery(userbookscart);
        
        return res;
       
    }
      
    public static void removeBookfromUserCart(String userid,String bookid) throws SQLException // Used for select query
    {
        removefromusercart = "DELETE FROM `UserBookCart` WHERE user_id=\'"+userid+"\' AND Book_ID=\'"+bookid+"\'";
        int res = st.executeUpdate(removefromusercart);
        
        System.out.print("DELETED ROWS: "+res);
       
    }
    
    public static void insertintobookcart(String user_id, String book_id, String chapter_index) throws SQLException{
        insertintobookcart = "REPLACE INTO `UserBookCart`(`user_id`, `Book_ID`, `Chapter_index`) VALUES (\'"+user_id+"\',\'"+book_id+"\',\'"+chapter_index+"\')";
        int res = st.executeUpdate(insertintobookcart);
        
        System.out.println("INSERTED ROWS: "+res);
    }
    
    public static void movefromcarttomybooks(String user_id) throws SQLException{
        
        movequery = "REPLACE INTO UserPurchasedBook SELECT * FROM UserBookCart WHERE user_id=\'"+user_id+"\'";
        String deleteQuery="DELETE FROM UserBookCart WHERE user_id=\'"+user_id+"\'";
        
        int res= st.executeUpdate(movequery);
        int res2= st.executeUpdate(deleteQuery);
        System.out.println("INSERTED ROWS: "+res);
        System.out.println("DELETED ROWS:" +res2);
        
    }    


    
    
    
}
