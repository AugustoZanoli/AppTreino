import 'package:flutter/material.dart';
import 'package:apptreino/core/models/afazeres.dart';
import 'package:intl/intl.dart';

class AfazeresList extends StatelessWidget {
  final List<Afazeres> afazeres;
  final void Function(String) onRemove;

  AfazeresList(this.afazeres, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: afazeres.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 0),
                Text(
                  'Nenhum afazer registrado!',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 20),
              ],
            )
          : ListView.builder(
              itemCount: afazeres.length,
              itemBuilder: (ctx, index) {
                final tr = afazeres[index];
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  color: Colors
                      .transparent, // Define a cor do fundo como transparente
                  elevation: 0, // Remove a sombra do card
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Define a borda branca
                    side: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ), // Define a borda branca
                  ),
                  child: ListTile(
                    title: Text(
                      tr.titulo,
                      style: TextStyle(
                        fontSize: 18.0,
                        color:
                            Colors.white, // Define a cor do texto como branca
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.data),
                      style: TextStyle(
                        color:
                            Colors.white, // Define a cor do texto como branca
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => onRemove(tr.id),
                    ),
                  ),
                );
              }),
    );
  }
}
