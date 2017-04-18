/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;
import helper.BookDisplayHelper;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author hetulpatel
 */
public class test {
    
    public static void main(String[] args) throws SQLException{
        
        ArrayList<String[]> latestBooks = new ArrayList<>();
        
       // BookDisplayHelper.RemoveBookFromCart("AA001","AAA01");
        
        

        /*latestBooks = BookDisplayHelper.userpurchasedbookslist("AA001");
        for(int i=0;i<latestBooks.size();i++){
            
            String[] out = latestBooks.get(i);
            
            System.out.println(out[0] + ":" + out[1]+ ":" + out[2]+ ":" + out[3]+ ":" + out[4]+ ":" + out[5]+ ":" + out[6]+ ":" + out[8]);
            
            
            int m=0;
            Integer[] intstart=new Integer[out[6].split(",").length];
            for (String str : out[6].split(","))
                intstart[m++] = Integer.parseInt(str);
            
            m=0;
            Integer[] intend=new Integer[out[7].split(",").length];
            for (String str : out[7].split(","))
                intend[m++] = Integer.parseInt(str);
            
            List<Integer> start = new ArrayList<>(Arrays.asList(intstart));
            List<Integer> end = new ArrayList<>(Arrays.asList(intend));
            //List<Integer> end = new ArrayList<Integer>(Arrays.asList(out[7].split(",")));
            Collections.sort(start);
            Collections.sort(end);
            
            
            
        
            String pages = "";
            for(int k=0; k<Integer.parseInt(out[4]); k++){
                if(k!=(Integer.parseInt(out[4])-1))
                    pages+=start.get(k)+"_"+end.get(k)+",";
                else
                    pages+=start.get(k)+"_"+end.get(k);
                
            }
            
            System.out.println("Pages: "+pages);
            */
        
        System.out.println("String: "+increment("ZZ999"));
    }
    
        public static String increment(String number) {
            Pattern compile = Pattern.compile("^(.*?)([9Z]*)$");
            Matcher matcher = compile.matcher(number);
            String left="";
            String right="";
            if(matcher.matches()){
                 left = matcher.group(1);
                 right = matcher.group(2);
            }
            number = !left.isEmpty() ? Long.toString(Long.parseLong(left, 36) + 1,36):"";
            number += right.replace("Z", "A").replace("9", "0");
            return number.toUpperCase();
 
            
        }


            
            
       
    }

        
       // System.out.println(out[0]+":"+out[10]);
        
        
    
    

