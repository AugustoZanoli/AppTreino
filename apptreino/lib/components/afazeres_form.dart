import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AfazeresForm extends StatefulWidget {
  final void Function(String, String, DateTime) onSubmit;

  AfazeresForm({required this.onSubmit});

  @override
  State<AfazeresForm> createState() => _AfazeresFormState();
}

class _AfazeresFormState extends State<AfazeresForm> {
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final category = _categoryController.text;

    if (title.isEmpty || category.isEmpty || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, category, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2027),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: _categoryController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Categoria',
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Nenhuma data selecionada!!'
                          : 'Data selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.grey.shade900, // Use red color
                    ),
                    onPressed: _showDatePicker,
                    child: Text(
                      'Selecionar data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: Text('Novo afazer'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey
                        .shade900, // Use red color for the button background
                    onPrimary: Colors.white, // Use white color for the text
                  ),
                  onPressed: _submitForm,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
