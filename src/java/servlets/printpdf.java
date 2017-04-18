package servlets;





import org.apache.pdfbox.pdmodel.PDDocument;


import java.io.File;
import java.io.IOException;
import java.net.URL;


/**
 * Created by hetulpatel on 08/04/17.
 */
public class printpdf {

    public static void main(String [] args) throws IOException {

        /*URL location = printpdf.class.getProtectionDomain().getCodeSource().getLocation();
        System.out.println(location.getFile());

        try {
            File file = new File("/Users/hetulpatel/Documents/JT_Stud_2017/Pages3/Ebooks/test.pdf");
            PDDocument document = PDDocument.load(file);

            int noOfPages = document.getNumberOfPages();
            document.removePage(0);
            document.save("test.pdf");
            System.out.print(noOfPages);
            document.close();

            //response.addHeader("Content-Type", "application/force-download")
            //response.addHeader("Content-Disposition", "attachment; filename=\"yourFile.pdf\"")

            *//*PDDocument document =new PDDocument();
            document.addPage(new PDPage());
            document.save("Hello.pdf");
            document.close();
            System.out.print("PATH :" + System.getProperty("user.dir"));*//*
        }catch (IOException e){
            e.printStackTrace();
        }
*/
        String pages = "9_16,17_24,61_70,71_78";
        String book_id = "AAA01";
        String[] chapters = pages.split(",",-1);

        try {
            //Loading EBook From Dir.
            File file = new File("/Users/hetulpatel/NetBeansProjects/Pages6/web/Ebooks/" + book_id + ".pdf");
            PDDocument document = PDDocument.load(file);

            //Loading Front Page From Dir.
            File front = new File("/Users/hetulpatel/NetBeansProjects/Pages6/web/Ebooks/front_page.pdf");
            PDDocument front_page = PDDocument.load(front);



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


            //Saving temp file
            temp.save("/Users/hetulpatel/NetBeansProjects/Pages6/web/Ebooks/sample.pdf");
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
