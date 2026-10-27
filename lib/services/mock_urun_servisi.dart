import '../models/kategori.dart';
import '../models/urun.dart';
import 'urun_servis.dart';

class MockUrunServisi implements UrunServis {
  final List<Urun> _urunDeposu = const [
    Urun(
      id: 1,
      baslik: "Macbook M5 Pro Laptop",
      aciklama: "Apple'ın yeni işlemcili güçlü laptopu. 16GB RAM, 512GB SSD",
      fiyat: 199999.99,
      resimUrl: "https://picsum.photos/200/300",
      kategori: Kategori.elektronik,
      stokAdedi: 5,
    ),
    Urun(
      id: 2,
      baslik: "Apple iPhone 18 Pro Max",
      aciklama: "Apple'ın en güçlü işlemcili ve kamera sistemli telefonu. Titanyum gövde, 5G.",
      fiyat: 149999.99,
      resimUrl: "https://picsum.photos/200/300",
      kategori: Kategori.elektronik,
      stokAdedi: 8,
    ),
    Urun(
      id: 3,
      baslik: "Erkek L Gömlek",
      aciklama: "Gömlek",
      fiyat: 499.99,
      resimUrl: "https://picsum.photos/200/300",
      kategori: Kategori.giyim,
      stokAdedi: 12,
    ),
    Urun(
      id: 4,
      baslik: "Erkek Deri Ayakkabı",
      aciklama: "Erkek Deri Ayakkabı",
      fiyat: 499.99,
      resimUrl: "https://picsum.photos/200/300",
      kategori: Kategori.ayakkabi,
      stokAdedi: 15,
    ),
    Urun(
      id: 5,
      baslik: "Kız Çocuk Elbise",
      aciklama: "Kız Çocuk Elbise",
      fiyat: 999.99,
      resimUrl: "https://picsum.photos/200/300",
      kategori: Kategori.giyim,
      stokAdedi: 15,
    ),
    Urun(
      id: 6,
      baslik: "Bileklik",
      aciklama: "Bileklik",
      fiyat: 199.99,
      resimUrl: "https://picsum.photos/200/300",
      kategori: Kategori.aksesuar,
      stokAdedi: 50,
    ),
    Urun(
      id: 7,
      baslik: "Apple Watch Serisi 10",
      aciklama: "Apple'ın yeni işlemcili güçlü akıllı saati. Titanyum gövde, GPS, cellular.",
      fiyat: 39999.99,
      resimUrl: "https://picsum.photos/200/300",
      kategori: Kategori.elektronik,
      stokAdedi: 5,
    ),
    Urun(
      id: 8,
      baslik: "Kulaklık",
      aciklama: "Kulaklık",
      fiyat: 999.99,
      resimUrl: "https://picsum.photos/200/300",
      kategori: Kategori.elektronik,
      stokAdedi: 30,
    ),
    Urun(
      id: 9,
      baslik: "Oyuncak Araba",
      aciklama: "Oyuncak Araba",
      fiyat: 199.99,
      resimUrl: "https://picsum.photos/200/300",
      kategori: Kategori.aksesuar,
      stokAdedi: 50,
    ),
  ];

  @override
  Future<List<Urun>> tumUrunleriGetir() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return List.from(_urunDeposu);
  }

  @override
  Future<List<Urun>> kategoriyeGoreGetir(Kategori kategori) async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (kategori == Kategori.hepsi) {
      return List.from(_urunDeposu);
    }
    return _urunDeposu.where((urun) => urun.kategori == kategori).toList();
  }

  @override
  Future<List<Urun>> adaGoreAra(String aramaMetni) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (aramaMetni.trim().isEmpty) {
      return List.from(_urunDeposu);
    }
    return _urunDeposu.where((urun) {
      final baslikKucuk = urun.baslik.toLowerCase();
      final arananKucuk = aramaMetni.toLowerCase();
      return baslikKucuk.contains(arananKucuk);
    }).toList();
  }
}