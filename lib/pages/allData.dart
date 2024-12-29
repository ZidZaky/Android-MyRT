import 'package:flutter/material.dart';
import 'package:android_myrt/services/api_service.dart';
import 'package:android_myrt/pages/detailKartuKeluarga.dart';

class AllData extends StatefulWidget {
  const AllData({super.key});

  @override
  State<AllData> createState() => _AllDataState();
}

class _AllDataState extends State<AllData> {
  String searchQuery = "";
  List<Map<String, dynamic>> allData = []; // Store the original data
  List<Map<String, dynamic>> filteredData = [];
  bool isLoading = true; // To manage loading state

  @override
  void initState() {
    super.initState();
    fetchKartuKeluargaData();
  }

  Future<void> fetchKartuKeluargaData() async {
    try {
      List items = await ApiService.fetchItems();
      setState(() {
        allData = List<Map<String, dynamic>>.from(items); // Store original data
        filteredData =
            List<Map<String, dynamic>>.from(items); // Initially show all data
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: $e');
    }
  }

  void filterData(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      if (searchQuery.isEmpty) {
        // Reset to all data when the search query is empty
        filteredData = List<Map<String, dynamic>>.from(allData);
      } else {
        // Filter based on the search query
        filteredData = allData.where((item) {
          final noKK = item['NoKK']?.toString().toLowerCase() ?? '';
          return noKK.contains(searchQuery);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Kartu Keluarga"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Show loading indicator
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Cari Kartu Keluarga',
                      hintText: 'Masukkan No KK',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: filterData,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      final kartuKeluarga = filteredData[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        elevation:
                            3, // Adjust elevation to make the card stand out
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Optional: Rounded corners for the entire card
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners for the image
                            child: Stack(
                              children: [
                                // Fallback Container (black solid background)
                                Container(
                                  width: 60,
                                  height: 90,
                                  color: Colors.black, // Solid black background
                                ),
                                // Image with fallback
                                Image.network(
                                  kartuKeluarga['kkImageUrl'] ??
                                      '', // Default empty string
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 60,
                                      height: 90,
                                      color: Colors
                                          .black, // Fallback to black color
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          title: Text('No KK: ${kartuKeluarga['NoKK']}'),
                          subtitle: Text('Alamat: ${kartuKeluarga['alamat']}'),
                          trailing: const Icon(Icons.arrow_forward),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Detailkartukeluarga(data: kartuKeluarga),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
