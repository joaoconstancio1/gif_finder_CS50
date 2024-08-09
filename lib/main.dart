import 'package:flutter/material.dart';
import 'package:gif_finder/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    home: const HomePage(),
    theme: ThemeData(hintColor: Colors.white),
  ));
}
