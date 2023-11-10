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
      _allAfazeress = List.from(_Afazeress);
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
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Aqui você pode buscar os dados novamente sempre que a dependência (os dados) mudar
    fetchData();
  }

  void fetchData() async {
    // Adapte este código conforme necessário para buscar os dados do Firestore
    final tasksCollection = FirebaseFirestore.instance.collection('tasks');
    final data = await tasksCollection.get();

    setState(() {
      _Afazeress = data.docs
          .map((doc) => Afazeres(
                id: doc.id,
                titulo: doc['name'],
                data: (doc['date'] as Timestamp).toDate(),
                categoria: doc['category'],
              ))
          .toList();

      _allAfazeress = List.from(_Afazeress);
    });
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
        backgroundColor: Colors.purple.shade900,
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
                color: Colors.white,
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
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fundoafazeres.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  color: Colors.grey.shade900.withOpacity(0.1),
                  child: Text(
                    'Adicione seus afazeres! Lembre-se, uma rotina sáudavel representa uma vida sáudavel!',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Nunito', // Exemplo de uma fonte diferente
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                AfazeresList(_Afazeress, _removeAfazeres),
                // Por exemplo, sua lista de afazeres
              ],
            ),
          ),
        ],
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
