//import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes APP',
      debugShowCheckedModeBanner: false,
            localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
       supportedLocales: [
        const Locale('es','ES')
      ],
      //home : HomePage(),
      initialRoute: '/',
      routes:getApplicactionRoutes() ,

      
      onGenerateRoute: (RouteSettings settings){
        
        print('RUTA LLAMADA : ${settings.name}' );

        return MaterialPageRoute(
          builder: (context) => AlertPage()
        
        );

      },

    );
  }
}