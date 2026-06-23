import 'package:dio/dio.dart';

import '../../../../core/utils/constant/app_strings.dart';

class RegisterNewUserService {
  final Dio dio;

  RegisterNewUserService({required this.dio});
  Future<void> registerNewUserService({
    required String authMethod,
    String? email,
    String? phone,
    String? phonePrefix,
    String? prefix,
  }) async {
    await dio.post(
      kRegisterNewUser,
      data: {
        "auth_method": authMethod,
        if (phonePrefix != null) "phone_prefix": phonePrefix,
        if (email != null) "email": email,
        if (phone != null) "phone": phone,
        if (prefix != null) "prefix": prefix,
      },
    );
  }
}
