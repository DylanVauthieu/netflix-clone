// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/models.dart';
import 'package:netflix_clone/widgets/vertical_icon_button.dart';
import 'package:netflix_clone/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  final Content featureContent;

  const ContentHeader({
    Key? key,
    required this.featureContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _ContentHeaderMobile(featureContent: featureContent),
      desktop: _ContentHeaderDesktop(featureContent: featureContent),
    );
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featureContent;

  const _ContentHeaderMobile({
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
                  image: NetworkImage(featureContent.imageUrl),
                  fit: BoxFit.cover)),
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
            child: Image.network(featureContent.titleImageUrl),
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
                onTap: () => print('Add to list'),
              ),
              const _PlayButton(title: 'Play', iconname: Icons.play_arrow),
              VerticalIconButton(
                icon: Icons.info_outline,
                title: 'Info',
                onTap: () => print('Info'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  final Content featureContent;

  const _ContentHeaderDesktop({
    Key? key,
    required this.featureContent,
  }) : super(key: key);

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  bool _isMuted = true;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.featureContent.videoUrl),
    )
      ..initialize().then((_) => setState(() {}))
      ..setVolume(0)
      ..play()
      ..setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoPlayerController.value.isPlaying
          ? _videoPlayerController.pause()
          : _videoPlayerController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: -1.0,
            child: AspectRatio(
              aspectRatio: _videoPlayerController.value.isInitialized
                  ? _videoPlayerController.value.aspectRatio
                  : 2.344,
              child: _videoPlayerController.value.isInitialized
                  ? VideoPlayer(_videoPlayerController)
                  : Image.network(
                      widget.featureContent.imageUrl,
                      fit: BoxFit.cover,
                    ),
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
            left: 60.0,
            right: 60.0,
            bottom: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.network(
                    widget.featureContent.titleImageUrl,
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  widget.featureContent.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2.0, 4.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const _PlayButton(
                      title: 'Play',
                      iconname: Icons.play_arrow,
                    ),
                    const SizedBox(width: 16.0),
                    const _PlayButton(
                      title: 'More Info',
                      iconname: Icons.info_outline,
                    ),
                    const SizedBox(width: 20.0),
                    if (_videoPlayerController.value.isInitialized)
                      IconButton(
                        icon: Icon(
                          _isMuted ? Icons.volume_off : Icons.volume_up,
                        ),
                        color: Colors.white,
                        iconSize: 30.0,
                        onPressed: () => setState(() {
                          _isMuted
                              ? _videoPlayerController.setVolume(100)
                              : _videoPlayerController.setVolume(0);
                          _isMuted = _videoPlayerController.value.volume == 0;
                        }),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  final String title;
  final IconData iconname;

  const _PlayButton({
    Key? key,
    required this.title,
    required this.iconname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => print(title),
      icon: Icon(
        iconname,
        color: Colors.black,
        size: 30.0,
      ),
      style: ElevatedButton.styleFrom(
        padding: !Responsive.isDesktop(context)
            ? const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0)
            : const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
      ),
      label: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
