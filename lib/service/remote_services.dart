import 'service.dart';
import 'package:dio/dio.dart';


class RemoteServices {

  static Future<Response> getCourse() async {
    return  await Dio().get(Apis.baseUrl + Apis.cores);

  }

}
