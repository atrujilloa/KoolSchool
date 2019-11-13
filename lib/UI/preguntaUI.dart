import 'package:flutter/material.dart';

class PreguntaUI extends StatefulWidget{

//----------------------------------------------
// ATRIBUTOS
//----------------------------------------------

// Atributo que guardara el texto de la pregunta
final Text _texto;

//----------------------------------------------
// CONSTRUCTOR
//----------------------------------------------

/// Contructor de la pregunta que recibe el texto que contendra 
PreguntaUI (this._texto);

//----------------------------------------------
// METODOS
//----------------------------------------------

/// Juntara la clase Stateful con una que si pueda cambiar de esta, ya que debra cambiar su texto a medida que se avanze de pregunta

@override
  State createState() => new PreguntaEstado();
  
}

class PreguntaEstado extends State<PreguntaUI>  with SingleTickerProviderStateMixin{

  /// Este unico metodo de la clase creara visualmente la barra con el texto de la pregunta 
  @override
  Widget build (BuildContext context){
    return new Material(
    color: Colors.white,
    child: new Padding(
      padding: new EdgeInsets.symmetric(vertical: 30), // Crea unas margenes o sangria 
      child: new Center(
        child: FittedBox(fit: BoxFit.cover, child: new Text(widget._texto.data,style: TextStyle(fontSize: 30))), // Pone el texto
      ),
    )
    );
  }
}