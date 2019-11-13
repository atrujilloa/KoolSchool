import 'package:Kool_School/UI/botonUI.dart';
import 'package:Kool_School/paginas/paginaMenu.dart';
import 'package:Kool_School/paginas/paginaPdf.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class PaginaInicial extends StatelessWidget{
  @override

    // Fuerza a la aplicacion a arracar en modo horizontal
    Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    
    ]);

    return new Material(color: Colors.yellow[700], // Un material es como una hoja de papel encima de la pantalla
     child: new Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centra lo de la columna en el ejer y
        children: <Widget>[
          new Padding(
            padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .05), // Añade espacio entre los textos
            ),
           FittedBox(fit:BoxFit.cover, child: new Text("KoolSchool", style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white))),
            new Padding(
            padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .05), // Añade espacio entre los textos
            ),
            Expanded(
              child:new Row(
            children: <Widget>[
               new Padding(
            padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .05), // Añade espacio entre los textos
            ),
              new BotonUI(Colors.purpleAccent[400], new Text("Lecturas",style: TextStyle(fontSize: 75,fontWeight: FontWeight.bold)), () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new PaginaPdf()))), // Boton lecturas
             new Padding(
            padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .05), // Añade espacio entre los textos
            ),
              new BotonUI(Colors.purple[600], new Text("Preguntas",style: TextStyle(fontSize: 75, fontWeight: FontWeight.bold)), () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new PaginaMenu()))), // Boton quiz
              new Padding(
            padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .05), // Añade espacio entre los textos
            ),
            
                  ],
                  
              ) ,
            )
          
        ],
      )
    );
  }
}