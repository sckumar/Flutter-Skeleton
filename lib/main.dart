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
    // Login Page UI and Logic
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
    // Product List Page UI and Logic
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
    // Product Details Page UI and Logic
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
    // Shopping Cart Page UI and Logic
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
    // Checkout Page UI and Logic
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
    // Order Confirmation Page UI and Logic
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
    // Account Creation Page UI and Logic
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
    // Admin Product Creation Page UI and Logic
    return Scaffold(
      body: Center(
        child: Text('Admin Product Creation Page'),
      ),
    );
  }
}