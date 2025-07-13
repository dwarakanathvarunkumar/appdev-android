import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../../../shared/providers/auth_provider.dart';
import '../../../shared/providers/cards_provider.dart';
import '../../../shared/models/digital_card_model.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../../../core/app_constants.dart';

class CardFormScreen extends StatefulWidget {
  final DigitalCardModel? card;
  
  const CardFormScreen({super.key, this.card});

  @override
  State<CardFormScreen> createState() => _CardFormScreenState();
}

class _CardFormScreenState extends State<CardFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _designationController = TextEditingController();
  final _orgNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _addressController = TextEditingController();
  final _websiteController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _instagramController = TextEditingController();
  
  String _selectedTemplate = AppConstants.cardTemplates.first;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.card != null;
    
    if (_isEditing) {
      final card = widget.card!;
      _nameController.text = card.name;
      _designationController.text = card.designation;
      _orgNameController.text = card.orgName;
      _phoneController.text = card.phone;
      _emailController.text = card.email;
      _whatsappController.text = card.whatsapp ?? '';
      _addressController.text = card.address ?? '';
      _websiteController.text = card.website ?? '';
      _linkedinController.text = card.socialLinks['linkedin'] ?? '';
      _instagramController.text = card.socialLinks['instagram'] ?? '';
      _selectedTemplate = card.template;
    } else {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      if (authProvider.userProfile != null) {
        final user = authProvider.userProfile!;
        _nameController.text = user.name;
        _orgNameController.text = user.orgName;
        _phoneController.text = user.phone;
        _emailController.text = user.email;
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _designationController.dispose();
    _orgNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _whatsappController.dispose();
    _addressController.dispose();
    _websiteController.dispose();
    _linkedinController.dispose();
    _instagramController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Card' : 'Create Card'),
        actions: [
          TextButton(
            onPressed: () => _saveCard(context),
            child: const Text('Save'),
          ),
        ],
      ),
      body: Consumer<CardsProvider>(
        builder: (context, cardsProvider, child) {
          if (cardsProvider.isLoading) {
            return const LoadingWidget(message: 'Saving card...');
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Template',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _selectedTemplate,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.palette),
                    ),
                    items: AppConstants.cardTemplates.map((template) {
                      return DropdownMenuItem(
                        value: template,
                        child: Text(AppConstants.templateNames[template] ?? template),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedTemplate = value!;
                      });
                    },
                  ),
                  
                  const SizedBox(height: 24),
                  
                  Text(
                    'Basic Information',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name *',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _designationController,
                    decoration: const InputDecoration(
                      labelText: 'Designation *',
                      prefixIcon: Icon(Icons.work),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your designation';
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _orgNameController,
                    decoration: const InputDecoration(
                      labelText: 'Organization Name *',
                      prefixIcon: Icon(Icons.business),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter organization name';
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 24),
                  
                  Text(
                    'Contact Information',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number *',
                      prefixIcon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter phone number';
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email Address *',
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter email address';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _whatsappController,
                    decoration: const InputDecoration(
                      labelText: 'WhatsApp Number',
                      prefixIcon: Icon(Icons.chat),
                      hintText: '+91 9876543210',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      prefixIcon: Icon(Icons.location_on),
                    ),
                    maxLines: 2,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _websiteController,
                    decoration: const InputDecoration(
                      labelText: 'Website',
                      prefixIcon: Icon(Icons.web),
                      hintText: 'https://example.com',
                    ),
                    keyboardType: TextInputType.url,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  Text(
                    'Social Media',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _linkedinController,
                    decoration: const InputDecoration(
                      labelText: 'LinkedIn Profile',
                      prefixIcon: Icon(Icons.link),
                      hintText: 'linkedin.com/in/username',
                    ),
                    keyboardType: TextInputType.url,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _instagramController,
                    decoration: const InputDecoration(
                      labelText: 'Instagram Profile',
                      prefixIcon: Icon(Icons.camera_alt),
                      hintText: 'instagram.com/username',
                    ),
                    keyboardType: TextInputType.url,
                  ),
                  
                  const SizedBox(height: 32),
                  
                  ElevatedButton(
                    onPressed: () => _saveCard(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(_isEditing ? 'Update Card' : 'Create Card'),
                  ),
                  
                  if (cardsProvider.error != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        cardsProvider.error!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _saveCard(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final cardsProvider = Provider.of<CardsProvider>(context, listen: false);
    
    if (authProvider.user == null) return;
    
    final cardId = _isEditing ? widget.card!.id : const Uuid().v4();
    final now = DateTime.now();
    
    final socialLinks = <String, String>{};
    if (_linkedinController.text.trim().isNotEmpty) {
      socialLinks['linkedin'] = _linkedinController.text.trim();
    }
    if (_instagramController.text.trim().isNotEmpty) {
      socialLinks['instagram'] = _instagramController.text.trim();
    }
    
    final card = DigitalCardModel(
      id: cardId,
      userId: authProvider.user!.uid,
      template: _selectedTemplate,
      name: _nameController.text.trim(),
      designation: _designationController.text.trim(),
      orgName: _orgNameController.text.trim(),
      phone: _phoneController.text.trim(),
      email: _emailController.text.trim(),
      whatsapp: _whatsappController.text.trim().isNotEmpty 
          ? _whatsappController.text.trim() 
          : null,
      address: _addressController.text.trim().isNotEmpty 
          ? _addressController.text.trim() 
          : null,
      website: _websiteController.text.trim().isNotEmpty 
          ? _websiteController.text.trim() 
          : null,
      socialLinks: socialLinks,
      qrCodeLink: '${AppConstants.qrCodeBaseUrl}$cardId',
      createdAt: _isEditing ? widget.card!.createdAt : now,
      updatedAt: now,
    );
    
    await cardsProvider.saveCard(card);
    
    if (mounted && cardsProvider.error == null) {
      Navigator.of(context).pop();
    }
  }
}
