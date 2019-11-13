import 'package:flutter/material.dart';
import 'package:Kool_School/UI/botonUI.dart';
import 'package:Kool_School/UI/overlayCorrectoIncorrecto.dart';
import 'package:Kool_School/UI/preguntaUI.dart';
import 'package:Kool_School/UI/textInputUI.dart';
import 'package:Kool_School/paginas/paginaPuntuacion.dart';
import 'package:Kool_School/utils/pregunta.dart';
import 'package:Kool_School/utils/quiz.dart';

class PaginaQuiz extends StatefulWidget {

  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

  /// Atributo que modela el quiz de la clase 
  final Quiz _quiz;

  //----------------------------------------------
  // Constructor
  //----------------------------------------------
  /// Constructor que recibe un quiz como parametro
  PaginaQuiz(this._quiz);


  //----------------------------------------------
  // METODOS
  //----------------------------------------------
   @override
  State createState() => new PaginaEstadoQuiz(_quiz);
}

class PaginaEstadoQuiz extends State<PaginaQuiz> {
  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

  /// Atributo para la pregunta actual
  Pregunta _preguntaActual;

  /// Atributo que corre un nuevo quiz con ciertas preguntas
  Quiz quiz;

  /// Atributo con el texto dela pregunta actual  z
  String textoDeLaPregunta;

  /// Atributo que modela la retroalimentacion
  String retroalimentacionDeLaPregunta;

  /// Atributo que guarda el numero dela pregunta actual
  int numeroDePreguntaActual;

  /// Atributo para guardar si la respuesta que dio el usuario es correcta o no, este se actualiza compribandola la respuesta esperada
  bool esCorrecto;

  /// Atributo que dice si el overlay del feedback de la respuesta se muestra en pantalla o no
  bool overlayVisible = false;

  /// Atributo que guarda el text input de las preguntas abiertas
  TextInputUI textInput;


  //----------------------------------------------
  // Constructor
  //----------------------------------------------
  /// Constructor que recibe un quiz como parametro
  PaginaEstadoQuiz(Quiz pQuiz)
  {
    quiz = pQuiz;
    quiz.reiniciarQuiz();
  }

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  //// Metodo inicial que carga la pegunta, su texto y su numero desde el quiz
  @override
  void initState() {
    super.initState();
    _preguntaActual = quiz.siguientePregunta;
    textoDeLaPregunta = _preguntaActual.darPregunta;
    numeroDePreguntaActual = quiz.darNumeroDePreguntaActual;
  }

  /// Metodo que se corre luego de que el usuario responde, este comprueba si la respuesta fue correcta SOLO PARA PREGUNTAS VOF Y MULTIPLE
  void manejarRespuesta(String respuesta) {
    esCorrecto = (_preguntaActual.darRespuesta == respuesta);
    retroalimentacionDeLaPregunta =
        _preguntaActual.darRetroalimentacionAPregunta(respuesta);
    quiz.ganarPunto(esCorrecto);
    this.setState(() {
      overlayVisible = true;
    });
  }

  /// Metodo que se corre luego de que el usuario responde, este comprueba si la respuesta fue correcta SOLO PARA PREGUNTA ABIERTA
  void manejarRespuestaAbierta() {
    String response = textInput.darRespuesta;
    esCorrecto = (_preguntaActual.darRespuesta == response);
    retroalimentacionDeLaPregunta =
        _preguntaActual.darRetroalimentacionAPregunta(response);
    quiz.ganarPunto(esCorrecto);
    this.setState(() {
      overlayVisible = true;
    });
  }

  /// Metodo que dibuja los dos botones para resonder, la pregunta, genera el overlay de feedback cuando es necesario, cambia de pregunta y cuando se acaban avanza a la pagina de puntuacion
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        if (_preguntaActual.darTipoDePregunta ==
            TipoDePregunta.vOF) // Si es pregunta de VERDADERO O FALSO
          new Column(
            children: <Widget>[
              new BotonUI(
                  Colors.greenAccent,
                  new Text("Verdadero", style: TextStyle(fontSize: 50)),
                  () => manejarRespuesta("Verdadero")), // Boton verdadero
              new PreguntaUI(new Text(textoDeLaPregunta)), // Pregunta
              new BotonUI(
                  Colors.redAccent,
                  new Text("Falso", style: TextStyle(fontSize: 50)),
                  () => manejarRespuesta("Falso")), // Boton falso
            ],
          ),
        if (_preguntaActual.darTipoDePregunta ==
            TipoDePregunta.multiple) // Si la pregunta es eleccion MULTIPLE
          new Column(
            children: <Widget>[
              Expanded(
                  child: new Row(children: <Widget>[
                new BotonUI(
                    Colors.amber,
                    new Text(_preguntaActual.darOpciones[0],
                        style: TextStyle(fontSize: 50)),
                    () => manejarRespuesta("a")), // Boton a
                new BotonUI(
                    Colors.blueAccent,
                    new Text(_preguntaActual.darOpciones[1],
                        style: TextStyle(fontSize: 50)),
                    () => manejarRespuesta("b")), // Boton b
              ])),

              new PreguntaUI(new Text(textoDeLaPregunta)), // Pregunta

              Expanded(
                  child: new Row(children: <Widget>[
                new BotonUI(
                    Colors.red,
                    new Text(_preguntaActual.darOpciones[2],
                        style: TextStyle(fontSize: 50)),
                    () => manejarRespuesta("c")), // Boton c
                new BotonUI(
                    Colors.lime,
                    new Text(_preguntaActual.darOpciones[3],
                        style: TextStyle(fontSize: 50)),
                    () => manejarRespuesta("d")), // Boton b
              ])),
            ],
          ),
        if (_preguntaActual.darTipoDePregunta ==
            TipoDePregunta.abierta) // Si es pregunta ABIERTA
          textInput = new TextInputUI(() => manejarRespuestaAbierta(),
              "Escribe tu respuesta aquí", "Calificar"),
        if (_preguntaActual.darTipoDePregunta ==
            TipoDePregunta
                .abierta) // Si es pregunta ABIERTA hay 2 if pq no me deja poner corchetes y no entiendo pq, pero asi funciona
          new Column(
            children: <Widget>[
              new Flexible(
                flex: 1,
                child: new PreguntaUI(new Text(textoDeLaPregunta)), // Pregunta
              ),
              new Expanded(
                flex: 2,
                child: textInput,
              )
            ],
          ),
        overlayVisible == true
            ? new OverlayCorectoIncorrecto(
                esCorrecto,
                () {
                  if (quiz.darCantidadDePreguntas ==
                      numeroDePreguntaActual + 1) {
                    // Verifica que aun queden preguntas por responder
                    Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new PaginaPuntuacion(quiz.darPuntajeActual,
                                    quiz.darCantidadDePreguntas)),
                        (Route route) =>
                            route == null); // Avanza a la pagina de puntuacion
                    return;
                  }

                  _preguntaActual = quiz.siguientePregunta;
                  this.setState(() {
                    // Esta parte actualizara la pregunta cuando se avanze
                    overlayVisible = false;
                    textoDeLaPregunta = _preguntaActual.darPregunta;
                    numeroDePreguntaActual = quiz.darNumeroDePreguntaActual;
                  });
                },
                this.retroalimentacionDeLaPregunta,
              )
            : new Container()
      ],
    );
  }
}
