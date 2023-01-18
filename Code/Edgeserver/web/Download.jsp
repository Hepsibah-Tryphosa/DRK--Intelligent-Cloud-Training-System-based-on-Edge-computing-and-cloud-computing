<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="EncryptionDecryption.EncryptionAlgoritham"%>
<%@page import="FileUpload.FileUtilities"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.io.ByteArrayInputStream"%>

<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.StringWriter"%>

<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
int fileId = Integer.parseInt(request.getParameter("fileid"));
String fileName = request.getParameter("filename");
//FileUtilities fu = new FileUtilities();
//fu.updateFileRank(fileId);
EncryptionAlgoritham ea = new EncryptionAlgoritham();
//fu.allTranscationTypes(session.getAttribute("datauser").toString(), fileName, "Downloading");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    InputStream inputStream = null;
    StringBuffer sb = new StringBuffer();
    BufferedReader br = null;
    String temp = null;
    int BUFFER_SIZE = 4096;
    try {
        con = Dbconn.getConnection();
        String query = "select * from datafiles where dataid = ?";
        ps = con.prepareStatement(query);
        ps.setInt(1, fileId);
        rs = ps.executeQuery();
        if (rs.next()) {            
            Blob blob = rs.getBlob("cipherdata");
            InputStream is = blob.getBinaryStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(is));
            StringBuilder outLine = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
            outLine.append(line);
        }
        String cipher_Text = outLine.toString();   //Prints the string content read from input stream
        reader.close();
            String palinText = ea.decrypt(cipher_Text);
           inputStream = new ByteArrayInputStream(palinText.getBytes(StandardCharsets.UTF_8)); 
            int fileLength = inputStream.available();

            System.out.println("fileLength = " + fileLength);

            ServletContext context = getServletContext();

            // sets MIME type for the file download
            String mimeType = context.getMimeType(fileName);
            if (mimeType == null) {
                mimeType = "application/octet-stream";
            }

            // set content properties and header attributes for the response
            response.setContentType(mimeType);
            response.setContentLength(fileLength);
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"", fileName);
            response.setHeader(headerKey, headerValue);

            // writes the file to the client
            OutputStream outStream = response.getOutputStream();

            byte[] buffer = new byte[BUFFER_SIZE];
            int bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, bytesRead);
            }

            inputStream.close();
            outStream.close();
        } else {
            // no file found
            response.getWriter().print("File not found for the id: " + fileId);
        }

    } catch (Exception e) {
        System.out.println("Exception at Download " + e.getMessage());
    } finally {
        try {
        } catch (Exception e) {
        }
    }


%>