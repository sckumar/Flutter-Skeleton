import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter E-commerce App',
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
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
    Product('Product 1', 'assets/product1.png', 'Description 1', 10.0),
    Product('Product 2', 'assets/product2.png', 'Description 2', 20.0),
    // Add more products as needed
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
            trailing: ElevatedButton(
              onPressed: () {
                // Add to cart functionality
              },
              child: Text('Add to Cart'),
            ),
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
        children: [
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
  // This should be replaced with actual cart data
  final List<CartItem> cartItems = [
    CartItem(Product('Product 1', 'assets/product1.png', 'Description 1', 10.0), 1),
    CartItem(Product('Product 2', 'assets/product2.png', 'Description 2', 20.0), 2),
    // Add more cart items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Cart')),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(cartItems[index].product.image),
            title: Text(cartItems[index].product.name),
            subtitle: Text('Quantity: ${cartItems[index].quantity}'),
            trailing: Text('\$${cartItems[index].product.price * cartItems[index].quantity}'),
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

classCheckoutPage extends StatelessWidget {
  // This should be replaced with actual user and cart data
  final User user = User('John Doe', '123 Main St', '555-555-5555');
  final List<CartItem> cartItems = [
    CartItem(Product('Product 1', 'assets/product1.png', 'Description 1', 10.0), 1),
    CartItem(Product('Product 2', 'assets/product2.png', 'Description 2', 20.0), 2),
    // Add more cart items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(user.name),
              Text(user.address),
              Text(user.contact),
              SizedBox(height: 20),
              Text('Order Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(cartItems[index].product.image),
                    title: Text(cartItems[index].product.name),
                    subtitle: Text('Quantity: ${cartItems[index].quantity}'),
                    trailing: Text('\$${cartItems[index].product.price * cartItems[index].quantity}'),
                  );
                },
              ),
              SizedBox(height: 20),
              Text('Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              // Add payment method selection here
              SizedBox(height: 20),
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
      ),
    );
  }
}

class OrderConfirmationPage extends StatelessWidget {
  // This should be replaced with actual order data
  final Order order = Order('123456', DateTime.now(), [
    CartItem(Product('Product 1', 'assets/product1.png', 'Description 1', 10.0), 1),
    CartItem(Product('Product 2', 'assets/product2.png', 'Description 2', 20.0), 2),
    // Add more ordered items as needed
  ], 50.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Confirmation')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Thank you for your order!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Order Number: ${order.orderNumber}'),
            Text('Order Date: ${order.date}'),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: order.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(order.items[index].product.image),
                  title: Text(order.items[index].product.name),
                  subtitle: Text('Quantity: ${order.items[index].quantity}'),
                  trailing: Text('\$${order.items[index].product.price * order.items[index].quantity}'),
                );
              },
            ),
            SizedBox(height: 20),
            Text('Total Amount: \$${order.totalAmount}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// Models
class Product {
  final String name;
  final String image;
  final String description;
  final double price;

  Product(this.name, this.image, this.description, this.price);
}

class CartItem {
  final Product product;
  int quantity;

  CartItem(this.product, this.quantity);
}

class User {
  final String name;
  final String address;
  final String contact;

  User(this.name, this.address, this.contact);
}

class Order {
  final String orderNumber;
  final DateTime date;
  final List<CartItem> items;
  final double totalAmount;

  Order(this.orderNumber, this.date, this.items, this.totalAmount);
}

// Note: The assets used in the code (e.g., 'assets/product1.png') need to be added to your Flutter project.
// Also, the code assumes that the user is already logged in and does not handle user authentication or state management.