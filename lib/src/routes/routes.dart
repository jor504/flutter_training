

import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/animated_containter.dart';

Map<String, WidgetBuilder> getApplicactionRoutes(){


return  <String,WidgetBuilder>{
        '/' : (BuildContext context) => HomePage(),
        'alert' : (BuildContext context) => AlertPage(),
        //'avatar' : (BuildContext context) => AvatarPage(),
        /*Otra manera de llamar las rutas */
        AvatarPage.pageName : (BuildContext context) => AvatarPage(),
        
        
        'card' : (BuildContext context) => CardsPage(),
        'animatedContainer' : (BuildContext context) => AnimatedContainerPage(),
        'inputs': (BuildContext context) => InputPage(),
        'slider' : (BuildContext context) => SliderPage(),
        'list' : (BuildContext context) => ListaPage()
};

}
