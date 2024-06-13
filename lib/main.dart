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
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement login logic
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListPage()),
                );
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement forgot password logic
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Implement product list logic
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Center(
        child: Text('List of Products'),
      ),
    );
  }
}

// TODO: Implement ProductDetailsPage, ShoppingCartPage, CheckoutPage, OrderConfirmationPage, AccountCreationPage, AdminProductCreationPage

// You would continue creating classes for each page following the pattern above.
// Each class would be a StatelessWidget or StatefulWidget depending on your needs.
// You would use Navigator.push to move between pages.