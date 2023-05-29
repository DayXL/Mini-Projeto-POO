import 'package:flutter/material.dart';
import 'dart:async';
import 'telaJogos.dart';


class TelaJogos extends StatelessWidget {
  const TelaJogos({super.key});

  @override

  Widget build(BuildContext context) {

    return const MaterialApp(

      debugShowCheckedModeBanner:false,

      home: ScaffoldMessenger(

        child: Scaffold(

          body: EstlFun(),

        )
      )
    );

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

    );
  }
}