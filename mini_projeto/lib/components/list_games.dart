import 'package:flutter/material.dart';
import '../services/game_services.dart';
import 'detalhes_jogos.dart';
import 'tela_jogos.dart';

class LoadGameList extends StatelessWidget {
  final List jsonObjects;
  final List<String> propertyNames;
  final GameService gameService;

  const LoadGameList(
      {super.key,
      this.jsonObjects = const [],
      this.propertyNames = const ["id", "name", "released", "image_background"],
      required this.gameService});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.greenAccent, Colors.black],
          stops: [0.1, 0.3],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ConteudoCorpo(
        jsonObjects: jsonObjects,
        propertyNames: propertyNames,
        gameService: gameService,
      ),
    );
  }
}

class ConteudoCorpo extends StatefulWidget {
  final List jsonObjects;
  final List<String> propertyNames;
  final GameService gameService;

  const ConteudoCorpo({
    Key? key,
    this.jsonObjects = const [],
    this.propertyNames = const ["id", "name", "released", "background_image"],
    required this.gameService,
  }) : super(key: key);

  @override
  _ConteudoCorpoState createState() => _ConteudoCorpoState();
}

class _ConteudoCorpoState extends State<ConteudoCorpo> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.jsonObjects.map((jsonObject) {
        final int id = jsonObject['id'] ?? '';
        final String text1 = jsonObject['name'] ?? '';
        final String imagem = jsonObject['background_image'] ?? '';
        final String text2 = jsonObject['released'] ?? '';

        bool isFavorite = widget.gameService.isFavorite(jsonObject['name']);

        return Container(
          margin: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    gameService.carregarDetalhesJogos(id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetalheTelaJogos(name: text1, id: id, imagem: imagem)),
                    );
                  },
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.network(imagem),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        text2,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      //add to favorites
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            if (isFavorite) {
                              widget.gameService.removeFavorite(jsonObject['name']);
                            } else {
                              widget.gameService.addFavorite(
                                jsonObject['name'],
                                jsonObject['released'],
                                imagem,
                                id,
                              );
                            }
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

