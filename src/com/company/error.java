package com.company;

public class error {
    String lexema, tipo, descripcion;
    int linea, columna;
    public error(String lexema, String tipo, String descripcion, int linea, int columna)
    {
        this.lexema = lexema;
        this.tipo = tipo;
        this.descripcion = descripcion;
        this.linea = linea;
        this.columna = columna;

    }

    @Override
    public String toString() {
        return "error{" +
                "lexema='" + lexema + '\'' +
                ", tipo='" + tipo + '\'' +
                ", descripcion='" + descripcion + '\'' +
                ", linea=" + linea +
                ", columna=" + columna +
                '}';
    }

}
