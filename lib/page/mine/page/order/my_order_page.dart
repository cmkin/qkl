import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/mine/page/order/my_order_detail_page.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/my_app_bar.dart';
import 'package:styled_widget/styled_widget.dart';
class MyOrderPage extends StatefulWidget {
  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      appBar: MyAppBar(
        centerTitle: "${S.of(context).mi_wddd}",
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12,top: 15),
        child: Column(
          children: [
            getItem("${S.of(context).wddd_ysbdd}", 11, 23),
            Gaps.vGap15,
            getItem("${S.of(context).wddd_dxsbdd}", 11, 23),
            Gaps.vGap15,
            getItem("${S.of(context).wddd_lhsbdd}", 11, 23),
          ],
        ),
      ),
    );
  }

  Widget getItem(String title,int a,int b){
    return Stack(
      children: [
        Card(
          // 边框
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: ColorUtils.getWhiteBgColor(context),
          child: Container(
            padding: EdgeInsets.only(left: 18,right: 18,top: 18,bottom: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title).fontSize(16).textColor(Colours.dark_text_gray).fontWeight(FontWeight.w800),
                Gaps.vGap15,
                Row(
                  children: [
                    Text("${S.of(context).wddd_cyz} $a ${S.of(context).dw_bi}").fontSize(13).textColor(Colours.text_gray),
                    Gaps.hGap32,
                    Text("${S.of(context).wddd_ydq} $a ${S.of(context).dw_bi}").fontSize(13).textColor(Colours.text_gray),
                  ],
                ),

              ],
            ),
          ),
        ),
        //列表item的点击效果
        Positioned.fill(
          child: Material(
            //背景
            color: Colors.transparent,
            child: Ink(
              decoration: new BoxDecoration(
                //设置四周圆角 角度
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: InkWell(
                splashColor: Colours.click_color.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(12)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyOrderDetailPage(title),
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
