import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'msg')
  String msg;

  Login(
    this.code,
    this.token,
    this.msg,
  );

  factory Login.fromJson(Map<String, dynamic> srcJson) =>
      _$LoginFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
