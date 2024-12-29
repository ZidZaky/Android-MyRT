import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = "http://10.0.2.2:8000/api/kartu-keluarga";

class ApiService {
  static Future<List> fetchItems() async {
    final response = await http.get(Uri.parse('$baseUrl'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal Melakukan Fetch Data');
    }
  }

  static Future<void> addItem(Map<String, dynamic> item) async {
    final response = await http.post(
      Uri.parse('$baseUrl'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(item),
    );
    if (response.statusCode != 201) {
      throw Exception('Gagal Menambahkan Data');
    }
  }

  static Future<void> updateItem(int id, Map<String, dynamic> item) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(item),
    );
    if (response.statusCode != 200) {
      throw Exception('Gagal Melakukan Update Data');
    }
  }

  static Future<void> deleteItem(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Gagal Melakukan Hapus Data');
    }
  }
}
