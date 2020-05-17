import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Alert Page')
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
        ),
        body: Center(
          child : RaisedButton(
            child: Text('Mostrar Alerta'),
            color: Colors.blue,
            onPressed: () => _mostarAlerta(context),
            textColor: Colors.white,
            shape: StadiumBorder(),
            )
        ),
    );

  }

  void _mostarAlerta(BuildContext context){

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la caja de una alerta'),
              FlutterLogo(
                size: 100,
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: ()=> Navigator.of(context).pop(),
              child: Text('Cancelar')
            ),
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text('Ok')
            ),
          ],
        );
      }
    );

  }






}