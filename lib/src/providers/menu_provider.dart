import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle; //Solo se importa el rootBundle de services.dart


class _MenuProvider {

  List<dynamic> opciones = [];


  _MenuProvider(){
    //cargarData();


  }

  Future <List<dynamic>> cargarData() async {

    final resp = await rootBundle.loadString('data/menu_opts.json');
        Map dataMap = json.decode(resp);
       return opciones = dataMap['rutas'];
  }


}

final menuProvider = new _MenuProvider();

