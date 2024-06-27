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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListPage()),
                );
              },
            ),
            TextButton(
              child: Text('Forgot Password?'),
              onPressed: () {
                // Implement forgot password functionality
              },
            ),
            TextButton(
              child: Text('Create Account'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountCreationPage()),
                );
              },
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
    Product('Product 2', 'assets/product2.png', 'Description of product 2', 20.0),
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
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(product.image),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(product.name, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 8.0),
                Text(product.description),
                SizedBox(height: 16.0),
                Text('\$${product.price}', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 24.0),
                ElevatedButton(
                  child: Text('Add to Cart'),
                  onPressed: () {
                    // Add to cart functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  final List<CartItem> cartItems = [
    CartItem(Product('Product 1', 'assets/product1.png', 'Description of product 1', 10.0), 1),
    CartItem(Product('Product 2', 'assets/product2.png', 'Description of product 2', 20.0), 2),
    // Add more cart items here
  ];

  @override
  Widget build(BuildContext context)
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
              // Implement tap to view product details if needed
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              child: Text('Remove'),
              onPressed: () {
                // Implement remove from cart functionality
              },
            ),
            ElevatedButton(
              child: Text('Proceed to Checkout'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutPage()),
                );
              },
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
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // User details form fields
            // Order summary
            // Payment method selection
            ElevatedButton(
              child: Text('Place Order'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderConfirmationPage()),
                );
              },
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
    return Scaffold(
      appBar: AppBar(title: Text('Order Confirmation')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Thank you for your order!', style: TextStyle(fontSize: 24.0)),
            // Display order details
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Create Account'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListPage()),
                );
              },
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
      appBar: AppBar(title: Text('Create Product')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            // Image upload field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Create Product'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String image;
  final String description;
  final double price;

  Product(this.name, this.image, this.description, this.price);
}

class CartItem
{
  final Product product;
  int quantity;

  CartItem(this.product, this.quantity);
}

// The following are placeholder widgets for the parts of the UI that require more complex state management or backend integration.
// You should replace these with your actual widgets and logic.

class UserDetailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for user detail form
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16.0),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Address',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16.0),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Contact Information',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for order summary
    return Column(
      children: <Widget>[
        Text('Order Summary', style: TextStyle(fontSize: 20.0)),
        // List of products in the order
      ],
    );
  }
}

class PaymentMethodSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for payment method selection
    return Column(
      children: <Widget>[
        Text('Payment Method', style: TextStyle(fontSize: 20.0)),
        // Payment method options
      ],
    );
  }
}

class OrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder for order details
    return Column(
      children: <Widget>[
        Text('Order Number: #123456', style: TextStyle(fontSize: 18.0)),
        Text('Order Date: ${DateTime.now()}', style: TextStyle(fontSize: 18.0)),
        // List of ordered products with quantity and price
        Text('Total Amount: \$100', style: TextStyle(fontSize: 18.0)),
      ],
    );
  }
}

// The image upload field in the AdminProductCreationPage is not implemented in this code.
// You would typically use a package like image_picker to handle image selection and upload.

// This code is a starting point for a Flutter e-commerce app. It includes the basic UI and navigation flow.
// You will need to integrate it with a backend to handle data storage, authentication, and other functionalities.