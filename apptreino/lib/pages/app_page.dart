import 'package:apptreino/pages/pomodoro.dart';
import 'package:apptreino/store/pomodoro.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Pomodoro(),
      ),
    );
  }
}

// final store = ContadorStore();

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey.shade900,
//         title: Text('Minha Lista de Afazeres'),
//         titleTextStyle: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//           fontSize: 20,
//         ),
//         actions: <Widget>[
//           DropdownButtonHideUnderline(
//             child: DropdownButton(
//               icon: Icon(
//                 Icons.more_vert,
//                 color: Theme.of(context).primaryIconTheme.color,
//               ),
//               items: [
//                 DropdownMenuItem(
//                   value: 'logout',
//                   child: Container(
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.exit_to_app,
//                           color: Colors.grey.shade900,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text('Sair'),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//               onChanged: (value) {
//                 if (value == 'logout') {
//                   AuthService().logout();
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'You have pushed the button this many times:',
//               ),
//               Observer(
//                 builder: (_) => Text(
//                   '${store.contador}',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: store.incrementar,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
