import 'package:flutter/material.dart';
import 'package:Kool_School/UI/botonUI.dart';
import 'package:Kool_School/paginas/paginaQuiz.dart';
import 'package:Kool_School/paginas/paginaFormulario.dart';
import 'package:Kool_School/utils/pregunta.dart';
import 'package:Kool_School/utils/quiz.dart';

class PaginaMenu extends StatelessWidget
{

  


  Widget build(BuildContext context) {
    return new Material(
        color: Colors.cyan[600],
        child: Column(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .05), // Añade espacio entre los textos
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new BotonUI(Colors.pink[600], new Text("Añadir",
                    style: TextStyle(
                        fontSize: 75, fontWeight: FontWeight.bold)), () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new PaginaFormulario()))),
                // Boton quiz
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new BotonUI(Colors.pink[600], new Text("Actividad 1: Historia Indígena",
                    style: TextStyle(
                        fontSize: 75, fontWeight: FontWeight.bold)), () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new PaginaQuiz(quiz[0])))),
                // Boton quiz
              ],
            ),
            Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .02), // Añade espacio entre los textos
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new BotonUI(Colors.pink[700], new Text( "Actividad 2: Lunas de Júpiter",
                    style: TextStyle(
                        fontSize: 75, fontWeight: FontWeight.bold)), () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new PaginaQuiz(quiz[1])))),
                // Boton quiz
              ],
            ),
             Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .02), // Añade espacio entre los textos
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new BotonUI(Colors.pink[800], new Text( "Actividad 3: Las Vacunas",
                    style: TextStyle(
                        fontSize: 75, fontWeight: FontWeight.bold)), () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new PaginaQuiz(quiz[2])))),
                // Boton quiz
              ],
            ),
             Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width * .02), // Añade espacio entre los textos
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new BotonUI(Colors.pink[900], new Text( "Actividad 4: Los Sentidos",
                    style: TextStyle(
                        fontSize: 75, fontWeight: FontWeight.bold)), () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new PaginaQuiz(quiz[3])))),
                // Boton quiz
              ],
            ),
          ],
        ),
    );
  }
}

