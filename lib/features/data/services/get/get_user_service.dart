import 'package:dio/dio.dart';

import '../../../../core/utils/constant/app_strings.dart';
import '../../models/auth/get/get_user_model.dart';

class GetUserService {
  final Dio dio;

  GetUserService({required this.dio});

  Future<GetUserModel> getUser() async {
    final response = await dio.get(kGetUser);

    final data = response.data as Map<String, dynamic>;

    return GetUserModel.fromJson(data);
  }
}
