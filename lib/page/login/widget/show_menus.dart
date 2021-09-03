import 'package:flutter/material.dart';

Color _bgColor = Colors.white;
double cellHeight = 34;
double cellWidth=120;

typedef ClickCallBack = void Function(int selectIndex, String selectText);

class PopMenus {
  static void showPop(
      {@required BuildContext context,
        @required List<String> listData,
        @required String selText,
        ClickCallBack clickCallback}) {
    Widget _buildMenuLineCell(dataArr) {
      return ListView.separated(
        itemCount: dataArr.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.pop(context);
                if (clickCallback != null) {
                  clickCallback(index, listData[index]);
                }
              },
              child: Container(
                height: cellHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    selText==dataArr[index]?
                    Text(dataArr[index], style: TextStyle(fontSize: 16,color:
                    Colors.blue)):Text(dataArr[index], style: TextStyle(fontSize: 16))
                  ],
                ),
              ));
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 0.1,
            color: Color(0xFFE6E6E6),
          );
        },
      );
    }

    _buildMenusView(dataArr) {
      var cellH = dataArr.length * cellHeight;
      return Positioned(
        left: 120,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 10),
              // child: TriangleUpWidget(height: 10,width: 14),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Container(
                    color: _bgColor,
                    width: cellWidth,
                    height: cellH,
                    child: _buildMenuLineCell(dataArr)))
          ],
        ),
      );
    }

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return BasePopMenus(child: _buildMenusView(listData));
        });
  }
}

class BasePopMenus extends Dialog {
  BasePopMenus({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(onTap: () => Navigator.pop(context)),
          child
        ],
      ),
    );
  }
}