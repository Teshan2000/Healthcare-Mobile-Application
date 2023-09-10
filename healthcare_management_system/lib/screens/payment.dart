import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
          },
        ),
        title: Text( 'Payment',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Consultation',
                  style: TextStyle(fontSize: 16),),
                Text('Rs. 350',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discounts',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text('-Rs. 50',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('Rs. 300',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 28.0),
            Text('Choose Payment Option',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                buildPaymentOption(
                  imagePath: 'assets/credit_card.png',
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
                SizedBox(width: 16.0),
                buildPaymentOption(
                  imagePath: 'assets/helapay.png',
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
                SizedBox(width: 16.0),
                buildPaymentOption(
                  imagePath: 'assets/webxpay.png',
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
            SizedBox(height: 16.0),
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
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'CVV Number',
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
            SizedBox(height: 16.0),
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
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              height: 48.0,
              color: Colors.blue,
              child: ElevatedButton(
                onPressed: () {
                  showPaymentConfirmationDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                ),
                child: Text('Make The Payment', style: TextStyle(fontSize: 22, color: Colors.white)),
              ),
            ),
            // SizedBox(height: 16.0),
            // if (isPaymentSuccessful) ...[
            //  Text(
            //   'Payment Successful!',
            //   style: TextStyle(fontSize: 24, color: Colors.green),
            //  ),
            // ],
            SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 56.0,
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
        builder: (context) => PaymentSuccessPage(),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TryAgainPage(),
      ));

    }
  }
}

class PaymentSuccessPage extends StatelessWidget {
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
            Icon(Icons.check_circle,
              color: Colors.green,
              size: 72.0,
            ),
            SizedBox(height: 16.0),
            Text(' Your Payment was successful!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ],


        ),
      ),
    );
  }
}

class TryAgainPage extends StatelessWidget {
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

bool isValidCardNumber(String cardNumber) {

  return cardNumber.isNotEmpty && cardNumber.length == 16;
}

bool isValidCvv(String cvv) {

  return cvv.isNotEmpty && cvv.length == 3;
}

bool isValidExpiryDate(String expiryDate) {

  return expiryDate.isNotEmpty && expiryDate.length == 5;
}

void main() {
  runApp(MaterialApp(
    home: PaymentPage(),
  ));
}
