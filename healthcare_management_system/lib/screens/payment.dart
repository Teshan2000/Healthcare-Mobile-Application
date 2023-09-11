import 'package:flutter/material.dart';
import 'package:healthcare_management_system/components/button.dart';
import 'package:healthcare_management_system/screens/success.dart';
import '../components/customAppbar.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  PaymentState createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  bool isCreditCardSelected = false;
  bool isHelaPaySelected = false;
  bool isWebXPaySelected = false;

  String cardNumber = '';
  String cvv = '';
  String expiryDate = '';
  bool isCardValid = false;
  bool isCvvValid = false;
  bool isExpiryDateValid = false;
  bool isPaymentSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Payment Details',
        icon: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_outline),
            color: Colors.blue,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12.0),
            const Text(
              'Choose Payment Option',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                buildPaymentOption(
                  imagePath: 'Assets/credit_card.png',
                  label: 'Credit/Debit Card',
                  isSelected: isCreditCardSelected,
                  onTap: () {
                    setState(() {
                      isCreditCardSelected = true;
                      isHelaPaySelected = false;
                      isWebXPaySelected = false;                      
                    });
                  },
                ),
                SizedBox(width: 15.0),
                buildPaymentOption(
                  imagePath: 'Assets/helapay.png',
                  label: 'HelaPay',
                  isSelected: isHelaPaySelected,
                  onTap: () {
                    setState(() {
                      isCreditCardSelected = false;
                      isHelaPaySelected = true;
                      isWebXPaySelected = false;
                    });
                  },
                ),
                SizedBox(width: 15.0),
                buildPaymentOption(
                  imagePath: 'Assets/webxpay.png',
                  label: 'WEBXPAY',
                  isSelected: isWebXPaySelected,
                  onTap: () {
                    setState(() {
                      isCreditCardSelected = false;
                      isHelaPaySelected = false;
                      isWebXPaySelected = true;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Number',
                prefixIcon: Icon(Icons.credit_card),
                errorText: isCardValid ? null : 'Invalid Card Number',
              ),
              onChanged: (value) {
                setState(() {
                  cardNumber = value;
                  isCardValid = isValidCardNumber(value);
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Unique Code',
                prefixIcon: Icon(Icons.lock),
                errorText: isCvvValid ? null : 'Invalid CVV Number',
              ),
              onChanged: (value) {
                setState(() {
                  cvv = value;
                  isCvvValid = isValidCvv(value);
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Expiry Date',
                prefixIcon: Icon(Icons.calendar_today),
                errorText: isExpiryDateValid ? null : 'Invalid Expiry Date',
              ),
              onChanged: (value) {
                setState(() {
                  expiryDate = value;
                  isExpiryDateValid = isValidExpiryDate(value);
                });
              },
            ),
            const SizedBox(height: 24.0),
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
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Button(
                width: double.infinity,
                title: "Make The Payment",
                onPressed: () {
                  showPaymentConfirmationDialog(context);
                },
                disable: false,
              ),
            ),
            const SizedBox(height: 16.0),
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

  void showPaymentConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you sure you want to pay?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                performPayment();
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  void performPayment() {

    if (isCardValid && isCvvValid && isExpiryDateValid) {

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Success(),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TryAgain(),
      ));
    }
  }
}

class TryAgain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error,
              color: Colors.red,
              size: 72.0,
            ),
            SizedBox(height: 16.0),
            Text('Try Again',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

bool isValidCardNumber(String cardNumber) {
  return cardNumber.isNotEmpty && cardNumber.length == 16;
}

bool isValidCvv(String cvv) {
  return cvv.isNotEmpty && cvv.length == 3;
}

bool isValidExpiryDate(String expiryDate) {
  return expiryDate.isNotEmpty && expiryDate.length == 5;
}

