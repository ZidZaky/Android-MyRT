class KartuKeluarga {
  final int NoKK;
  final String alamat;

  KartuKeluarga({required this.NoKK, required this.alamat});

  factory KartuKeluarga.fromSqfliteDatabase(Map<String, dynamic> map) => KartuKeluarga(
    NoKK: map['NoKK'],
    alamat: map['alamat']
  );
}