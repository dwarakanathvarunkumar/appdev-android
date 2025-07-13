class AppConstants {
  static const String appName = 'SellerCart';
  static const String appVersion = '1.0.0';
  
  static const List<String> userCategories = [
    'Freelancer',
    'Retailer',
    'Agro',
    'Services',
    'Manufacturing',
    'Other',
  ];
  
  static const List<String> cardTemplates = [
    'modern-blue',
    'classic-white',
    'elegant-dark',
  ];
  
  static const Map<String, String> templateNames = {
    'modern-blue': 'Modern Blue',
    'classic-white': 'Classic White',
    'elegant-dark': 'Elegant Dark',
  };
  
  static const int maxProducts = 50;
  static const int maxImageSizeKB = 2048;
  
  static const String whatsappBaseUrl = 'https://wa.me/';
  static const String qrCodeBaseUrl = 'https://sellercart.app/card/';
}
