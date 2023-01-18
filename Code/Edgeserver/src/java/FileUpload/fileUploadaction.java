/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FileUpload;

import DatabaseConnectivity.Dbconn;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Ramu Maloth
 */
@MultipartConfig(maxFileSize = 16177215)
public class fileUploadaction extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String filename = request.getParameter("filename");
        String atrbname = request.getParameter("atrbname");
        String cloudname = request.getParameter("cloudname");
        String contents  = request.getParameter("contents");
        String macKey    = request.getParameter("macKey");
        
        InputStream inputStream = null;
        InputStream cipherData = null;
        Part filePart = request.getPart("file");
      //  String filename = getFileName(filePart);
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        HttpSession hs = request.getSession();
        String name = hs.getAttribute("uname").toString();
        System.out.println("name:"+name);
        String email  = hs.getAttribute("email").toString();
        System.out.println("email:"+email);
         cipherData = new ByteArrayInputStream(contents.getBytes(StandardCharsets.UTF_8));
        Connection con = null;
        PreparedStatement ps = null;
        java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
        try {
            con = Dbconn.getConnection();
            String query = "insert into datafiles(name,email,filename,attributename,cloudname,mackey,cipherdata,cdate) values(?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1,name);
            ps.setString(2, email);
            ps.setString(3, filename);
            ps.setString(4, atrbname);
            ps.setString(5, cloudname);
            ps.setString(6, macKey);
            ps.setBinaryStream(7, cipherData);
            //ps.setBinaryStream(8, inputStream);
            ps.setDate(8, sqlDate);
           int no =  ps.executeUpdate();
            if(no > 0){
            response.sendRedirect("fileupload.jsp?msg=success");
            }else{
            response.sendRedirect("fileupload.jsp?msg=faild");
            }
            
        } catch (Exception e) {
            System.out.println("Error at DBA File upload "+e.getMessage());
        }finally{
            try {
                inputStream.close();
                cipherData.close();
                ps.close();
                con.close();
            } catch (Exception e) {
            }
        }
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
