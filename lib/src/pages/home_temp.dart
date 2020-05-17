import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
 
 final opciones = ['Uno','Dos','Tres','Cuatro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Componentes Temp'),
      ),
       body: ListView(
         children: _crearItemsCorta(),
       ),
    );

  }

  List<Widget> _crearItems() {

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),

      );
      //Operador en cascada ..
      lista..add(tempWidget)
           ..add(Divider());
    
    }

    return lista;
  }

  List<Widget> _crearItemsCorta(){

    return opciones.map((item){

      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + ' !'),
            subtitle: Text('Subtitulo ' + item),
            leading: Icon( Icons.account_balance ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){},
          ),
          Divider(
            height: 40,
          ),
        ],
      );
      
    }).toList(); //cast a lista
    
  }

  

}