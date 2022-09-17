package arbol_graficado;

import java.util.ArrayList;

public class listaenlazada {
    String completo = "digraph G\n" +
            "{label=\"expresion regular\"\n" +
            "        node[shape = circle]\n" +
            "        node[style = filled]\n" +
            "        node[fillcolor = \"#EEEEE\"]\n" +
            "        node[color = \"#EEEEE\"]\n" +
            "        node[color = \"#31CEF0\"]";
    String conexiones = "";
    public nodo First, Last;
    public int tamaño;


    public  listaenlazada()
    {
        this.First = null;
        this.Last = null;
        this.tamaño = 0;
    }
    public void agrega(nodo mnodo)//Metodo agregar
    {
        //nodo mnodo = new nodo(valor);
        if (this.tamaño==0) {
            this.First = mnodo;
            this.Last = mnodo;
        }
        else
        {
            nodo ahora = this.First;
            while (ahora.Next != null)
                ahora = ahora.Next;
            ahora.Next = mnodo;
            ahora.Next.Prev = ahora;
            this.Last = mnodo;
        }
        this.tamaño += 1;
    }
    public void remove(nodo mnodo)
    {
        mnodo.Prev.Next = mnodo.Next;
        mnodo.Next.Prev = mnodo.Prev;
        mnodo = null;

    }
    public void concatena(listaenlazada p)
    {
        nodo c = p.First;
        while (c!= null) {
            this.agrega(new nodo(c.value));
            c = c.Next;
        }
    }
    public void imprimirtodo(listaenlazada p){
        nodo temp = p.First;
        while (temp != null)
        {
            if (temp.value.getClass()==listaenlazada.class)
            imprimirtodo(listaenlazada.class.cast(temp.value));
                else
            completo+= "\n"+temp;
            temp= temp.Next;

        }


    }
    String pepe = "";
    ArrayList<String> rep = new ArrayList<>();
    public void v(nodo x, nodo c)
    {

        while (c!= null)
        {
            String ind = pepe;
            //System.out.println(ind+"{_____________ENTRA_A_V_________");
            //System.out.println(ind+"x: "+x.value.getClass().getSimpleName()+"_"+x.value);
            //System.out.println(ind+"c: "+c.value.getClass().getSimpleName()+"_"+c.value);
            //System.out.println("{|"+ind+"}");
            if (x.value.getClass() == String.class && c.value.getClass()==listaenlazada.class)
            {

                nodo aptd = listaenlazada.class.cast(c.value).First;
                while (aptd != null)
                {
                    if (aptd.value.getClass()!= listaenlazada.class) {

                        //System.out.println(ind+"_____________APUNTA____________");
                        //System.out.println(ind+"x: "+x.value.getClass().getSimpleName()+"_"+x.value);
                        //System.out.println(ind+"APTD: "+aptd.value.getClass().getSimpleName()+"_"+aptd.value);
                        //System.out.println("{"+ind+"}");
                        if (!rep.contains("\n" + x.hashCode() + "->" + aptd.hashCode())) {
                            conexiones += "\n" + x.hashCode() + "->" + aptd.hashCode();
                            rep.add("\n" + x.hashCode() + "->" + aptd.hashCode());
                        }
                    }
                    else {
                        pepe += ".";

                        //v(listaenlazada.class.cast(aptd.value).First, listaenlazada.class.cast(aptd.value).First.Next);
                        v(aptd.Prev, aptd);
                    }
                    aptd=aptd.Next;
                }

            }

            x = x.Next;
            c = c.Next;
            //System.out.println("{"+ind+"|}");
            pepe+=".";
            //v(x,c);
        }


    }

    public String g()
    {
        completo = "digraph G\n" +
                "{label=\"expresion regular\"\n" +
                "        node[shape = octagon]\n" +
                "        node[style = filled]\n" +
                "        node[fillcolor = \"#EEEEE\"]\n" +
                "        node[color = \"#EEEEE\"]\n" +
                "        node[color = \"#31CEF0\"]";
        conexiones = "";
        pepe = "";
        v(this.First,this.First.Next);
        imprimirtodo(this);
        return completo+conexiones+"\n }";
    }



    @Override
    public String toString() {//impresion de resultados
     /*   String retorno="";
        int cont = 0;
        nodo m = this.First;
        while (m!= null)
        {
            retorno+="\n "+m;
            m=m.Next;
            cont++;
        }

        return
                retorno+

                        "\n";*/

        String retorno="[";
        int cont = 0;
        nodo m = this.First;
        while (m!= null)
        {
            retorno+=" '"+m.value.getClass().getSimpleName()+":"+m.value.toString()+"', ";
            m=m.Next;
            cont++;
        }

        return
                retorno+
                        "]";
    }
}