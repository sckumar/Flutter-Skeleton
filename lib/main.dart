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

// Continue creating classes for ProductDetailsPage, ShoppingCartPage, CheckoutPage, OrderConfirmationPage, AccountCreationPage, and AdminProductCreationPage

// You will also need to create navigation logic, for example:
// Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage()));

// And so on for each page redirection...