import 'package:apptreino/core/services/auth_service.dart';
import 'package:apptreino/pages/afazeres_page.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:apptreino/pages/pomodoro.dart';
import 'package:apptreino/pages/story_page.dart';
import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cuide de você!'),
          backgroundColor: Colors.purple.shade900,
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
            ),
          ],
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/fundoinicio.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              bottom: 600,
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1), // Fundo com opacidade
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Lembre-se: Priorizar a saúde psicológica é essencial para cultivar bem-estar e resiliência, fortalecendo a capacidade de enfrentar desafios e promovendo uma vida equilibrada e plena! Se cuide!',
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
            ),
            Positioned(
              top: 0,
              bottom: 200,
              left: 0,
              right: 0,
              child: Container(
                  child: Icon(
                Icons.warning_amber_rounded,
                color: Colors.white,
                size: 125,
              )),
            ),
            Positioned(
              child: HealthTipsPage(),
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple.shade900.withOpacity(0.8),
              image: DecorationImage(
                image: AssetImage('assets/images/fundolateral.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.blue.withOpacity(0.4),
              child: ListView(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.access_alarm,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Pomodoro',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pomodoro(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.notes,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Afazeres',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AfazeresPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.menu_book_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Leituras',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.water_damage_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Água',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HealthTipsPage extends StatelessWidget {
  final List<String> healthTips = [
    'Amigos são o remédio para vários tipos de problemas!',
    'Beba bastante água durante o dia.',
    'Mantenha uma dieta equilibrada.',
    'Pratique exercícios regularmente.',
    'Durma pelo menos 7-8 horas por noite.',
    'Cultive momentos de alegria para fortalecer a mente.',
    'Aprecie pequenas vitórias diárias para construir confiança.',
    'Sorria, pois a felicidade é contagiosa.',
    'Agradeça pelas coisas positivas em sua vida.',
    'Enfrente desafios com coragem e determinação.',
    'Dedique tempo para cuidar de sua saúde mental.',
    'Aceite as mudanças como oportunidades de crescimento.',
    'Compartilhe amor e gentileza sempre que possível.',
    'Aproveite o poder terapêutico da natureza.',
    'Desconecte-se das telas por algum tempo todos os dias.',
    'Ouça música para relaxar e elevar o espírito.',
    'Cultive hobbies que tragam alegria e realização.',
    'Expresse gratidão por seus relacionamentos.',
    'Aprenda algo novo regularmente para estimular a mente.',
    'Reserve momentos para a meditação e reflexão.',
    'Construa uma rede de apoio emocional sólida.',
    'Esteja presente e valorize cada momento da vida.',
    'Evite o estresse desnecessário, focando no que você pode controlar.',
    'Estimule seu senso de humor, rindo das adversidades.',
    'Defina metas realistas e celebre os progressos alcançados.',
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: healthTips.length,
      itemBuilder: (context, index) {
        return HealthTipCard(healthTips[index]);
      },
    );
  }
}

class HealthTipCard extends StatelessWidget {
  final String tip;

  HealthTipCard(this.tip);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        color: Colors.transparent, // Define a cor do fundo como transparente
        elevation: 0, // Remove a sombra do card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Define a borda branca
          side: BorderSide(
              color: Colors.white, width: 1), // Define a borda branca
        ),
        child: Container(
          width: 300.0,
          padding: EdgeInsets.all(16.0),
          child: Text(
            tip,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white, // Define a cor do texto como branca
            ),
          ),
        ),
      ),
    );
  }
}
