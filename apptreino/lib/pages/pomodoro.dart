import 'package:apptreino/components/cronometro.dart';
import 'package:apptreino/components/entrada_tempo.dart';
import 'package:apptreino/store/pomodoro.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Cronometro(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Observer(
            builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EntradaTempo(
                  valor: store.tempoTrabalho,
                  titulo: 'Trabalho',
                  inc: store.iniciado && store.estaTrabalhando()
                      ? null
                      : store.incrementarTempoTrabalho,
                  dec: store.iniciado && store.estaTrabalhando()
                      ? null
                      : store.decrementarTempoTrabalho,
                ),
                EntradaTempo(
                  valor: store.tempoDescanso,
                  titulo: 'Descanso',
                  inc: store.iniciado && store.estaDescansando()
                      ? null
                      : store.incrementarTempoDescanso,
                  dec: store.iniciado && store.estaDescansando()
                      ? null
                      : store.decrementarTempoDescanso,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
