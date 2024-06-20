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
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product('Product 1', 'assets/product1.png', 'Description of product 1', 10.0),
    Product('Product 2', 'assets/product2.png', 'Description of product 2', 15.0),
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
            trailing: ElevatedButton(
              onPressed: () {
                // Add to cart functionality
              },
              child: Text('Add to Cart'),
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
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
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
    CartItem(Product('Product 1', 'assets/product1.png', 'Description of product 1', 10.0), 1),
    CartItem(Product('Product 2', 'assets/product2.png', 'Description of product 2', 15.0), 2),
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
            trailing: Text('\$${(cartItems[index].product.price * cartItems[index].quantity).toString()}'),
            onTap: () {
              // Removefrom cart functionality
              // You would typically call a function here to remove the item from the cart
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
                // Implement remove all functionality
              },
              child: Text('Remove All'),
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
      CartItem(Product('Product 1', 'assets/product1.png', 'Description of product 1', 10.0), 1),
      CartItem(Product('Product 2', 'assets/product2.png', 'Description of product 2', 15.0), 2),
      // Add more checkout items as needed
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // User details form
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
              SizedBox(height: 24),
              // Order summary
              Text('Order Summary', style: TextStyle(fontSize: 20)),
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
              SizedBox(height: 24),
              // Payment method selection
              // For simplicity, we're not implementing actual payment methods here
              Text('Payment Method', style: TextStyle(fontSize: 20)),
              ListTile(
                title: Text('Credit Card'),
                leading: Radio(
                  value: 'CreditCard',
                  groupValue: 'PaymentMethod',
                  onChanged: (value) {
                    // Handle payment method change
                  },
                ),
              ),
              ListTile(
                title: Text('PayPal'),
                leading: Radio(
                  value: 'PayPal',
                  groupValue: 'PaymentMethod',
                  onChanged: (value) {
                    // Handle payment method change
                  },
                ),
              ),
              SizedBox(height: 24),
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
  @override
  Widget build(BuildContext context) {
    // This should be your order details
    final orderDetails = OrderDetails(
      orderNumber: '123456',
      orderDate: DateTime.now(),
      orderedProducts: [
        OrderedProduct(Product('Product 1', 'assets/product1.png', 'Description of product 1', 10.0), 1),
        OrderedProduct(Product('Product 2', 'assets/product2.png', 'Description of product 2', 15.0), 2),
        // Add more ordered products as needed
      ],
      totalAmount: 40.0,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Order Confirmation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Thank you for your purchase!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            Text('Order Number: ${orderDetails.orderNumber}'),
            Text('Order Date: ${orderDetails.orderDate}'),
            SizedBox(height: 16),
            Text('Order Details:', style: TextStyle(fontSize: 20)),
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
            SizedBox(height: 16),
            Text('Total Amount: \$${orderDetails.totalAmount.toString()}', style: TextStyle(fontSize: 20)),
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
      appBar: AppBar(title: Text('Create Account')),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductListPage()),
                  );
                },
                child: Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminProductCreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Product')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // Image upload would be handled here
              // For simplicity, we're just using a placeholder
              TextField(
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductListPage()),
                  );
                },
                child: Text('Create Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Models for simplicity
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
  final DateTime orderDate;
  final List<OrderedProduct> orderedProducts;
  final double totalAmount;

  OrderDetails({
    required this.orderNumber,
    required this.orderDate,
    required this.orderedProducts,
    required this.totalAmount,
  });
}

class OrderedProduct {
  final Product product;
  final int quantity;

  OrderedProduct(this.product, this.quantity);
}