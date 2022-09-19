package com.company;

import java.awt.image.AreaAveragingScaleFilter;
import java.util.*;

public class error {
    public static String resultado_sintactico = "";
    String lexema, tipo, descripcion,conexiones;
    public static ArrayList<String> errores_lexicos = new ArrayList<>();
    public  static  ArrayList<String> errores_sintacticos = new ArrayList<>();
    int linea, columna;
    listaenlazada general = new listaenlazada();
    HashMap<String, ArrayList<String>> apuntadores = new HashMap<>();
    HashMap<String, Integer> grado= new HashMap<>();
    ArrayList<String> flechitas = new ArrayList<>();
    public error(String lexema, String tipo, String descripcion, int linea, int columna)
    {
        this.lexema = lexema;
        this.tipo = tipo;
        this.descripcion = descripcion;
        this.linea = linea;
        this.columna = columna;

    }
    public static ArrayList<String> arbol_sintactico = new ArrayList<>();

    public String resultado = "";
    public void imprime_go(ArrayList p, int indent)
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
                //System.out.println(inde+k.toString());
                resultado += "\n"+inde+k.toString();
            }
        }

    }


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
                //System.out.println(inde+k.toString());
                resultado += "\n"+inde+k.toString();
            }
        }
    }
    public void imprime_arbol_sintactico()
    {
        String init = "digraph G\n" +
                "{label=\"ARBOL SINTACTICO\"\n" +
                "        node[shape = hexagon]\n" +
                "        node[style = filled]\n" +
                "        node[fillcolor = \"#EEEEE\"]\n" +
                "        node[color = \"#EEEEE\"]\n" +
                "        node[color = \"#31CEF0\"]\n"
              ;

        Collections.reverse(arbol_sintactico);
        for (String p: arbol_sintactico) {
            //init+= "\n "+ p.hashCode()+"[label=\""+p+"\"]";
        general.agrega(new nodo(p));

        }
       /*nodo g = general.First;
        while (g.Next!=null) {
            if (g.value == "VARIABLE") {
                general.remove(g);
                break;
            }
            g = g.Next;
        }*/




        grado.put("INSTRUCCION_IMPRIMIR",3);
        grado.put("INSTRUCCION_IMPRIMIR_NL",3);
        grado.put("INSTRUCCION_CALL",3);
        //grado.put("BLOQUE_INSTRUCCIONES",3);
        //grado.put("ETS",3);

        //GLOBALA
        apuntadores.put("GLOBALA",new ArrayList<String>(
                Arrays.asList("INICIO","BLOQUE_INSTRUCCIONES","FIN")));
       //BLOQUE_INSTRUCCIONES
        apuntadores.put("BLOQUE_INSTRUCCIONES",new ArrayList<String>(
                Arrays.asList("BLOQUE_INSTRUCCION")));
        //BLOQUE_INSTRUCCION
        apuntadores.put("BLOQUE_INSTRUCCION",new ArrayList<String>(
                Arrays.asList("INSTRUCCION_IMPRIMIR","INSTRUCCION_IMPRIMIR_NL","INSTRUCCION_DECLARACION","INSTRUCCION_CALL")));
        //INSTRUCCION_IMPRIMIR
        apuntadores.put("INSTRUCCION_IMPRIMIR_NL",new ArrayList<String>(
                Arrays.asList("IMPRIMIR_NL",
                        //"ABRE_PARENTESIS",
                        "CIERRA_PARENTESIS_IMP_NL",
                        "ETS",
                        "ABRE_PARENTESIS_IMP_NL",
                        "PUNTO_Y_COMA_IMP_NL"
                        )));
        //INSTRUCCION_IMPRIMIR
        apuntadores.put("INSTRUCCION_IMPRIMIR",new ArrayList<String>(
                Arrays.asList("IMPRIMIR",
                        //"ABRE_PARENTESIS",
                        "CIERRA_PARENTESIS_IMP",
                        "ETS",
                        "ABRE_PARENTESIS_IMP",
                        "PUNTO_Y_COMA_IMP"
                        )));

        //ETS
        apuntadores.put("ETS",new ArrayList<String>(
                Arrays.asList(
                        "NUMERO",
                        "VERDADERO",
                        "FALSO",
                        "FRASE",
                        "FRASECITA",
                        "VARIABLE",
                        "POR",
                        "DIVIDIDO",
                        "MOD",
                        "POTENCIA",
                        "ABRE_CORCHETE",
                        "CIERRA_CORCHETE",
                        "ABRE_PARENTESIS_T",
                        "CIERRA_PARENTESIS_T",
                        "MAS",
                        "MENOS",
                        "MENOR",
                        "MAYOR_O_IGUAL",
                        "MENOR_O_IGUAL",
                        "MAYOR",
                        "ES_DIFERENTE",
                        "ES_IGUAL",
                        "NOT",
                        "AND",
                        "OR",
                        "BLOQUE_INSTRUCCIONES")));

        conexiones = "";
        String generalpre = general.toString();
        try {
            //conecta(general.First, general.First.Next);

        }
        catch (Exception e)
        {
            System.out.println("se va al catch por conecta");
        }
        String end= "\n }";
        //System.out.println(init+generalpre+conexiones+end);
        System.out.println();

    }

    public void conecta(nodo x, nodo c)
    {
        if ((x.value == c.value && x.Next != null) || (grado.get(x.value)!= null && grado.get(c.value)!=null &&grado.get(x.value)==grado.get(c.value))) return;

        if (apuntadores.get(x.value) != null) {
            if (apuntadores.get(x.value).contains(c.value)) {
                if (!flechitas.contains("\n"+x.hashCode() +"->"+c.hashCode()+";")) {
                    flechitas.add("\n"+x.hashCode() +"->"+c.hashCode()+";");
                    conexiones+= "\n"+x.hashCode() +"->"+c.hashCode()+";";
                    //System.out.println("\n" + x.hashCode() + "->" + c.hashCode() + ";");
                }

                if (apuntadores.get(c.value) == null)
                {
                    general.remove(c);
                    if (x.Next!=null) {
                        c = x.Next;
                        if (x.value == "BLOQUE_INSTRUCCION") {
                            nodo temp = x.Prev;
                            general.remove(x);
                            x = temp;
                        }
                        conecta(x, c);
                    }
                }
                else if (c.Next != null)
                    conecta(c,c.Next);

            }
            if (c.Next != null)
                conecta(x,c.Next);
        }


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
