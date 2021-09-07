// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_newest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllNewest _$AllNewestFromJson(Map<String, dynamic> json) {
  return AllNewest(
    json['msg'] as String,
    json['code'] as int,
    (json['data'] as List<dynamic>)
        .map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AllNewestToJson(AllNewest instance) => <String, dynamic>{
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
    json['creatTime'] as String,
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
      'creatTime': instance.creatTime,
    };
