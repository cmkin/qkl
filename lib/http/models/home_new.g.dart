// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeNew _$HomeNewFromJson(Map<String, dynamic> json) {
  return HomeNew(
    json['msg'] as String,
    json['code'] as int,
    Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeNewToJson(HomeNew instance) => <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['noticeId'] as int,
    json['noticeTitle'] as String,
    json['content'] as String,
    json['start'] as int,
    json['end'] as int,
    json['status'] as int,
    json['time'] as int,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'noticeId': instance.noticeId,
      'noticeTitle': instance.noticeTitle,
      'content': instance.content,
      'start': instance.start,
      'end': instance.end,
      'status': instance.status,
      'time': instance.time,
    };
