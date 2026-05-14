/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package collaborative;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import collaborative.Dbconnection;
import collaborative.Ftpcon;
import collaborative.encryption;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author java2
 */
public class Upload extends HttpServlet {

    private static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connection con;
            PreparedStatement pstm = null;
              String fname = "";
              String data = "";
             String cd = "";
             String cloud = "";
             String k = null;
             int abc = 0;
        Date date = new Date();
        SimpleDateFormat DateFor = new SimpleDateFormat("dd/MM/yyyy");
        String stringDate= DateFor.format(date);



             int j = 0;
             String a = (String) request.getSession().getAttribute("email");
             System.out.println("User Name : " + a);
             try {
                 fname = request.getParameter("fname");
                 data = request.getParameter("data");
                 cloud = request.getParameter("cloud");
                 if (data == null) data = "";

                 con = Dbconnection.getConnection();

                 pstm = con.prepareStatement("insert into upload (file, filename, CDate, cipher,email,skey,cloud,dt,size,count)values(?,?,?,?,?,?,?,?,?,?)");
                 String str = data;
                 int size = str.getBytes().length;
                 //secretkey generating
                 KeyGenerator keyGen = KeyGenerator.getInstance("AES");
                 keyGen.init(128);
                 SecretKey secretKey = keyGen.generateKey();
                 System.out.println("secret key:" + secretKey);



                 //converting secretkey to String
                 byte[] be = secretKey.getEncoded();//encoding secretkey
                 String skey = Base64.encode(be);
                 System.out.println("converted secretkey to string:" + skey);
                 String cipher = new encryption().encrypt(str, secretKey);
                 System.out.println(str);



                  k = stringDate.substring(0,2);
                  abc = Integer.parseInt(k);


                 pstm.setString(1, str);
                 pstm.setString(2, fname);
                 pstm.setString(3, stringDate);
                 pstm.setString(4, cipher);
                 pstm.setString(5, a);

                 pstm.setString(6, skey);
                 pstm.setString(7, cloud);
                 pstm.setInt(8, abc);
                 pstm.setInt(9, size);
                 pstm.setInt(10, 0);



                 /*Cloud Start*/
                 File f = new File("C:\\Users\\hp\\Desktop\\input"+fname);
                 FileWriter fw = new FileWriter(f);
                 fw.write(cipher);
                 fw.close();
                 Ftpcon ftpcon = new Ftpcon();
                 ftpcon.upload(f, fname);
                 /*Cloud End*/
                 int i = pstm.executeUpdate();
                 if (i == 1) {
                     response.sendRedirect("mobilesource_upload.jsp?m1=success");
                 } else {
                     response.sendRedirect("owner_upload.jsp?msgg=failed");
                 }
                 con.close();
             } catch (Exception e) {
                 out.println(e.toString());
             } finally {
                 out.close();
             }
        }
    }

    private static String getStringFromInputStream(InputStream is) {
        BufferedReader br = null;
        StringBuilder sb = new StringBuilder();
        String line;
        try {
            br = new BufferedReader(new InputStreamReader(is));
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
        } catch (IOException e) {
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                }
            }
        }
        return sb.toString();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
