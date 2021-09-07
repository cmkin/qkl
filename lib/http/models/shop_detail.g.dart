// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopDetail _$ShopDetailFromJson(Map<String, dynamic> json) {
  return ShopDetail(
    json['code'] as int,
    Data.fromJson(json['data'] as Map<String, dynamic>),
    json['msg'] as String,
  );
}

Map<String, dynamic> _$ShopDetailToJson(ShopDetail instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['infoId'] as int,
    json['productId'] as int,
    json['langId'] as int,
    json['infoTitle'] as String,
    json['infoData'] as String,
    Product.fromJson(json['product'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'infoId': instance.infoId,
      'productId': instance.productId,
      'langId': instance.langId,
      'infoTitle': instance.infoTitle,
      'infoData': instance.infoData,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
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

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
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
