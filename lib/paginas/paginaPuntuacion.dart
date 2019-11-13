import 'package:flutter/material.dart';
import 'package:Kool_School/paginas/paginaInicial.dart';


class PaginaPuntuacion extends StatelessWidget {

  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

  /// Atributo que tiene la cantidad de puntos totales ganados por el usuario
  final int _puntos;

  /// Atributo que tiene la cantidad de preuntas totales que fue preguntada
  final int _preguntasTotales;

  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  PaginaPuntuacion(this._puntos, this._preguntasTotales);

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Tu puntaje fue de: \n", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * .05),),
          new Text(_puntos.toString() +" Respuestas correctas de " +  _preguntasTotales.toString() , style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * .05)),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: MediaQuery.of(context).size.width * .2,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new PaginaInicial()), (Route route) => route == null)
          )
        ],
      )
    );
  }
}