import 'package:flutter/material.dart' hide Router;
import 'package:zjsb_app/util/image_utils.dart';

class BlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Image(image: ImageUtils.getAssetImage('cxjl_pic_jzsb')),
          SizedBox(
            height: 10,
          ),
          Text('没有数据'),
        ],
      ),
    );
  }
}
