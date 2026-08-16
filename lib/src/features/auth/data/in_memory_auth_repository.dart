import 'package:flutter_mobile_framework/src/features/auth/data/auth_repository.dart';

class InMemoryAuthRepository implements AuthRepository {
  @override
  Future<String> signIn() async {
    await Future<void>.delayed(const Duration(milliseconds: 700));
    return 'Solomon Ayodele';
  }
}

