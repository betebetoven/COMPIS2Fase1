package com.company;

//import java_cup.runtime.*;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import analizadores.al;
import analizadores.as;
import arbol_graficado.al_g;
import arbol_graficado.as_g;
import arbol_graficado.listaenlazada;


public class Main {

    public static void main(String[] args) {

        try {
            //error.arbol_sintactico.add("DEBERIA DE AGREGAR ESTO");

            //String j;
            //j.getBytes(StandardCharsets.UTF_8)
            String p = "";
            Object j = p ;
            String no = j.toString();
            j.getClass().cast(j);
            error pop = new error("","","",2,2);

            ArrayList<String> popa = new ArrayList<>();
            Object pepe = popa;
            ArrayList<String>segundo = ArrayList.class.cast(pepe);

            System.out.println(pepe.toString());
            al lexico = new al(new BufferedReader(new FileReader("C:\\Users\\Alberto\\Desktop\\cys\\COMPIS2Fase1\\src\\tr.txt")));
            System.out.println("ahora va al sintactico");
            as sintactico = new as(lexico);
            sintactico.parse();
           // pop.imprime_arbol_sintactico();

            System.out.println(pepe.toString());
            al_g lexicog = new al_g(new BufferedReader(new FileReader("C:\\Users\\Alberto\\Desktop\\cys\\COMPIS2Fase1\\src\\tr.txt")));
            System.out.println("ahora va al sintactico");
            as_g sintacticog = new as_g(lexicog);
            sintacticog.parse();
           // pop.imprime_arbol_sintactico();
            listaenlazada jojo = new listaenlazada();
            listaenlazada jaja = new listaenlazada();




        } catch (Exception e) {
            System.out.println("se fue al catch");
        }






    }

}
