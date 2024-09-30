import 'package:dio/dio.dart';


class Repo {
  Future<List>getData()async{
    final dio = Dio();
    try{
      String url  = 'http://test.api.boxigo.in/sample-data/';
      var response = await dio.get(url);
      return [
        {
          'status':'success',
          'data':response.data
        }
      ];
    }catch(e){
      return [{"msg":'Login Failed'}];
    }
  }
}