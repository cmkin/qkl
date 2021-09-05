// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$loginFromJson(Map<String, dynamic> json) {
  return Login(
    json['code'] as int,
    json['token'] as String,
    json['msg'] as String,
  );
}

Map<String, dynamic> _$loginToJson(Login instance) => <String, dynamic>{
      'code': instance.code,
      'token': instance.token,
      'msg': instance.msg,
    };
