// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:netflix_clone/assets.dart';
import 'package:netflix_clone/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({
    Key? key,
    this.scrollOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: const Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(children: [
        Image.asset(Assets.netflixLogo0),
        const SizedBox(width: 12.0),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _AppBarButton(title: 'TV Shows', onTaps: () => print('TV Shows')),
              _AppBarButton(title: 'Movies', onTaps: () => print('Movies')),
              _AppBarButton(title: 'My list', onTaps: () => print('My list')),
            ],
          ),
        )
      ]),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(children: [
        Image.asset(Assets.netflixLogo1),
        const SizedBox(width: 12.0),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _AppBarButton(title: 'Home', onTaps: () => print('Home')),
              _AppBarButton(title: 'TV Shows', onTaps: () => print('TV Shows')),
              _AppBarButton(title: 'Movies', onTaps: () => print('Movies')),
              _AppBarButton(title: 'Latest', onTaps: () => print('Latest')),
              _AppBarButton(title: 'My list', onTaps: () => print('My list')),
            ],
          ),
        ),
        const Spacer(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.search),
                iconSize: 28.0,
                color: Colors.white,
                onPressed: () => print('Search'),
              ),
              _AppBarButton(title: 'KIDS', onTaps: () => print('KIDS')),
              _AppBarButton(title: 'DVD', onTaps: () => print('DVD')),
              _AppBarButton(title: 'Movies', onTaps: () => print('Movies')),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.card_giftcard),
                iconSize: 28.0,
                color: Colors.white,
                onPressed: () => print('Gift'),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.notifications),
                iconSize: 28.0,
                color: Colors.white,
                onPressed: () => print('Notifications'),
              ),
            ],
          ),
        )
      ]),
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
