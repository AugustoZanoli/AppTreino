import 'package:apptreino/core/services/auth_service.dart';
import 'package:apptreino/pages/auth_page.dart';
import 'package:apptreino/pages/app_page.dart';
import 'package:apptreino/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:apptreino/core/models/app_user.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(context),
      builder: (cdx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        } else {
          return StreamBuilder<AppUser?>(
              stream: AuthService().userChanges,
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingPage();
                } else {
                  return snapshot.hasData ? HomePage() : AuthPage();
                }
              }));
        }
      },
    );
  }
}
