// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceList _$DeviceListFromJson(Map<String, dynamic> json) {
  return DeviceList(
    json['code'] as int,
    (json['data'] as List<dynamic>)
        .map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['msg'] as String,
  );
}

Map<String, dynamic> _$DeviceListToJson(DeviceList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['deviceId'] as int,
    json['userId'] as int,
    json['type'] as int,
    json['expireTime'] as int,
    json['orderId'] as int,
    json['createTime'] as int,
    DeviceType.fromJson(json['deviceType'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'deviceId': instance.deviceId,
      'userId': instance.userId,
      'type': instance.type,
      'expireTime': instance.expireTime,
      'orderId': instance.orderId,
      'createTime': instance.createTime,
      'deviceType': instance.deviceType,
    };

DeviceType _$DeviceTypeFromJson(Map<String, dynamic> json) {
  return DeviceType(
    json['deviceId'] as int,
    json['type'] as int,
    json['deviceName'] as String,
    json['time'] as int,
    json['deviceSort'] as int,
  );
}

Map<String, dynamic> _$DeviceTypeToJson(DeviceType instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'type': instance.type,
      'deviceName': instance.deviceName,
      'time': instance.time,
      'deviceSort': instance.deviceSort,
    };
