import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PaginaLecturaPdf extends StatelessWidget
{
  final PDFDocument _documento;
 final VoidCallback _onTap;
  

  PaginaLecturaPdf (this._documento, this._onTap);

 
  

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title:  Text('Regresar'), 
          
          actions: <Widget>[

            // text
            new Center(
             child: new Text(
              "Ir al Quiz    ",  style: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.white)), 
              ),
             ),
            

            // action button
            IconButton(
              icon: Icon(Icons.arrow_forward, size: 26.5),
              onPressed: () => _onTap(),
            ),
         
   
            ]
        ),
        body: Center(
        child:
        PDFViewer(document: _documento)),
        
    );
  }

}