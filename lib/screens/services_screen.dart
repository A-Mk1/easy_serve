import 'package:flutter/material.dart';
import 'create_request_screen.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      'name': 'Beauty & Makeup',
      'icon': Icons.face_retouching_natural,
      'color': Colors.pinkAccent,
      'items': ['Bridal Makeup', 'Party Makeup', 'Hairstyling', 'Skin Care']
    },
    {
      'name': 'Event Planning',
      'icon': Icons.celebration,
      'color': Colors.purple,
      'items': ['Wedding Setup', 'Birthday Party', 'Baby Shower', 'Graduation']
    },
    {
      'name': 'Interior Design',
      'icon': Icons.weekend,
      'color': Colors.brown,
      'items': ['Living Room Decor', 'Kitchen Design', 'Modern Lighting']
    },
    {
      'name': 'Henna Art',
      'icon': Icons.brush,
      'color': Colors.orangeAccent,
      'items': ['Bridal Henna', 'Simple Hand Design', 'Sudanese Henna']
    },
    {
      'name': 'Photography',
      'icon': Icons.camera_alt,
      'color': Colors.teal,
      'items': ['Portrait Session', 'Event Coverage', 'Photo Editing']
    },
    {
      'name': 'Flower Delivery',
      'icon': Icons.local_florist,
      'color': Colors.redAccent,
      'items': ['Rose Bouquet', 'Gift Wrapping', 'Indoor Plants']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Services'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          itemCount: services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            final service = services[index];
            return GestureDetector(
              onTap: () {
                _showSubServices(context, service);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4)),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: service['color'].withOpacity(0.1),
                      child: Icon(service['icon'],
                          size: 35, color: service['color']),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      service['name'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSubServices(BuildContext context, Map<String, dynamic> service) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select ${service['name']}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: service['color']),
              ),
              const Divider(),
              ...(service['items'] as List<String>).map((subItem) {
                return ListTile(
                  leading: Icon(Icons.star_border, color: service['color']),
                  title: Text(subItem),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            CreateRequestScreen(initialTitle: subItem),
                      ),
                    );
                  },
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
