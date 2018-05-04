/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hem_db_client;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

enum State {
    Initial,
    Connected,
    DB_Selected,
    Table_Selected
}
/**
 *
 * @author chocomoon
 */
public class DB_Connector {
    
    private static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    private static final String CHAINE_CONNECT_DB = "jdbc:mysql://127.0.0.1:3306/";
    
    private Connection conn;
    
    State state = State.Initial;
    
    //private Boolean connReady;  // True if the connexion is set
    
    public DB_Connector(){}
    
    public Connection testLogin(String login, String password) {
        System.out.println("Login :" + login + ", password :" + password);
        //Connection conn = null; 
        try {
            Class.forName(DRIVER_NAME);
            try {
                Logger.getLogger(DB_Connector.class.getName()).log(Level.SEVERE, "Connecting");
                conn = DriverManager.getConnection(CHAINE_CONNECT_DB,login,password);
                Logger.getLogger(DB_Connector.class.getName()).log(Level.SEVERE, "Connected");
                state = State.Connected;
                return conn;
            } catch (SQLException ex) {
                Logger.getLogger(DB_Connector.class.getName()).log(Level.SEVERE, "Connection failed");

                Logger.getLogger(DB_Connector.class.getName()).log(Level.SEVERE, null, ex);
                // OMDB 13.03.2018 : Problème de connection à la BD, affiche un message et ferme l'application !
                JOptionPane.showMessageDialog(null, "ERROR WHILE CONNECTING");
                //System.exit(0);
                return null;
            } catch (Exception ex) {
                Logger.getLogger(DB_Connector.class.getName()).log(Level.SEVERE, "Connection failed, only different");
                return null;
                
            }
        } catch (ClassNotFoundException ex) {
            // log an exception. for example:
            System.out.println("com.mysql.jdbc.Driver UNAVAILABLE "); 
        }
        state = State.Connected;
        return conn;
    }
    
    public State getState() {
        return state;
    }
    
    public Boolean listDB(){
        
        String sql_select_db = "SHOW DATABASES;";

        try{
            
            PreparedStatement pst = conn.prepareStatement(sql_select_db);
            ResultSet rs = pst.executeQuery();            

            int count = 0;
            while(rs.next())
            {
                count = count +1;
                
                // Output the list of DB
                System.out.println(count + "." + rs.getString(1));
            }
            this.closeConnection();
            return true;    

        }
        catch(Exception e){
            // OMDB 13.03.2018 : Avertir l'utilisateur d'un sacré problème d'accès aux tables... héhé !!!
            JOptionPane.showMessageDialog(null, "Connexion to the database O.K.  \nERROR: incorrect data insertion in database");
            // OMDB 13.03.2018 : Imprime les erreurs pour pouvoir debugger
            e.printStackTrace();
            // OMDB 13.03.2018 : QUITTE L'APPLICATION
            System.exit(0);
            return false;
        }
        
    }
    
    public boolean closeConnection() throws SQLException{

        if(conn.isClosed()){

        } else {
            conn.close();      
        }
        return true;
    }
}
