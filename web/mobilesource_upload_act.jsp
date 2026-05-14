<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="collaborative.Ftpcon"%>

<%@page import="collaborative.encryption"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="collaborative.Dbconnection"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>



<%
    
            Connection con;
            PreparedStatement pstm = null;
             String fname = "";
             String attribute = "";
             String attribute1 = "";
             String status = "";
           // String keyword = "";
            String cd = "";
            String cloud = "";
            
            int j = 0;
            String a = (String) request.getSession().getAttribute("email");
            System.out.println("User Name : " + a);
            try {
                boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
                if (!isMultipartContent) {
                    return;
                }
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                try {
                    List<FileItem> fields = upload.parseRequest(request);
                    Iterator<FileItem> it = fields.iterator();
                    if (!it.hasNext()) {
                        return;
                    }
                    while (it.hasNext()) {
                        FileItem fileItem = it.next();
                        if (fileItem.getFieldName().equals("fname")) {
                            fname = fileItem.getString();
                            System.out.println("File Name" + fname);
                        
                        }
                       
                        
                          if (fileItem.getFieldName().equals("cloud")) {
                            cloud = fileItem.getString();
                            System.out.println("cloud" + cloud);
                        }
                        
                        else {

                        }
                        boolean isFormField = fileItem.isFormField();
                        if (isFormField) {
                        } else {
                            try {
                                
                                con = Dbconnection.getConnection();
                                
                                     
                                
                                
                                
                                
                                
                                
                                pstm = con.prepareStatement("insert into upload (file, filename, CDate, cipher,email,skey,cloud)values(?,?,?,?,?,?,?)");
                                System.out.println("getD " + fileItem.getName());
                                String str = getStringFromInputStream(fileItem.getInputStream());
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
                                



                                //for get extension from given file
                                String b = fileItem.getName().substring(fileItem.getName().lastIndexOf('.'));
                                System.out.println("File Extension" + b);
                               
                                pstm.setBinaryStream(1, fileItem.getInputStream());
                                pstm.setString(2, fname);
                                pstm.setDate(3, getCurrentDate());
                                pstm.setString(4, cipher);
                                pstm.setString(5, a);
                                
                                pstm.setString(6, skey);
                                pstm.setString(7, cloud);
                                
                                
                               
                                
                                
                                /*Cloud Start*/
                                File f = new File("C:\\Users\\hp\\Desktop\\input"+fileItem.getName());
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
                            }
                        }
                    }
                } catch (FileUploadException e) {
                } catch (Exception ex) {
                    Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
                }
            } finally {
                out.close();
            }
        }
    }

    

%>
