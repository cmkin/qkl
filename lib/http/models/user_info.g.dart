// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$userInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
    json['code'] as int,
    Data.fromJson(json['data'] as Map<String, dynamic>),
    json['msg'] as String,
  );
}

Map<String, dynamic> _$userInfoToJson(UserInfo instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['userId'] as int,
    json['nick'] as String,
    json['sex'] as int,
    json['type'] as int,
    json['headId'] as int,
    json['headUrl'] as String,
    json['fromId'] as int,
    json['code'] as int,
    json['updateTime'] as int,
    json['createTime'] as int,
    json['money'] as int,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'userId': instance.userId,
      'nick': instance.nick,
      'sex': instance.sex,
      'type': instance.type,
      'headId': instance.headId,
      'headUrl': instance.headUrl,
      'fromId': instance.fromId,
      'code': instance.code,
      'updateTime': instance.updateTime,
      'createTime': instance.createTime,
      'money': instance.money,
    };
