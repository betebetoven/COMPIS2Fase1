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

        String opt = "";
        if (this.value.getClass() == String.class && (String.class.cast(this.value).contains("GLOBALA")))
            opt = ",fillcolor = \"#8B0000\"";
        else  if (this.value.getClass() == String.class && (String.class.cast(this.value).contains("BLOQUE_INSTRUCCIONES")))
            opt = ",fillcolor = \"#CD5C5C\"";
        else  if (this.value.getClass() == String.class && (String.class.cast(this.value).contains("BLOQUE_INSTRUCCION")))
            opt = ",fillcolor = \"#FFC0CB\"";
        else  if (this.value.getClass() == String.class && (String.class.cast(this.value).contains("INSTRUCCION_")))
            opt = ",fillcolor = \"#98FB98\"";
        else  if (this.value.getClass() == String.class && (String.class.cast(this.value).contains("OPCION")))
            opt = ",fillcolor = \"#AFEEEE\"";
            else opt = "";
        return  this.hashCode()+"[label=\""+this.value+"\""+opt+"]";


    }

}