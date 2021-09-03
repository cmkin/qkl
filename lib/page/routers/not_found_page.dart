import 'package:flutter/material.dart' hide Router;
import 'package:zjsb_app/widgets/my_app_bar.dart';
import 'package:zjsb_app/widgets/state_layout.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: '页面不存在',
      ),
      body: StateLayout(
        type: StateType.network,
//        hintText: '页面不存在',
      ),
    );
  }
}
