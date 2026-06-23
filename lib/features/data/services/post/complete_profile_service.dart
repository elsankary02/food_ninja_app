import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/utils/constant/app_strings.dart';
import '../../models/auth/get/get_user_model.dart';

class CompleteProfileService {
  final Dio dio;

  CompleteProfileService({required this.dio});

  Future<GetUserModel> completeProfile({
    required String name,
    required String username,
    String? email,
    File? file,
  }) async {
    final response = await dio.post(
      kCompleteProfile,
      data: FormData.fromMap({
        'name': name,
        'username': username,
        if (file != null) 'avatar': await MultipartFile.fromFile(file.path),
        if (email != null) 'email': email,
      }),
    );
    final data = response.data["user"] as Map<String, dynamic>;
    return GetUserModel.fromJson(data);
  }
}
