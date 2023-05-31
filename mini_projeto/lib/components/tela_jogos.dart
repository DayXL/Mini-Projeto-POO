import 'package:flutter/material.dart';
import './myappbar.dart';
import './refresh_button.dart';

class TelaJogos extends StatelessWidget {
  const TelaJogos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScaffoldMessenger(
            child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: MyAppBar(),
          ),
          body: const Loading(),
          floatingActionButton: RefreshButton(),
        )));
  }
}

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
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
