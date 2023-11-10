import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  // Simulando uma lista de parágrafos de uma história
  final List<String> paragraphs = [
    ' "A Canção da Coragem" ',
    'Havia uma terra distante onde as emoções eram personificadas como criaturas mágicas. Uma jovem chamada Lídia vivia em um reino repleto de sombras, pois sua mente estava assombrada por uma criatura sombria chamada Desespero. Desespero sussurrava palavras de desânimo e tristeza constantemente, mergulhando Lídia em uma névoa de melancolia.',
    'Um dia, Lídia ouviu falar de uma lendária harpa mágica que podia criar uma melodia capaz de dissipar as sombras da mente. Determinada a encontrar essa harpa, ela embarcou em uma jornada perigosa através de florestas encantadas e montanhas traiçoeiras. Enfrentando desafios emocionais, como a Floresta da Dúvida e a Montanha da Angústia, Lídia persistiu, inspirando-se na esperança de um novo amanhecer.',
    'Finalmente, ela chegou ao Vale da Serenidade, onde a harpa lendária repousava. Ao tocar suas cordas, uma bela melodia ressoou, dissipando as sombras de Desespero e enchendo a mente de Lídia com uma luz radiante. Sua jornada não apenas curou sua própria mente, mas também trouxe esperança para outros que enfrentavam desafios semelhantes.',
    ' "As Asas Renascidas" ',
    'Em um reino onde a magia fluía através das veias das criaturas aladas, havia um jovem chamado Aric. Desde a infância, Aric sonhava em voar pelos céus, mas um acidente trágico havia deixado suas asas quebradas. Ele se viu confinado a uma vida no chão, incapaz de realizar seu sonho.',
    'Determinado a superar sua limitação física, Aric embarcou em uma busca por uma antiga fada curandeira conhecida como Lysandra, que era famosa por restaurar a saúde das criaturas aladas. Sua jornada o levou através de planícies vastas e montanhas escarpadas, enfrentando criaturas mágicas que desafiavam sua força e coragem.',
    'Ao encontrar Lysandra, ela realizou um ritual poderoso, invocando a essência mágica dos céus para renovar as asas de Aric. Com um brilho resplandecente, suas asas renasceram, e Aric experimentou a alegria de voar pela primeira vez. Sua determinação e coragem não apenas restauraram sua saúde física, mas também inspiraram outros a superar suas próprias adversidades.',
    ' "A Fonte da Vitalidade" ',
    'Em um reino onde a vitalidade de todas as criaturas era mantida por uma fonte mágica, um grupo de habitantes estava enfraquecido pela contaminação da fonte. Entre eles estava uma curandeira chamada Elara, que, apesar de seus esforços, estava perdendo a esperança de encontrar uma solução.',
    'Determinada a salvar seu povo, Elara partiu em uma jornada em busca da lendária Fonte da Vitalidade, um manancial mágico que supostamente poderia purificar e fortalecer a saúde de todos. Sua jornada a levou por terras desconhecidas e perigosas, onde ela enfrentou criaturas místicas e superou obstáculos desafiadores.',
    'Ao encontrar a Fonte da Vitalidade, Elara descobriu que sua magia era alimentada pelo amor e união. Ao reunir seu povo e fortalecer os laços entre eles, a fonte resplandeceu com uma luz intensa, purificando a contaminação e devolvendo a vitalidade a todos. A história de Elara se tornou uma lenda, lembrando a todos da importância da solidariedade e do amor na manutenção da saúde em geral.',
    ' "O Refúgio dos Sonhos" ',
    'Em um mundo onde os sonhos eram portas para outras dimensões, vivia uma jovem chamada Luna, cuja mente estava aprisionada em um labirinto de pesadelos. Cada noite, ela era atormentada por monstros sombrios que representavam seus medos mais profundos. Determinada a escapar desse tormento, Luna descobriu a existência do "Refúgio dos Sonhos", um lugar mágico onde as almas perdidas podiam encontrar paz.',
    'Luna embarcou em uma jornada dentro de seus próprios sonhos, enfrentando criaturas abstratas e superando desafios psicológicos. Com a orientação de sábios oníricos, ela aprendeu a transformar seus pesadelos em poderosas ferramentas de autodescoberta. Cada vitória dentro de seu mundo interior a aproximava mais do Refúgio dos Sonhos.',
    'Ao chegar ao Refúgio, Luna encontrou um espelho mágico que refletia sua verdadeira essência. Aceitando todas as partes de si mesma, a escuridão que a assombrava começou a se dissipar. Luna tornou-se a guardiã do Refúgio dos Sonhos, ajudando outros a enfrentar seus medos noturnos e transformar seus pesadelos em fontes de força.',
    ' "A Dança da Cura" ',
    'Em um reino onde a magia era canalizada através da arte, vivia um talentoso dançarino chamado Rafael. Um dia, uma terrível praga o atingiu, roubando seus movimentos graciosos e condenando-o a uma vida limitada pela dor. Desafiando todas as probabilidades, Rafael decidiu buscar a cura através da dança, a arte que sempre o inspirou.',
    'Determinado a dançar novamente, ele viajou para encontrar a lendária "Bailarina Cósmica", uma entidade mágica que personificava a harmonia entre corpo e alma. No caminho, Rafael enfrentou desafios que testaram sua resistência e perseverança. Cada passo, mesmo doloroso, o aproximava mais da Bailarina Cósmica.',
    'Ao encontrá-la, Rafael iniciou uma dança mágica que transcendia os limites do físico. Cada movimento curava não apenas seu corpo, mas também a energia ao seu redor. À medida que a dança fluía, a praga que o afligia se dissipava. Rafael tornou-se um símbolo de superação, usando sua arte para curar outros afligidos pela dor.',
    // Adicione mais parágrafos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        elevation: 0,
        title: Text('Leia e se inspire!'),
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
                  // Aqui você pode chamar a lógica de logout se necessário
                }
              },
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fundohistoria.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: paragraphs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.white),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    paragraphs[index],
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
