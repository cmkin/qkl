import 'package:json_annotation/json_annotation.dart';

part 'shop_detail.g.dart';

@JsonSerializable()
class ShopDetail extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'msg')
  String msg;

  ShopDetail(
    this.code,
    this.data,
    this.msg,
  );

  factory ShopDetail.fromJson(Map<String, dynamic> srcJson) =>
      _$ShopDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ShopDetailToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'infoId')
  int infoId;

  @JsonKey(name: 'productId')
  int productId;

  @JsonKey(name: 'langId')
  int langId;

  @JsonKey(name: 'infoTitle')
  String infoTitle;

  @JsonKey(name: 'infoData')
  String infoData;

  @JsonKey(name: 'product')
  Product product;

  Data(
    this.infoId,
    this.productId,
    this.langId,
    this.infoTitle,
    this.infoData,
    this.product,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Product extends Object {
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

  Product(
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

  factory Product.fromJson(Map<String, dynamic> srcJson) =>
      _$ProductFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
