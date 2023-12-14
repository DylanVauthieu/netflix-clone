// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/models.dart';
import 'package:netflix_clone/widgets/vertical_icon_button.dart';

class ContentHeader extends StatelessWidget {
  final Content featureContent;

  const ContentHeader({
    Key? key,
    required this.featureContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featureContent.imageUrl),
              fit: BoxFit.cover
            )
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: Image.asset(featureContent.titleImageUrl),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                title: 'List',
                onTap: () => print('MyList'),
              ),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: 'List',
                onTap: () => print('MyList'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
