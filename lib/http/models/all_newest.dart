import 'package:json_annotation/json_annotation.dart';

part 'all_newest.g.dart';

@JsonSerializable()
class AllNewest extends Object {
  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  List<Data> data;

  AllNewest(
    this.msg,
    this.code,
    this.data,
  );

  factory AllNewest.fromJson(Map<String, dynamic> srcJson) =>
      _$AllNewestFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AllNewestToJson(this);
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

  Data(this.noticeId, this.noticeTitle, this.content, this.start, this.end,
      this.status, this.time, this.creatTime);

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
