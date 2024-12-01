import 'package:flutter/material.dart';

void main() {
  runApp(const ClothesApp());
}

class ClothesApp extends StatelessWidget {
  const ClothesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '211172',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class Clothing {
  final String name;
  final String image;
  final String price;
  final String description;

  Clothing(
      {required this.name,
      required this.image,
      required this.price,
      required this.description});
}

class DetailsScreen extends StatelessWidget {
  final Clothing clothing;

  const DetailsScreen({required this.clothing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clothing.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                clothing.image,
                height: 300,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              clothing.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              clothing.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Price: ${clothing.price}',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Clothing> clothes = [
    Clothing(
        name: "Ugly Christmas Sweater",
        image: "assets/images/picture1.jpg",
        price: "\$50",
        description: "Men's ugly Christmas sweater"),
    Clothing(
        name: "Christmas Socks",
        image: "assets/images/picture2.jpg",
        price: "\$15",
        description: "Green Christmas socks"),
    Clothing(
        name: "Christmas Pyjamas",
        image: "assets/images/picture3.jpg",
        price: "\$35",
        description: "Christmas pyjama pants with cars"),
    Clothing(
        name: "Christmas Bennie",
        image: "assets/images/picture4.jpg",
        price: "\$20",
        description: "Green Christmas bennie with reindeers"),
    Clothing(
        name: "Christmas Shirt",
        image: "assets/images/picture5.jpg",
        price: "\$40",
        description: "Men's red dress shirt with Christmas trees"),
    Clothing(
        name: "Christmas T-Shirt",
        image: "assets/images/picture6.jpg",
        price: "\$25",
        description: "Men's red t-shirt with Christmas quote"),
    Clothing(
        name: "Christmas Gloves",
        image: "assets/images/picture7.jpg",
        price: "\$30",
        description: "Kid's red Christmas funky gloves"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('211172'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 3 / 4,
            ),
            itemCount: clothes.length,
            itemBuilder: (context, index) {
              final clothing = clothes[index];
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(clothing: clothing),
                      ),
                    );
                  },
                  child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              clothes[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text(
                                  clothing.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 4.0),
                                Text(clothing.price,
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 14))
                              ]))
                        ],
                      )));
            }),
      ),
    );
  }
}
