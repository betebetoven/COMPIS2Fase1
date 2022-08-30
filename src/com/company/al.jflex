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
    abre_pregunta = "¿"
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
      {verdadero}                   { return new Symbol(Simbolos.verdadero,yycolumn, yyline, yytext()); }
      {falso}                   { return new Symbol(Simbolos.falso,yycolumn, yyline, yytext()); }
      {caracter}                   { return new Symbol(Simbolos.caracter,yycolumn, yyline, yytext()); }
      {frasecita}                   { return new Symbol(Simbolos.frasecita,yycolumn, yyline, yytext()); }
      {mas}                   { return new Symbol(Simbolos.mas,yycolumn, yyline, yytext()); }
      {menos}                   { return new Symbol(Simbolos.menos,yycolumn, yyline, yytext()); }
      {por}                   { return new Symbol(Simbolos.por,yycolumn, yyline, yytext()); }
      {dividido}                   { return new Symbol(Simbolos.dividido,yycolumn, yyline, yytext()); }
      {abre_corchete}                   { return new Symbol(Simbolos.abre_corchete,yycolumn, yyline, yytext()); }
      {cierra_corchete}                   { return new Symbol(Simbolos.cierra_corchete,yycolumn, yyline, yytext()); }
      {potencia}                   { return new Symbol(Simbolos.potencia,yycolumn, yyline, yytext()); }
      {mod}                   { return new Symbol(Simbolos.mod,yycolumn, yyline, yytext()); }
      {abre_parentesis}                   { return new Symbol(Simbolos.abre_parentesis,yycolumn, yyline, yytext()); }
      {cierra_parentesis}                   { return new Symbol(Simbolos.cierra_parentesis,yycolumn, yyline, yytext()); }
      {mayor}                   { return new Symbol(Simbolos.mayor,yycolumn, yyline, yytext()); }
      {menor}                   { return new Symbol(Simbolos.menor,yycolumn, yyline, yytext()); }
      {mayor_o_igual}                   { return new Symbol(Simbolos.mayor_o_igual,yycolumn, yyline, yytext()); }
      {menor_o_igual}                   { return new Symbol(Simbolos.menor_o_igual,yycolumn, yyline, yytext()); }
      {es_igual}                   { return new Symbol(Simbolos.es_igual,yycolumn, yyline, yytext()); }
      {es_diferente}                   { return new Symbol(Simbolos.es_diferente,yycolumn, yyline, yytext()); }
      {or}                   { return new Symbol(Simbolos.or,yycolumn, yyline, yytext()); }
      {and}                   { return new Symbol(Simbolos.and,yycolumn, yyline, yytext()); }
      {not}                   { return new Symbol(Simbolos.not,yycolumn, yyline, yytext()); }
      {ingresar}                   { return new Symbol(Simbolos.ingresar,yycolumn, yyline, yytext()); }
      {como}                   { return new Symbol(Simbolos.como,yycolumn, yyline, yytext()); }
      {con_valor}                   { return new Symbol(Simbolos.con_valor,yycolumn, yyline, yytext()); }
      {punto_y_coma}                   { return new Symbol(Simbolos.punto_y_coma,yycolumn, yyline, yytext()); }
      {coma}                   { return new Symbol(Simbolos.coma,yycolumn, yyline, yytext()); }
      {si}                   { return new Symbol(Simbolos.si,yycolumn, yyline, yytext()); }
      {o_si}                   { return new Symbol(Simbolos.o_si,yycolumn, yyline, yytext()); }
      {abre_pregunta}                   { return new Symbol(Simbolos.abre_pregunta,yycolumn, yyline, yytext()); }
      {cierra_pregunta}                   { return new Symbol(Simbolos.cierra_pregunta,yycolumn, yyline, yytext()); }
      {de_lo_contrario}                   { return new Symbol(Simbolos.de_lo_contrario,yycolumn, yyline, yytext()); }
      {entonces}                   { return new Symbol(Simbolos.entonces,yycolumn, yyline, yytext()); }
      {fin_segun}                   { return new Symbol(Simbolos.fin_segun,yycolumn, yyline, yytext()); }
      {fin_si}                   { return new Symbol(Simbolos.fin_si,yycolumn, yyline, yytext()); }
      {para}                   { return new Symbol(Simbolos.para,yycolumn, yyline, yytext()); }
      {hasta}                   { return new Symbol(Simbolos.hasta,yycolumn, yyline, yytext()); }
      {fin_para}                   { return new Symbol(Simbolos.fin_para,yycolumn, yyline, yytext()); }
      {hacer}                   { return new Symbol(Simbolos.hacer,yycolumn, yyline, yytext()); }
      {mientras}                   { return new Symbol(Simbolos.mientras,yycolumn, yyline, yytext()); }
      {fin_mientras}                   { return new Symbol(Simbolos.fin_mientras,yycolumn, yyline, yytext()); }
      {repetir}                   { return new Symbol(Simbolos.repetir,yycolumn, yyline, yytext()); }
      {hasta_que}                   { return new Symbol(Simbolos.hasta_que,yycolumn, yyline, yytext()); }
      {retornar}                   { return new Symbol(Simbolos.retornar,yycolumn, yyline, yytext()); }
      {metodo}                   { return new Symbol(Simbolos.metodo,yycolumn, yyline, yytext()); }
      {fin_metodo}                   { return new Symbol(Simbolos.fin_metodo,yycolumn, yyline, yytext()); }
      {con_parametros}                   { return new Symbol(Simbolos.con_parametros,yycolumn, yyline, yytext()); }
      {funcion}                   { return new Symbol(Simbolos.funcion,yycolumn, yyline, yytext()); }
      {fin_funcion}                   { return new Symbol(Simbolos.fin_funcion,yycolumn, yyline, yytext()); }
      {ejecutar}                   { return new Symbol(Simbolos.ejecutar,yycolumn, yyline, yytext()); }
      {imprimir}                   { return new Symbol(Simbolos.imprimir,yycolumn, yyline, yytext()); }
      {imprimir_nl}                   { return new Symbol(Simbolos.imprimir_nl,yycolumn, yyline, yytext()); }

      /* comments */
      {Comment}                      { /* ignore */ }

      /* whitespace */
      {WhiteSpace}                   { /* ignore */ }
    }



    /* error fallback */
    .                              { System.out.println("Illegal character <"+
                                                        yytext()+">"); }