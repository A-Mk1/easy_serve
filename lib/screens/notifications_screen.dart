import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<Map<String, String>> alerts = const [
    {'title': 'Request Accepted', 'desc': 'Your Beauty & Makeup request has been accepted!', 'time': '2 mins ago'},
    {'title': 'Special Offer', 'desc': 'Get 20% off on your next Henna Art booking!', 'time': '1 hour ago'},
    {'title': 'Service Reminder', 'desc': 'Don’t forget your Photography session tomorrow.', 'time': '5 hours ago'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: alerts.isEmpty
          ? const Center(child: Text('No notifications yet'))
          : ListView.builder(
              itemCount: alerts.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.orangeAccent,
                      child: Icon(Icons.notifications_active, color: Colors.white),
                    ),
                    title: Text(alerts[index]['title']!),
                    subtitle: Text(alerts[index]['desc']!),
                    trailing: Text(alerts[index]['time']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                );
              },
            ),
    );
  }
}