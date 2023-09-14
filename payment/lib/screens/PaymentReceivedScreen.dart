import 'package:flutter/material.dart';

class PaymentReceivedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final double totalAmount = args['totalAmount'];
    final int quantity = args['quantity'];
    final DateTime paymentDate = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Payment Received'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Payment received successfully',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Date: ${paymentDate.toLocal()}',
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              'Unit Amount: ${totalAmount / quantity} UGX',
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              'Total Amount: $totalAmount UGX',
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
