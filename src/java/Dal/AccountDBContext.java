/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Cuong Bui
 */
public class AccountDBContext extends DBContext<Account>{

    public Account Login(String username, String password) {
        try {
            String sql = "select * from Accounts where username = ? and password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Account c = new Account();
                c.setUserName(rs.getString("username"));
                c.setPassword(rs.getString("password"));
                c.setDisplayName(rs.getString("displayname"));
                c.setRole(rs.getInt("roleId"));
                c.setAid(rs.getInt("aId"));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) {
        AccountDBContext acc = new AccountDBContext();
        Account a = acc.Login("sutdent", "123");
        System.out.println(a);
        
    }
    
}
