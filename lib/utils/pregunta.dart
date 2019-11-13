 
 
 enum TipoDePregunta {
    vOF, multiple, abierta
  }


class Pregunta{

  //----------------------------------------------
  // ATRIBUTOS
  //----------------------------------------------

   /// Atributo donde se guarda la pregunta
   String _pregunta;
   /// Atributo donde se guarda si la respuesta fue correcta o no
   String _respuesta;
   /// Atributo que representa el tipo de pregunta
   TipoDePregunta _tipoDePregunta;
    /// Atributo que contiene una lista de opciones para Multiple
  List <String> _opciones;

  /// Atributo que contiene una lista de retroalimentaciones
  List <String> _retroalimentaciones;

  //----------------------------------------------
  // CONSTRUCTORES
  //----------------------------------------------

  /// Constructor para VoF y Abierta que recibe una pregunta de tipo String, un String para la respuesta y un enum para el tipo de pregunta
  Pregunta.vofYabierta(pPregunta, pRespuesta, pTipoDePregunta, pRetroalimentaciones)
  {
    _pregunta = pPregunta;
    _respuesta = pRespuesta;
    _tipoDePregunta = pTipoDePregunta;
    _retroalimentaciones = pRetroalimentaciones;
  }

  /// Constructor para Multiple que recibe una pregunta de tipo String, un String para la respuesta, un enum para el tipo de pregunta y una lista de 4 opciones
  Pregunta.multiple(pPregunta, pRespuesta, pTipoDePregunta, pOpciones, pRetroalimentaciones)
  {
    _pregunta = pPregunta;
    _respuesta = pRespuesta;
    _tipoDePregunta = pTipoDePregunta;
    _opciones = pOpciones;
    _retroalimentaciones = pRetroalimentaciones;
  }

  //----------------------------------------------
  // METODOS
  //----------------------------------------------

  /// Metodo que retorna el texto de la pregunta
  String get darPregunta => _pregunta;

  /// Metodo que retorna la respuesta 
  String get darRespuesta => _respuesta;

  /// Metodo que returna el tipo de pregunta
  TipoDePregunta get darTipoDePregunta => _tipoDePregunta;

  /// Metofo que retorna las opciones
  List <String> get darOpciones =>  _opciones;

  //Metodo que retorna las retroalimentaciones
  List<String> get darRetroalimentaciones => _retroalimentaciones;

  //Metodo que retorna la retroalimentacion a determinada entrada
  String darRetroalimentacionAPregunta(String response)
  {
    if(this._tipoDePregunta == TipoDePregunta.vOF || this._tipoDePregunta == TipoDePregunta.abierta)
    {
      if(response == this._respuesta)
      {
        return this._retroalimentaciones[0];
      }
      else
      {
        return this._retroalimentaciones[1];
      }
    }
    else
    {
        int indexInArray = -1;

        if(response == "a")
        {
            indexInArray = 0;
        }
        else if(response == "b")
        {
            indexInArray = 1;
        }
        else if (response == "c")
        {
            indexInArray = 2;
        }
        else if(response == "d")
        {
            indexInArray = 3;
        }
        else
        {
          return "";
        }

        return  _retroalimentaciones[indexInArray];
    }
    
  }

}