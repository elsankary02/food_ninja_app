import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/constant/app_strings.dart';
import '../../provider.dart';

abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutFailure extends LogoutState {
  final String errMessage;

  LogoutFailure({required this.errMessage});
}

class LogoutSuccess extends LogoutState {}

class LogoutNotifier extends Notifier<LogoutState> {
  @override
  LogoutState build() {
    return LogoutInitial();
  }

  Future<void> logOut() async {
    final provider = ref.read(logOutServiceProvider);
    state = LogoutLoading();
    try {
      await provider.logOut();
      state = LogoutSuccess();
    } on Exception catch (e) {
      if (e is DioException) {
        final data = e.response!.data;
        state = LogoutFailure(errMessage: data[kMessage]);
        return;
      }
      state = LogoutFailure(errMessage: e.toString());
    }
  }
}

final logOutProvider = NotifierProvider<LogoutNotifier, LogoutState>(
  LogoutNotifier.new,
);
