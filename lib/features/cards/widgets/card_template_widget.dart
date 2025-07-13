import 'package:flutter/material.dart';
import '../../../shared/models/digital_card_model.dart';

class CardTemplateWidget extends StatelessWidget {
  final DigitalCardModel card;
  
  const CardTemplateWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    switch (card.template) {
      case 'modern-blue':
        return _ModernBlueTemplate(card: card);
      case 'classic-white':
        return _ClassicWhiteTemplate(card: card);
      case 'elegant-dark':
        return _ElegantDarkTemplate(card: card);
      default:
        return _ModernBlueTemplate(card: card);
    }
  }
}

class _ModernBlueTemplate extends StatelessWidget {
  final DigitalCardModel card;
  
  const _ModernBlueTemplate({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            card.designation,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            card.orgName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          _ContactInfo(card: card, textColor: Colors.white),
        ],
      ),
    );
  }
}

class _ClassicWhiteTemplate extends StatelessWidget {
  final DigitalCardModel card;
  
  const _ClassicWhiteTemplate({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            card.designation,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            card.orgName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2196F3),
            ),
          ),
          const SizedBox(height: 16),
          _ContactInfo(card: card, textColor: Colors.black87),
        ],
      ),
    );
  }
}

class _ElegantDarkTemplate extends StatelessWidget {
  final DigitalCardModel card;
  
  const _ElegantDarkTemplate({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            card.designation,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            card.orgName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF03DAC6),
            ),
          ),
          const SizedBox(height: 16),
          _ContactInfo(card: card, textColor: Colors.white),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final DigitalCardModel card;
  final Color textColor;
  
  const _ContactInfo({required this.card, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ContactItem(
          icon: Icons.phone,
          text: card.phone,
          textColor: textColor,
        ),
        const SizedBox(height: 8),
        _ContactItem(
          icon: Icons.email,
          text: card.email,
          textColor: textColor,
        ),
        if (card.whatsapp != null) ...[
          const SizedBox(height: 8),
          _ContactItem(
            icon: Icons.chat,
            text: card.whatsapp!,
            textColor: textColor,
          ),
        ],
        if (card.address != null) ...[
          const SizedBox(height: 8),
          _ContactItem(
            icon: Icons.location_on,
            text: card.address!,
            textColor: textColor,
          ),
        ],
        if (card.website != null) ...[
          const SizedBox(height: 8),
          _ContactItem(
            icon: Icons.web,
            text: card.website!,
            textColor: textColor,
          ),
        ],
      ],
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color textColor;
  
  const _ContactItem({
    required this.icon,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: textColor.withOpacity(0.8),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: textColor.withOpacity(0.9),
            ),
          ),
        ),
      ],
    );
  }
}
