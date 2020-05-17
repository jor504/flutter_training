import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {

  static final pageName = 'avatar';

  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://cdn11.bigcommerce.com/s-jbg7mp3qyd/images/stencil/1280x1280/products/3816/5694/darth_vader_profile__33436.1464722408.jpg?c=2&imbypass=on'),
             radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right : 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/original.gif'), 
          image: NetworkImage('https://images.alphacoders.com/270/thumb-1920-270241.jpg'),
          fadeInDuration: Duration(
            milliseconds : 200
          ),
          ),
      ),
    );

  }
}