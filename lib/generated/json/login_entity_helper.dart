import 'package:zjsb_app/page/login/models/login_entity.dart';

loginEntityFromJson(LoginEntity data, Map<String, dynamic> json) {
	if (json['bindId'] != null) {
		data.bindId = json['bindId'].toString();
	}
	if (json['bindName'] != null) {
		data.bindName = json['bindName'].toString();
	}
	if (json['projectId'] != null) {
		data.projectId = json['projectId'].toString();
	}
	if (json['projectName'] != null) {
		data.projectName = json['projectName'].toString();
	}
	if (json['token'] != null) {
		data.token = json['token'].toString();
	}
	return data;
}

Map<String, dynamic> loginEntityToJson(LoginEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['bindId'] = entity.bindId;
	data['bindName'] = entity.bindName;
	data['projectId'] = entity.projectId;
	data['projectName'] = entity.projectName;
	data['token'] = entity.token;
	return data;
}