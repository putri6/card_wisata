import 'package:flutter/material.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          _buildContainerWithImage(
            'assets/foto.png', // Replace with your image path
            "Lembang",
          ),
          _buildContainerWithImage(
            'assets/image.jpeg', // Replace with your image path
            'Ciwidey',
          ),
          _buildContainerWithImage(
            'assets/image3.jpg', // Replace with your image path
            'Soreang',
          ),
          _buildContainerWithImage(
            'assets/image4.jpg', // Replace with your image path
            'Kota Bandung',
          ),
          
        ],
      ),
    );
  }

  Widget _buildContainerWithImage(String imagePath, String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: AssetImage('assets/foto.png'), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 100, // Adjust the width of the image
            height: 100, // Adjust the height of the image
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    
  }
}
