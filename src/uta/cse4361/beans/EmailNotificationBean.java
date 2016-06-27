/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import uta.cse4361.businessobjects.AdvisorAccount;
import uta.cse4361.businessobjects.EmailAccount;
import uta.cse4361.databases.DatabaseManager;
import uta.cse4361.databases.RelationalDatabaseImpl;
import uta.cse4361.interfaces.Constants;
import static uta.cse4361.interfaces.Constants.SUCCESS_MESSAGE;

/**
 *
 * @author Nabin
 */
public class EmailNotificationBean implements Constants{
  
    private String email= null;
    private String opt;

    public EmailNotificationBean() {
    }

    
    public String Advisor(){
       String returnMessage = SUCCESS_MESSAGE;
       
       EmailAccount AA = new EmailAccount();
       boolean a = AA.initialize(this.email, this.opt);
       if (a == false)
           return this.CREATE_ADVISOR_FAIL;
       DatabaseManager dm = new DatabaseManager();
       returnMessage = dm.emailRegister(AA);
       return returnMessage;
    }
    public String getEmail() {
        return email;
    }
    
    public String getOpt() {
        return opt;
    }

   

    public void setEmail(String email) {
        this.email = email;
    }

    public void setOpt(String opt) {
        this.opt = opt;
    }
     
}
