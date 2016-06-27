/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.SQLException;
import uta.cse4361.businessobjects.EmailAccount;

/**
 *
 * @author Andrew
 */
public class EmailGet extends RDBImplCommand{
    private EmailAccount aa;
    private String sqlQuery = "INSERT INTO Notification values (?,?)";
    
    public EmailGet(EmailAccount aa){
        this.aa = aa;}
    
    public void queryDB() throws SQLException{
        try{
            statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, aa.getEmail());
             statement.setString(2,aa.getOpt());
            statement.executeUpdate();
            processResult();
        }
        catch (SQLException e) {
            System.out.println("GetAdvisor failed");
            conn.close();
        } finally {
            statement.close();
        }
    }
    
    public void processResult(){
     result = "";
    }
}
