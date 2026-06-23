import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/constant/app_strings.dart';
import '../../../models/auth/get/get_user_model.dart';
import '../../provider.dart';

abstract class GetUserState {}

class GetUserInitial extends GetUserState {}

class GetUserLoading extends GetUserState {}

class GetUserFailure extends GetUserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}

class GetUserSuccess extends GetUserState {
  final GetUserModel userModel;

  GetUserSuccess({required this.userModel});
}

class GetUserNotifier extends Notifier<GetUserState> {
  GetUserModel? _userModel;
  GetUserModel? get userModel => _userModel;

  @override
  GetUserState build() {
    return GetUserInitial();
  }

  void updateUser(GetUserModel getUserModel) {
    _userModel = getUserModel;
  }

  Future<void> getUser() async {
    final provider = ref.read(getUserServiceProvider);
    state = GetUserLoading();
    try {
      final getUser = await provider.getUser();
      _userModel = getUser;
      state = GetUserSuccess(userModel: getUser);
    } on Exception catch (e) {
      if (e is DioException) {
        final data = e.response!.data;
        state = GetUserFailure(errMessage: data[kMessage]);
        return;
      }
      state = GetUserFailure(errMessage: e.toString());
    }
  }
}

final getUserProvider = NotifierProvider<GetUserNotifier, GetUserState>(
  GetUserNotifier.new,
);
