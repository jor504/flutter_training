import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre;
  String _email;
  String _fecha;
  String _opcionSeleccionada = 'Volar';
  List <String> _poderes = ['Volar','Rayos X','Super Fuerza','Super Aliento'];

  TextEditingController _inputFieldDateController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de Texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal:10.0,vertical:20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {

    

    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration:InputDecoration(
        border: OutlineInputBorder(
          borderRadius : BorderRadius.circular(20.0),
        ),

        counter : Text('Letras ${_nombre?.length ?? 0}'),
        hintText : 'Escribe Algo',
        labelText : 'Nombre',
        helperText : 'Solo nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon : Icon(Icons.account_circle)
      ) ,
      onChanged: (valor){
       
        setState(() {
          _nombre= valor;
        });
      },
    );


  }

  Widget _crearPersona() {

    return ListTile(
      title: Text('Nombre es : $_nombre'),
      subtitle: Text('Email es: $_email'),
      trailing: Text(_opcionSeleccionada),
    );


  }

 Widget _crearEmail() {

   return TextField(
      //autofocus: true,
      //textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.emailAddress,
      decoration:InputDecoration(
        border: OutlineInputBorder(
          borderRadius : BorderRadius.circular(20.0),
        ),

        counter : Text('Letras ${_nombre?.length ?? 0}'),
        hintText : 'Email',
        labelText : 'Email',
        //helperText : 'Solo nombre',
        suffixIcon: Icon(Icons.alternate_email),
        icon : Icon(Icons.email)
      ) ,
      onChanged: (valor){
       
        setState(() {
          _email= valor;
        });
      },
    );



 }

  Widget _crearPassword() {

    return TextField(
      //autofocus: true,
      //textCapitalization: TextCapitalization.sentences,
      //keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration:InputDecoration(
        border: OutlineInputBorder(
          borderRadius : BorderRadius.circular(20.0),
        ),

        counter : Text('Letras ${_nombre?.length ?? 0}'),
        hintText : 'Password',
        labelText : 'Password',
        //helperText : 'Solo nombre',
        suffixIcon: Icon(Icons.lock),
        icon : Icon(Icons.lock_outline)
      ) ,
      onChanged: (valor){
       
        setState(() {
          _email= valor;
        });
      },
    );

  }

 Widget _crearFecha(BuildContext context) {
   
   return TextField(
      //autofocus: true,
      //textCapitalization: TextCapitalization.sentences,
      //keyboardType: TextInputType.emailAddress,
      //obscureText: true,
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration:InputDecoration(
        border: OutlineInputBorder(
          borderRadius : BorderRadius.circular(20.0),
        ),

        counter : Text('Letras ${_nombre?.length ?? 0}'),
        hintText : 'Fecha de Nacimiento',
        labelText : 'Fecha de Nacimiento',
        //helperText : 'Solo nombre',
        suffixIcon: Icon(Icons.calendar_today),
        icon : Icon(Icons.calendar_today)
      ) ,
      onTap: (){
        
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);

      },
    );


  }


  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(context: context, 
                                           initialDate: new DateTime.now(), 
                                           firstDate: new DateTime(2019), 
                                           lastDate: new DateTime(2021),
                                           locale: Locale('es','ES'));

    if (picked != null ){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown(){

    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach( (poder){

      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      
      ));

    });

    return lista;

  }

  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30,),
        Expanded(
                  child: DropdownButton(
                value: _opcionSeleccionada,
                items: getOpcionesDropDown(), 
              onChanged: (opt){
              setState(() {
                _opcionSeleccionada = opt;
              });

              }
              ),
        )
      ],

    );
    


  }


}


