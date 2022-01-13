import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fsmusic_flutter/pages/basic/base_event.dart';
import 'package:fsmusic_flutter/pages/basic/base_state.dart';
import 'package:fsmusic_flutter/repository/api/base/base_resp_model.dart';
import 'package:fsmusic_flutter/repository/api/http.dart';
import 'package:fsmusic_flutter/utils/fsm_log.dart';

abstract class BaseService<E extends BaseEvent, S extends BaseState> extends Bloc<E, S> {
  static const sTag = "BaseService";
  BaseService(S initialState) : super(initialState);

  void when<EI extends E>(EventHandler<EI, S> handler, {EventTransformer<EI>? transformer}) //
      =>
      on<EI>(handler, transformer: transformer);

  //

  Future<T?> request<T>(FRequest<T> request, {String? okMsg}) async {
    try {
      FResponse<T> resp = await request.exec();
      FLog.d(sTag, "resp = $resp");
      if (resp.data is ApiRespModel) {
        var d = (resp.data as ApiRespModel);
        if (d.code != 0) {
          var msg = d.errorMsg ?? "请求失败";
          toast(msg);
          return null;
        }
        toast(okMsg);
      }
      return resp.data;
    } catch (e, s) {
      Fluttertoast.showToast(msg: "请求失败");
      FLog.d(sTag, "request", e, s);
    }
    return null;
  }

  void toast(String? msg) {
    if (msg != null) Fluttertoast.showToast(msg: msg);
  }
}

class DefaultService extends BaseService<DefaultEvent, DefaultState> {
  DefaultService({DefaultState initialState = const DefaultState()}) : super(initialState);
}
