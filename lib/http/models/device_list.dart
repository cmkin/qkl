import 'package:json_annotation/json_annotation.dart';

part 'device_list.g.dart';

@JsonSerializable()
class DeviceList extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'msg')
  String msg;

  DeviceList(
    this.code,
    this.data,
    this.msg,
  );

  factory DeviceList.fromJson(Map<String, dynamic> srcJson) =>
      _$DeviceListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DeviceListToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'deviceId')
  int deviceId;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'expireTime')
  int expireTime;

  @JsonKey(name: 'orderId')
  int orderId;

  @JsonKey(name: 'createTime')
  int createTime;

  @JsonKey(name: 'deviceType')
  DeviceType deviceType;

  Data(
    this.deviceId,
    this.userId,
    this.type,
    this.expireTime,
    this.orderId,
    this.createTime,
    this.deviceType,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class DeviceType extends Object {
  @JsonKey(name: 'deviceId')
  int deviceId;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'deviceName')
  String deviceName;

  @JsonKey(name: 'time')
  int time;

  @JsonKey(name: 'deviceSort')
  int deviceSort;

  DeviceType(
    this.deviceId,
    this.type,
    this.deviceName,
    this.time,
    this.deviceSort,
  );

  factory DeviceType.fromJson(Map<String, dynamic> srcJson) =>
      _$DeviceTypeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DeviceTypeToJson(this);
}
