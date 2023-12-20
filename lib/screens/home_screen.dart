import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/cubits/cubits.dart';
import 'package:netflix_clone/data/data.dart';
import 'package:netflix_clone/widgets/widgets.dart';

import '../models/content_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        BlocProvider.of<AppBarCubit>(context)
            .setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.grey[850],
        child: const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        onPressed: () => print('Cast'),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, scrollOffset) {
            return CustomAppBar(scrollOffset: scrollOffset);
          },
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverToBoxAdapter(
            child: ContentHeader(featureContent: sintelContent),
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('previews').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.connectionState == ConnectionState.active) {
                  List<Content> content = List.generate(
                    snapshot.data!.docs.length,
                    (index) => Content.fromJson(snapshot.data!.docs[index].data()),
                  );
                  return SliverToBoxAdapter(
                    child: Preview(
                      key: const PageStorageKey('previews'),
                      title: 'Previews',
                      contentList: content,
                    ),
                  );
                } else {
                  return const SliverToBoxAdapter(child: SizedBox());
                }
              } else {
                return const SliverToBoxAdapter(child: SizedBox());
              }
            },
          ),
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('myList').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    List<Content> content = List.generate(
                        snapshot.data!.docs.length,
                        (index) => Content.fromJson(
                            snapshot.data!.docs[index].data()));
                    return SliverToBoxAdapter(
                      child: ContentList(
                        key: const PageStorageKey('my list'),
                        title: 'My List',
                        contentList: content,
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter(child: SizedBox());
                  }
                } else {
                  return const SliverToBoxAdapter(child: SizedBox());
                }
              }
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('originals')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    List<Content> content = List.generate(
                        snapshot.data!.docs.length,
                        (index) => Content.fromJson(
                            snapshot.data!.docs[index].data()));
                    return SliverToBoxAdapter(
                      child: ContentList(
                        key: const PageStorageKey('Netflix Originals'),
                        title: 'Netflix Originals',
                        contentList: content,
                        isOriginals: true,
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter(child: SizedBox());
                  }
                } else {
                  return const SliverToBoxAdapter(child: SizedBox());
                }
              }
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('trending').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    List<Content> content = List.generate(
                        snapshot.data!.docs.length,
                        (index) => Content.fromJson(
                            snapshot.data!.docs[index].data()));
                    return SliverToBoxAdapter(
                      child: ContentList(
                        key: const PageStorageKey('Trending'),
                        title: 'Trending',
                        contentList: content,
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter(child: SizedBox());
                  }
                } else {
                  return const SliverToBoxAdapter(child: SizedBox());
                }
              }
            ),
        ],
      ),
    );
  }
}
