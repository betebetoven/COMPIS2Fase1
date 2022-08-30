 /* JFlex example: partial Java language lexer specification */
 package com.company;
 import java_cup.runtime.*;


    /*
     * This class is a simple example lexer.
     */
%%

%public
%class analizador_lexico
%cupsym Simbolos
%cup
%char
%column
%full
%ignorecase
%line
%unicode



    LineTerminator = \r|\n|\r\n
    InputCharacter = [^\r\n]
    WhiteSpace     = {LineTerminator} | [ \t\f]

    /* comments */
    Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

    TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
    // Comment can be the last line of the file, without line terminator.
   EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
     DocumentationComment = "/**" {CommentContent} "*"+ "/"
    CommentContent       = ( [^*] | \*+ [^/*] )*
    letra = [:jletter:]
    digito = [:jletterdigit:]
    guion = "_"

    comilla = \u0022
    cejilla = \u0027
    //punto = "."|"+"
    id = ({letra}|{digito}|{guion})+
    frase = ({comilla}({id})+{comilla})
    frasecita = ({cejilla}({id})+{cejilla})

    //
    //conjNUM = ({digito}|{letra})({WhiteSpace}?","{WhiteSpace}?({digito}|{letra}))+
    //Rango = ({digito}|{letra}){WhiteSpace}?"~"{WhiteSpace}?({digito}|{letra})

    //conjunto = {conjNUM}|{Rango}
    //conjunto ="->" ({id}|"~"|",")+~";"
    //o = \u007C
    //conjER = {o}|{punto}|"*"|"?"
    //declaracion = "{"{id}"}"
    //er =({frase}|{declaracion}|{conjER})
    //ER = {er}({er}|{WhiteSpace})+
    //ER = ":"({WhiteSpace}|{letra}|{comilla}|{digito}|{guion}|{punto}|"{"|"}"|"*"|{o})+";"
    //ER = ({letra}|{comilla}|{digito}|{guion}|{punto}|"{"|"}"|"*"|{o})+
    inicio = "inicio"
    final = "fin"
    numero = "numero"
    cadena = "cadena"
    boolean = "boolean"
    caracter = "caracter"
    DecIntegerLiteral = 0 | [1-9][0-9]*

    numero = "numero"
    cadena ="cadena"
    boolean = "boolean"
    verdadero = "verdadero"
    falso = "falso"
    caracter = "caracter"

    //frasesita  hacer la frase pero con comilla simple para caracter

    mas ="+"
    menos = "-"
    por = "*"
    dividido = "/"
    abre_corchete = "["
    cierra_corchete = "]"
    potencia = "potencia"
    mod = "mod"
    abre_parentesis = "("
    cierra_parentesis = ")"
    mayor = "mayor"
    menor = "menor"
    mayor_o_igual = "mayor_o_igual"
    menor_o_igual = "menor_o_igual"
    es_igual = "es_igual"
    es_diferente = "es_diferente"
    or = "or"
    and = "and"
    not = "not"
    ingresar = "ingresar"
    como = "como"
    con_valor = "con_valor"
    punto_y_coma = ";"
    coma = ","
    //nombres de variables inician y terminan en guin bajo
    flechita = "->"
    si = "si"
    o_si= "o_si"
    apre_pregunta = "¿"
    cierra_pregunta = "?"
    de_lo_contrario = "de_lo_contrario"
    entonces = "entonces"
    fin_segun = "fin_segun"
    fin_si =  "fin_si"
    para = "para"
    hasta = "hasta"
    fin_para = "fin_para"
    hacer = "hacer"
    mientras = "mientras"
    fin_mientras = "fin_mientras"
    repetir = "repetir"
    hasta_que = "hasta_que"
    retornar = "retornar"
    metodo  = "metodo"
    fin_metodo = "fin_metodo"
    con_parametros = "con_parametros"
    funcion = "funcion"
    fin_funcion = "fin_funcion"
    ejecutar = "ejecutar"
    imprimir = "imprimir"
    imprimir_nl = "imprimir_nl"





%%

    /* keywords */
    <YYINITIAL> {inicio}           { //System.out.println("Reconocio token: <abre_llave>lexema:"+yytext());
                                          return new Symbol(Simbolos.abre_llave,yycolumn, yyline, yytext()); }
    <YYINITIAL> {final}          { //System.out.println("Reconocio token: <cierra_llave>lexema:"+yytext());
                                              return new Symbol(Simbolos.cierra_llave,yycolumn, yyline, yytext()); }
    <YYINITIAL> "CONJ"            { //System.out.println("Reconocio token: <conjpr>lexema:"+yytext());
                                              return new Symbol(Simbolos.conjpr,yycolumn, yyline, yytext()); }

    <YYINITIAL> {
      /* identifiers */
      "->"                            {//System.out.println("Reconocio token: <flecha>lexema:"+yytext());
                                                                            return new Symbol(Simbolos.flecha,yycolumn, yyline, yytext()); }
      {id}                   { //System.out.println("Reconocio token: <id>lexema:"+yytext());
                               return new Symbol(Simbolos.id,yycolumn, yyline, yytext()); }
      {frase}                   { //System.out.println("Reconocio token: <frase>lexema:"+yytext());
                                     return new Symbol(Simbolos.frase,yycolumn, yyline, yytext()); }
      {conjunto}                   { //System.out.println("Reconocio token: <conjunto>lexema:"+yytext());
                                     return new Symbol(Simbolos.conjunto,yycolumn, yyline, yytext()); }
      {ER}                   { //System.out.println("Reconocio token: <expreg>lexema:"+yytext());
                                     return new Symbol(Simbolos.expreg,yycolumn, yyline, yytext()); }

      /* literals */
      {DecIntegerLiteral}            { //System.out.println("Reconocio token: <DecIntegerLiteral>lexema:"+yytext());
                                return new Symbol(Simbolos.DecIntegerLiteral,yycolumn, yyline, yytext()); }


      /* operators */
      ":"                            { //System.out.println("Reconocio token: <dos_puntos>lexema:"+yytext());
                                                                      return new Symbol(Simbolos.dos_puntos,yycolumn, yyline, yytext()); }
      ";"                            { //System.out.println("Reconocio token: <separador>lexema:"+yytext());
                                                                      return new Symbol(Simbolos.separador,yycolumn, yyline, yytext()); }

      "%%"                            {//System.out.println("Reconocio token: <separador_region>lexema:"+yytext());
                                                                            return new Symbol(Simbolos.separador_region,yycolumn, yyline, yytext()); }

      /* comments */
      {Comment}                      { /* ignore */ }

      /* whitespace */
      {WhiteSpace}                   { /* ignore */ }
    }



    /* error fallback */
    .                              { System.out.println("Illegal character <"+
                                                        yytext()+">"); }