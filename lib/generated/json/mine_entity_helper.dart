import 'package:zjsb_app/page/home/models/mine_entity.dart';

mineEntityFromJson(MineEntity data, Map<String, dynamic> json) {
	if (json['role_name'] != null) {
		data.roleName = json['role_name'].toString();
	}
	if (json['head_image'] != null) {
		data.headImage = json['head_image'].toString();
	}
	if (json['user_id'] != null) {
		data.userId = json['user_id'].toString();
	}
	if (json['user_name'] != null) {
		data.userName = json['user_name'].toString();
	}
	if (json['company_name'] != null) {
		data.companyName = json['company_name'].toString();
	}
	if (json['real_name'] != null) {
		data.realName = json['real_name'].toString();
	}
	if (json['organization_name'] != null) {
		data.organizationName = json['organization_name'].toString();
	}
	return data;
}

Map<String, dynamic> mineEntityToJson(MineEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['role_name'] = entity.roleName;
	data['head_image'] = entity.headImage;
	data['user_id'] = entity.userId;
	data['user_name'] = entity.userName;
	data['company_name'] = entity.companyName;
	data['real_name'] = entity.realName;
	data['organization_name'] = entity.organizationName;
	return data;
}