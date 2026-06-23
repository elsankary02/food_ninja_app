import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/constant/app_strings.dart';
import '../../provider.dart';

abstract class RegisterNewUserState {}

class RegisterNewUserInitial extends RegisterNewUserState {}

class RegisterNewUserLoading extends RegisterNewUserState {}

class RegisterNewUserFailure extends RegisterNewUserState {
  final String errMessage;

  RegisterNewUserFailure({required this.errMessage});
}

class RegisterNewUserSuccess extends RegisterNewUserState {}

class RegisterNewUserNotifier
    extends AutoDisposeNotifier<RegisterNewUserState> {
  @override
  RegisterNewUserState build() {
    return RegisterNewUserInitial();
  }

  Future<void> registerNewUser({
    required String authMethod,
    String? email,
    String? phone,
    String? phonePrefix,
    String? prefix,
  }) async {
    final provider = ref.read(regRegisterNewUserServiceProvider);
    state = RegisterNewUserLoading();
    try {
      await provider.registerNewUserService(
        authMethod: authMethod,
        email: email,
        phone: phone,
        phonePrefix: phonePrefix,
        prefix: prefix,
      );
      state = RegisterNewUserSuccess();
    } on Exception catch (e) {
      if (e is DioException) {
        final data = e.response!.data;
        state = RegisterNewUserFailure(errMessage: data[kMessage]);
        return;
      }
      state = RegisterNewUserFailure(errMessage: e.toString());
    }
  }
}

final registerNewUserProvider =
    NotifierProvider.autoDispose<RegisterNewUserNotifier, RegisterNewUserState>(
      RegisterNewUserNotifier.new,
    );
