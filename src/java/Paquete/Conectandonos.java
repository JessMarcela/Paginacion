/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paquete;


import java.sql.*;

/**
 *
 * @author Laura Camacho, Jessica Garcia & Alan Bohorquez  
 */
public class Conectandonos {

    public String ejecutar(int min, int max) {
        
       
        String resultado = "";
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/avanzada", "root", "123456");

        int i=1;
            Statement stmt =   con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from estudiante LIMIT "+(min-1)+","+max); 
            resultado = resultado + "<table style=\"BORDER-LEFT-COLOR: red; "                                       //Borde izquierdo
                    + "BORDER-BOTTOM-COLOR: red; BORDER-TOP-COLOR: red; "                                           //Borde abajo y arriba
                    + "BORDER-RIGHT-COLOR: red\""                                                                   //Borde derecho                                                      
                    + "border = 10 WIDTH = 500 BGCOLOR=\"FFFFFF\"> ";               
            resultado = resultado + "<td WIDTH= 20 HEIGHT= 20 style=\"color:#0C7AA6;font-size:150%;\"> Código </td>";       //Columna de código
            resultado = resultado + "<td WIDTH= 20 HEIGHT= 20 style=\"color:#0C7AA6;font-size:150%;\"> Nombre </td>";       //Columna de nombre
            resultado = resultado + "<td WIDTH= 20 HEIGHT= 20 style=\"color:#0C7AA6;font-size:150%;\"> Estado </td> </tr>"; //Columna de estado
            
            while(i <= max){
                
                resultado = resultado + "<tr>";
                
                if(rs.next()){
                resultado = resultado + "<td WIDTH= 20 HEIGHT= 20 style=\"color:#850578;font-size:130%;\">";
                resultado = resultado + rs.getInt(1);
                resultado = resultado + "</td>";
                
                resultado = resultado + "<td WIDTH= 50 HEIGHT= 20 style=\"color:#850578;font-size:130%;\">";
                resultado = resultado + rs.getString(2);
                resultado = resultado + "</td>";
                
                resultado = resultado + "<td WIDTH= 50 HEIGHT= 20 style=\"color:#850578;font-size:130%;\">";
                resultado = resultado + rs.getString(3);
                resultado = resultado + "</td>"; 
                }else{
                resultado = resultado + "<td WIDTH= 20 HEIGHT= 20 style=\"color:#850578;font-size:130%;\"></td>";
                resultado = resultado + "<td WIDTH= 20 HEIGHT= 20 style=\"color:#850578;font-size:130%;\"></td>";
                resultado = resultado + "<td WIDTH= 20 HEIGHT= 20 style=\"color:#850578;font-size:130%;\"></td>";
                }
                resultado = resultado + "</tr>";
                i++;
            }
            
                resultado = resultado + "</table>";
                
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        } 

        return resultado;
    }
    
    public String contar (){
        
          String resultado = "";
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/avanzada", "root", "123456");
           

            Statement stmt =   con.createStatement();
            ResultSet rs = stmt.executeQuery("select count(*) from estudiante"); 
            String numeroRegistros = "";
            while(rs.next()){
                numeroRegistros = rs.getString(1);
                resultado = resultado + numeroRegistros;
            }
            
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        } 
        return resultado;  
    }


}
