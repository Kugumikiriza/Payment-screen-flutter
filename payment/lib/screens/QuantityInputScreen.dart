import 'package:flutter/material.dart';

class QuantityInputScreen extends StatefulWidget {
  @override
  _QuantityInputScreenState createState() => _QuantityInputScreenState();
}

class _QuantityInputScreenState extends State<QuantityInputScreen> {
  int quantity = 1;
  final double unitAmount = 85000.0;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  double getTotalAmount() {
    return quantity * unitAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Final Quantity input'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Link Details',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Order our tools with ease. The best workshop ever............',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Quantity',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: decrementQuantity,
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(fontSize: 24.0),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: incrementQuantity,
                ),
              ],
            ),
            Text(
              'Total Amount: ${getTotalAmount()} UGX',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (quantity > 20) {
                  // Show error message
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Quantity cannot be above 20.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Navigate to PaymentReceived and pass data
                  Navigator.pushNamed(
                    context,
                    '/payment-received',
                    arguments: {
                      'totalAmount': getTotalAmount(),
                      'quantity': quantity,
                    },
                  );
                }
              },
              child: const Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
