import 'dart:convert';
import 'dart:io';
import 'package:craveiospro/Database/firebase_database.dart';
import 'package:craveiospro/SelectPhotoOptionsScreen.dart';
import 'package:craveiospro/UI/Stepper/homepage.dart';
import 'package:craveiospro/UI/dashboard_screen.dart';
import 'package:craveiospro/utility.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'custom_date_picker_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'firebase_options.dart';

// Code Updated by Vasant and Mohnish


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  // if(kIsWeb){

  //   await Firebase.initializeApp(
  //       options: const FirebaseOptions(
  //         apiKey: "AIzaSyAuBnfQgIMUr_IL6IVuXeZUM3rCeGhsvyY",
  //         appId: "1:729752416660:web:7392b5371f611accc61f81",
  //         messagingSenderId: "729752416660",
  //         projectId: "c-client-registration"
  //   )
  // );
  // }
  // else {
  //   await Firebase.initializeApp();
    
  // }
  
  runApp(
      const MyApp()
  );

  //final db = FirebaseFirestore.instance.collection('guest2').doc();

  /*FirebaseDatabase.instance.setPersistenceEnabled(true);
  final scoresRef = FirebaseDatabase.instance.ref("scores");
  scoresRef.keepSynced(true);

  final FirebaseDatabase database = FirebaseDatabase.instance;
  database.setPersistenceEnabled(true);
  database.setPersistenceCacheSizeBytes(10000000);*/

  // var db=FirebaseFirestore.instance;
  // db.settings = const Settings(persistenceEnabled: true);

// Apple and Android
  /* db.settings = const Settings(persistenceEnabled: true);

  db.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );*/

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>Firebase_Database(),
      child: MaterialApp(
        title: 'Crave Client Registration',
        theme: ThemeData(
          canvasColor: const Color(0xFFD4FCFF),
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: const Color(0xFF00D3FF),
            background: Colors.red,
            secondary: const Color(0xFFD4F8FF),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: kIsWeb? const MyHomePage():const DashboardScreen()
      ),
    );
  }
}


