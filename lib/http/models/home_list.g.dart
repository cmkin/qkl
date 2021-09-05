// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

homeList _$homeListFromJson(Map<String, dynamic> json) {
  return homeList(
    json['msg'] as String,
    json['code'] as int,
    (json['data'] as List<dynamic>)
        .map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$homeListToJson(homeList instance) => <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['prId'] as int,
    json['title'] as String,
    json['typeId'] as int,
    json['groupId'] as int,
    json['price'] as int,
    json['amount'] as int,
    json['period'] as int,
    json['periodExtra'] as int,
    json['periodType'] as int,
    json['delivery'] as int,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'prId': instance.prId,
      'title': instance.title,
      'typeId': instance.typeId,
      'groupId': instance.groupId,
      'price': instance.price,
      'amount': instance.amount,
      'period': instance.period,
      'periodExtra': instance.periodExtra,
      'periodType': instance.periodType,
      'delivery': instance.delivery,
    };
