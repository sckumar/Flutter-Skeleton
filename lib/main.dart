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
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(decoration: InputDecoration(labelText: 'Username')),
              TextField(decoration: InputDecoration(labelText: 'Password'), obscureText: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage()));
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  // Implement forgot password functionality
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
  @override
  Widget build(BuildContext context) {
    // Mock data
    final products = [
      {'name': 'Product 1', 'image': 'assets/product1.png', 'description': 'Description 1'},
      {'name': 'Product 2', 'image': 'assets/product2.png', 'description': 'Description 2'},
      // Add more products as needed
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(products[index]['image']),
            title: Text(products[index]['name']),
            subtitle: Text(products[index]['description']),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Add to cart functionality
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Map product;

  ProductDetailsPage({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name'])),
      body: Column(
        children: <Widget>[
          Image.asset(product['image']),
          Text(product['name'], style: TextStyle(fontSize: 24)),
          Text(product['description']),
          Text('Price: \$20'), // Replace with actual price
          ElevatedButton(
            onPressed: () {
              // Add to cart functionality
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mock data
    final cartItems = [
      {'name': 'Product 1', 'image': 'assets/product1.png', 'quantity': 1, 'price': 20},
      // Add more cart items as needed
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart')),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(cartItems[index]['image']),
            title: Text(cartItems[index]['name']),
            subtitle: Text('Quantity: ${cartItems[index]['quantity']}'),
            trailing: Text('Total: \$${cartItems[index]['price']}'),
            onTap: () {
              // Remove from cart functionality
            },
          );
        },
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage()));
        },
        child: Text('Proceed to Checkout'),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mock data
    final orderSummary = [
      {'name': 'Product 1', 'quantity': 1, 'price': 20},
      // Addmore order summary items as needed
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('User Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            // Replace with actual user details
            Text('Name: John Doe'),
            Text('Address: 123 Flutter St'),
            Text('Contact: 123-456-7890'),
            SizedBox(height: 20),
            Text('Order Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: orderSummary.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(orderSummary[index]['name']),
                    subtitle: Text('Quantity: ${orderSummary[index]['quantity']}'),
                    trailing: Text('Total: \$${orderSummary[index]['price']}'),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Payment Method', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            // Add payment method selection here
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderConfirmationPage()));
              },
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mock data
    final orderDetails = {
      'orderNumber': '123456',
      'date': '01/01/2021',
      'products': [
        {'name': 'Product 1', 'quantity': 1, 'price': 20},
        // Add more products as needed
      ],
      'totalAmount': 20,
    };

    return Scaffold(
      appBar: AppBar(title: Text('Order Confirmation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Thank you for your purchase!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Order Number: ${orderDetails['orderNumber']}'),
            Text('Date: ${orderDetails['date']}'),
            Expanded(
              child: ListView.builder(
                itemCount: orderDetails['products'].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(orderDetails['products'][index]['name']),
                    subtitle: Text('Quantity: ${orderDetails['products'][index]['quantity']}'),
                    trailing: Text('Total: \$${orderDetails['products'][index]['price']}'),
                  );
                },
              ),
            ),
            Text('Total Amount: \$${orderDetails['totalAmount']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// Implement Account Creation Page and Admin Product Creation Page as needed