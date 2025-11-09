import 'package:flutter/material.dart';
import '../screens/quote_form_screen.dart';
import '../screens/quote_preview_screen.dart';

void main() {
  runApp(ProductQuoteApp());
}

class ProductQuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Quote Builder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => QuoteFormScreen(), // home screen
        '/preview': (context) => QuotePreviewScreen(),
      },
    );
  }
}
