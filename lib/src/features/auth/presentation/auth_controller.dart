import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mobile_framework/src/core/di/service_locator.dart';
import 'package:flutter_mobile_framework/src/features/auth/data/auth_repository.dart';

final authControllerProvider =
    NotifierProvider<AuthController, AuthState>(AuthController.new);

enum AuthStatus {
  signedOut,
  signingIn,
  signedIn,
}

class AuthState {
  const AuthState({
    this.status = AuthStatus.signedOut,
    this.userName,
    this.errorMessage,
  });

  final AuthStatus status;
  final String? userName;
  final String? errorMessage;

  bool get isLoading => status == AuthStatus.signingIn;
  bool get isAuthenticated => status == AuthStatus.signedIn;

  AuthState copyWith({
    AuthStatus? status,
    String? userName,
    String? errorMessage,
    bool clearError = false,
  }) {
    return AuthState(
      status: status ?? this.status,
      userName: userName ?? this.userName,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
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
    state = state.copyWith(
      status: AuthStatus.signingIn,
      clearError: true,
    );
    try {
      final userName = await _repository.signIn();
      state = state.copyWith(
        status: AuthStatus.signedIn,
        userName: userName,
        clearError: true,
      );
    } catch (error) {
      state = state.copyWith(
        status: AuthStatus.signedOut,
        errorMessage: 'Sign in failed. Please try again.',
      );
    }
  }

  void signOut() {
    state = const AuthState();
  }
}
