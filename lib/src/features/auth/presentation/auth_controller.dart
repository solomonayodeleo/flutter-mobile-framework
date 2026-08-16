import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mobile_framework/src/core/di/service_locator.dart';
import 'package:flutter_mobile_framework/src/features/auth/data/auth_repository.dart';

final authControllerProvider =
    NotifierProvider<AuthController, AuthState>(AuthController.new);

class AuthState {
  const AuthState({
    this.isLoading = false,
    this.userName,
    this.errorMessage,
  });

  final bool isLoading;
  final String? userName;
  final String? errorMessage;

  AuthState copyWith({
    bool? isLoading,
    String? userName,
    String? errorMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      userName: userName ?? this.userName,
      errorMessage: errorMessage,
    );
  }
}

class AuthController extends Notifier<AuthState> {
  late final AuthRepository _repository;

  @override
  AuthState build() {
    _repository = getIt<AuthRepository>();
    return const AuthState();
  }

  Future<void> signIn() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final userName = await _repository.signIn();
      state = state.copyWith(isLoading: false, userName: userName);
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Sign in failed. Please try again.',
      );
    }
  }
}

