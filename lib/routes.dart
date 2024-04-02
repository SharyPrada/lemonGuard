class ApiUserService {
  static const String apiBaseUrl = 'http://127.0.0.1:8000/api/';

  static const String apiLoginUrl = '${apiBaseUrl}users/login/';
  static const String apiRegisterUrl = '${apiBaseUrl}users/signup/';
  static const String apiGetUserUrl = '${apiBaseUrl}users/me/';
}
class ApiCropService {
  static const String apiBaseUrl = 'http://127.0.0.1:8000/api/';

  static const String getDataCropIndexUrl = '${apiBaseUrl}crops/index/';
  static const String apiRegisterUrl = '${apiBaseUrl}crops/edit/';
  static const String apiGetUserUrl = '${apiBaseUrl}crops/create/';
}
