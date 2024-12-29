import 'package:flutter/material.dart';
import 'package:android_myrt/services/api_service.dart';


class AddKartuKeluarga extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController noKKController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  void addItem(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> item = {
        "NoKK": noKKController.text,
        "Alamat": alamatController.text,
      };

      try {
        await ApiService.addItem(item);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Item added successfully!")));
        Navigator.pop(context); // Go back to the previous screen
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Failed to add item")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Kartu Keluarga"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: noKKController,
                decoration: InputDecoration(labelText: "Nomor Kartu Keluarga"),
                validator: (value) => value!.isEmpty ? "NoKK Tidak Bisa Kosong" : null,
              ),
              TextFormField(
                controller: alamatController,
                decoration: InputDecoration(labelText: "Alamat"),
                validator: (value) => value!.isEmpty ? "Alamat Tidak Bisa Kosong" : null,
              ),
              
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => addItem(context),
                child: Text("Tambah Kartu Keluarga"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
