import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../shared/models/digital_card_model.dart';
import '../widgets/card_template_widget.dart';

class CardPreviewScreen extends StatelessWidget {
  final DigitalCardModel card;
  
  const CardPreviewScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Preview'),
        actions: [
          IconButton(
            onPressed: () => _shareCard(context),
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardTemplateWidget(card: card),
            
            const SizedBox(height: 24),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'QR Code',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: QrImageView(
                        data: card.qrCodeLink,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Scan to view digital card',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _shareCard(context),
                    icon: const Icon(Icons.share),
                    label: const Text('Share Card'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _openWhatsApp(context),
                    icon: const Icon(Icons.chat),
                    label: const Text('WhatsApp'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _shareCard(BuildContext context) {
    final shareText = '''
🌟 *${card.name}*
${card.designation}
${card.orgName}

📞 ${card.phone}
📧 ${card.email}
${card.whatsapp != null ? '💬 WhatsApp: ${card.whatsapp}' : ''}
${card.address != null ? '📍 ${card.address}' : ''}
${card.website != null ? '🌐 ${card.website}' : ''}

🔗 View my digital card: ${card.qrCodeLink}

📱 Created with SellerCart
''';

    Share.share(shareText);
  }

  void _openWhatsApp(BuildContext context) async {
    if (card.whatsapp != null) {
      final whatsappUrl = 'https://wa.me/${card.whatsapp!.replaceAll(RegExp(r'[^\d]'), '')}';
      final uri = Uri.parse(whatsappUrl);
      
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not open WhatsApp')),
          );
        }
      }
    }
  }
}
