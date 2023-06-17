class AppConstants {
  static final AppConstants _instance = AppConstants._internal();
  static AppConstants get instance => _instance;
  AppConstants._internal();

  final String appName = "İşlemsel Zeka ve Derin Öğrenme Quiz Uygulaması";
  final String appVersion = "v1.0.0";
  final String appDescription = """
                      Bu uygulama, İşlemsel Zeka ve Derin Öğrenme dersi için hazırlanmıştır. 
                      Uygulama, güncel olarak 26 sorudan oluşan bir quiz içermektedir.
                      Soruların cevapları doğru ve yanlış olarak ayrılmıştır.
                      Soruların cevaplarına göre puanlama yapılmaktadır.
                      Uygulama, 100 üzerinden puanlama yapmaktadır.
                      Uygulama, 100 üzerinden 100 puan alanları "MÜKEMMEL" olarak kabul etmektedir.
                      Uygulama, 100 üzerinden 70 ve üzeri puan alanları 'BAŞARILI' olarak kabul etmektedir.
                      Uygulama, 100 üzerinden 70 altı puan alanları 'BAŞARISIZ' olarak kabul etmektedir.
                      """;
  final String preparedBy = "Mehmet AKDUMAN";
}
