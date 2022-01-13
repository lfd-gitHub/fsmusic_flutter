import 'package:fsmusic_flutter/repository/api/api.dart';
import 'package:fsmusic_flutter/repository/api/base/base_resp_model.dart';
import 'package:fsmusic_flutter/repository/api/http.dart';
import 'package:fsmusic_flutter/repository/api/user/model/login.dart';

class UserApi {
  static FRequest<ApiRespModel<Login>> loginByPwd(String username, String pwd) {
    return Api.newRequest(Api.login, params: {"username": username, "password": pwd}, dataConvert: (data) => Login.fromJson(data)).withMethod(Method.post);
  }
}
