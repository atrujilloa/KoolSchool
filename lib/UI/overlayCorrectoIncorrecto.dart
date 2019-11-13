import 'dart:math' as math;
import 'package:flutter/material.dart';

// Clase que se encarga se ser el overlay, como la capa superior, cada vez que el usuario responde. Es la que contiene el correcto o incorrecto con su respectiva animacion y cuando esta es tocada se pasa a la siguiente pregunta.

class OverlayCorectoIncorrecto extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;
  final String _feedback;

  OverlayCorectoIncorrecto(this._isCorrect, this._onTap, this._feedback);

  @override
  State createState() => new CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<OverlayCorectoIncorrecto>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 10000,
        child: new Material(
          color: Colors.black87,
          child: new InkWell(
            onTap: () => widget._onTap(),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: new Transform.rotate(
                    angle: _iconAnimation.value * 2 * math.pi,
                    child: new Icon(
                      widget._isCorrect == true ? Icons.done : Icons.clear,
                      size: _iconAnimation.value *
                          MediaQuery.of(context).size.width *
                          .1, color: widget._isCorrect == true ? Colors.lightGreenAccent[400] : Colors.redAccent[700], 
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(bottom: 20.0),
                ),
                new Text(
                  widget._isCorrect == true
                      ? "¡Correcto!" + "\n" + widget._feedback
                      : "¡Incorrecto!" + "\n" + widget._feedback,
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * .04),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ));
  }
}
