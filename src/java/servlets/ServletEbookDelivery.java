package servlets;

import java.io.ByteArrayOutputStream;
import org.apache.pdfbox.pdmodel.PDDocument;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;

/**
 * Created by hetulpatel on 10/04/17.
 */
@WebServlet(name = "ServletEbookDelivery")
public class ServletEbookDelivery extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pages = (String) request.getParameter("pages");
        String book_id = (String) request.getParameter("bookid");

        System.out.println("pages: "+pages);

        String[] chapters = pages.split(",",-1);

        String tomcatRoot = getServletContext().getRealPath("/");
        String path = getServletContext().getInitParameter("ebook_res");
        System.out.println("Path: "+path);

        String sourceFile = path + "/AAA01.pdf";
        String targetFile = path + "/front_page.pdf"; 


        try {
            //Loading EBook From Dir.

            //Class cls = this.getClass();

            //URL url1 = getServletContext().getResource("/WEB-INF/Ebooks/AAA01.pdf");
            //URL url2 = getServletContext().getResource("/WEB-INF/Ebooks/front_page.pdf");



            //URL url = cls.getResource("Ebooks/AAA01.pdf");
            //
            //URL url2 = cls.getResource("Ebooks/front_page.pdf");
            System.out.println("Value = " + sourceFile);

            File file = new File(sourceFile);
            PDDocument document = PDDocument.load(file);
            System.out.println("File 1 Loaded");

            //Loading Front Page From Dir.
            File front = new File(targetFile);
            PDDocument front_page = PDDocument.load(front);

            System.out.println("File 2 Loaded");
            //PDPage page = new PDPage().;


            //Creating temp file
            PDDocument temp = new PDDocument();
            temp.addPage(front_page.getPage(0));

            for (int i = 0; i < chapters.length; i++) {

                String[] index = chapters[i].split("_");

                for (int j = Integer.parseInt(index[0]); j <= Integer.parseInt(index[1]); j++) {

                    //System.out.println("CH: "+i + "Page: " + j);
                    temp.addPage(document.getPage(j-1));

                }
            }
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            

            //Saving temp file
            //temp.save("/Users/hetulpatel/NetBeansProjects/Pages6/web/output_pdf/sample.pdf");
            temp.save(output);
            try {

            response.addHeader("Content-Type", "application/force-download"); 
            response.addHeader("Content-Disposition", "attachment; filename="+"Bookkart-sample.pdf");
            response.getOutputStream().write(output.toByteArray());
            response.sendRedirect("Pages6/index.jsp");

            } catch (Exception ex) {            
                ex.printStackTrace();
            }  
            
            System.out.print("File Created");


            //Closing documents
            temp.close();
            document.close();
            front_page.close();
            
            
        }catch (IOException e){
            e.printStackTrace();
            System.out.print("File not found");
        }

    }
}
