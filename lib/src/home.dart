import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expo_tech_roleta/src/roulette.dart';
import 'package:expo_tech_roleta/src/util/roulette_data.dart';

class Home extends StatefulWidget {
  const Home({ super.key });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late RouletteController _rouletteController;

  @override
  void initState() {
    super.initState();
    _rouletteController = RouletteController();
  }

  @override
  void dispose() {
    _rouletteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Provider<RouletteController>.value(
      value: _rouletteController,
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