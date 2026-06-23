import 'package:dio/dio.dart';

import '../../../../core/utils/constant/app_strings.dart';

class ResendOtpService {
  final Dio dio;

  ResendOtpService({required this.dio});
  Future<void> resendOtp({
    required String authMethod,
    String? phonePrefix,
    String? email,
    String? phone,
  }) async {
    await dio.post(
      kResendOtp,
      data: {
        "auth_method": authMethod,
        if (phonePrefix != null) "phone_prefix": phonePrefix,
        if (email != null) "email": email,
        if (phone != null) "phone": phone,
      },
    );
  }
}
