import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'msg')
  String msg;

  UserInfo(
    this.code,
    this.data,
    this.msg,
  );

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'nick')
  String nick;

  @JsonKey(name: 'sex')
  int sex;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'headId')
  int headId;

  @JsonKey(name: 'headUrl')
  String headUrl;

  @JsonKey(name: 'fromId')
  int fromId;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'updateTime')
  int updateTime;

  @JsonKey(name: 'createTime')
  int createTime;

  @JsonKey(name: 'money')
  int money;

  Data(
    this.userId,
    this.nick,
    this.sex,
    this.type,
    this.headId,
    this.headUrl,
    this.fromId,
    this.code,
    this.updateTime,
    this.createTime,
    this.money,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
