import 'package:apptreino/pages/auth_or_app_page.dart';
import 'package:apptreino/store/pomodoro.store.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
        ),

        // Adicione outros providers, se necessário
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // Altere para a cor desejada
        useMaterial3: true,
      ),
      home: AuthOrAppPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
