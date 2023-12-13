// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:netflix_clone/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      color: Colors.orange,
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(width: 12.0),
            Row(
              children: [
                _AppBarButton(
                  title: 'TV Shows',
                  onTaps: () => print('TV Shows')
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTaps: () => print('Movies')
                ),
                _AppBarButton(
                  title: 'My list',
                  onTaps: () => print('My list')
                ),
              ],
            )
          ]
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function() onTaps;

  const _AppBarButton({
    Key? key,
    required this.title,
    required this.onTaps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaps,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
