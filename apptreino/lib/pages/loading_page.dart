import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Carregando...',
            style: TextStyle(color: Colors.white),
          )
        ]),
      ),
    );
  }
}
