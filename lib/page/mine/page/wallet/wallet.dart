import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/mine/page/services/mine_services.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/util/color_utils.dart';

class wallet extends StatefulWidget {
  wallet();

  @override
  _walletState createState() => _walletState();
}

class _walletState extends State<wallet> {
  //余额
  Widget allUsdt() {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              // Where the linear gradient begins and ends
              end: Alignment.topRight,
              begin: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              //stops: [0.3, 0.5, 0.7, 0.9],
              colors: [
            Colours.dark_button_disabled,
            ColorUtils.getThemeColor()
          ])),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1688.00',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 0, bottom: 8),
            child: Text(
              S.of(context).wat_zhye,
              style: TextStyle(
                  color: Color.fromARGB(200, 255, 255, 255), fontSize: 12),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '≈12688.00 CNY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '(${S.of(context).wat_ktxje})',
                style: TextStyle(
                    color: Color.fromARGB(150, 255, 255, 255), fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      appBar: AppBar(
          title: Text(
            S.of(context).wat_wdqb,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colours.text_color,
              size: 18,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: ColorUtils.getWhiteBgColor(context),
          elevation: 1),
      body: Container(
        child: Column(
          children: [
            allUsdt(),
            Container(
              margin: EdgeInsets.all(10),
              color: ColorUtils.getWhiteBgColor(context),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RechargePage(
                            viewType: 2,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).mi_tx,
                            style: TextStyle(fontSize: 12, color: Colours.text),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 12,
                            color: Colours.text_gray_c,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RechargePage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border(top: BorderSide(color: Colours.navi_bg))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).mi_cz,
                            style: TextStyle(fontSize: 12, color: Colours.text),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 12,
                            color: Colours.text_gray_c,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
