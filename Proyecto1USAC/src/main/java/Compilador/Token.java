/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Compilador;

/**
 *
 * @author alex
 */
public class Token {

    private TokenConstants tokenTipo;
    private int fila, columna;
    private String lexeman;

    public Token(TokenConstants tokenTipo, int fila, int columna, String lexeman) {
        this.tokenTipo = tokenTipo;
        this.lexeman = lexeman;
        this.fila = fila;
        this.columna = columna;
    }

    public TokenConstants getTokenTipo() {
        return tokenTipo;
    }

    public void setTokenTipo(TokenConstants tokenTipo) {
        this.tokenTipo = tokenTipo;
    }

    public String getLexeman() {
        return lexeman;
    }

    public void setLexeman(String lexeman) {
        this.lexeman = lexeman;
    }

    public int getFila() {
        return fila;
    }

    public void setFila(int fila) {
        this.fila = fila;
    }

    public int getColumna() {
        return columna;
    }

    public void setColumna(int columna) {
        this.columna = columna;
    }

    @Override
    public String toString() {
        return "Token{" + "tokenTipo=" + tokenTipo + ", lexema=" + lexeman + '}';
    }

}
