import 'package:zjsb_app/generated/json/base/json_convert_content.dart';

class LoginEntity with JsonConvert<LoginEntity> {
	String bindId;
	String bindName;
	String projectId;
	String projectName;
	String token;
}
