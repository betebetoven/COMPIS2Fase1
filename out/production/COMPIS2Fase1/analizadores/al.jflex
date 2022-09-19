 /* JFlex example: partial Java language lexer specification */
 package analizadores;
 import java_cup.runtime.*;
 import com.company.error;


    /*
     * This class is a simple example lexer.
     */
%%

%public
%class al
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


    comilla = \u0022
    cejilla = \u0027
    arroba = "@"
    dolar = "$"
    numeral = "#"
    punto ="."
    acorch = "{"
    ccorch ="}"
    ptc = ";"
    com = ","
    id = ({letra}|{digito})+
    //Identifier = [:jletter:]+ [:jletterdigit:]* [:jletter:]*
    frase = {comilla} ({letra}|{digito}|{WhiteSpace}|{punto}|{ptc}|{com}|{numeral}|{arroba})*{comilla}

    frasecita = {cejilla} (({letra}|{digito})|({dolar}{acorch}{digito}+{ccorch})) {cejilla}
    DecIntegerLiteral = 0 | [1-9][0-9]*
    number = {DecIntegerLiteral}+"."?{DecIntegerLiteral}?




    /*bulean = "boolean"
    caracter = "caracter"

*/
    /*


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
    con_incremental = "con_incremental"
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

*/



%%

    /* keywords */
    <YYINITIAL> "inicio"          {  return new Symbol(Simbolos.inicio,yycolumn, yyline, yytext());  }
    <YYINITIAL> "final"         {  return new Symbol(Simbolos.finall,yycolumn, yyline, yytext()); }
     <YYINITIAL>  "->"                           {   return new Symbol(Simbolos.flechita,yycolumn, yyline, yytext()); }

    <YYINITIAL>   {frase}                   {  return new Symbol(Simbolos.frase,yycolumn, yyline, yytext()); }
  <YYINITIAL>   "_"                   {  return new Symbol(Simbolos.guion,yycolumn, yyline, yytext()); }
  <YYINITIAL>   "numero"                   {  return new Symbol(Simbolos.numero,yycolumn, yyline, yytext()); }
  <YYINITIAL>   {number}                   {  return new Symbol(Simbolos.number,yycolumn, yyline, yytext()); }

  <YYINITIAL>   "cadena"                  { return new Symbol(Simbolos.cadena,yycolumn, yyline, yytext()); }
  <YYINITIAL>     "boolean"                  { return new Symbol(Simbolos.bulean,yycolumn, yyline, yytext()); }
  <YYINITIAL>     "verdadero"                   { return new Symbol(Simbolos.verdadero,yycolumn, yyline, yytext()); }
  <YYINITIAL>     "falso"                  { return new Symbol(Simbolos.falso,yycolumn, yyline, yytext()); }
  <YYINITIAL>     "caracter"                  { return new Symbol(Simbolos.caracter,yycolumn, yyline, yytext()); }
 <YYINITIAL>      {frasecita}                   { return new Symbol(Simbolos.frasecita,yycolumn, yyline, yytext()); }
  <YYINITIAL>     "+"                  { return new Symbol(Simbolos.mas,yycolumn, yyline, yytext()); }
 <YYINITIAL>      "-"                  { return new Symbol(Simbolos.menos,yycolumn, yyline, yytext()); }

 <YYINITIAL>      "*"                   { return new Symbol(Simbolos.por,yycolumn, yyline, yytext()); }
  <YYINITIAL>     "/"                  { return new Symbol(Simbolos.dividido,yycolumn, yyline, yytext()); }
  <YYINITIAL>     "["                   { return new Symbol(Simbolos.abre_corchete,yycolumn, yyline, yytext()); }
  <YYINITIAL>     "]"                   { return new Symbol(Simbolos.cierra_corchete,yycolumn, yyline, yytext()); }
  <YYINITIAL>     "potencia"                   { return new Symbol(Simbolos.potencia,yycolumn, yyline, yytext()); }
   <YYINITIAL>    "%"                   { return new Symbol(Simbolos.mod,yycolumn, yyline, yytext()); }
  <YYINITIAL>     "("                   { return new Symbol(Simbolos.abre_parentesis,yycolumn, yyline, yytext()); }
  <YYINITIAL>     ")"                   { return new Symbol(Simbolos.cierra_parentesis,yycolumn, yyline, yytext()); }
  <YYINITIAL>     "mayor"                   { return new Symbol(Simbolos.mayor,yycolumn, yyline, yytext()); }
   <YYINITIAL>    "menor"                   { return new Symbol(Simbolos.menor,yycolumn, yyline, yytext()); }
  <YYINITIAL>     "mayor_o_igual"                   { return new Symbol(Simbolos.mayor_o_igual,yycolumn, yyline, yytext()); }
   <YYINITIAL>    "menor_o_igual"                   { return new Symbol(Simbolos.menor_o_igual,yycolumn, yyline, yytext()); }
  <YYINITIAL>     "es_igual"                   { return new Symbol(Simbolos.es_igual,yycolumn, yyline, yytext()); }

    <YYINITIAL>   "es_diferente"                   { return new Symbol(Simbolos.es_diferente,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "or"                   { return new Symbol(Simbolos.or,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "and"                   { return new Symbol(Simbolos.and,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "not"                   { return new Symbol(Simbolos.not,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "ingresar"                   { return new Symbol(Simbolos.ingresar,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "como"                   { return new Symbol(Simbolos.como,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "con_valor"                   { return new Symbol(Simbolos.con_valor,yycolumn, yyline, yytext()); }
    <YYINITIAL>  ";"                   { return new Symbol(Simbolos.punto_y_coma,yycolumn, yyline, yytext()); }
    <YYINITIAL>   ","                   { return new Symbol(Simbolos.coma,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "si"                   { return new Symbol(Simbolos.si,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "o_si"                   { return new Symbol(Simbolos.o_si,yycolumn, yyline, yytext()); }
    <YYINITIAL>   \u00BF                  { return new Symbol(Simbolos.abre_pregunta,yycolumn, yyline, yytext()); }
    <YYINITIAL>   \u003F                   { return new Symbol(Simbolos.cierra_pregunta,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "de_lo_contrario"                   { return new Symbol(Simbolos.de_lo_contrario,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "entonces"                   { return new Symbol(Simbolos.entonces,yycolumn, yyline, yytext()); }
      <YYINITIAL>  "segun"                   { return new Symbol(Simbolos.segun,yycolumn, yyline, yytext()); }
    <YYINITIAL>  "fin_segun"                   { return new Symbol(Simbolos.fin_segun,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "fin_si"                  { return new Symbol(Simbolos.fin_si,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "para"                   { return new Symbol(Simbolos.para,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "hasta"                   { return new Symbol(Simbolos.hasta,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "fin_para"                   { return new Symbol(Simbolos.fin_para,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "hacer"                   { return new Symbol(Simbolos.hacer,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "mientras"                   { return new Symbol(Simbolos.mientras,yycolumn, yyline, yytext()); }
   <YYINITIAL>    "fin_mientras"                   { return new Symbol(Simbolos.fin_mientras,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "repetir"                   { return new Symbol(Simbolos.repetir,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "hasta_que"                   { return new Symbol(Simbolos.hasta_que,yycolumn, yyline, yytext()); }
    <YYINITIAL>   "retornar"                   { return new Symbol(Simbolos.retornar,yycolumn, yyline, yytext()); }
   <YYINITIAL>    "metodo"                   { return new Symbol(Simbolos.metodo,yycolumn, yyline, yytext()); }
   <YYINITIAL>    "fin_metodo"                   { return new Symbol(Simbolos.fin_metodo,yycolumn, yyline, yytext()); }
   <YYINITIAL>    "con_parametros"                   { return new Symbol(Simbolos.con_parametros,yycolumn, yyline, yytext()); }
   <YYINITIAL>    "funcion"                   { return new Symbol(Simbolos.funcion,yycolumn, yyline, yytext()); }
   <YYINITIAL>    "fin_funcion"                   { return new Symbol(Simbolos.fin_funcion,yycolumn, yyline, yytext()); }
   <YYINITIAL>    "ejecutar"                   { return new Symbol(Simbolos.ejecutar,yycolumn, yyline, yytext()); }
   <YYINITIAL>    "imprimir"                   { return new Symbol(Simbolos.imprimir,yycolumn, yyline, yytext()); }
   <YYINITIAL>    "imprimir_nl"                  { return new Symbol(Simbolos.imprimir_nl,yycolumn, yyline, yytext()); }
   <YYINITIAL>    "con_incremental"                 { return new Symbol(Simbolos.con_incremental,yycolumn, yyline, yytext()); }
  <YYINITIAL>   "_"{id}"_"                   {  return new Symbol(Simbolos.variable,yycolumn, yyline, yytext()); }
   <YYINITIAL>   {id}                   {  return new Symbol(Simbolos.id,yycolumn, yyline, yytext()); }

      /* comments */
   <YYINITIAL>    {Comment}                      { /* ignore */ }

      /* whitespace */
    <YYINITIAL>   {WhiteSpace}                   { /* ignore */ }




    /* error fallback */
    .                              { System.out.println("Illegal character <"+
                                                        yytext()+"> en: linea:"+yyline+" columna: "+yycolumn); error.errores_lexicos.add("Illegal character <"+yytext()+"> en: linea:"+yyline+" columna: "+yycolumn); }