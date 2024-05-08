import 'package:flutter/material.dart';  
  
void main() {  
  runApp(MyApp());  
}  
  
class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      title: 'Product App',  
      theme: ThemeData(  
        primarySwatch: Colors.blue,  
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
        child: ElevatedButton(  
          onPressed: () {  
            // Perform login logic here  
            Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => ProductListPage()),  
            );  
          },  
          child: Text('Login'),  
        ),  
      ),  
    );  
  }  
}  
  
class ProductListPage extends StatelessWidget {  
  final List<Product> products = [  
    Product(  
      name: 'Product 1',  
      description: 'This is the first product.',  
      price: 9.99,  
      image: 'assets/product1.png',  
    ),  
    Product(  
      name: 'Product 2',  
      description: 'This is the second product.',  
      price: 19.99,  
      image: 'assets/product2.png',  
    ),  
    // Add more products here  
  ];  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: Text('Products'),  
      ),  
      body: ListView.builder(  
        itemCount: products.length,  
        itemBuilder: (context, index) {  
          return ListTile(  
            leading: Image.asset(products[index].image),  
            title: Text(products[index].name),  
            subtitle: Text(products[index].description),  
            trailing: Text('\$${products[index].price.toStringAsFixed(2)}'),  
            onTap: () {  
              Navigator.push(  
                context,  
                MaterialPageRoute(  
                  builder: (context) => ProductDetailPage(product: products[index]),  
                ),  
              );  
            },  
          );  
        },  
      ),  
    );  
  }  
}  
  
class ProductDetailPage extends StatelessWidget {  
  final Product product;  
  
  ProductDetailPage({required this.product});  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: Text(product.name),  
      ),  
      body: Center(  
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,  
          children: [  
            Image.asset(product.image),  
            SizedBox(height: 20),  
            Text(product.description),  
            SizedBox(height: 20),  
            Text('Price: \$${product.price.toStringAsFixed(2)}'),  
            SizedBox(height: 20),  
            ElevatedButton(  
              onPressed: () {  
                // Perform purchase logic here  
              },  
              child: Text('Buy Now'),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}  
  
class Product {  
  final String name;  
  final String description;  
  final double price;  
  final String image;  
  
  Product({required this.name, required this.description, required this.price, required this.image});  
}  
