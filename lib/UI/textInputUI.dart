import 'package:flutter/material.dart';
import 'package:Kool_School/UI/botonUI.dart';


class TextInputUI extends StatefulWidget{

  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

  /// Atributo que tiene el texto pista sobre el que escribira el usuario
  final String _textoPista;

  /// Atributo que tiene el texto del boton 
  final String _textoBoton;

  /// Atributo para guardar lo que va a hacer cuando alguien le de click
  final VoidCallback _onTap;

  /// Atributo para la respuesta escrita en el input
  String _respuesta;
  
  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------
  
  /// Constructor que recibe por parametro el metodo que se va a ajecutar luego de darle click en calificar, el texto pista y el texto del boton
  TextInputUI(this._onTap, this._textoPista, this._textoBoton);
  

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  /// Metodo que crea el estado a cambiar, esto es otra calse, es para que el usuario pueda ur viendo lo que escribe
  @override
  State createState() => new TextInputValueState();
  
  /// Metodo que retorna la respuesta
  String get darRespuesta => _respuesta;

  /// Metodo para cambiar la respuesta
  void cambiarRespuesta(String pRespuesta)
  {
    _respuesta = pRespuesta;
  }


}

class TextInputValueState extends State<TextInputUI> {
  TextEditingController _textInputController = TextEditingController();
 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(50),
                child: TextField(
                  controller: _textInputController,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: widget._textoPista),
                ),
              ),
              new BotonUI2(Colors.blue, new Text(widget._textoBoton,style: TextStyle(fontSize: 50)),() => verificarRespuesta(_textInputController.text))
             
            ],
          ),
        ));
        
  }

  /// Metodo para cambiar la respuesta despues de escrita por el usuario y llamar al metodo on tap que le llego por parametro a la clase TextInputUI
  void verificarRespuesta(String pRespuesta)
  {
    widget.cambiarRespuesta(pRespuesta);
    widget._onTap();
  }
}

