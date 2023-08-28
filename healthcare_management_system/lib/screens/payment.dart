import 'package:flutter/material.dart';

class PaymentDetailsPage extends StatefulWidget {
  @override
  _PaymentDetailsPageState createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  bool isCreditCardSelected = false;
  bool isPayPalSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text(
          'Payment Details',
          style: TextStyle(color: Colors.white, fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0.5 * 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Consultation',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Rs. 350',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 1 * 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discounts',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  '-Rs. 50',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 1 * 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rs. 300',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 1.75 * 16.0),
            Text(
              'Choose Payment Option',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 1 * 16.0),
            Row(
              children: [
                buildPaymentOption(
                  imagePath: 'images/credit_card.png',
                  label: 'Credit Card',
                  isSelected: isCreditCardSelected,
                  onTap: () {
                    setState(() {
                      isCreditCardSelected = true;
                      isPayPalSelected = false;
                    });
                  },
                ),
                SizedBox(width: 4 * 16.0),
                buildPaymentOption(
                  imagePath: 'images/paypal.png',
                  label: 'PayPal',
                  isSelected: isPayPalSelected,
                  onTap: () {
                    setState(() {
                      isCreditCardSelected = false;
                      isPayPalSelected = true;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 1 * 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Number',
                prefixIcon: Icon(Icons.credit_card),
              ),
            ),
            SizedBox(height: 1 * 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Unique Code',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 0.5* 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Currency',
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            SizedBox(height: 2.5 * 9.0),
            Container(
              width: double.infinity,
              height: 2.2 * 16.0,
              color: Colors.blue,
              child: ElevatedButton(
                onPressed: () {
                  // Handle payment button press
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                ),
                child: Text('Make The Payment', style: TextStyle(fontSize: 18),),
                 ),
            ),
            SizedBox(height: 1.1* 16.0),
            Container(
              height: 4 * 16.0,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavigationIconButton(icon: Icons.home, label: 'Home'),
                  NavigationIconButton(icon: Icons.message, label: 'Messages'),
                  NavigationIconButton(icon: Icons.schedule, label: 'Schedule'),
                  NavigationIconButton(icon: Icons.settings, label: 'Settings'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOption({
    required String imagePath,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 100, // Set the width to make the image square
            height: 100, // Set the height to make the image square
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationIconButton extends StatelessWidget {
  final IconData icon;
  final String label;

  NavigationIconButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaymentDetailsPage(),
  ));
}