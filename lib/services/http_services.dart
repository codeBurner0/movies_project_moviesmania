//@dart=2.9
// ignore_for_file: non_constant_identifier_names
//Packages
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

//Model
import '../model/app_config.dart';

class HTTPService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  String _base_url = '';
  String _api_key = '';

  HTTPService() {
    AppConfig _config = getIt.get<AppConfig>();
    _base_url = _config.BASE_API_URL;
    _api_key = _config.API_KEY;
  }

  Future<Object> get(String _path, {Map<String, dynamic> query}) async {
    try {
      String _url = '$_base_url$_path';
      Map<String, dynamic> _query = {
        'api_key': _api_key,
        'language': 'en-US',
      };
      return await dio.get(_url, queryParameters: _query);
    }
    on DioError catch (e) {
      print('Unable to get data.');
      print('DioError:$e');
      return DioError;
    }
  }
}