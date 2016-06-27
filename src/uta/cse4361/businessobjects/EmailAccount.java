/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.businessobjects;

/**
 *
 * @author Andrew
 */
public class EmailAccount {
    
    private String opt;
    private String email;
        
    public EmailAccount(){
        
    }
    
    public boolean initialize(String opt, String email){
        boolean result = true;
        
        if(opt != null && !opt.isEmpty() && 
                email != null && !email.isEmpty())
        {
            this.opt = opt;
            this.email = email;
          
        }
        else
        {
            result = false;
        }
        
        return result;
    }
    
   public void setOpt(String opt){
        this.opt = opt;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    public String getOpt(){
        return opt;
    }
    
    public String getEmail(){
        return email;
    }
}
