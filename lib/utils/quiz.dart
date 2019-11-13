import 'package:Kool_School/utils/pregunta.dart';

class Quiz{

  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

  String _nombre;

  /// Atributo que contiene una lista de preguntas, el _ en el nombre lo hace privado
  List <Pregunta> _preguntas;

  /// Atributo que dice en que preunta vamos
  int _contador = -1;

  /// Atributo que cuenta el puntaje
  int _puntaje = 0;

  //----------------------------------------------
  // CONSTRUCTOR
  //----------------------------------------------

  /// Cosntructor que recibe una lista de preguntas
  Quiz(pNombre, pPreguntas)

  {
    _nombre = pNombre;
    _preguntas = pPreguntas;
  }  

  //----------------------------------------------
  // METODOS
  //----------------------------------------------


  String get darNombreQuiz => _nombre;

  /// Metodo que retorna la lista de preguntas
  List<Pregunta> get darPreguntas => _preguntas;

  /// Metodo que retorna la cantidad de preguntas
  int get darCantidadDePreguntas =>_preguntas.length;

  /// Metodo que retora el numero de pregunta actual
  int get darNumeroDePreguntaActual => _contador;   

  /// Metodo que retorna el puntaje actual
  int get darPuntajeActual => _puntaje;

  /// Metodo que retorna la siguiente pregunta
  Pregunta get siguientePregunta{
    _contador++;
    if(_contador >= darCantidadDePreguntas)
      return null;
    return _preguntas[_contador];
  }

  /// Metodo que retorna aumenta el puntaje en 1, de tener la respuesta corrrecta
  void ganarPunto(bool esCorrecto)
  {
    if(esCorrecto)
      _puntaje++;
      
  }

  /// Metodo que reinicia el quiz
  void reiniciarQuiz()
  {
    _puntaje = 0;
    _contador = -1;
  }

}