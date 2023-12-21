import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/cubits/app_bar/app_bar_cubit.dart';
import 'package:netflix_clone/models/content_model.dart';
import 'package:netflix_clone/widgets/custom_app_bar.dart';
import 'package:netflix_clone/widgets/showall.dart';

class DisplayCatalog extends StatefulWidget {
  const DisplayCatalog({
    Key? key,
  }) : super(key: key);

  @override
  State<DisplayCatalog> createState() => _DisplayCatalogState();
}

class _DisplayCatalogState extends State<DisplayCatalog> {
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
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, scrollOffset) {
            return const CustomAppBar();
          },
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          StreamBuilder(
              stream: FirebaseFirestore.instance.collection('all').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    List<Content> content = List.generate(
                        snapshot.data!.docs.length,
                        (index) => Content.fromJson(
                            snapshot.data!.docs[index].data()));
                    content.sort((a, b) => a.name.compareTo(b.name));
                    return SliverToBoxAdapter(
                      child: ShowAll(
                        key: const PageStorageKey('all'),
                        title: 'All Catalog',
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