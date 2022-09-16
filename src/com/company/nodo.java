package com.company;

public class nodo {

    public   String value;

    public   nodo Next,Prev;

    public int fila, columna;
    public nodo(String value){
        this.value = value;

        this.Next = null;
        this.Prev = null;
        this.fila = -1;
        this.columna = -1;
    }



    @Override
    public String toString() {

            return  this.hashCode()+"[label=\""+this.value+"\"]";


    }

}