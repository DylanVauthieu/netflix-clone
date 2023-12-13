import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.grey[850],
        child: const Icon(
          Icons.cast,
          color: Colors.white,),
        onPressed: () => print('Cast'),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: const CustomAppBar(),
      ),
    );
  }
}