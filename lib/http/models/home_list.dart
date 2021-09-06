import 'package:json_annotation/json_annotation.dart';

part 'home_list.g.dart';

@JsonSerializable()
class homeList extends Object {
  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  List<Data> data;

  homeList(
    this.msg,
    this.code,
    this.data,
  );

  factory homeList.fromJson(Map<String, dynamic> srcJson) =>
      _$homeListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$homeListToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'prId')
  int prId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'typeId')
  int typeId;

  @JsonKey(name: 'groupId')
  int groupId;

  @JsonKey(name: 'price')
  int price;

  @JsonKey(name: 'amount')
  int amount;

  @JsonKey(name: 'period')
  int period;

  @JsonKey(name: 'periodExtra')
  int periodExtra;

  @JsonKey(name: 'periodType')
  int periodType;

  @JsonKey(name: 'delivery')
  int delivery;

  Data(
    this.prId,
    this.title,
    this.typeId,
    this.groupId,
    this.price,
    this.amount,
    this.period,
    this.periodExtra,
    this.periodType,
    this.delivery,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
