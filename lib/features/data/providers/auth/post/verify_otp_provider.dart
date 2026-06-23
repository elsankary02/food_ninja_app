import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/constant/app_strings.dart';
import '../../provider.dart';

abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpFailure extends VerifyOtpState {
  final String errMessage;

  VerifyOtpFailure({required this.errMessage});
}

class VerifyOtpSuccess extends VerifyOtpState {}

class VerifyOtpNotifier extends AutoDisposeNotifier<VerifyOtpState> {
  @override
  VerifyOtpState build() {
    return VerifyOtpInitial();
  }

  Future<void> verifyOtp({
    required String authMethod,
    String? otp,
    String? phonePrefix,
    String? email,
    String? phone,
  }) async {
    final provider = ref.read(verifyOtpServiceProvider);
    state = VerifyOtpLoading();
    try {
      final auth = await provider.verifyOtp(
        authMethod: authMethod,
        otp: otp,
        phonePrefix: phonePrefix,
        email: email,
        phone: phone,
      );
      ref.read(prefsProvider).setString(kToken, auth.token);
      ref.invalidate(dioProvider);
      state = VerifyOtpSuccess();
    } on Exception catch (e) {
      if (e is DioException) {
        final data = e.response!.data;
        state = VerifyOtpFailure(errMessage: data[kMessage]);
        return;
      }
    }
  }
}

final verifyOtpProvider =
    NotifierProvider.autoDispose<VerifyOtpNotifier, VerifyOtpState>(
      VerifyOtpNotifier.new,
    );
