import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/util/color_utils.dart';

class ChangeUserNamePage extends StatefulWidget {
  @override
  _ChangeUserNamePageState createState() => _ChangeUserNamePageState();
}

class _ChangeUserNamePageState extends State<ChangeUserNamePage> {
  final TextEditingController _userNameController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nodeText1.dispose();
    _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
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
          title: Text(
            S.of(context).about_xgnc,
            style: TextStyles.get2828TextStyle(context),
          ).fontSize(16), //.fontWeight(FontWeight.bold),
          centerTitle: true,
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  S.of(context).about_save,
                  style: TextStyles.get6565TextStyle(context),
                ).fontSize(16))
          ],
        ),
        backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            // 昵称
            Container(
                padding: EdgeInsets.only(left: 12, right: 12),
                color: ColorUtils.getWhiteBgColor(context),
                child: TextField(
                  controller: _userNameController,
                  focusNode: _nodeText1,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: S.of(context).about_qsrnc,
                    hintStyle: TextStyle(color: Colours.ligGray_text_color),
                  ),
                )),
            Gaps.vGap10,
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).about_ncgz,
                style: TextStyles.get6565TextStyle(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
