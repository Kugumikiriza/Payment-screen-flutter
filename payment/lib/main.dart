import 'package:flutter/material.dart';
import 'package:payment/screens/PaymentDetailsScreen.dart';
import 'package:payment/screens/PaymentReceivedScreen.dart';
import 'package:payment/screens/QuantityInputScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PaymentDetailsScreen(),
        '/quantity-input': (context) => QuantityInputScreen(),
        '/payment-received': (context) => PaymentReceivedScreen(),
      },
    );
  }
}
