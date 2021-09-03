import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

class CustBtn extends StatefulWidget {
  final bgColor ;
  final Widget  child;
  final VoidCallback onPressed;
  CustBtn({Key key, @required this.onPressed,
    this.bgColor = Colors.white,@required this.child}):super(key: key);
  @override
  _CustBtnState createState() => _CustBtnState();
}

class _CustBtnState extends State<CustBtn> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        color: widget.bgColor,
        child: InkWell(
          onTap: (){
            widget.onPressed();
          },
          child: Container(
            alignment: Alignment.center,
            child: widget.child ,
          ),
        ),
      ),
    );
  }
}

