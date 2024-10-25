import 'package:dio/dio.dart';

import '../../constants.dart';
import '../model/character.dart';

class CharcacterService
{
  late Dio dio ;
  CharcacterService()
  {
    BaseOptions baseOptions = BaseOptions
      (
      baseUrl: kBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getCharacters() async {
    try {
      Response response = await dio.get('character');
      return response.data['results'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}