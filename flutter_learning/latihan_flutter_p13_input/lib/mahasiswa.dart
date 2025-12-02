class Mahasiswa {
  String nim;
  String nama;

  Mahasiswa({required this.nim, required this.nama});

  factory Mahasiswa.fromMap(Map<String, dynamic> map) {
    return Mahasiswa(nim: map['nim'], nama: map['nama']);
  }

  Map<String, dynamic> toMap() {
    return {'nim': nim, 'nama': nama};
  }
}
