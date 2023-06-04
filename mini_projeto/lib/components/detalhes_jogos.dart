import 'package:flutter/material.dart';

class DetalheJogos extends StatelessWidget {
  const DetalheJogos({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldMessenger(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: MyAppBar(),
            ),
            body: EstlFun(),

        ));
  }
}

class EstlFun extends StatefulWidget {
  const EstlFun({Key? key}) : super(key: key);

  @override
  _EstlFunState createState() => _EstlFunState();
}

class _EstlFunState extends State<EstlFun> {
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

      child: Column(
        
        children: [
          Expanded(
            child: Row(
              children: [          
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Stack(
                      children: [
                        Image.asset('assets/imagens/test_images/game.png'),

                        Positioned(
                          child: IconButton(
                            icon: const Icon(Icons.favorite_border, size: 50.0),
                            color: Colors.red,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                Expanded(
                  flex: 6,
                  child: Card(
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      child: const Text(
                        'Megaman Battle Network Legacy Collection A renomada série Mega Man Battle Network, que se expandiu para anime e quadrinhos, está de volta em Mega Man Battle Network Legacy Collection. Este pacote inclui dez jogos cheios de ação, além de novidades adicionais como uma galeria de ilustrações e música! Além disso, tem suporte a jogo online!',
                        style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        ),
                        
                        softWrap: true,
                      ),
                    ),
                  ),
                ),
          
              ],
          
            ),
          ),
      
          Expanded(
            flex: 1,

            child: Card(
              child: Container(
                margin: const EdgeInsets.all(16.0),
                child: const Text(
                  'Megaman Battle Network Legacy Collection A renomada série Mega Man Battle Network, que se expandiu para anime e quadrinhos, está de volta em Mega Man Battle Network Legacy Collection. Este pacote inclui dez jogos cheios de ação, além de novidades adicionais como uma galeria de ilustrações e música! Além disso, tem suporte a jogo online! A renomada série Mega Man Battle Network, que se expandiu para anime e quadrinhos, está de volta em Mega Man Battle Network Legacy Collection. Este pacote inclui dez jogos cheios de ação, além de novidades adicionais como uma galeria de ilustrações e música! Além disso, tem suporte a jogo online!',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      
      
      )
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Megaman Battle Network Legacy Collection"),
      backgroundColor: Colors.greenAccent,

    );
  }
}