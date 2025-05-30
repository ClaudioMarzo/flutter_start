import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expo_tech_roleta/src/roulette.dart';
import 'package:expo_tech_roleta/src/util/roulette_state.dart';

class Home extends StatefulWidget {
  const Home({ super.key });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   @override
   Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RouletteState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expo Tech Roleta',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const Roulette(),
      ),
    );
  }
}