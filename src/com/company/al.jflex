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
    id = ({letra}|{digito})+
    frase = ({comilla}({id}|{WhiteSpace})+{comilla})
    frasecita = ({cejilla}({id})+{cejilla})
    number = {digito}+"."?{digito}*


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
    bulean = "boolean"
    caracter = "caracter"
    DecIntegerLiteral = 0 | [1-9][0-9]*

    numero = "numero"
    cadena ="cadena"

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
    <YYINITIAL> {inicio}           { return new Symbol(Simbolos.inicio,yycolumn, yyline, yytext()); }
    <YYINITIAL> {final}          {  return new Symbol(Simbolos.final,yycolumn, yyline, yytext()); }

    <YYINITIAL> {
      /* identifiers */
      {flechita}                           {return new Symbol(Simbolos.flechita,yycolumn, yyline, yytext()); }
      {id}                   { return new Symbol(Simbolos.id,yycolumn, yyline, yytext()); }
      {frase}                   {return new Symbol(Simbolos.frase,yycolumn, yyline, yytext()); }
    {guion}                   { return new Symbol(Simbolos.guion,yycolumn, yyline, yytext()); }
    {numero}                   {  return new Symbol(Simbolos.numero,yycolumn, yyline, yytext()); }
    {number}                   { return new Symbol(Simbolos.number,yycolumn, yyline, yytext()); }
    {cadena}                   { return new Symbol(Simbolos.cadena,yycolumn, yyline, yytext()); }
    {frase}                   { return new Symbol(Simbolos.frase,yycolumn, yyline, yytext()); }
      {bulean}                   { return new Symbol(Simbolos.bulean,yycolumn, yyline, yytext()); }
      {number}                   { return new Symbol(Simbolos.number,yycolumn, yyline, yytext()); }
      {number}                   { return new Symbol(Simbolos.number,yycolumn, yyline, yytext()); }
      {number}                   { return new Symbol(Simbolos.number,yycolumn, yyline, yytext()); }
      {number}                   { return new Symbol(Simbolos.number,yycolumn, yyline, yytext()); }
      {number}                   { return new Symbol(Simbolos.number,yycolumn, yyline, yytext()); }
      {number}                   { return new Symbol(Simbolos.number,yycolumn, yyline, yytext()); }














      /* comments */
      {Comment}                      { /* ignore */ }

      /* whitespace */
      {WhiteSpace}                   { /* ignore */ }
    }



    /* error fallback */
    .                              { System.out.println("Illegal character <"+
                                                        yytext()+">"); }