import 'package:flutter/material.dart';
import './apptheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter E-commerce App',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
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
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product('Product 1', 'assets/1.jpg', 'This is product 1 description', 10.0),
    Product('Product 2', 'assets/2.jpg', 'This is product 2 description', 20.0),
    Product('Product 3', 'assets/3.jpg', 'This is product 1 description', 10.0),
    Product('Product 4', 'assets/4.jpg', 'This is product 2 description', 20.0),
    Product('Product 3', 'assets/3.jpg', 'This is product 1 description', 10.0),
    Product('Product 4', 'assets/4.jpg', 'This is product 2 description', 20.0),
    Product('Product 3', 'assets/3.jpg', 'This is product 1 description', 10.0),
    Product('Product 4', 'assets/4.jpg', 'This is product 2 description', 20.0),
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
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(product.image),
          Text(product.name, style: TextStyle(fontSize: 24)),
          Text(product.description),
          Text('\$${product.price.toString()}', style: TextStyle(fontSize: 18)),
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
  // This should be your cart data
  final List<CartItem> cartItems = [
    CartItem(Product('Product 1', 'assets/product1.png', 'This is product 1 description', 10.0), 1),
    // Add more cart items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(cartItems[index].product.image),
            title: Text(cartItems[index].product.name),
            subtitle: Text('Quantity: ${cartItems[index].quantity}'),
            trailing: Text('\$${(cartItems[index].product.price * cartItems[index].quantity).toString()}'),
            isThreeLine: true,
            dense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            onTap: () {
              // This could show more details or edit the quantity
            },
            onLongPress: () {
              // Remove item from cart functionality
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              onPressed: () {
                // Remove all items from cart functionality
              },
              child: Text('Clear Cart'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutPage()),
                );
              },
              child: Text('Proceed to Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This should be your checkout data
    final List<CartItem> checkoutItems = [
      CartItem(Product('Product 1', 'assets/product1.png', 'This is product 1 description', 10.0), 1),
      // Add more checkout items here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // User details form
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Contact Information',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            // Order summary
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: checkoutItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(checkoutItems[index].product.image),
                  title: Text(checkoutItems[index].product.name),
                  subtitle: Text('Quantity: ${checkoutItems[index].quantity}'),
                  trailing: Text('\$${(checkoutItems[index].product.price * checkoutItems[index].quantity).toString()}'),
                );
              },
            ),
            // Payment method selection
            // For simplicity, we're not implementing actual payment method selection
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text('Select Payment Method', style: TextStyle(fontSize: 18)),
                  // Add payment method selection here
                ],
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
    // This should be your order details
    final orderDetails = OrderDetails(
      orderNumber: '123456',
      date: DateTime.now(),
      orderedProducts: [
        OrderedProduct(Product('Product 1', 'assets/product1.png', 'This is product 1 description', 10.0), 1),
        // Add more ordered products here
      ],
      totalAmount: 10.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Thank you for your purchase!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            Text('Order Number: ${orderDetails.orderNumber}'),
            Text('Order Date: ${orderDetails.date.toString()}'),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: orderDetails.orderedProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(orderDetails.orderedProducts[index].product.image),
                  title: Text(orderDetails.orderedProducts[index].product.name),
                  subtitle: Text('Quantity: ${orderDetails.orderedProducts[index].quantity}'),
                  trailing: Text('\$${(orderDetails.orderedProducts[index].product.price * orderDetails.orderedProducts[index].quantity).toString()}'),
                );
              },
            ),
            Text('Total Amount: \$${orderDetails.totalAmount.toString()}'),
          ],
        ),
      ),
    );
  }
}

class AccountCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListPage()),
                );
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminProductCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Image upload field would require integration with image picker and backend
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListPage()),
                );
              },
              child: Text('Create Product'),
            ),
          ],
        ),
      ),
    );
  }
}

// Mock data models
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

class OrderDetails {
  final String orderNumber;
  final DateTime date;
  final List<OrderedProduct> orderedProducts;
  final double totalAmount;

  OrderDetails({
    required this.orderNumber,
    required this.date,
    required this.orderedProducts,
    required this.totalAmount,
  });
}

class OrderedProduct {
  final Product product;
  final int quantity;

  OrderedProduct(this.product, this.quantity);
}