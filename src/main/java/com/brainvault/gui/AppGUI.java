package com.brainvault.gui;
import javax.swing.*;
import java.sql.*;
import com.brainvault.dao.DBConnection;

public class AppGUI {
public static void main(String[] args){
JFrame f=new JFrame("BrainVault GUI");
JTextField t=new JTextField(); t.setBounds(50,50,150,20);
JButton b=new JButton("Fetch"); b.setBounds(50,80,100,30);
f.add(t); f.add(b);
b.addActionListener(e->{
try{
Connection con=DBConnection.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select name from students");
String data="";
while(rs.next()) data+=rs.getString(1)+"\n";
JOptionPane.showMessageDialog(f,data);
}catch(Exception ex){ex.printStackTrace();}
});
f.setSize(300,200); f.setLayout(null); f.setVisible(true);
}
}
