class HttpApi {
  ///登录URL
  static const String URL_LOGIN = "/login";

  //首页
  static const String productList = "/product/list";

  ///修改密码
  static const String URL_CHANGE_PASSWORD = "/api/app/user/pwd";

  ///用户信息
  static const String URL_SCAN_FACE = "/api/app/business/face/scan";
  static const String URL_USER_INFO = "/api/app/user/info";
  static const String URL_SCAN_card = "/api/app/business/certificate/scan";
  static const String URL_HISTORY = "/api/app/business/record/list";
  static const String URL_HISTORY_DETAIL = "/api/app/business/query/record";
  static const String URL_RECORD_UPLOAD = "/api/app/business/files";
  static const String URL_RECORD_SUBMIT = "/api/app/business/record/scene";
  static const String URL_RECORD_INFO = "/api/app/business/query/scene/record";
  static const String URL_ERROR_TYPE = "/api/app/business/click/jump";
  static const String URL_JAVA_OCR = "/api/app/business/nlp";
  static const String URL_HISTORY_CLEAR = "/api/app/business/clear";
  static const String URL_MAIN_INFO = "/api/app/user/get/accuracy";

  ///基建

  static const String URL_APP_GETPROJECTINFO = "/app/getProjectInfo";
  static const String URL_APP_GETPARTAKEDETSIL = "/app/getPartakeDetail";
  static const String URL_APP_GETQUALNFO = "/app/getQuaInfo";
  static const String URL_APP_GETACTIONINFO = "/app/getActionInfo";

  static const String URL_BASIC_INFO = "/app/getStaffInfo";
  static const String URL_EMPLOYMENT_INFO = "/app/getWorkInfo";

  // // 查询列表
  // static const String URL_RECORD_LIST = "/api/app/business/record/list";

  ///后台固定的app更新地址
  static const String APP_UPDATE_URL =
      "http://upgrade.cqlanhui.com/api/system/updates/";
}
