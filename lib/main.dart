import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your login page UI here
    return Scaffold(
      body: Center(
        child: Text('Login Page'),
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your product list page UI here
    return Scaffold(
      body: Center(
        child: Text('Product List Page'),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your product details page UI here
    return Scaffold(
      body: Center(
        child: Text('Product Details Page'),
      ),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your shopping cart page UI here
    return Scaffold(
      body: Center(
        child: Text('Shopping Cart Page'),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your checkout page UI here
    return Scaffold(
      body: Center(
        child: Text('Checkout Page'),
      ),
    );
  }
}

class OrderConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your order confirmation page UI here
    return Scaffold(
      body: Center(
        child: Text('Order Confirmation Page'),
      ),
    );
  }
}

class AccountCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your account creation page UI here
    return Scaffold(
      body: Center(
        child: Text('Account Creation Page'),
      ),
    );
  }
}

class AdminProductCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your admin product creation page UI here
    return Scaffold(
      body: Center(
        child: Text('Admin Product Creation Page'),
      ),
    );
  }
}