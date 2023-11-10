import 'package:apptreino/components/auth_form.dart';
import 'package:apptreino/core/models/auth_form_data.dart';
import 'package:apptreino/core/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      if (!mounted) return;
      setState(() => _isLoading = true);
      if (formData.isLogin) {
        //Login
        await AuthService().login(
          formData.email,
          formData.password,
        );
      } else {
        //signup
        await AuthService().signup(
          formData.name,
          formData.email,
          formData.password,
          formData.image,
        );
      }
    } catch (error) {
      //tratar erro
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.purple.shade900,
              Colors.purple.shade700,
              Colors.purple.shade400,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Container(
            //     height: 500,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage(
            //             'assets/images/undraw_moonlight_5ksn (1).png'),
            //       ),
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/fundo 2 (1).png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: AuthForm(
                  onSubmit: _handleSubmit,
                ),
              ),
            ),
            if (_isLoading)
              Container(
                decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
