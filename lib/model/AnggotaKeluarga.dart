class AnggotaKeluarga {
  final String NIK;
  final String NamaLengkap;
  final String JenisKelamin;
  final String TempatLahir;
  final String Agama;
  final String Pendidikan;
  final String Pekerjaan;
  final String StatusPernikahan;
  final String StatusDalamKeluarga;
  final String Kewarganegaraan;
  final String NamaAyah;
  final String NamaIbu;

  final int NoKK;

  AnggotaKeluarga(
      {required this.NIK,
      required this.NamaLengkap,
      required this.JenisKelamin,
      required this.TempatLahir,
      required this.Agama,
      required this.Pendidikan,
      required this.Pekerjaan,
      required this.StatusPernikahan,
      required this.StatusDalamKeluarga,
      required this.Kewarganegaraan,
      required this.NamaAyah,
      required this.NamaIbu,
      required this.NoKK
      });

  factory AnggotaKeluarga.fromSqfliteDatabase(Map<String, dynamic> map) =>
      AnggotaKeluarga(
        NIK: map['NIK'], 
        NamaLengkap: map['NamaLengkap'], 
        JenisKelamin: map['JenisKelamin'], 
        TempatLahir: map['TempatLahir'], 
        Agama: map['Agama'], 
        Pendidikan: map['Pendidikan'], 
        Pekerjaan: map['Pekerjaan'], 
        StatusPernikahan: map['StatusPernikahan'], 
        StatusDalamKeluarga: map['StatusDalamKeluarga'], 
        Kewarganegaraan: map['Kewarganegaraan'], 
        NamaAyah: map['NamaAyah'], 
        NamaIbu: map['NamaIbu'],
        NoKK: map['NoKK']);
}
