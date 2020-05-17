import 'dart:async';

import 'package:flutter/material.dart';


class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {



  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0 ;
  bool _isLoading = false;

  /*En este momento del ciclo de vida de la aplicacion,
    Primero se agregan 10 elementos a la lista y luego en el build se cargan las imagenes
  */

  @override 
  void initState() { 
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      
      if(_scrollController.position.pixels  == _scrollController.position.maxScrollExtent){
        //_agregar10();
        fetchData();

      }

    });
    
  }
  @override
  void dispose() {
    
    super.dispose();
    _scrollController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas')
      ),

      body: Stack( //apila los widgets uno con otros
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      )
    );
  }




  Widget _crearLista(){

    return RefreshIndicator(
          onRefresh: obtenerPagina1,
          child: ListView.builder( // Necesario por si se tienen demasiados elementos
        
        controller : _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context , int index ){

          final imagen = _listaNumeros[index];



          return FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen')
            );

        },
        
        ),
    );

  }

  Future<Null> obtenerPagina1() async{

    final duration = Duration(seconds: 2);

    new Timer(duration,(){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });


    return Future.delayed(duration);

  }

  void _agregar10(){

    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {
      
    });

  }

  Future<Null> fetchData() async{

    _isLoading = true;
    setState(() {
      
    });

    final duration = new Duration(seconds : 2);
    new Timer(duration, respuestaHTTP);//No se ponen parentesis para que no se ejecute en el instate , es para hacer referencia a la funcion


  }

  void respuestaHTTP(){
    _isLoading = false;
    /*para mover el scroll 100 pixeles mas cuando ya termino de cargar
    */
    _scrollController.animateTo(
      _scrollController.position.pixels +100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds : 250)

      );
   _agregar10();

  }

  Widget _crearLoading() {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0,)
          
        ],
        );
      
      
       
    }else{
      return Container();
    }

  }


}