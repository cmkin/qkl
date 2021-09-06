import 'package:json_annotation/json_annotation.dart';

part 'home_new.g.dart';

@JsonSerializable()
class HomeNew extends Object {
  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  Data data;

  HomeNew(
    this.msg,
    this.code,
    this.data,
  );

  factory HomeNew.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeNewFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeNewToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'noticeId')
  int noticeId;

  @JsonKey(name: 'noticeTitle')
  String noticeTitle;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'start')
  int start;

  @JsonKey(name: 'end')
  int end;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'time')
  int time;

  @JsonKey(name: 'creatTime')
  String creatTime;

  Data(
    this.noticeId,
    this.noticeTitle,
    this.content,
    this.start,
    this.end,
    this.status,
    this.time,
    String json,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
