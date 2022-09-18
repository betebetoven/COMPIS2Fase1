package com.company;

import javax.print.event.PrintServiceAttributeListener;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import analizadores.al;
import analizadores.as;
import arbol_graficado.al_g;
import arbol_graficado.as_g;
import analizador_golag.al_go;
import analizador_golag.as_go;
import arbol_graficado.listaenlazada;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainFrame extends JFrame {
    private JTextArea entrada;
    private JTextArea salidapy;
    private JTextArea salidago;
    private JButton BPY;
    private JButton BGO;
    private JButton BREPButton;
    private JPanel mainPanel;

    public String analizadores()
    {
        String salida = "";
        try {
            al lexico = new al(new BufferedReader(new FileReader("C:\\Users\\Alberto\\Desktop\\cys\\COMPIS2Fase1\\src\\tr.txt")));
            as sintactico = new as(lexico);
            sintactico.parse();
            System.out.println("ESTO VIENE DESDE LA INTERFAZ WUJU");
            System.out.println(error.resultado_sintactico);
            salida = error.resultado_sintactico;
        }
        catch (Exception e) {
            System.out.println("se fue al catch");
        }
        return salida;

    }
    public String analizador_go()
    {
        String salida = "\n" +
                "package main\n" +
                "\n" +
                "import( \"fmt\"\n \"math\")"+
                "\n" +
                "func main() { \n";
        try {
            al_go lexico = new al_go(new BufferedReader(new FileReader("C:\\Users\\Alberto\\Desktop\\cys\\COMPIS2Fase1\\src\\tr.txt")));
            as_go sintactico = new as_go(lexico);
            sintactico.parse();
            System.out.println("ESTO VIENE DESDE LA INTERFAZ WUJU");
            System.out.println(error.resultado_sintactico);
            salida += error.resultado_sintactico;
        }
        catch (Exception e) {
            System.out.println("se fue al catch");
        }
        salida+="\n}";
        return salida;

    }
    public String arbol()
    {
        try {
            al_g lexicog = new al_g(new BufferedReader(new FileReader("C:\\Users\\Alberto\\Desktop\\cys\\COMPIS2Fase1\\src\\tr.txt")));
            as_g sintacticog = new as_g(lexicog);
            sintacticog.parse();
        }
        catch (Exception e) {
            System.out.println("se fue al catch");
        }
        return new String("hola");
    }

    public void escribe(String entrada)
    {
        try {
            FileWriter myWriter = new FileWriter("C:\\Users\\Alberto\\Desktop\\cys\\COMPIS2Fase1\\src\\tr.txt");
            myWriter.write(entrada);
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }

    public MainFrame()  {
        setContentPane(mainPanel);
        setSize(600,600);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setVisible(true);
        BPY.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                escribe(entrada.getText());
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException ex) {
                    ex.printStackTrace();
                }
                System.out.println("ESTO VIENE DESDE EL STRING");
                System.out.println(error.resultado_sintactico);
                salidapy.setText(analizadores());

            }
        });
        BGO.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                escribe(entrada.getText());
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException ex) {
                    ex.printStackTrace();
                }
                System.out.println("ESTO VIENE DESDE EL STRING");
                System.out.println(error.resultado_sintactico);
                salidago.setText(analizador_go());
            }
        });
        BREPButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                escribe(entrada.getText());
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException ex) {
                    ex.printStackTrace();
                }
                String j = arbol();
            }
        });
    }
}
