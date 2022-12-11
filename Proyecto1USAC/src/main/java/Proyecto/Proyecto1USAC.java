/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */
package Proyecto;

import Compilador.Token;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.util.Scanner;

/**
 *
 * @author alex
 */
public class Proyecto1USAC {

    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.println("Porfa ingrese el texto a evaluar");
        String input = sc.nextLine();
        Lexer lex = new Lexer(new StringReader(input));
        Token token = lex.yylex();
        System.out.println(token.toString());
    }
}
