import 'package:flutter/material.dart';

void main() {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchResultsPage(searchQuery: value),
                  ),
                );
              },
              decoration: InputDecoration(
                labelText: 'Search for a location',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('27°C', style: TextStyle(fontSize: 48)),
                  Text('Sunny', style: TextStyle(fontSize: 24)),
                  Text('Your Location', style: TextStyle(fontSize: 18)),
                  // Mock forecast data
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('Mon'),
                          Icon(Icons.wb_sunny),
                          Text('29°C'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Tue'),
                          Icon(Icons.wb_cloudy),
                          Text('24°C'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Wed'),
                          Icon(Icons.wb_sunny),
                          Text('30°C'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchResultsPage extends StatelessWidget {
  final String searchQuery;

  SearchResultsPage({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    // Mock search results data
    final searchResults = [
      {'location': 'New York', 'temperature': '22°C', 'condition': 'Cloudy'},
      {'location': 'London', 'temperature': '18°C', 'condition': 'Rainy'},
      {'location': 'Sydney', 'temperature': '25°C', 'condition': 'Sunny'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchResults[index]['location']!),
            subtitle: Text(searchResults[index]['condition']!),
            trailing: Text(searchResults[index]['temperature']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LocationDetailsPage(location: searchResults[index]['location']!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class LocationDetailsPage extends StatelessWidget {
  final String location;

  LocationDetailsPage({required this.location});

  @override
  Widget build(BuildContext context) {
    // Mock detailed weather data
    final weatherDetails = {
      'temperature': '22°C',
      'condition': 'Cloudy',
      'windSpeed': '10 km/h',
      'humidity': '75%',
      'forecast': [
        {'day': 'Thu', 'condition': 'Sunny', 'temperature': '26°C'},
        {'day': 'Fri', 'condition': 'Rainy', 'temperature': '20°C'},
        {'day': 'Sat', 'condition': 'Cloudy', 'temperature': '22°C'},
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(location),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(weatherDetails['temperature']!, style: TextStyle(fontSize: 48)),
            Text(weatherDetails['condition']!, style: TextStyle(fontSize: 24)),
           Text('Wind: ${weatherDetails['windSpeed']}', style: TextStyle(fontSize: 18)),
            Text('Humidity: ${weatherDetails['humidity']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Forecast for the next days:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: weatherDetails['forecast']!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(weatherDetails['forecast']![index]['day']!),
                    trailing: Text(weatherDetails['forecast']![index]['temperature']!),
                    leading: Icon(
                      weatherDetails['forecast']![index]['condition'] == 'Sunny'
                          ? Icons.wb_sunny
                          : weatherDetails['forecast']![index]['condition'] == 'Rainy'
                              ? Icons.beach_access
                              : Icons.wb_cloudy,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}