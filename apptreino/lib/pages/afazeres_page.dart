import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../components/afazeres_form.dart';
import '../components/afazeres_list.dart';
import '../core/models/afazeres.dart';
import 'package:apptreino/core/services/auth_service.dart';

class AfazeresPage extends StatefulWidget {
  @override
  _AfazeresPageState createState() => _AfazeresPageState();
}

class _AfazeresPageState extends State<AfazeresPage> {
  List<Afazeres> _Afazeress = [];
  List<Afazeres> _allAfazeress = [];

  List<Afazeres> get _recentAfazeress {
    return _Afazeress.where((tr) {
      return tr.data.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  List<Afazeres> searchAfazeressByName(List<Afazeres> Afazeress, String query) {
    query = query.toLowerCase();
    return Afazeress.where(
        (Afazeres) => Afazeres.titulo.toLowerCase().contains(query)).toList();
  }

  List<Afazeres> filterAfazeressByCategory(
      List<Afazeres> Afazeress, String category) {
    category = category.toLowerCase();
    return Afazeress.where(
        (Afazeres) => Afazeres.categoria.toLowerCase() == category).toList();
  }

  void updateAfazeress(List<Afazeres> Afazeress) {
    setState(() {
      _Afazeress = Afazeress;
    });
  }

  _addAfazeres(String name, String category, DateTime data) {
    final newAfazeres = Afazeres(
      id: Random().nextDouble().toString(),
      titulo: name,
      data: data,
      categoria: category,
    );

    // Crie uma referência à coleção "tasks" no Firestore
    final tasksCollection = FirebaseFirestore.instance.collection('tasks');

    // Adicione a nova tarefa ao Firestore
    tasksCollection.add({
      'name': newAfazeres.titulo,
      'date': newAfazeres.data,
      'category': newAfazeres.categoria,
    });

    setState(() {
      _Afazeress.add(newAfazeres);
    });

    Navigator.of(context).pop();
  }

  _removeAfazeres(String id) {
    setState(() {
      _Afazeress.removeWhere((tr) {
        return tr.id == id;
      });
    });
  }

  void _openAfazeresFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AfazeresForm(onSubmit: _addAfazeres);
      },
    );
  }

  void _handleSearch(String query) {
    if (query.isNotEmpty) {
      final searchResults = searchAfazeressByName(_allAfazeress, query);
      setState(() {
        _Afazeress = searchResults;
      });
    } else {
      setState(() {
        _Afazeress = _allAfazeress; // Restaure a lista original de tarefas
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _allAfazeress = _Afazeress; // Inicialize _allAfazeress com a lista original
  }

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    final currentUser = authService.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text('Minha Lista de Afazeres'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        actions: <Widget>[
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.grey.shade900,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Sair'),
                      ],
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  AuthService().logout();
                }
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.grey.shade900,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Coloca os elementos no canto direito e esquerdo
                  children: [
                    Row(
                      children: [
                        // Aqui você pode exibir a imagem do usuário (se disponível)
                        if (currentUser != null)
                          CircleAvatar(
                            backgroundImage: NetworkImage(currentUser
                                .imageURL), // Carregue a imagem a partir da URL
                            radius:
                                25, // Ajuste o tamanho do avatar conforme necessário
                          ),

                        // Nome e e-mail do usuário
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Olá, ${currentUser?.name ?? 'Usuário'}!',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'E-mail: ${currentUser?.email ?? ''}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            AfazeresList(_Afazeress, _removeAfazeres),
            // Por exemplo, sua lista de afazeres
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade300,
        child: Icon(Icons.add),
        onPressed: () => _openAfazeresFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
