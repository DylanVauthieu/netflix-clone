import 'dart:ui';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/firebase_options.dart';
import 'package:netflix_clone/screens/screens.dart';
// import 'package:uuid/uuid.dart';
// import '../data/data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //? This is for pushing my data.dart in my FireStore.
  // Uuid uuid = Uuid();

  // for (var element in originals) {
  //   await FirebaseFirestore.instance.collection('originals').doc(uuid.v4()).set({
  //     'name': element.name,
  //     'imageurl': element.imageUrl,
  //     'titleimageurl': element.titleImageUrl,
  //     'videourl': element.videoUrl,
  //     'description': element.description,
  //     'color': element.color.value,
  //   });
  // }
  // for (var element in previews) {
  //   await FirebaseFirestore.instance.collection('previews').doc(uuid.v4()).set({
  //     'name': element.name,
  //     'imageurl': element.imageUrl,
  //     'titleimageurl': element.titleImageUrl,
  //     'videourl': element.videoUrl,
  //     'description': element.description,
  //     'color': element.color.value,
  //   });
  // }
  // for (var element in trending) {
  //   await FirebaseFirestore.instance.collection('trending').doc(uuid.v4()).set({
  //     'name': element.name,
  //     'imageurl': element.imageUrl,
  //     'titleimageurl': element.titleImageUrl,
  //     'videourl': element.videoUrl,
  //     'description': element.description,
  //     'color': element.color.value,
  //   });
  // }
  // for (var element in myList) {
  //   await FirebaseFirestore.instance.collection('myList').doc(uuid.v4()).set({
  //     'name': element.name,
  //     'imageurl': element.imageUrl,
  //     'titleimageurl': element.titleImageUrl,
  //     'videourl': element.videoUrl,
  //     'description': element.description,
  //     'color': element.color.value,
  //   });
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
      title: 'Netflix Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.black),
      home: const NavScreen(),
    );
  }
}
