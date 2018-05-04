/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hem_db_client;

import java.awt.*;
import java.awt.event.*;
import java.sql.Connection;
import javax.swing.*;

/**
 *
 * @author chocomoon
 */
public class bOpenLogin implements ActionListener {

    DB_Connector myConnector;

    // Create the frame.
    JFrame frame = new JFrame("Login Box");

    JTextField myLoginInput = new JTextField();
    JTextField myPasswordInput = new JTextField();

    public bOpenLogin(DB_Connector connector) {

        this.myConnector = connector;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        // Debug to see if we reach that point....
        System.out.println("Login box start");

        // Define Frame's params
        frame.setSize(400, 300); // Taille de la fenêtre en (x,y)
        frame.setLocationRelativeTo(null); // La fenêtre apparaît au milieu de l'écran
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE); // Action à la fermeture de la fenêtre
        frame.setResizable(false); // Possibilité de redimensionner la fenêtre
        frame.setLayout(new FlowLayout());

        // Create a JPanel to insert into JFrame
        JPanel myPanel = new JPanel();
        myPanel.setPreferredSize(new Dimension(400, 100));

        // Create components and put them in the panel.
        // Username box
        Box bUser = Box.createVerticalBox(); // Crée un espace pour la liste déroulante
        JLabel myULabel = new JLabel("Username: ");
        //JTextField myLoginInput = new JTextField();
        bUser.add(myULabel);
        bUser.add(myLoginInput);
        bUser.add(new JLabel(" ")); // Ajoute un label vide pour un affichage plus aéré
        myPanel.add(bUser, BorderLayout.NORTH);

        // Password box
        Box bPass = Box.createVerticalBox(); // Crée un espace pour la liste déroulante
        JLabel myPLabel = new JLabel("Password: ");
//        JTextField myPasswordInput = new JTextField();
        bPass.add(myPLabel);
        bPass.add(myPasswordInput);
        bPass.add(new JLabel(" ")); // Ajoute un label vide pour un affichage plus aéré
        myPanel.add(bPass, BorderLayout.NORTH);

        // Login button
        Box bLoginB = Box.createVerticalBox(); // Crée un espace pour la liste déroulante
        JButton myLoginButton = new JButton("Login");
        bLoginB.add(myLoginButton);
        bLoginB.add(new JLabel(" ")); // Ajoute un label vide pour un affichage plus aéré
        myPanel.add(bLoginB, BorderLayout.NORTH);

        myLoginButton.addActionListener(new getLoginInfo());

        // Add the panel to the frame
        frame.getContentPane().add(myPanel);
        // Size the frame.
        frame.pack();
        // Show it.
        frame.setVisible(true);
    }

    class getLoginInfo implements ActionListener {

        public getLoginInfo() {
            System.out.println("Login Info");

        }

        @Override
        public void actionPerformed(ActionEvent e) {
            System.out.println("Login Info2");

            final String login = myLoginInput.getText();
            System.out.println(login);
            final String password = myPasswordInput.getText();
            System.out.println(password);

            myConnector.testLogin(login, password);

            if (myConnector.getState() == State.Connected) {
                System.out.println("Connexion established, closing login windows");
                
                myConnector.listDB();
                // Fermer la fenetre
                frame.dispatchEvent(new WindowEvent(frame, WindowEvent.WINDOW_CLOSING));
            } else {
                System.out.println("Connexion failed");
                // Dot not close the windows until the connexion is established (@TODO)
            }
        }
    }

}
