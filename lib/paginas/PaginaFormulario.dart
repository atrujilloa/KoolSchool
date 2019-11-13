import 'package:flutter/material.dart';
import 'package:Kool_School/utils/pregunta.dart';
import 'package:Kool_School/UI/preguntaUI.dart';
import 'package:Kool_School/UI/botonUI.dart';
import 'package:Kool_School/UI/textInputUI.dart';
import 'package:Kool_School/utils/pregunta.dart';
import 'package:Kool_School/utils/quiz.dart';

class PaginaFormulario extends StatefulWidget {
  PaginaFormularioState createState() => PaginaFormularioState();
}

class PaginaFormularioState extends State<PaginaFormulario> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  TextEditingController nameCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController preguntaCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();
  TextEditingController repeatPassCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Añadir Quiz'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(60.0),
            child: new Form(
              key: keyForm,
              child: formUI(),
            ),
          ),
        ),
      ),
    );
  }

  formItemsDesign(icon, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }

  String gender = 'hombre';
  String rta;

  Widget formUI() {
    return Column(
        children: <Widget>[
    formItemsDesign(
    const IconData(58169, fontFamily: 'MaterialIcons',
        matchTextDirection: true),
    TextFormField(
    controller: nameCtrl,
    decoration: new InputDecoration(
    labelText: 'Pon aquí el Nombre del Quiz',
    ),
    validator: validateName,
    )),
    formItemsDesign(
    const IconData(0xe147, fontFamily: 'MaterialIcons'),
    TextFormField(
    controller: preguntaCtrl,
    decoration: new InputDecoration(
    labelText: 'Pregunta que desea añadir',
    ),
    keyboardType: TextInputType.phone,
    maxLength: 10,
    )),
    formItemsDesign(
    null,
    Column(children: <Widget>[
    Text("Tipo pregunta"),
    RadioListTile<String>(
    title: const Text('Verdadero o falso'),
    value: 'VoF',
    groupValue: gender,
    onChanged: (value) {
    setState(() {
      gender = value;
    });
    },
    ),
    RadioListTile<String>(
    title: const Text('Pregunta abierta'),
    value: 'a',
    groupValue: gender,
    onChanged: (value) {
    setState(() {
    gender = value;
    });
    },
    ),
    RadioListTile<String>(
    title: const Text('Opción múltiple'),
    value: 'oM',
    groupValue: gender,
    onChanged: (value) {
    setState(() {
    gender = value;
    });
    },
    ),
    ])),
          formItemsDesign(
              null,
              Column(children: <Widget>[
                Text("Respuesta correcta"),
                RadioListTile<String>(
                  title: const Text('Verdadero'),
                  value: 'verdadero',
                  groupValue: rta,
                  onChanged: (value) {
                    setState(() {
                      rta = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Falso'),
                  value: 'a',
                  groupValue: rta,
                  onChanged: (value) {
                    setState(() {
                      rta = value;
                    });
                  },
                ),
              ])),
    GestureDetector(
    onTap: () {
    save();
    }, child: Container(
    margin: new EdgeInsets.all(30.0),
    alignment: Alignment.center,
    decoration: ShapeDecoration(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0)),
    gradient: LinearGradient(colors: [
    Color(0xFF0EDED2),
    Color(0xFF03A0FE),
    ],
    begin: Alignment.topLeft, end: Alignment.bottomRight),
    ),
    child: Text("Guardar",
    style: TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500)),
    padding: EdgeInsets.only(top: 16, bottom: 16),
    ))
    ]
    ,
    );
  }



  String validatePassword(String value) {
    print("valorrr $value passsword ${passwordCtrl.text}");
    if (value != passwordCtrl.text) {
      return "Las contraseñas no coinciden";
    }
    return null;
  }

  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El nombre es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "El nombre debe de ser a-z y A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "El telefono es necesariod";
    } else if (value.length != 10) {
      return "El numero debe tener 10 digitos";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\[email protected]\"]+(\.[^<>()[\]\\.,;:\[email protected]\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Correo invalido";
    } else {
      return null;
    }
  }

  save() {
    if(gender == 'VoF'|| gender == 'a') {
      listaPreguntas = [
        new Pregunta.vofYabierta(
            preguntaCtrl.text, 'Verdadero', TipoDePregunta.vOF, [
          " Muy Bien Has Acertado ",
          " Qué mal, estudia mejor la próxima vez"
        ])
      ];
    }

    print("Lista ${listaPreguntas[0].darPregunta}");
    
    if (keyForm.currentState.validate()) {
      print("Nombre ${nameCtrl.text}");
      print("Telefono ${preguntaCtrl.text}");
      print("Correo ${emailCtrl.text}");
      print("Tipo pregunta ${gender}");
      keyForm.currentState.reset();
    }
  }


  List<Pregunta> listaPreguntas;

  void validarTipoPregunta(){
    if(gender == 'VoF'|| gender == 'a')
      listaPreguntas = [new Pregunta.vofYabierta(preguntaCtrl.text, 'Verdadero', TipoDePregunta.vOF,  [" Muy Bien Has Acertado ", " Qué mal, estudia mejor la próxima vez"])];
  }

  Quiz crearQuiz(){
    new Quiz({nameCtrl.text}, listaPreguntas);
  }

}




