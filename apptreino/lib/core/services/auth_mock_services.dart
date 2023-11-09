import 'dart:io';
import 'dart:async';
import 'dart:math';

import 'package:apptreino/core/models/app_user.dart';
import 'package:apptreino/core/services/auth_service.dart';

class AuthMockService implements AuthService {
  static final _defaultUser = AppUser(
    id: '1',
    name: 'Teste',
    email: 'teste@gmail.com',
    imageURL: 'apptreino\assets\images\avatar.png',
  );

  static Map<String, AppUser> _users = {
    _defaultUser.email: _defaultUser,
  };
  static AppUser? _currentUser;
  static MultiStreamController<AppUser?>? _controller;
  static final _userStream = Stream<AppUser?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  AppUser? get currentUser {
    return _currentUser;
  }

  Stream<AppUser?> get userChanges {
    return _userStream;
  }

  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  ) async {
    final newUser = AppUser(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      imageURL: image?.path ?? 'apptreino/assets/images/avatar.png',
    );

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    _updateUser(_users[email]);
  }

  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(AppUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
