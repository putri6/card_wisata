import 'package:flutter/material.dart';

void main() {
  runApp(DetailsScreen());
}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halaman Wisata',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Halaman Wisata'),
        ),
        body: Stack(
          children: [
            Container(
              color: const Color.fromARGB(255, 227, 224, 220), // Placeholder color
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white, // Placeholder color
                    ),
                    height: 400,
                    width: double.infinity, // Mengubah lebar menjadi mengisi keseluruhan layar
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 600, // Ukuran kontainer gambar yang baru
                          height: 400,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/image.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 50), // Spacer antara gambar dan container baru
                        Expanded(
                          child: Container(
                            width: 600,
                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: const Color.fromARGB(255, 221, 226, 230), // Placeholder color
                            ),
                            child: Stack(
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        'Kawah Putih', // Placeholder text
                                        style: TextStyle(fontSize: 20, color: Colors.black),
                                        textAlign: TextAlign.center, // Menempatkan teks di tengah
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.calendar_today, color: Colors.black), // Icon untuk tanggal
                                          SizedBox(width: 10), // Jarak antara ikon dan teks
                                          Text(
                                            'Open Tuesday - Saturday', // Placeholder teks lain
                                            style: TextStyle(fontSize: 16, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10), // Spacer antara deskripsi dan teks lain
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.access_time, color: Colors.black), // Icon untuk jam
                                          SizedBox(width: 10), // Jarak antara ikon dan teks
                                          Text(
                                            '09.00 - 17.00 Wib', // Placeholder teks lain
                                            style: TextStyle(fontSize: 16, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.attach_money, color: Colors.black), // Icon untuk dolar 
                                          SizedBox(width: 10), // Jarak antara ikon dan teks
                                          Text(
                                            'Harga Tiket : 50.000', // Placeholder teks lain
                                            style: TextStyle(fontSize: 16, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        'Kawah Putih adalah sebuah danau vulkanik yang terletak di kawasan Ciwidey, \nKabupaten Bandung, Jawa Barat, Indonesia. Tempat ini terkenal karena air danau yang memiliki warna putih kehijauan akibat \ndari kandungan belerang yang tinggi dalam airnya. Kawah Putih merupakan salah satu tujuan wisata populer di Jawa Barat, \nmenarik wisatawan dengan keindahan alamnya yang unik dan pemandangan yang menakjubkan.', // Placeholder teks lain
                                        style: TextStyle(fontSize: 16, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: IconButton(
                                    onPressed: () {
                                      // Toggle favorite status
                                      _toggleFavorite();
                                    },
                                    icon: Icon(
                                      isFavorited ? Icons.favorite : Icons.favorite_border,
                                      color: isFavorited ? Colors.red : Colors.black,
                                    ), // Favorit icon love
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3, // Jumlah gambar
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 20 : 5),
                          child: buildImageContainer(getImageUrl(index)),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageContainer(String imageUrl) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  String getImageUrl(int index) {
    List<String> urls = [
      'https://awsimages.detik.net.id/community/media/visual/2022/05/03/kawasan-wisata-kawah-putih-1_169.jpeg?w=1200',
      'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/07/28/Kawah-Putih-3634976765.jpg',
      'https://osccdn.medcom.id/images/content/2021/12/21/d7b87db10e3ee88f0de7d25d4cd433df.jpg'
    ];
    return urls[index];
  }
}
