import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/common/common.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/page/mine/presenter/locale_provider.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/util/toast.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final List<String> _list = <String>['跟随系统', '中文', 'English'];
  @override
  Widget build(BuildContext context) {
    final String locale = SpUtil.getString(Constant.locale);
    String localeMode;
    switch (locale) {
      case 'zh':
        localeMode = _list[1];
        break;
      case 'en':
        localeMode = _list[2];
        break;
      default:
        localeMode = _list[0];
        break;
    }
    return Scaffold(
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
          S.of(context).choose_language,
          style: TextStyles.get2828TextStyle(context),
        ).fontSize(16), //.fontWeight(FontWeight.bold),
        centerTitle: true,
      ),
      backgroundColor: ColorUtils.getGrayWhiteBgColor(context),
      body: ListView.separated(
        itemCount: _list.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (_, int index) {
          return InkWell(
            onTap: () {
              final String locale =
                  index == 0 ? '' : (index == 1 ? 'zh' : 'en');
              context.read<LocaleProvider>().setLocale(locale);
              //print(locale);
              // Toast.show('当前功能仅登录模块有效');
              // setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 50,
              child: Row(
                children: [
                  Expanded(child: Text(_list[index])),
                  Opacity(
                    opacity: localeMode == _list[index] ? 1 : 0,
                    child: Icon(
                      Icons.done,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
