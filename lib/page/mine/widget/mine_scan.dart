import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:scan/scan.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/mvp/base_page.dart';
import 'package:zjsb_app/page/login/presenter/login_presenter.dart';
import 'package:zjsb_app/page/mine/presenter/mine_presenter.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:zjsb_app/util/color_utils.dart';

class ScanPage extends StatefulWidget  {

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage>{
  StateSetter stateSetter;
  IconData lightIcon = Icons.flash_on;
  ScanController controller = ScanController();
  List<AssetEntity> _assets = [];

  void getResult(String result){
    Navigator.of(context).pop(result);
    //TODO
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colours.text_color,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 1,
        title: Text(
           S.of(context).scan_title,
          style: TextStyles.get2828TextStyle(context),
        ).fontSize(18).fontWeight(FontWeight.bold),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){
            selectPhoto();
          }, child: Text(S.of(context).scan_photo,style: TextStyles.get6565TextStyle(context),).fontSize(16))
        ],
      ),
      body: Stack(
          children: [ScanView(
            controller: controller,
            scanAreaScale: .7,
            scanLineColor: ColorUtils.getThemeColor(),
            onCapture: (data) {
              getResult(data);
            },
          ),
          ]
      ),
    );
  }

  Future selectPhoto()  async{
    final List<AssetEntity> result = await AssetPicker.pickAssets(
      context,
      maxAssets: 1,
      pathThumbSize: 84,
      gridCount: 4,
      selectedAssets: _assets,
    );
    if (result != null && result.length > 0) {
      _assets = List<AssetEntity>.from(result);
      AssetEntity asset = _assets.first;
      File  file = await asset.file;
      getFile(file);
    }
  }

  Future getFile(File file) async{
    String result = await Scan.parse(file.path);
    getResult(result);
  }
}