import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: ThemeData(
//        //we can write everything with Theme data
//        //the one we didn't specify will see as default light theme.
//        primaryColor: kBackgroundColor,
//        //backgroundColor: kBackgroundColor, //this backgroundColor will not work
//        scaffoldBackgroundColor: kBackgroundColor,
//        accentColor: Colors.yellow,
//      ),

      theme: ThemeData.dark().copyWith(
        //copy everything except the following properties:
        primaryColor: kBackgroundColor,
        //backgroundColor: kBackgroundColor, //this backgroundColor will not work
        scaffoldBackgroundColor: kBackgroundColor,
//            ThemeData.dark() does not have accentColor
//            accentColor: Colors.yellow, //not working here
      ), //ThemeData.dark().copyWith()

//      theme: ThemeData.dark(),

      home: InputPage(),

//          Scaffold(
//        appBar: AppBar(
//          title: Text('Hello'),
//        ),
//
//        //to customize a specific widget outside the theme, use Theme widget
//        floatingActionButton: Theme(
//          data: ThemeData(accentColor: Colors.purple),
//          child: FloatingActionButton(
//            child: Icon(Icons.add),
//          ),
//        ),
//
////        //the following will not work, because we use ThemeData,there isn't Theme.of(context)
////        floatingActionButton: Theme(
////          data: Theme.of(context).copyWith(accentColor: Colors.red),
////          child: FloatingActionButton(
////            child: Icon(Icons.add),
////            onPressed: null,
////          ),
////        ),
//
//        //the default body text is black,
//        // so we can't see it if we don't specify in ThemeData
//        body: Text('Hello World'),
//      ),
    );
  }
}

//while using theme, we can still customize a certain part
//If you don’t want to inherit any application colors or font styles,
//create a ThemeData() instance and pass that to the Theme widget.
//this works to customize:
//      floatingActionButton: Theme(
//        data: ThemeData(accentColor: Colors.purple),
//        child: FloatingActionButton(
//          child: Icon(Icons.add),
//        ),
//      ),
