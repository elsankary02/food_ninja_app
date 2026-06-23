import 'package:dio/dio.dart';

import '../../../../core/utils/constant/app_strings.dart';

class LogOutService {
  final Dio dio;

  LogOutService({required this.dio});

  Future<void> logOut() async {
    await dio.post(kLogout);
  }
}
