import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/constant/app_strings.dart';
import '../../provider.dart';

abstract class ResendOtpState {}

class ResendOtpInitial extends ResendOtpState {}

class ResendOtpLoading extends ResendOtpState {}

class ResendOtpFailure extends ResendOtpState {
  final String errMessage;

  ResendOtpFailure({required this.errMessage});
}

class ResendOtpSuccess extends ResendOtpState {}

class ResendOtpNotifier extends Notifier<ResendOtpState> {
  @override
  ResendOtpState build() {
    return ResendOtpInitial();
  }

  Future<void> resendOtp({
    required String authMethod,
    String? phonePrefix,
    String? email,
    String? phone,
  }) async {
    final provider = ref.read(resendOtpServiceProvider);
    state = ResendOtpLoading();
    try {
      await provider.resendOtp(
        authMethod: authMethod,
        phonePrefix: phonePrefix,
        email: email,
        phone: phone,
      );
      state = ResendOtpSuccess();
    } on Exception catch (e) {
      if (e is DioException) {
        final data = e.response!.data;
        state = ResendOtpFailure(errMessage: data[kMessage]);
        return;
      }
      state = ResendOtpFailure(errMessage: e.toString());
    }
  }
}

final resendOtpProvider = NotifierProvider<ResendOtpNotifier, ResendOtpState>(
  ResendOtpNotifier.new,
);
