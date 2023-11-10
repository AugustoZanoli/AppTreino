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
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    title: Text(
                      tr.titulo,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.data),
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
