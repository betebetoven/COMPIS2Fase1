package com.company;

import java.util.ArrayList;

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
    public static ArrayList<String> arbol_sintactico = new ArrayList<>();
    public void imprime(ArrayList p, int indent)
    {

        for(Object k: p )
        {
            if (k.getClass()== ArrayList.class)
                imprime(ArrayList.class.cast(k),indent+1);
            else
            {
                String inde = "";
                for(int i = 0;i<indent;i++)
                    inde+="     ";
                System.out.println(inde+k.toString());
            }
        }
    }
    public void imprime_arbol_sintactico()
    {
        String init = "digraph G\n" +
                "{label=\"expresion regular\"\n" +
                "        node[shape = circle]\n" +
                "        node[style = filled]\n" +
                "        node[fillcolor = \"#EEEEE\"]\n" +
                "        node[color = \"#EEEEE\"]\n" +
                "        node[color = \"#31CEF0\"]\n"
              ;

        for (String p: arbol_sintactico) {
            init+= "\n "+ p.hashCode()+"[label=\""+p+"\"]";
        }

        String end= "\n }";
        System.out.println(init+end);
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
