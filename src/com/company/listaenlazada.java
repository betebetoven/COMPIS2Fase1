package com.company;
public class listaenlazada {
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



    @Override
    public String toString() {//impresion de resultados
        String retorno="";
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
                        "\n";
    }
}