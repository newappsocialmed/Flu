import 'package:dio/dio.dart';

class Repo{

  Future<List>getdata()async{
    final dio = Dio();
    try{
      String url  = 'http://test.api.boxigo.in/sample-data/';
      var response = await dio.get(url);
      return [
        {
          "data":response
        }
      ];
    }catch(e){
      return [{"msg":'Signin Failed'}];
    }
  }
}