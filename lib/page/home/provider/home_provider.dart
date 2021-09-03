import 'package:flutter/material.dart' hide Router;
import 'package:zjsb_app/page/home/models/test_entity.dart';

class HomeProvider extends ChangeNotifier {
  TestEntity _entity;
  TestEntity get entity => _entity;

  void setData(TestEntity entity) {
    _entity = entity;
    notifyListeners();
  }
}
