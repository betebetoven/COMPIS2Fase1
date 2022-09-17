package arbol_graficado;

public class nodo {

    public   Object value;

    public   nodo Next,Prev;

    public int fila, columna;
    public nodo(Object value){
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