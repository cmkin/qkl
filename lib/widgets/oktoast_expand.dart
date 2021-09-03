import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

const Color _bgColor = Colors.black87;
const double _radius = 3.0;

class JhToast2{
  static showText(
      String loadingText,
      ){
    _showText(loadingText);
  }
  static showSuccess(
      String loadingText,
      ){
    _showSuccess(loadingText);
  }
  static showError(
      String loadingText,
      ){
    _showError(loadingText);
  }
  static showInfo(
      String loadingText,
      ){
    _showInfo(loadingText);
  }

  static showLoadingText({
    String loadingText = "加载中...",
  }){
    _showLoading(loadingText);
  }

  static hideHUD(){
    dismissAllToast();
  }

}

void _showText(loadingText) {
  var w = Container(
    margin: const EdgeInsets.all(50.0),
    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(_radius)),
    child: ClipRect(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(loadingText,
                style: TextStyle(fontSize: 16,), textAlign: TextAlign.center),
          ],
        )
    ),
  );
  showToastWidget(w);
}


void _showLoading(loadingText) {
  var w = Container(
    margin: const EdgeInsets.all(50.0),
    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(_radius)),
    child: ClipRect(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 40.0,
              height: 40.0,
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.all(4.0),
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor:AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            Text(loadingText,
                style: TextStyle(fontSize: 16,), textAlign: TextAlign.center),
          ],
        )
    ),
  );
  var bg = Container(
    width: 2000,
    height: 2000,
    color: Colors.transparent,
    child: Center(child: w,),
  );


  showToastWidget(bg,duration:Duration(seconds: 10),handleTouch: true);
}

void _showSuccess(loadingText) {
  var w = Container(
    margin: const EdgeInsets.all(50.0),
    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(_radius)),
    child: ClipRect(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 40.0,
              height: 40.0,
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.check_circle_outline, size: 30, color: Colors.white,),
            ),
            Text(loadingText,
                style: TextStyle(fontSize: 16,), textAlign: TextAlign.center),
          ],
        )
    ),
  );
  showToastWidget(w);
}


void _showError(loadingText) {
  var w = Container(
    margin: const EdgeInsets.all(50.0),
    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(_radius)),
    child: ClipRect(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 40.0,
              height: 40.0,
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.highlight_off, size: 30, color: Colors.white,),
            ),
            Text(loadingText,
                style: TextStyle(fontSize: 16,), textAlign: TextAlign.center),
          ],
        )
    ),
  );
  showToastWidget(w);
}

void _showInfo(loadingText) {
  var w = Container(
    margin: const EdgeInsets.all(50.0),
    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(_radius)),
    child: ClipRect(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 40.0,
              height: 40.0,
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.info_outline, size: 30, color: Colors.white,), //info_outline
            ),
            Text(loadingText,
                style: TextStyle(fontSize: 16,), textAlign: TextAlign.center),
          ],
        )
    ),
  );
  showToastWidget(w);
}