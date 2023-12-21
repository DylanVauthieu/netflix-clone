import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:netflix_clone/cubits/cubits.dart';
import 'package:netflix_clone/firebase_options.dart';
import 'package:netflix_clone/screens/screens.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  usePathUrlStrategy();

  // final docs = await FirebaseFirestore.instance.collection('previews').get();

  // for (var element in docs.docs) {
  //   final ref = FirebaseStorage.instance
  //       .ref()
  //       .child((element.data()['titleimageurl'] as String).split('/').last);

  //   print(await ref.getDownloadURL());

  //   FirebaseFirestore.instance
  //       .collection('previews')
  //       .doc(element.id)
  //       .update({'titleimageurl': await ref.getDownloadURL()});
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBarCubit(),
      child: MaterialApp(
        scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.stylus,
          PointerDeviceKind.invertedStylus
        }),
        title: 'Netflix Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const NavScreen(),
      ),
    );
  }
}
