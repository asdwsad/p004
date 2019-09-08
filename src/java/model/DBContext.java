/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author anhgqse04763
 */
public class DBContext {
        
    public void getDataFromXml() throws NamingException {
        Context ctx = new InitialContext();
        Context env = (Context) ctx.lookup("java:comp/env");
        serverName = (String) env.lookup("serverName");
        dbName = (String) env.lookup("dbName");
        portNumber = (String) env.lookup("portNumber");
        userID = (String) env.lookup("userID");
        password = (String) env.lookup("password");
    }
    
    public Connection getConnection()throws Exception {
        getDataFromXml();
        String url = "jdbc:sqlserver://"+serverName+":"+portNumber +";databaseName="+dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }
    
    private String serverName;
    private String dbName;
    private String portNumber;
    private String userID;
    private String password;
}
