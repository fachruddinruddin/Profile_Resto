import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'Palm Beach Resort';
    biodata['email'] = 'poenyoex@gmail.com';
    biodata['phone'] = '+62895360785093';
    biodata['image'] = 'profile.png';
    biodata['desc'] =
        "Tempat makan yang nyaman dengan berbagai pilihan menu yang sedap dan terjangkau.";
    biodata['addr'] = 'Jl. Jepara No.1, Jawa Tengah';
    biodata['menu'] =
        '1. Ayam Goreng\n2. Nasi Goreng\n3. Mie Goreng\n4. Sate Ayam\n5. Es Teh Manis';
    biodata['open_hours'] =
        'Senin - Sabtu: 10:00 - 21:00\nMinggu: 12:00 - 22:00';
    biodata['latitude'] = '-6.9823';
    biodata['longitude'] = '110.4091';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile Resto",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile Resto",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: double.infinity,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 122, 122, 122)),
                child: Text(
                  biodata['name'] ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  btnContact(Icons.email, Colors.green[900],
                      "mailto:${biodata['email']}"),
                  btnContact(Icons.map, Colors.blueAccent,
                      "https://www.google.com/maps/search/?api=1&query=${biodata['latitude']},${biodata['longitude']}"),
                  btnContact(Icons.phone, Colors.deepPurple,
                      "tel:${biodata['phone']}"),
                ],
              ),
              SizedBox(height: 16),
              teksKotak(Colors.black38, 'Deskripsi'),
              SizedBox(height: 10),
              Text(
                biodata['desc'] ?? '',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              teksKotak(Colors.black38, 'List Menu'),
              SizedBox(height: 10),
              Text(
                biodata['menu'] ?? '',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              teksKotak(Colors.black38, 'Lokasi'),
              SizedBox(height: 10),
              Text(
                biodata['addr'] ?? '',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 5),
              ElevatedButton.icon(
                onPressed: () async {
                  await launch(
                      "https://www.google.com/maps/search/?api=1&query=${biodata['latitude']},${biodata['longitude']}");
                },
                icon: Icon(Icons.location_on),
                label: Text('Buka di Maps'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              teksKotak(Colors.black38, 'Jam Buka'),
              SizedBox(height: 10),
              Text(
                biodata['open_hours'] ?? '',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> launch(String uri) async {
  if (!await launchUrl(Uri.parse(uri))) {
    throw Exception('Tidak dapat memanggil : $uri');
  }
}

Expanded btnContact(IconData icon, Color? color, String uri) {
  return Expanded(
    child: ElevatedButton(
      onPressed: () async {
        await launch(uri);
      },
      child: Icon(icon),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
    ),
  );
}

Row textAttribute(String judul, String teks) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 80,
        child: Text(
          '- $judul ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      Text(
        ': ',
        style: TextStyle(fontSize: 18),
      ),
      Expanded(
        child: Text(
          teks,
          style: TextStyle(fontSize: 18),
        ),
      ),
    ],
  );
}

Container teksKotak(Color bgColor, String teks) {
  return Container(
    padding: EdgeInsets.all(10),
    alignment: Alignment.center,
    width: double.infinity,
    decoration: BoxDecoration(color: bgColor),
    child: Text(
      teks,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );
}
