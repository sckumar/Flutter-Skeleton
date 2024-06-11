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
    // TODO: Build your login page UI with username and password fields, login button, and forgot password link
    return Scaffold(
      body: Center(
        child: Text('Login Page Placeholder'),
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Build your product list page UI with a list of products
    return Scaffold(
      body: Center(
        child: Text('Product List Page Placeholder'),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Build your product details page UI
    return Scaffold(
      body: Center(
        child: Text('Product Details Page Placeholder'),
      ),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Build your shopping cart page UI
    return Scaffold(
      body: Center(
        child: Text('Shopping Cart Page Placeholder'),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Build your checkout page UI
    return Scaffold(
      body: Center(
        child: Text('Checkout Page Placeholder'),
      ),
    );
  }
}

class OrderConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Build your order confirmation page UI
    return Scaffold(
      body: Center(
        child: Text('Order Confirmation Page Placeholder'),
      ),
    );
  }
}

class AccountCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Build your account creation page UI
    return Scaffold(
      body: Center(
        child: Text('Account Creation Page Placeholder'),
      ),
    );
  }
}

class AdminProductCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Build your admin product creation page UI
    return Scaffold(
      body: Center(
        child: Text('Admin Product Creation Page Placeholder'),
      ),
    );
  }
}