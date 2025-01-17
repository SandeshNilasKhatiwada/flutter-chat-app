import 'package:chatapp/app.dart';
import 'package:chatapp/model/user.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register the Hive adapter for User
  Hive.registerAdapter(UserAdapter());

  // Open the box to ensure it is ready for use
  await Hive.openBox<User>('users'); // Opening the users box here

  runApp(const MyApp());
}
