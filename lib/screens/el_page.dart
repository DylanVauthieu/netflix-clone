import 'package:flutter/material.dart';

class DisplayContent extends StatefulWidget {
  const DisplayContent({
    Key? key,
  }) : super(key: key);

  @override
  State<DisplayContent> createState() => _DisplayContentState();
}

class _DisplayContentState extends State<DisplayContent> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
    );
  }
}
