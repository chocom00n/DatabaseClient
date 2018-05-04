/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hem_db_client;

import java.awt.*;
import javax.swing.*;

/**
 *
 * @author chocomoon
 */
public class DB_Windows extends JFrame{
 
    
    
    //private JButton connexion = new JButton("Connect");
    
    private JPanel container = new JPanel();
    private DB_Connector connector = new DB_Connector();
    
    
    public DB_Windows() {

        // Paramètres de la fenêtre
        super("DATABASE CLIENT 2000"); // Titre de la fenêtre
        setSize(400, 300); // Taille de la fenêtre en (x,y)
        setLocationRelativeTo(null); // La fenêtre apparaît au milieu de l'écran
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // Action à la fermeture de la fenêtre
        setResizable(false); // Possibilité de redimensionner la fenêtre
        setLayout(new FlowLayout());
        
        JLabel welcomeText = new JLabel("Please connect to your DB");
        add(welcomeText);

        
        JButton connexion = new JButton("Connect");
        connexion.addActionListener(new bOpenLogin(connector));
        add(connexion);
        

    }
}
