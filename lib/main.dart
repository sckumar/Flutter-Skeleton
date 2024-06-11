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
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/productList': (context) => ProductListPage(),
        '/productDetails': (context) => ProductDetailsPage(),
        '/shoppingCart': (context) => ShoppingCartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/orderConfirmation': (context) => OrderConfirmationPage(),
        '/accountCreation': (context) => AccountCreationPage(),
        '/adminProductCreation': (context) => AdminProductCreationPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your login page UI with username, password fields, and login button
    // On successful login, navigate to the Product List Page
  }
}

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your product list page UI
    // On clicking a product, navigate to the Product Details Page
    // On clicking the cart icon, navigate to the Shopping Cart Page
  }
}

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your product details page UI
    // On clicking the Add to Cart button, add the product to the cart
  }
}

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your shopping cart page UI
    // On clicking the Remove button, remove the item from the cart
    // On clicking the Proceed to Checkout button, navigate to the Checkout Page
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your checkout page UI
    // On clicking the Place Order button, complete the purchase and navigate to the Order Confirmation Page
  }
}

class OrderConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your order confirmation page UI
  }
}

class AccountCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your account creation page UI
    // On successful account creation, navigate to the Product List Page
  }
}

class AdminProductCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your admin product creation page UI
    // On successful product creation, navigate to the Product List Page
  }
}