import 'package:flutter/material.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/load_image.dart';

class DataEmpty extends StatelessWidget {
  DataEmpty(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadImage(
            "data_empty",
            width: 50,
            height: 50,
          ),
          Gaps.vGap10,
          Text(text,style: TextStyle(fontSize: 16,color: ColorUtils.get2828Color(context)),)
        ],
      ),
    );
  }
}
