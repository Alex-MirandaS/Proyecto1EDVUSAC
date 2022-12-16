/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */
package Proyecto;

import Compilador.Parser;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author alex
 */
public class Proyecto1USAC {

    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        Lexer lex;
        Parser p;
        String input = "";
        
       
        while (input != "salir") {

            input = sc.nextLine();
            lex = new Lexer(new StringReader(input));
            p = new Parser(lex);

            String resultado = "" + p.parse();
            System.out.println(resultado);
            
            for (int i = 0; i < p.getInstrucciones().size(); i++) {
                System.out.println(p.getInstrucciones().get(i));
            }
            
        }

    }
}
