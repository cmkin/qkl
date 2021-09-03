import 'package:zjsb_app/generated/json/base/json_convert_content.dart';
import 'package:zjsb_app/generated/json/base/json_field.dart';

class MineEntity with JsonConvert<MineEntity> {
  @JSONField(name: "role_name")
  String roleName;
  @JSONField(name: "head_image")
  String headImage;
  @JSONField(name: "user_id")
  String userId;
  @JSONField(name: "user_name")
  String userName;
  @JSONField(name: "company_name")
  String companyName;
  @JSONField(name: "real_name")
  String realName;
  @JSONField(name: "organization_name")
  String organizationName;
}
