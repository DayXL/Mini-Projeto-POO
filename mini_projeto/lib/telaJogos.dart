import 'package:flutter/material.dart';

class TelaJogos extends StatelessWidget {
  const TelaJogos({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScaffoldMessenger(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: MyAppBar(),
            ),
            body: EstlFun(),
        )));
  }
}

class EstlFun extends StatefulWidget {
  const EstlFun({Key? key}) : super(key: key);

  @override
  _EstlFunState createState() => _EstlFunState();
}

class _EstlFunState extends State<EstlFun> {
  @override
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
      child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                  child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: Image.asset(
                                'assets/imagens/test_images/game.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Megaman Battle Network Legacy Collection',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Joguinho do Megaman urruuu',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: Image.asset(
                                'assets/imagens/test_images/game.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Megaman Battle Network Legacy Collection',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Joguinho do Megaman urruuu',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: Image.asset(
                                'assets/imagens/test_images/game.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Megaman Battle Network Legacy Collection',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Joguinho do Megaman urruuu',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: Image.asset(
                                'assets/imagens/test_images/game.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Megaman Battle Network Legacy Collection',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Joguinho do Megaman urruuu',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: Image.asset(
                                'assets/imagens/test_images/game.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Megaman Battle Network Legacy Collection',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Joguinho do Megaman urruuu',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: Image.asset(
                                'assets/imagens/test_images/game.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Megaman Battle Network Legacy Collection',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Joguinho do Megaman urruuu',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: Image.asset(
                                'assets/imagens/test_images/game.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Megaman Battle Network Legacy Collection',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Joguinho do Megaman urruuu',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: Image.asset(
                                'assets/imagens/test_images/game.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Megaman Battle Network Legacy Collection',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Joguinho do Megaman urruuu',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Jogos"),
      backgroundColor: Colors.greenAccent,

    );
  }

}