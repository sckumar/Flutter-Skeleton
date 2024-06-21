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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
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
    Product('Product 1', 'assets/product1.png', 'Description of product 1', 10.0),
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
          return ListTile(
            leading: Image.asset(products[index].image),
            title: Text(products[index].name),
            subtitle: Text(products[index].description),
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
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
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
      appBar: AppBar(title: Text('Shopping Cart')),
      body: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(cartProducts[index].image),
            title: Text(cartProducts[index].name),
            subtitle: Text('Quantity: ${cartProducts[index].quantity}'),
            trailing: Text('\$${cartProducts[index].price * cartProducts[index].quantity}'),
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
      appBar: AppBar(title: Text('Checkout')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // User details section
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
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
                return ListTile(
                  leading: Image.asset(checkoutProducts[index].image),
                  title: Text(checkoutProducts[index].name),
                  subtitle: Text('Quantity: ${checkoutProducts[index].quantity}'),
                  trailing: Text('\$${checkoutProducts[index].price * checkoutProducts[index].quantity}'),
                );
              },
            ),
            // Payment method selection would go here
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderConfirmationPage()),
                  );
                },
                child: Text('Place Order'),
              ),
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
    final orderNumber = '123456';
    final orderDate = '01/01/2021';
    final List<Product> orderedProducts = [
      Product('Product 1', 'assets/product1.png', 'Description of product 1', 10.0, quantity: 2),
      // Add more ordered products here
    ];
    final totalAmount = orderedProducts.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(title: Text('Order Confirmation')),
      body: Column(
        children: <Widget>[
          Text('Thank you for your purchase!'),
          Text('Order Number: $orderNumber'),
          Text('Order Date: $orderDate'),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: orderedProducts.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset(orderedProducts[index].image),
                title: Text(orderedProducts[index].name),
                subtitle: Text('Quantity: ${orderedProducts[index].quantity}'),
                trailing: Text('\$${orderedProducts[index].price * orderedProducts[index].quantity}'),
              );
            },
          ),
          Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}'),
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
  int quantity;

  Product(this.name, this.image, this.description, this.price, {this.quantity = 1});
}