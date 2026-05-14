/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    package collaborative;

    
    import java.text.SimpleDateFormat;
    import java.util.Date;

    
     public class Main {
        public static void main(String[] args) {
        Date date = new Date();
        SimpleDateFormat DateFor = new SimpleDateFormat("d/M/yyyy");
        String stringDate= DateFor.format(date);
        System.out.println(stringDate);

        }    
        
        
        }