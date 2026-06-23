import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/env.dart';
import '../../../core/utils/constant/app_strings.dart';
import '../services/delete/delete_account_service.dart';
import '../services/get/get_user_service.dart';
import '../services/post/complete_profile_service.dart';
import '../services/post/logout_service.dart';
import '../services/post/register_new_user_service.dart';
import '../services/post/resend_otp_service.dart';
import '../services/post/verify_otp_service.dart';

final prefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});
final dioProvider = Provider.autoDispose<Dio>((ref) {
  final prefs = ref.read(prefsProvider);
  final token = prefs.getString(kToken);
  log("Token : $token");
  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        if (token != null) "Authorization": "Bearer $token",
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );
});

final regRegisterNewUserServiceProvider = Provider<RegisterNewUserService>((
  ref,
) {
  return RegisterNewUserService(dio: ref.read(dioProvider));
});
final verifyOtpServiceProvider = Provider<VerifyOtpService>((ref) {
  return VerifyOtpService(dio: ref.read(dioProvider));
});
final resendOtpServiceProvider = Provider<ResendOtpService>((ref) {
  return ResendOtpService(dio: ref.read(dioProvider));
});
final completeProfileServiceProvider = Provider<CompleteProfileService>((ref) {
  return CompleteProfileService(dio: ref.read(dioProvider));
});
final getUserServiceProvider = Provider<GetUserService>((ref) {
  return GetUserService(dio: ref.read(dioProvider));
});
final deleteAccountServiceProvider = Provider<DeleteAccountService>((ref) {
  return DeleteAccountService(dio: ref.read(dioProvider));
});
final logOutServiceProvider = Provider<LogOutService>((ref) {
  return LogOutService(dio: ref.read(dioProvider));
});
