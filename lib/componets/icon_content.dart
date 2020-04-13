import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.myIcon, this.myText, this.myOnPressed});
  final Widget myIcon;
  final String myText;
  final Function myOnPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //this is an IconButton, not Icon
        IconButton(
          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
          icon: myIcon,
          // we only call the function name
          onPressed: myOnPressed,
//        //the following works the same but not good code.
//          onPressed: () {
//            //if no (), we get error saying avoid using unnecessary statement
//            myFunction();
//          },
          iconSize: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(myText, style: kMyTextStyle),
      ],
    );
  }
}
