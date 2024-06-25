import 'package:flutter/material.dart';
import './apptheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListPage()),
                );
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
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product('Product 1', 'assets/1.jpg', 'Description of product 1', 10.0),
    Product('Product 2', 'assets/2.jpg', 'Description of product 2', 10.0),
    Product('Product 3', 'assets/3.jpg', 'Description of product 3', 10.0),
    Product('Product 4', 'assets/4.jpg', 'Description of product 4', 10.0),
    Product('Product 5', 'assets/5.jpg', 'Description of product 5', 10.0),
    Product('Product 6', 'assets/6.jpg', 'Description of product 6', 10.0),
    Product('Product 7', 'assets/7.jpg', 'Description of product 7', 10.0),
    Product('Product 8', 'assets/7.jpg', 'Description of product 8', 10.0),
    Product('Product 9', 'assets/7.jpg', 'Description of product 9', 10.0),
    Product('Product 10', 'assets/7.jpg', 'Description of product 10', 10.0),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingCartPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(product.image),
            title: Text(product.name),
            subtitle: Text(product.description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailsPage(product: product)),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(product.image),
          Text(product.name),
          Text(product.description),
          Text('\$${product.price}'),
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
  // This would be your cart data
  final List<Product> cartProducts = [
    Product('Product 1', 'assets/product1.png', 'Description of product 1', 10.0, quantity: 2),
    // Add more cart products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          final product = cartProducts[index];
          return ListTile(
            leading: Image.asset(product.image),
            title: Text(product.name),
            subtitle: Text('Quantity: ${product.quantity}'),
            trailing: Text('Total: \$${product.price * product.quantity}'),
            onTap: () {
              // Remove from cart functionality
            },
          );
        },
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckoutPage()),
          );
        },
        child: Text('Proceed to Checkout'),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This would be your checkout data
    final List<Product> checkoutProducts = [
      Product('Product 1', 'assets/product1.png', 'Description of product 1', 10.0, quantity: 2),
      // Add more checkout products here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // User details section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contact Information',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Order summary section
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: checkoutProducts.length,
              itemBuilder: (context, index) {
                final product = checkoutProducts[index];
                return ListTile(
                  leading: Image.asset(product.image),
                  title: Text(product.name),
                  subtitle: Text('Quantity: ${product.quantity}'),
                  trailing: Text('Total: \$${product.price * product.quantity}'),
                );
              },
            ),
            // Payment method selection
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                items: <String>['Credit Card', 'PayPal', 'Cash on Delivery']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle payment method change
                },
                decoration: InputDecoration(
                  labelText: 'Payment Method',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderConfirmationPage()),
                );
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
    // This would be your order details
    final List<Product> orderedProducts = [
      Product('Product 1', 'assets/product1.png', 'Description of product 1', 10.0, quantity: 2),
      // Add more ordered products here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
      ),
      body: Column(
        children: <Widget>[
          Text('Thank you for your order!'),
          Text('Order Number: 123456'),
          Text('Order Date: ${DateTime.now()}'),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: orderedProducts.length,
            itemBuilder: (context, index) {
              final product = orderedProducts[index];
              return ListTile(
                leading: Image.asset(product.image),
                title: Text(product.name),
                subtitle: Text('Quantity: ${product.quantity}'),
                trailing: Text('Total: \$${product.price * product.quantity}'),
              );
            },
          ),
          // Text('Total Amount: \$${orderedProducts.fold(0, (total, current) => total + (current.price * current.quantity))}'),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String image;
  final String description;
  final double price;
  final int quantity;

  Product(this.name, this.image, this.description, this.price, {this.quantity = 1});
}