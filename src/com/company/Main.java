package com.company;

//import java_cup.runtime.*;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import analizadores.al;
import analizadores.as;
public class Main {

    public static void main(String[] args) {

        try {
            //String j;
            //j.getBytes(StandardCharsets.UTF_8)
            System.out.println("si entra aca");
            al lexico = new al(new BufferedReader(new FileReader("C:\\Users\\Alberto\\Desktop\\cys\\COMPIS2Fase1\\src\\tr.txt")));
            System.out.println("si entra aca");
            System.out.println("ahora va al sintactico");
            //for (int i = 0; i<100;i++)
            //System.out.println(lexico.next_token());

            as sintactico = new as(lexico);
            System.out.println(sintactico.getClass());
            System.out.println(lexico.getClass());

            sintactico.parse();
        } catch (Exception e) {
            System.out.println("se fue al catch");
        }


    }
}
