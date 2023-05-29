import 'package:flutter/material.dart';

late final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;

void main() {

  _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  MyApp app = const MyApp();

  runApp(app);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner:false,

      home: ScaffoldMessenger(

        key: _scaffoldMessengerKey,

        child: const Scaffold(

          body: EstlFun(),

        )
      )
    );

  }

}

class EstlFun extends StatelessWidget {
  const EstlFun({Key? key}) : super(key: key);

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
        
        image: DecorationImage(
          image: ExactAssetImage('assets/imagens/telaPrincipal.png'),
          scale: 0.7,
        ),


      ),

      
      child : Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator()),
        ],
      ),

    );
  }
}