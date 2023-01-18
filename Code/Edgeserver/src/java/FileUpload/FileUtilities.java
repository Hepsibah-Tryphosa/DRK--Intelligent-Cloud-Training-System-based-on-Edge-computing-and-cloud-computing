/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package FileUpload;

import DatabaseConnectivity.Dbconn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Ramu Maloth
 */
public class FileUtilities {
    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public int getFileRank(int fileId){
    int rank = 0;
        try {
            con = Dbconn.getConnection();
            String query = "select downloadrank from datafiles where dataid = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, fileId);
            rs = ps.executeQuery();
            if(rs.next()){
            rank = rs.getInt(1);
            return rank;
            }
        } catch (Exception e) {
            System.out.println("Error Getting Download Rank "+e.getMessage());
        }finally{
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (Exception e) {
            }
        }
        return rank;
    }
    
    public void updateFileRank(int fileId){
    int currentRank  = getFileRank(fileId);
    currentRank++;
        try {
            con = Dbconn.getConnection();
            String query = "update datafiles set downloadrank = ? where dataid = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, currentRank);
            ps.setInt(2, fileId);
            ps.executeUpdate();            
        } catch (Exception e) {
            System.out.println("Updating File Rank "+e.getMessage());
        }finally{
            try {
              
                ps.close();
                con.close();
            } catch (Exception e) {
            }
        }
       
    }
    
    
   
    }
    
   
    

