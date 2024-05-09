import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/createAccount': (context) => AccountCreationPage(),
        '/productList': (context) => ProductListPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            RaisedButton(
              child: Text('Login'),
              onPressed: () {
                // Perform login logic here
                Navigator.pushNamed(context, '/productList');
              },
            ),
            FlatButton(
              child: Text('Create Account'),
              onPressed: () {
                Navigator.pushNamed(context, '/createAccount');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AccountCreationPage extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Creation Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
            SizedBox(height: 16.0),
            RaisedButton(
              child: Text('Create Account'),
              onPressed: () {
                // Perform account creation logic here
                Navigator.pushNamed(context, '/productList');
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
        title: Text('Product List Page'),
      ),
      body: ListView(
        children: [
          ProductItem(
            name: 'Product 1',
            description: 'Product 1 description',
            image: 'assets/product1.jpg',
          ),
          ProductItem(
            name: 'Product 2',
            description: 'Product 2 description',
            image: 'assets/product2.jpg',
          ),
          ProductItem(
            name: 'Product 3',
            description: 'Product 3 description',
            image: 'assets/product3.jpg',
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String description;
  final String image;

  const ProductItem({
    Key key,
    this.name,
    this.description,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        image,
        width: 50,
        height: 50,
      ),
      title: Text(name),
      subtitle: Text(description),
      trailing: RaisedButton(
        child: Text('Add to Cart'),
        onPressed: () {
          // Perform add to cart logic here
        },
      ),
    );
  }
}