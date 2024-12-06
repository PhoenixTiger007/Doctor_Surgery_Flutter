import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String? errorMessage;

  AuthState({
    this.isAuthenticated = true, // Changed default to true to bypass login
    this.isLoading = false,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Mock credentials
    if (email == 'test@example.com' && password == 'password') {
      state = state.copyWith(isAuthenticated: true, isLoading: false);
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Invalid email or password',
      );
    }
  }

  void logout() {
    state = AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
