import 'dart:convert' as convert;

import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';

///加解密工具类
class Encrypttils {
  // base64 加密
  static String base64Encode(String data) {
    var content = convert.utf8.encode(data);
    return convert.base64Encode(content);
  }

  // base64 解密
  static String base64Decode(String data) {
    List<int> bytes = convert.base64Decode(data);
    String result = convert.utf8.decode(bytes);
    return result;
  }

  // 路由传值加密   不能传中文
  static String routersEncode(Object data) {
    String json = jsonEncode(data);
    String jsonStr = jsonEncode(Utf8Encoder().convert(json));
    return jsonStr;
  }

  // 路由传值解密   不能传中文
  static String routersDencode(Object data) {
    var list = List<int>();
    for (var data in jsonDecode(data)) {
      list.add(data);
    }
    String json = Utf8Decoder().convert(list);
    return json;
  }

  ///RSA 加密
  static Future<String> rsaEncode(String content) async {
    var publicKeyStr =
        await rootBundle.loadString('assets/data/socket_key.pem');
    var publicKey = RSAKeyParser().parse(publicKeyStr);
    final encrypter = Encrypter(RSA(publicKey: publicKey));
    return encrypter.encrypt(content).base64;
  }
}
