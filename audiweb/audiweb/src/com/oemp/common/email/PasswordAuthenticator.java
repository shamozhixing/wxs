package com.oemp.common.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
/**
 * smtp服务器 用户验证类
 * @author user
 *
 */
public class PasswordAuthenticator extends Authenticator{
	 private String user;
     private String pwd;

     private PasswordAuthenticator() {
     }
     public PasswordAuthenticator(String u,String p){
          super();
          this.user = u;
          this.pwd = p;
     }
     public PasswordAuthentication getPasswordAuthentication (){
          return new PasswordAuthentication(this.user,this.pwd );
     }
}
