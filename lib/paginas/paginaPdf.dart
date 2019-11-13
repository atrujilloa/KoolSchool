import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaginaPdf extends StatefulWidget
{
  @override
  State createState  () => new PaginaPdfEstado();

}

class PaginaPdfEstado extends State<PaginaPdf>
{

  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------


  /// Atributo booleano que dira si se esta cargando el documento o no
  bool _cargando = false;

  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  /// Constructor que llama al metodo cargarPdf(). Esto para que solo se llame una vez cuando de crea esta clase
  PaginaPdfEstado()
  {
  }

  //----------------------------------------------
  /// Metodo que dibujara el visor de pdf junto con un titilo y ayuda de la libreria
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Texto Lenguaje Grado 1'),
      ),
    );
  }

}