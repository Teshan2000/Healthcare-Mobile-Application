import 'package:flutter/material.dart';
import '../components/customAppbar.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  PaymentState createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  bool isCreditCardSelected = false;
  bool isPayPalSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appTitle: 'Payment Details',
        icon: Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 0.5 * 16.0),
            const Text(
              'Choose Payment Option',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 1 * 16.0),
            Row(
              children: [
                buildPaymentOption(
                  imagePath: 'Assets/credit_card.png',
                  label: 'Credit Card',
                  isSelected: isCreditCardSelected,
                  onTap: () {
                    setState(() {
                      isCreditCardSelected = true;
                      isPayPalSelected = false;
                    });
                  },
                ),
                const SizedBox(width: 4 * 16.0),
                buildPaymentOption(
                  imagePath: 'Assets/paypal.png',
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
            const SizedBox(height: 1 * 16.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Card Number',
                prefixIcon: Icon(Icons.credit_card),
              ),
            ),
            const SizedBox(height: 1 * 16.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Unique Code',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 0.5* 16.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Currency',
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            const SizedBox(height: 2.5 * 9.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Channeling',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Rs. 350',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 1 * 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Discounts',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  '- Rs. 50',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 1 * 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
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
            const SizedBox(height: 1.75 * 16.0),
            Container(
              width: double.infinity,
              height: 2.2 * 16.0,
              color: Colors.blue,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                ),
                child: const Text('Make The Payment',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 1.1* 16.0),
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
            width: 100, 
            height: 100, 
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
                fit: BoxFit.cover, 
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
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

  const NavigationIconButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
