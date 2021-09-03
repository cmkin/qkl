import 'package:zjsb_app/page/home/models/app_update_entity.dart';

appUpdateEntityFromJson(AppUpdateEntity data, Map<String, dynamic> json) {
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	if (json['retdata'] != null) {
		data.retdata = AppUpdateRetdata().fromJson(json['retdata']);
	}
	if (json['data'] != null) {
		data.data = AppUpdateData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> appUpdateEntityToJson(AppUpdateEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	data['retdata'] = entity.retdata?.toJson();
	data['data'] = entity.data?.toJson();
	return data;
}

appUpdateRetdataFromJson(AppUpdateRetdata data, Map<String, dynamic> json) {
	if (json['update'] != null) {
		data.update = json['update'];
	}
	if (json['address'] != null) {
		data.address = json['address'].toString();
	}
	if (json['releaseNotes'] != null) {
		data.releaseNotes = json['releaseNotes'].toString();
	}
	if (json['version'] != null) {
		data.version = json['version'].toString();
	}
	if (json['force'] != null) {
		data.force = json['force'] is String
				? int.tryParse(json['force'])
				: json['force'].toInt();
	}
	return data;
}

Map<String, dynamic> appUpdateRetdataToJson(AppUpdateRetdata entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['update'] = entity.update;
	data['address'] = entity.address;
	data['releaseNotes'] = entity.releaseNotes;
	data['version'] = entity.version;
	data['force'] = entity.force;
	return data;
}

appUpdateDataFromJson(AppUpdateData data, Map<String, dynamic> json) {
	if (json['update'] != null) {
		data.update = json['update'];
	}
	if (json['address'] != null) {
		data.address = json['address'].toString();
	}
	if (json['releaseNotes'] != null) {
		data.releaseNotes = json['releaseNotes'].toString();
	}
	if (json['version'] != null) {
		data.version = json['version'].toString();
	}
	if (json['force'] != null) {
		data.force = json['force'] is String
				? int.tryParse(json['force'])
				: json['force'].toInt();
	}
	return data;
}

Map<String, dynamic> appUpdateDataToJson(AppUpdateData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['update'] = entity.update;
	data['address'] = entity.address;
	data['releaseNotes'] = entity.releaseNotes;
	data['version'] = entity.version;
	data['force'] = entity.force;
	return data;
}