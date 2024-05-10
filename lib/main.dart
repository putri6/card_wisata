import 'package:flutter/material.dart';
import 'package:wisata_card/pages/DetailsScreen_wisata.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Wisata Bandung'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _calculateCrossAxisCount(constraints),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: 24, // Display one row
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GridItem(
                        imagePath: 'assets/image.jpeg',
                        text1: 'Kawah Putih',
                        text2: 'Kawah Putih adalah wisata yang berada di daerah ciwidey',
                        onTap: () {
                          // Navigate to a different screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailsScreen()),
                          );
                        },

                      ),
                      // GridItem(
                      //   imagePath: 'assets/rancaupas.jpg',
                      //   text1: 'Item 2',
                      //   text2: 'Description 2',
                      //   onTap: () {
                      //     print('Item 2 tapped');
                      //   },
                      // ),
                      // GridItem(
                      //   imagePath: 'assets/cikole.jpg',
                      //   text1: 'Item 3',
                      //   text2: 'Description 3',
                      //   onTap: () {
                      //     print('Item 3 tapped');
                      //   },
                      // ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  int _calculateCrossAxisCount(BoxConstraints constraints) {
    double screenWidth = constraints.maxWidth;
    int crossAxisCount = (screenWidth / 200).floor();
    return crossAxisCount > 0 ? crossAxisCount : 1;
  }
}

class GridItem extends StatelessWidget {
  final String imagePath;
  final String text1;
  final String text2;
  final VoidCallback onTap;

  const GridItem({
    required this.imagePath,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imagePath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return CircularProgressIndicator();
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error);
              },
            ),
            SizedBox(height: 8),
            Text(
              text1,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
