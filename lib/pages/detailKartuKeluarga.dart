import 'package:flutter/material.dart';

class Detailkartukeluarga extends StatelessWidget {
  final Map<String, dynamic> data;

  const Detailkartukeluarga({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Kartu Keluarga - No KK: ${data['noKK']}'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('', // Default empty string
                width: 1000,
                height: 140,
                fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 1000,
                height: 140,
                color: Colors.black, // Fallback to black color
              );
            }),
            Text(
              'No KK: ${data['NoKK']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Alamat: ${data['alamat']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Anggota Keluarga:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: data['anggota'].length,
                itemBuilder: (context, index) {
                  final anggota = data['anggota'][index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      title: Text(
                          anggota['NamaLengkap'] ?? 'Nama Tidak Diketahui'),
                      subtitle: Text(
                          'Status Dalam Keluarga: ${anggota['StatusDalamKeluarga']} - Pekerjaan: ${anggota['Pekerjaan']}'),
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