//----------------------------------------------
  // ATRIBUTOS QUIZ (ESTAN FUERA DE LA CLASE PARA QUE SEAN GLOBALES)
  //----------------------------------------------


 List<Quiz> quiz = [
    new Quiz( 'Quiz1', [
    new Pregunta.vofYabierta(
      "¿Miguel es un niño Indígena?",
      "Verdadero",
      TipoDePregunta.vOF,
      [" Muy Bien Has Acertado ", " Que mal, estudia mejor la próxima vez"],
    ),
    new Pregunta.multiple(
      "¿Miguel quiere acompañar a su papá en un viaje a?",
      "a",
      TipoDePregunta.multiple,
      ["Bogotá", "Cali", "Medellin", "Cartagena"],
      [
        "Muy Bien! Efectivamente quieren ir a la Capital de nuestra Colombia ",
        "Oh oh! No es la correcta, nunca hablamos de Cali !",
        "Oh oh! No es la correcta, nunca hablamos de Medellín !",
        "Oh oh! No es la correcta, nunca hablamos de Cartagena !",
      ],
    ),
    new Pregunta.vofYabierta(
      "¿Cuantos días se demoran en llegar Bogotá? (Escriba solo el numero de dias)",
      "5",
      TipoDePregunta.abierta,
      [
        "Asi es! son 5 días! ",
        "Parece que no recordaste bien el número, puedes anotar en un cuaderno, escribir nos ayuda a memorizar !",
      ],
    ),
    new Pregunta.vofYabierta(
      "¿El miércoles la gente del pueblo se reune para ver la llegada y la salida del avión?",
      "Falso",
      TipoDePregunta.vOF,
      [
        " Es cierto porque no es el miércoles sino otro día! ",
        " Oh no! Entendiste el día que no era",
      ],
    ),
    new Pregunta.vofYabierta(
      "¿El avión de la Pedrera a Leticia se demora 10 horas?",
      "Falso",
      TipoDePregunta.vOF,
      [
        " Así es! Son menos de 10 horas !",
        " Parece que no recordaste bien el número, puedes anotar en un cuaderno, escribir nos ayuda a memorizar !",
      ],
    ),
    new Pregunta.vofYabierta(
      "¿Para viajar de la ciudad de Leticia hacia Bogotá deberan tomar otro avión?",
      "Verdadero",
      TipoDePregunta.vOF,
      [
        " Vaya! Que buen lector eres, efectivamente tienen que tomar otro vuelo",
         "Oh no! no recordaste que deben tomar otro vuelo, revisa la lectura con cuidado! ",
      ],
    ),
    new Pregunta.vofYabierta(
      "¿Miguel, su papá y su tío pasan la noche en un hotel pequeño?",
      "Verdadero",
      TipoDePregunta.vOF,
      [
        "Sin duda, el hotel que escogieron era un hotel pequeño",
        "Oh no! tal vez no te fijaste bien en el adjetivo, revisa la lectura con cuidado",
      ],
    )
  ]),

  /// Atributo que corre un nuevo quiz con ciertas preguntas
  new Quiz( 'Quiz2', [
    new Pregunta.vofYabierta(
      "¿Galileo Galilei identificó los primeros cuatro satélites de Júpiter?",
      "Verdadero",
      TipoDePregunta.vOF,
      [" Muy Bien Has Acertado ", " Qué mal, estudia mejor la próxima vez"],
    ),
    new Pregunta.multiple(
      "¿Cuantas lunas se han descubierto en Júpiter?",
      "c",
      TipoDePregunta.multiple,
      ["30","15","63","2"],
      [
        "¡Oh oh! ¡No es la correcta!",
        "¡Oh oh! ¡No es la correcta!",
        "¡Muy Bien! Efectivamente se han descubierto 63 lunas",
        "¡Oh oh! No es la correcta!",
      ],
    ),
     new Pregunta.multiple(
      "¿Cuál es el planeta con mayor número de satélites?",
      "b",
      TipoDePregunta.multiple,
      ["Venus","Júpiter","Marte","La Tierra"],
      [
        "¡Oh oh! ¡No es la correcta!",
        "¡Oh oh! ¡No es la correcta!",
        "¡Muy Bien! Efectivamente Júpiter tiene el mayor número de satélites de nuestro sistema solar ",
        "¡Oh oh! No es la correcta!",
      ],
    ),
    
    new Pregunta.vofYabierta(
      "¿El tamaño de Júpiter es mayor que el de la tierra?",
      "Verdadero",
      TipoDePregunta.vOF,
      [
        "¡Correcto! Júpiter es más grande que nuestro planeta Tierra",
        " Parece que no recordaste bien el número, puedes anotar en un cuaderno, escribir nos ayuda a memorizar !",
      ],
    )
  
  ]),

  new Quiz( 'Quiz3',[
    new Pregunta.multiple(
      "¿Cuál era la principal causa de muerte en Turquía en el siglo XVII?",
      "a",
      TipoDePregunta.multiple,
      ["Viruela", "Sarampión", "Polio", "Malaria"],
      [
        "Muy Bien! Efectivamente la viruela era la principal causa de muerte! ",
        "Oh oh! No es la correcta!",
        "Oh oh! No es la correcta!",
        "Oh oh! No es la correcta!",
      ],
    ),
    new Pregunta.multiple(
      "¿En qué país se intentó utilizar la vacuna a mitad del siglo XVIII?",
      "b",
      TipoDePregunta.multiple,
      ["Turquía", "Inglaterra", "Alemania", "Austria"],
      [
        "Oh oh! No es la correcta!",
        "Muy Bien! Efectivamente fue en Inglaterra",
        "Oh oh! No es la correcta!",
        "Oh oh! No es la correcta!",
      ],
    ),
    new Pregunta.multiple(
      "¿¿Cuál fue el nombre del médico inglés que utilizó la vacuna en un niño de ocho años?",
      "c",
      TipoDePregunta.multiple,
      ["Jhon Smith", "Paul Albarn", "Edward Jenner", "Jhon Armstrong"],
      [
        "Oh oh! No es la correcta!",
        "Oh oh!, no es la correcta",
        "Muy Bien! Efectivamente fue Edward Jenner",
        "Oh oh! No es la correcta!",
      ],
    ),
    new Pregunta.vofYabierta(
      "¿Si a un organismo se le inyectaba la viruela de las ubres de las vacas, y luego la viruela negra genera inmunidad?",
      "Verdadero",
      TipoDePregunta.vOF,
      [
        " Es cierto y esa fue la base del desarollo de las vacunas ",
        " Oh no! No es la correcta",
      ],
    ),
  ]),

  new Quiz( 'Quiz4',[
    new Pregunta.multiple(
      "¿Con cual sentido puedes escuchar los sonidos?",
      "a",
      TipoDePregunta.multiple,
      ["Oído", "Olfato", "Tacto", "Gusto"],
      [
        "Muy Bien! Efectivamente escuchamos con nuestro oído! ",
        "Oh oh! No es la correcta!",
        "Oh oh! No es la correcta!",
        "Oh oh! No es la correcta!",
      ],
    ),
    new Pregunta.multiple(
      "¿Con cual sentido puedes ver lo que te rodea?",
      "b",
      TipoDePregunta.multiple,
      ["Oído", "Vista", "Tacto", "Olfato"],
      [
        "Oh oh! No es la correcta!",
        "Muy Bien! Efectivamente vemos con la vista!",
        "Oh oh! No es la correcta!",
        "Oh oh! No es la correcta!",
      ],
    ),
    new Pregunta.multiple(
      "¿Con cual sentido puedes distinguir la temperatura y textura de las cosas?",
      "c",
      TipoDePregunta.multiple,
      ["Vista", "Oído", "Tacto", "Gusto"],
      [
        "Oh oh! No es la correcta!",
        "Oh oh!, no es la correcta",
        "Muy Bien! Efectivamente con el tacto! también podemos distinguir el tamaño y la consistencia de las cosas!",
        "Oh oh! No es la correcta!",
      ],
    ),
    new Pregunta.multiple(
      "¿Con cual sentido puedes diferenciar los sabores de los alimentos?",
      "d",
      TipoDePregunta.multiple,
      ["Vista", "Oído", "Tacto", "Gusto"],
      [
        "Oh oh! No es la correcta!",
        "Oh oh!, no es la correcta",
        "Oh oh!, no es la correcta",
        "Muy Bien! Efectivamente con el gusto",
      ],
    ),
    new Pregunta.multiple(
      "¿Con cual sentido puedes percibir los olores?",
      "c",
      TipoDePregunta.multiple,
      ["Vista", "Oído", "Olfato", "Gusto"],
      [
        "Oh oh! No es la correcta!",
        "Oh oh!, no es la correcta",
        "Muy Bien! Efectivamente con el olfato",
        "Oh oh!, no es la correcta",
      ],
    ),
  ])
];
