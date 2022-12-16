/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Proyecto;

import java.nio.file.Files;

/**
 *
 * @author alex
 */
public class Conversor {

    public String comentarioS(String s) {
        s = s.replaceAll("//", "");
        s = "#" + s;
        return s;
    }

    public String comentarioM(String s) {
        s = s.replaceAll("[(/*)|(*/)]", "");
        s = "'''" + s + "'''";
        return s;
    }
    
    public String asignS(String s){
        
        return s;
    }
}
