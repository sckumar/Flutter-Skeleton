import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                // Simulate a login
                if (_usernameController.text == 'user' && _passwordController.text == 'pass') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProductListPage()),
                  );
                } else {
                  // Show error message
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Invalid username or password'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            TextButton(
              child: Text('Forgot Password?'),
              onPressed: () {
                // Handle forgot password
              },
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Center(
        child: Text('Welcome to the Product List!'),
      ),
    );
  }
}