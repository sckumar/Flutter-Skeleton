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
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24.0),
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
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  // TODO: Implement Product List Page
  @override
  Widget build(BuildContext context) {
    // Placeholder for actual product list
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Center(
        child: Text('List of Products will be displayed here'),
      ),
    );
  }
}

// TODO: Implement ProductDetailsPage, ShoppingCartPage, CheckoutPage, OrderConfirmationPage, AccountCreationPage, AdminProductCreationPage

// Note: You would need to create classes for each page similar to the LoginPage and ProductListPage.