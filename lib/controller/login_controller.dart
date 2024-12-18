
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../base/constants.dart';

class LoginController  extends GetxController{

  final dio = Dio();

  getLoginApi() async {
    final response = await dio.get("${Constants.BASEURL}/users");
    print(response);
  }
}