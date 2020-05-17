import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquerCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top:50.0),


        child : Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
              )
          ],
        )

      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamanio de la imagen',
      //divisions: 20,
      value: _valorSlider,
      min : 10.0,
      max : 400.0,
      onChanged: ( _bloquerCheck )  ? null :( valor ){
      
      
       
        setState(() {
          _valorSlider = valor;
        });
      },

    );

  }

  Widget _crearImagen() {

    return FadeInImage(
      placeholder: AssetImage('assets/original.gif'),
      image: NetworkImage('https://images-na.ssl-images-amazon.com/images/I/61nRsmNnVzL._AC_SL1023_.jpg'),
      width: _valorSlider,
      fit : BoxFit.contain,
      fadeInDuration: Duration(
            milliseconds : 200
          ),
    );

  }

  Widget _crearCheckBox() {

/*
    return Checkbox(
      value : _bloquerCheck,
      onChanged: (valor){

        setState(() {
          _bloquerCheck = valor;
        });
      },

    );
    */
    return CheckboxListTile( //Ventaja de usar listitle se puede dar clicken cualquier parte
      title: Text('Bloquear Slider'),
       value : _bloquerCheck,
      onChanged: (valor){

        setState(() {
          _bloquerCheck = valor;
        });
      },
      
      );

  }

  Widget _crearSwitch() {

    return SwitchListTile(
      title: Text('Bloquear Slider'),
       value : _bloquerCheck,
      onChanged: (valor){

        setState(() {
          _bloquerCheck = valor;
        });
      },
    
    
    
    );



  }
}